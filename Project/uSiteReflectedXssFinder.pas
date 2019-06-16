unit uSiteReflectedXssFinder;

interface

uses Classes, SysUtils, DB, ADODB, uDatabaseObject, uSiteNavigator, Forms,
    MSHTML, SHDocVw, idUri, Vcl.ExtCtrls, Dialogs;

type
    /// <summary>
    /// Класс, реализующий поиск отраженных уязвимостей.
    /// </summary>
    TSiteReflectedXssFinder = class(TSiteNavigator)
    private
        /// <summary>
        /// Общее количество найденных ссылок
        /// </summary>
        FTotalPageCount: Integer;
        /// <summary>
        /// Количество посещенных ссылок
        /// </summary>
        FVisitedPageCount: Integer;
        /// <summary>
        /// Очередь URL-адресов (очередь содержит варианты URL, в которые встроены XSS коды)
        /// </summary>
        FURLQueue: TStringList;
        /// <summary>
        /// Список XSS, которые будут проверяться
        /// </summary>
        FTaskProblem: TADOQuery;
        /// <summary>
        /// Идентфикатор проверяемой страницы
        /// </summary>
        FCurrentPageID: Integer;
        /// <summary>
        /// Количество найденных уязвимостей
        /// </summary>
        FProblemCount: Integer;
        /// <summary>
        /// Обработчик события "Загрузка документа завершена"
        /// </summary>
        procedure WebBrowserOnDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant); override;
        /// <summary>
        /// Обработчик события "Загрузка файла"
        /// </summary>
        procedure WebBrowserOnFileDownload(ASender: TObject; ActiveDocument: WordBool; var Cancel: WordBool); override;
        /// <summary>
        /// Обработчик события "Ошибка навигации"
        /// </summary>
        procedure WebBrowserOnNavigateError(ASender: TObject; const pDisp: IDispatch; const URL, Frame, StatusCode: OleVariant; var Cancel: WordBool); override;
        /// <summary>
        /// Обработчик таймера
        /// </summary>
        procedure TimerOnTimer(Sender: TObject); override;
        /// <summary>
        /// Вычисляет общее количество страниц для поиска уязвимостей
        /// </summary>
        function GetTaskPageCount(TaskID: Integer): Integer;
        /// <summary>
        /// Метод встраивания XSS кода в параметры URL-адреса
        /// </summary>
        function InjectXssInUrl(URL: string; XSS: string): TStringList;
    public
        /// <summary>
        /// Конструктор класса
        /// </summary>
        constructor Create(Connection: TADOConnection);
        /// <summary>
        /// Деструктор класса
        /// </summary>
        destructor Destroy; override;
        /// <summary>
        /// Метод генерации карты сайта
        /// </summary>
        procedure Find;
        /// <summary>
        /// Общее количество найденных ссылок
        /// </summary>
        property TotalPageCount: Integer read FTotalPageCount;
        /// <summary>
        /// Количество посещенных ссылок
        /// </summary>
        property VisitedPageCount: Integer read FVisitedPageCount;
        /// <summary>
        /// Количество найденных уязвимостей
        /// </summary>
        property ProblemCount: Integer read FProblemCount;
        /// <summary>
        /// Очередь URL-адресов
        /// </summary>
        property URLQueue: TStringList read FURLQueue;
    end;

implementation

{ TSiteMapCreator }

constructor TSiteReflectedXssFinder.Create(Connection: TADOConnection);
begin
    inherited Create(Connection);
    FURLQueue := TStringList.Create;
end;

destructor TSiteReflectedXssFinder.Destroy;
begin
    FURLQueue.Free;
    if Assigned(FTaskProblem) then
        FTaskProblem.Free;
    inherited;
end;







procedure TSiteReflectedXssFinder.TimerOnTimer(Sender: TObject);
var
    Page, TaskProblem: TADOQuery;
    URI: TIdURI;
    I: Integer;
    URL: string;
    L: TStringList;
begin
    if URLQueue.Count = 0 then
    begin
        Page := GetQuery('select top 1 * from Page where ForChecking = True and Visited = False and TaskID = ' + IntToStr(TaskID) + ' order by ID asc');
        try
            if ((Page.RecordCount = 0) and (TotalPageCount > 0)) then
            begin
                SetState(snsComplete);
                Exit;
            end;
            try
                FCurrentPageID := Page.FieldByName('ID').AsInteger;
                Page.Edit;
                Page.FieldByName('Visited').AsBoolean := True;
                Page.Post;
                Inc(FVisitedPageCount);
                for I := 1 to FTaskProblem.RecordCount do
                begin
                    FTaskProblem.RecNo := I;
                    L := InjectXssInUrl(Page.FieldByName('URL').AsString, FTaskProblem.FieldByName('Code').AsString);
                    try
                        URLQueue.AddStrings(L);
                    finally
                        L.Free;
                    end;
                end;
            except
                on E: Exception do
                begin
                    Page.Edit;
                    Page.FieldByName('ErrorMessage').AsString := E.Message;
                    Page.FieldByName('Error').AsBoolean := True;
                    Page.Post;
                end;
            end;
        finally
            Page.Free;
        end;
    end
    else
    begin
        try
            URL := URLQueue.Strings[0];
            URLQueue.Delete(0);
            WebBrowser.Navigate(URL);
            if Assigned(OnStatusTextChange) then
                OnStatusTextChange(Self, URL);
        finally
            Timer.Enabled := False;
        end;
    end;

end;

procedure TSiteReflectedXssFinder.WebBrowserOnDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
var
    SubStr, HTML: WideString;
    I: Integer;
    SubLen, SrcLen: Integer;
begin
    HTML := WideLowerCase((WebBrowser.Document as IHTMLDocument2).body.outerHTML);
    for I := 1 to FTaskProblem.RecordCount do
    begin
        FTaskProblem.RecNo := I;
        SubStr := WideLowerCase(FTaskProblem.FieldByName('Code').AsString);
        if Pos(SubStr, HTML) > 0 then
        begin
            PageCheckAdd(FCurrentPageID, FTaskProblem.FieldByName('ProblemID').AsInteger, 1, URL);
            Inc(FProblemCount);
            if Assigned(OnStatusTextChange) then
                OnStatusTextChange(Self, 'Найдена уязвимость: ' + URL);
        end;
    end;
    Timer.Enabled := True;
end;

procedure TSiteReflectedXssFinder.WebBrowserOnFileDownload(ASender: TObject; ActiveDocument: WordBool; var Cancel: WordBool);
begin
    Cancel := True;
    Timer.Enabled := True;
end;

procedure TSiteReflectedXssFinder.WebBrowserOnNavigateError(ASender: TObject; const pDisp: IDispatch; const URL, Frame, StatusCode: OleVariant;
  var Cancel: WordBool);
begin
    Cancel := True;
    Timer.Enabled := True;
end;

procedure TSiteReflectedXssFinder.Find;
begin
    FProblemCount := 0;
    FVisitedPageCount := 0;
    SetState(snsFree);
    TestRequirement;
    SetState(snsExec);
    FTotalPageCount := GetTaskPageCount(TaskID);
    if FTotalPageCount = 0 then
        SetState(snsComplete);
    TaskClearVisitFlag;
    if Assigned(FTaskProblem) then
        FTaskProblem.Free;
    FTaskProblem := GetQuery('select * from ViewTaskProblem where TaskID = ' + IntToStr(TaskID));
    PageCheckClear(1);
    Timer.Enabled := True;
end;

function TSiteReflectedXssFinder.GetTaskPageCount(TaskID: Integer): Integer;
var
    Page: TADOQuery;
begin
    Page := GetQuery('select count(ID) as F1 from Page where ForChecking = True and TaskID = ' + IntToStr(TaskID));
    try
        Result := Page.FieldByName('F1').AsInteger;
    finally
        Page.Free;
    end;
end;

function TSiteReflectedXssFinder.InjectXssInUrl(URL, XSS: string): TStringList;
var
    L: TStringList;
    URI: TIdURI;
    I: Integer;
    S, Param, Value: string;

    function DivideString(S: string; Delimiter: Char; var Param: string; var Value: string): Boolean;
    var
        I: Integer;
    begin
        Param := '';
        Value := '';
        Result := Pos(Delimiter, S) > 0;
        if Result then
        begin
            for I := 1 to length(S) do
            begin
                if S[I] = Delimiter then
                    Break;
                Param := Param + S[I];
            end;

            for I := length(S) downto 1 do
            begin
                if S[I] = Delimiter then
                    Break;
                Value := S[I] + Value;
            end;
        end;
    end;

    function Combine(L: TStringList; Delimiter: Char): string;
    var
        I: Integer;
    begin
        Result := '';
        for I := 0 to L.Count - 1 do
        begin
            if Result <> '' then
                Result := Result + Delimiter;
            Result := Result + L.Strings[I];
        end;
    end;

begin
    Result := TStringList.Create;
    try
        URI := TIdURI.Create(URL);
        try
            L := TStringList.Create;
            try
                L.Delimiter := '&';
                L.DelimitedText := URI.Params;
                for I := 0 to L.Count - 1 do
                begin
                    S := L.Strings[I];
                    if DivideString(S, '=', Param, Value) then
                    begin
                        L.Strings[I] := Param + '=' + XSS;
                        URI.Params := Combine(L, L.Delimiter);
                        Result.Add(URI.GetFullURI());
                        L.Strings[I] := S;
                    end;
                end;
            finally
                L.Free;
            end;
        finally
            URI.Free;
        end;
    except
        Result.Free;
        raise
    end;
end;

end.
