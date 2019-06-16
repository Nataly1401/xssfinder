unit uSiteMapCreator;

interface

uses Classes, SysUtils, DB, ADODB, uDatabaseObject, uSiteNavigator, Forms,
    MSHTML, SHDocVw, idUri, Vcl.ExtCtrls;

type
    /// <summary>
    /// Класс реализующий построение карты сайта.
    /// </summary>
    TSiteMapCreator = class(TSiteNavigator)
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
        /// Добавить страницу в базу данных
        /// </summary>
        function PageAdd(URL: string; Title: string): Integer;
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
        procedure CreateMap;
        /// <summary>
        /// Общее количество найденных ссылок
        /// </summary>
        property TotalPageCount: Integer read FTotalPageCount;
        /// <summary>
        /// Количество посещенных ссылок
        /// </summary>
        property VisitedPageCount: Integer read FVisitedPageCount;

    end;

implementation

{ TSiteMapCreator }

constructor TSiteMapCreator.Create(Connection: TADOConnection);
begin
    inherited Create(Connection);
end;

destructor TSiteMapCreator.Destroy;
begin
    inherited;
end;

function TSiteMapCreator.PageAdd(URL: string; Title: string): Integer;
var
    Q: TADOQuery;
begin
    Result := 0;
    Q := GetQuery('select * from Page where TaskID = ' + IntToStr(TaskID) + ' and URL = ' + QuotedStr(URL));
    try
        if Q.RecordCount = 0 then
        begin
            Q.Insert;
            Q.FieldByName('TaskID').AsInteger := TaskID;
            Q.FieldByName('RegistrationDate').AsDateTime := Now;
            Q.FieldByName('Title').AsString := Title;
            Q.FieldByName('URL').AsString := URL;
            Q.FieldByName('Visited').AsBoolean := False;
            Q.FieldByName('Checked').AsBoolean := False;
            Q.Post;
            Inc(FTotalPageCount);
        end
        else
        begin
            Q.Edit;
            Q.FieldByName('Title').AsString := Title;
            Q.Post;
        end;

        Result := Q.FieldByName('ID').AsInteger;
    finally
        Q.Free;
    end;
end;

procedure TSiteMapCreator.TimerOnTimer(Sender: TObject);
var
    Page: TADOQuery;
begin
    try
        Page := GetQuery('select top 1 * from Page where Visited = 0 and TaskID = ' + IntToStr(TaskID));
        try
            if (Page.RecordCount = 0) and (TotalPageCount > 0) then
                SetState(snsComplete);
            try
                WebBrowser.Navigate(Page.FieldByName('URL').AsString);

            except
                on E: Exception do
                begin
                    Page.Edit;
                    Page.FieldByName('ErrorMessage').AsString := E.Message;
                    Page.FieldByName('Error').AsBoolean := True;
                    Page.Post;
                    Inc(FVisitedPageCount);
                end;
            end;
        finally
            Page.Free;
        end;
    finally
        Timer.Enabled := False;
    end;
end;

procedure TSiteMapCreator.WebBrowserOnDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
var
    Links: IHTMLElementCollection;
    Link: IHTMLElement;
    LinkUrl, LinkText: string;
    I, PageID: Integer;
    Page: TADOQuery;
begin
    try
        PageID := PageAdd(URL, (WebBrowser.Document as IHTMLDocument2).Title);
        Page := PageGet(PageID);
        try
            Page.Edit;
            Page.FieldByName('UsedHtmlForm').AsBoolean := (WebBrowser.Document as IHTMLDocument2).Forms.length > 0;
            Page.Post;
            Links := (WebBrowser.Document as IHTMLDocument2).all.tags('a') as IHTMLElementCollection;
            for I := 0 to Links.length - 1 do
            begin
                Link := Links.item(OleVariant(I), varEmpty) as IHTMLElement;
                LinkUrl := Link.getAttribute('href', varEmpty);
                LinkText := Link.innerText;
                if TestLink(LinkUrl) then
                begin
                    if (PageAdd(LinkUrl, LinkText) > 0) then
                    begin
                        if Assigned(OnStatusTextChange) then
                            OnStatusTextChange(Self, LinkText + ' (' + LinkUrl + ')');
                    end;
                end;
                if State = snsCancel then
                    Exit;
                Application.ProcessMessages;
            end;

            Page.Edit;
            Page.FieldByName('Visited').AsBoolean := True;
            Page.FieldByName('ForChecking').AsBoolean := True;
            Page.Post;
            Inc(FVisitedPageCount);
            if Assigned(OnStatusTextChange) then
                OnStatusTextChange(Self, URL);
        finally
            Page.Free
        end;
    except
    end;
    Timer.Enabled := True;
end;

procedure TSiteMapCreator.WebBrowserOnFileDownload(ASender: TObject; ActiveDocument: WordBool; var Cancel: WordBool);
begin
    Cancel := True;
    Timer.Enabled := True;
end;

procedure TSiteMapCreator.WebBrowserOnNavigateError(ASender: TObject; const pDisp: IDispatch; const URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
    Cancel := True;
    Timer.Enabled := True;
end;

procedure TSiteMapCreator.CreateMap;
begin
    FTotalPageCount := 0;
    FVisitedPageCount := 0;
    SetState(snsFree);
    TestRequirement;
    SetState(snsExec);
    PageDeleteAll;
    WebBrowser.Navigate(BaseURL);
end;

end.
