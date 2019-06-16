unit uSiteLogin;

interface

uses Classes, SysUtils, DB, ADODB, uDatabaseObject, uSiteNavigator, Forms,
    MSHTML, SHDocVw, idUri, Vcl.ExtCtrls;

type
    /// <summary>
    /// Класс, реализующий механизм автоматической авторизации.
    /// </summary>
    TSiteLogin = class(TSiteNavigator)
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
        /// Информационное сообщение
        /// </summary>
        FInfoMessage: string;
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
        procedure Login;
        /// <summary>
        /// Общее количество найденных ссылок
        /// </summary>
        property TotalPageCount: Integer read FTotalPageCount;
        /// <summary>
        /// Количество посещенных ссылок
        /// </summary>
        property VisitedPageCount: Integer read FVisitedPageCount;
        /// <summary>
        /// Информационное сообщение
        /// </summary>
        property InfoMessage: string read FInfoMessage;
    end;

implementation

{ TSiteMapCreator }

constructor TSiteLogin.Create(Connection: TADOConnection);
begin
    inherited Create(Connection);
end;

destructor TSiteLogin.Destroy;
begin
    inherited;
end;

procedure TSiteLogin.TimerOnTimer(Sender: TObject);
begin

end;

procedure TSiteLogin.WebBrowserOnDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
var
    FormList, InputList, ButtonList: IHTMLElementCollection;
    Form, Input, Button: IHTMLElement;
    I, J: Integer;
begin
    if Task.FieldByName('AuthorizationURL').AsString = URL then
    begin
        FormList := (WebBrowser.Document as IHTMLDocument2).Forms;
        InputList := (WebBrowser.Document as IHTMLDocument2).all.tags('input') as IHTMLElementCollection;
        ButtonList := (WebBrowser.Document as IHTMLDocument2).all.tags('button') as IHTMLElementCollection;
        for I := 0 to FormList.length - 1 do
        begin
            Form := FormList.item(OleVariant(I), varEmpty) as IHTMLElement;
            if (Task.FieldByName('LoginFormName').AsString = Form.getAttribute('name', 0)) or
              (Task.FieldByName('LoginFormID').AsString = Form.getAttribute('id', 0)) or
              (Task.FieldByName('LoginFormClass').AsString = Form.getAttribute('class', 0)) then
            begin
                for J := 0 to InputList.length - 1 do
                begin
                    Input := InputList.item(OleVariant(J), varEmpty) as IHTMLElement;
                    if Input.getAttribute('type', 0) = 'text' then
                    begin
                        if (Form.contains(Input)) then
                        begin
                            if (Task.FieldByName('LoginFieldName').AsString = Input.getAttribute('name', 0)) or
                              (Task.FieldByName('LoginFieldID').AsString = Input.getAttribute('id', 0)) then
                            begin
                                Input.setAttribute('value', Task.FieldByName('LoginFieldValue').AsString, 0);
                            end;
                        end;
                    end;

                    if Input.getAttribute('type', 0) = 'password' then
                    begin
                        if (Form.contains(Input)) then
                        begin
                            if (Task.FieldByName('PasswordFieldName').AsString = Input.getAttribute('name', 0)) or
                              (Task.FieldByName('PasswordFieldID').AsString = Input.getAttribute('id', 0)) then
                            begin
                                Input.setAttribute('value', Task.FieldByName('PasswordFieldValue').AsString, 0);
                            end;
                        end;
                    end;
                end;

                for J := 0 to ButtonList.length - 1 do
                begin
                    Button := ButtonList.item(OleVariant(J), varEmpty) as IHTMLElement;
                    if (Form.contains(Button)) then
                    begin
                        if Button.getAttribute('type', 0) = 'submit' then
                        begin
                            Button.click;
                        end;
                    end;
                end;
            end;
        end;
    end
    else
    begin
        if Task.FieldByName('AuthorizationCompleteURL').AsString = URL then
        begin
            SetState(snsComplete);
        end
        else
        begin
            SetState(snsError);
        end;
    end;
end;

procedure TSiteLogin.WebBrowserOnFileDownload(ASender: TObject; ActiveDocument: WordBool; var Cancel: WordBool);
begin
    Cancel := True;
    Timer.Enabled := True;
end;

procedure TSiteLogin.WebBrowserOnNavigateError(ASender: TObject; const pDisp: IDispatch; const URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
    Cancel := True;
    Timer.Enabled := True;
end;



procedure TSiteLogin.Login;
begin
    SetState(snsFree);
    TestRequirement;
    SetState(snsExec);
    if Task.FieldByName('Authorization').AsBoolean = False then
    begin
        SetState(snsComplete);
        Exit;
    end;
    WebBrowser.Navigate(Task.FieldByName('AuthorizationURL').AsString);
end;

end.
