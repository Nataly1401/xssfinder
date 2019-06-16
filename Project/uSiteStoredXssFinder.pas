unit uSiteStoredXssFinder;

interface

uses Classes, SysUtils, DB, ADODB, uDatabaseObject, uSiteNavigator, Forms,
    MSHTML, SHDocVw, idUri, Vcl.ExtCtrls, Dialogs;

type
    /// <summary>
    /// Режимы работы XssFinder
    /// </summary>
    TSiteStoredXssFinderMode = (ssxfmInject, ssxfmFind);

    /// <summary>
    /// Структура для хранения полей формы (для размежения в очереди на заполнение)
    /// </summary>
    TSiteStoredXssFinderPageField = class
    private
        /// <summary>
        /// Номер html-формы
        /// </summary>
        FHtmlFormNumber: Integer;
        /// <summary>
        /// Номер html-элемента формы
        /// </summary>
        FHtmlElementNumber: Integer;
        /// <summary>
        /// Задает  номер html-элемента формы
        /// </summary>
        procedure SetHtmlElementNumber(const Value: Integer);
        /// <summary>
        /// Задает  номер html-формы
        /// </summary>
        procedure SetHtmlFormNumber(const Value: Integer);
    published
        /// <summary>
        /// Конструктор класса
        /// </summary>
        constructor Create;
        /// <summary>
        /// Деструктор класса
        /// </summary>
        destructor Destroy; override;
        /// <summary>
        /// Номер html-элемента формы
        /// </summary>
        property HtmlElementNumber: Integer read FHtmlElementNumber write SetHtmlElementNumber;
        /// <summary>
        /// Номер html-формы
        /// </summary>
        property HtmlFormNumber: Integer read FHtmlFormNumber write SetHtmlFormNumber;

    end;

    /// <summary>
    /// Класс, реализующий поиск хранимых уязвимостей.
    /// </summary>
    TSiteStoredXssFinder = class(TSiteNavigator)
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
        FXSSQueue: TStringList;
        /// <summary>
        /// Список XSS, которые будут проверяться
        /// </summary>
        FTaskProblem: TADOQuery;
        /// <summary>
        /// Идентфикатор проверяемой страницы
        /// </summary>
        FCurrentPageID: Integer;
        /// <summary>
        /// URL текущей страницы
        /// </summary>
        FCurrentPageURL: string;
        /// <summary>
        /// Количество найденных уязвимостей
        /// </summary>
        FProblemCount: Integer;
        /// <summary>
        /// Режим работы анализатора (инъекция или поиск)
        /// </summary>
        FMode: TSiteStoredXssFinderMode;
        /// <summary>
        /// Флаг "Первая загрузка страницы"
        /// </summary>
        FFirstPageLoading: Boolean;
        /// <summary>
        /// Флаг "вызов страницы из таймера"
        /// </summary>
        FFromTimer: Boolean;
        /// <summary>
        /// Очередь полей для заполнения
        /// </summary>
        FPageFieldsQueue: TStringList;
        /// <summary>
        /// Метод создает очередь полей
        /// </summary>
        procedure GetPageInputFieldQueue;
        /// <summary>
        /// Метод заполняет очередь XSS сигнатур
        /// </summary>
        procedure GetXSSQueue;
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
        /// Вычисляет количество страниц, в которые будут производиться инъекции
        /// </summary>
        function GetTaskPageCountForInject(TaskID: Integer): Integer;
        /// <summary>
        /// Вычисляет общее количество страниц для поиска уязвимостей
        /// </summary>
        function GetTaskPageCountForFind(TaskID: Integer): Integer;
        /// <summary>
        /// Задаем режим работы XssFinder
        /// </summary>
        procedure SetMode(const Value: TSiteStoredXssFinderMode);
        /// <summary>
        /// Выполняет проверку страницы на наличие хранимых XSS-уязвимостей
        /// </summary>
        procedure ExecutePageCheck(URL: string);
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
        property XSSQueue: TStringList read FXSSQueue;
        /// <summary>
        /// Очередь полей для заполнения
        /// </summary>
        property PageFieldsQueue: TStringList read FPageFieldsQueue;
        /// <summary>
        /// Режим работы анализатора (инъекция или поиск)
        /// </summary>
        property Mode: TSiteStoredXssFinderMode read FMode;
    end;

implementation

{ TSiteMapCreator }

constructor TSiteStoredXssFinder.Create(Connection: TADOConnection);
begin
    inherited Create(Connection);
    FXSSQueue := TStringList.Create;
    FPageFieldsQueue := TStringList.Create;
    FPageFieldsQueue.OwnsObjects := True;

    FMode := ssxfmInject;
end;

destructor TSiteStoredXssFinder.Destroy;
begin
    FXSSQueue.Free;
    FPageFieldsQueue.Free;
    if Assigned(FTaskProblem) then
        FTaskProblem.Free;
    inherited;
end;

procedure TSiteStoredXssFinder.ExecutePageCheck(URL: string);
var
    SubStr, HTML: WideString;
    I, J, HtmlElementNumber, HtmlFormNumber: Integer;
begin
    if Assigned(OnStatusTextChange) then
        OnStatusTextChange(Self, 'Поиск XSS: ' + URL);
    HTML := WideLowerCase((WebBrowser.Document as IHTMLDocument2).body.outerHTML);
    for I := 1 to FTaskProblem.RecordCount do
    begin
        FTaskProblem.RecNo := I;
        SubStr := WideLowerCase(FTaskProblem.FieldByName('Code').AsString);
        if Pos(SubStr, HTML) > 0 then
        begin
            PageCheckAdd(FCurrentPageID, FTaskProblem.FieldByName('ProblemID').AsInteger, 2, URL);
            Inc(FProblemCount);
            if Assigned(OnStatusTextChange) then
                OnStatusTextChange(Self, 'Найдена XSS: ' + URL);
        end;
    end;
end;

procedure TSiteStoredXssFinder.TimerOnTimer(Sender: TObject);
var
    Page, TaskProblem: TADOQuery;
    URI: TIdURI;
    I: Integer;
    URL: string;
    L: TStringList;
begin
    if Mode = ssxfmInject then
    begin
        if (XSSQueue.Count = 0) and (PageFieldsQueue.Count = 0) then
        begin
            Page := GetQuery('select top 1 * from Page where Visited = False and ForChecking = True and UsedHtmlForm = True and TaskID = ' + IntToStr(TaskID) +
                ' order by ID asc');
            try
                if ((Page.RecordCount = 0) and (TotalPageCount > 0)) then
                begin
                    SetMode(ssxfmFind);
                    FTotalPageCount := GetTaskPageCountForFind(TaskID);
                    Exit;
                end;
                try
                    FFirstPageLoading := True;
                    FCurrentPageID := Page.FieldByName('ID').AsInteger;
                    FCurrentPageURL := Page.FieldByName('URL').AsString;
                    FFromTimer := True;
                    Page.Edit;
                    Page.FieldByName('Visited').AsBoolean := True;
                    Page.Post;
                    Inc(FVisitedPageCount);
                    WebBrowser.Navigate(FCurrentPageURL);
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
            WebBrowser.Navigate(FCurrentPageURL);
        end;
    end
    else
    begin

        Page := GetQuery('select top 1 * from Page where Visited = False and ForChecking = True and TaskID = ' + IntToStr(TaskID) + ' order by ID asc');
        try
            if ((Page.RecordCount = 0) and (TotalPageCount > 0)) then
            begin
                SetState(snsComplete);
                Exit;
            end;
            try
                FFirstPageLoading := True;
                FCurrentPageID := Page.FieldByName('ID').AsInteger;
                FCurrentPageURL := Page.FieldByName('URL').AsString;
                FFromTimer := True;
                Page.Edit;
                Page.FieldByName('Visited').AsBoolean := True;
                Page.Post;
                Inc(FVisitedPageCount);
                WebBrowser.Navigate(FCurrentPageURL);
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
    end;
    FFromTimer := True;
    Timer.Enabled := False;
end;

procedure TSiteStoredXssFinder.WebBrowserOnDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
var
    Document: IHTMLDocument2;
    FormElement: IHTMLFormElement;
    Input: IHTMLElement;
    I, J, HtmlElementNumber, HtmlFormNumber: Integer;
    Data: TSiteStoredXssFinderPageField;
begin
    if Mode = ssxfmInject then
    begin
        if FFromTimer = True then
        begin
            if FFirstPageLoading then
            begin
                GetPageInputFieldQueue;
                GetXSSQueue;
                FFirstPageLoading := False;
            end;
            if PageFieldsQueue.Count > 0 then
            begin
                if Assigned(OnStatusTextChange) then
                    OnStatusTextChange(Self, 'Встраивание XSS: ' + URL);
                Data := PageFieldsQueue.Objects[0] as TSiteStoredXssFinderPageField;
                HtmlFormNumber := Data.HtmlFormNumber;
                HtmlElementNumber := Data.HtmlElementNumber;
                PageFieldsQueue.Delete(0);

                Document := WebBrowser.Document as IHTMLDocument2;
                if HtmlFormNumber < Document.Forms.length then
                begin
                    FormElement := Document.Forms.item(OleVariant(HtmlFormNumber), varEmpty) as IHTMLFormElement;
                    if HtmlElementNumber < FormElement.length then
                    begin
                        Input := FormElement.item(OleVariant(HtmlElementNumber), varEmpty) as IHTMLElement;

                        if (AnsiLowerCase(Input.tagName) = 'input') then
                        begin
                            Input.setAttribute('value', XSSQueue.Strings[0], 0);
                            FFromTimer := False;
                            FormElement.submit;
                            Exit;
                        end;

                        if (AnsiLowerCase(Input.tagName) = 'textarea') then
                        begin
                            Input.innerText := XSSQueue.Strings[0];
                            FFromTimer := False;
                            FormElement.submit;
                            Exit;
                        end;

                    end;
                end;
            end
            else
            begin
                if XSSQueue.Count > 0 then
                begin
                    XSSQueue.Delete(0);
                    if XSSQueue.Count = 0 then
                    begin
                        Timer.Enabled := True;
                        Exit;
                    end;
                end;
                GetPageInputFieldQueue;
            end;
        end
        else
        begin
            ExecutePageCheck(URL);
        end;
    end
    else
    begin
        ExecutePageCheck(URL);
    end;
    Timer.Enabled := True;
end;

procedure TSiteStoredXssFinder.GetPageInputFieldQueue;
var
    FormList: IHTMLElementCollection;
    Input: IHTMLElement;
    FormElement: IHTMLFormElement;
    I, J: Integer;
    Data: TSiteStoredXssFinderPageField;
begin
    PageFieldsQueue.Clear;
    FormList := (WebBrowser.Document as IHTMLDocument2).Forms;
    for I := 0 to FormList.length - 1 do
    begin
        FormElement := FormList.item(OleVariant(I), varEmpty) as IHTMLFormElement;
        for J := 0 to FormElement.length - 1 do
        begin
            Input := FormElement.item(OleVariant(J), varEmpty) as IHTMLElement;
            if AnsiLowerCase(Input.getAttribute('type', 0)) = 'text' then
            begin
                Data := TSiteStoredXssFinderPageField.Create;
                Data.HtmlFormNumber := I;
                Data.HtmlElementNumber := J;
                PageFieldsQueue.AddObject('', Data);
            end;

            if AnsiLowerCase(Input.tagName) = 'textarea' then
            begin
                Data := TSiteStoredXssFinderPageField.Create;
                Data.HtmlFormNumber := I;
                Data.HtmlElementNumber := J;
                PageFieldsQueue.AddObject('', Data);
            end;

        end;
    end;
end;

procedure TSiteStoredXssFinder.WebBrowserOnFileDownload(ASender: TObject; ActiveDocument: WordBool; var Cancel: WordBool);
begin
    Cancel := True;
    Timer.Enabled := True;
end;

procedure TSiteStoredXssFinder.WebBrowserOnNavigateError(ASender: TObject; const pDisp: IDispatch; const URL, Frame, StatusCode: OleVariant;
    var Cancel: WordBool);
begin
    Cancel := True;
    Timer.Enabled := True;
end;

procedure TSiteStoredXssFinder.Find;
begin
    FProblemCount := 0;
    FVisitedPageCount := 0;
    SetState(snsFree);
    TestRequirement;
    SetState(snsExec);
    SetMode(ssxfmInject);
    FTotalPageCount := GetTaskPageCountForInject(TaskID);
    if FTotalPageCount = 0 then
        SetState(snsComplete);
    if Assigned(FTaskProblem) then
        FTaskProblem.Free;
    FTaskProblem := GetQuery('select * from ViewTaskProblem where TaskID = ' + IntToStr(TaskID));
    PageCheckClear(2);
    Timer.Enabled := True;
end;

function TSiteStoredXssFinder.GetTaskPageCountForInject(TaskID: Integer): Integer;
var
    Page: TADOQuery;
begin
    Page := GetQuery('select count(ID) as F1 from Page where ForChecking = True and UsedHtmlForm = True and TaskID = ' + IntToStr(TaskID));
    try
        Result := Page.FieldByName('F1').AsInteger;
    finally
        Page.Free;
    end;
end;

function TSiteStoredXssFinder.GetTaskPageCountForFind(TaskID: Integer): Integer;
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

procedure TSiteStoredXssFinder.GetXSSQueue;
var
    I: Integer;
begin
    XSSQueue.Clear;
    for I := 1 to FTaskProblem.RecordCount do
    begin
        FTaskProblem.RecNo := I;
        XSSQueue.Add(FTaskProblem.FieldByName('Code').AsString);
    end;
end;

procedure TSiteStoredXssFinder.SetMode(const Value: TSiteStoredXssFinderMode);
begin
    TaskClearVisitFlag;
    FVisitedPageCount := 0;
    FMode := Value;
end;

{ TSiteStoredXssFinderPageField }

constructor TSiteStoredXssFinderPageField.Create;
begin
    inherited;
end;

destructor TSiteStoredXssFinderPageField.Destroy;
begin

    inherited;
end;


procedure TSiteStoredXssFinderPageField.SetHtmlElementNumber(const Value: Integer);
begin
    FHtmlElementNumber := Value;
end;

procedure TSiteStoredXssFinderPageField.SetHtmlFormNumber(const Value: Integer);
begin
    FHtmlFormNumber := Value;
end;

end.
