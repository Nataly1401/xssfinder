unit ufExecution;

interface

uses
    uSiteNavigator, uSiteMapCreator, uSiteLogin, uSiteReflectedXssFinder, uSiteStoredXssFinder,
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
    WinInet, Vcl.AppEvnts, uMyWebBrowser;

type
    TExecutionMode = (emNone, emFullCycle, emCreateMap, emReflectedXssScan, emStoredXssScan);

    TfExecution = class(TForm)
        sbMain: TStatusBar;
        Panel1: TPanel;
        pbMain: TProgressBar;
        lMessage: TLabel;
        pControl: TPanel;
        eAddress: TEdit;
        bAutorizationComplete: TButton;
        bNavigate: TButton;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormShow(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure wbMainNavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
        procedure bAutorizationCompleteClick(Sender: TObject);
        procedure bNavigateClick(Sender: TObject);
    private
        { Private declarations }
        wbMain: TMyWebBrowser;
        FExecutionMode: TExecutionMode;
        FSiteMapCreator: TSiteMapCreator;
        FSiteLogin: TSiteLogin;
        FSiteReflectedXssFinder: TSiteReflectedXssFinder;
        FSiteStoredXssFinder: TSiteStoredXssFinder;
        procedure SiteLoginOnChangeState(Sender: TObject);
        procedure SiteLoginOnStatusTextChange(Sender: TObject; const Text: string);
        procedure SiteMapCreatorOnChangeState(Sender: TObject);
        procedure SiteMapCreatorOnStatusTextChange(Sender: TObject; const Text: string);
        procedure SiteReflectedXssFinderOnChangeState(Sender: TObject);
        procedure SiteReflectedXssFinderOnStatusTextChange(Sender: TObject; const Text: string);
        procedure SiteStoredXssFinderOnChangeState(Sender: TObject);
        procedure SiteStoredXssFinderOnStatusTextChange(Sender: TObject; const Text: string);
        procedure SetFormDefaultState;
        procedure RunSiteMapCreator;
        procedure RunSiteManualLogin;
        procedure RunSiteLogin;
        procedure RunSiteReflectedXssFinder;
        procedure RunSiteStoredXssFinder;
        procedure SetExecutionMode(const Value: TExecutionMode);
    public
        property SiteMapCreator: TSiteMapCreator read FSiteMapCreator;
        property SiteLogin: TSiteLogin read FSiteLogin;
        property SiteReflectedXssFinder: TSiteReflectedXssFinder read FSiteReflectedXssFinder;
        property SiteStoredXssFinder: TSiteStoredXssFinder read FSiteStoredXssFinder;
        property ExecutionMode: TExecutionMode read FExecutionMode write SetExecutionMode;
    end;

var
    fExecution: TfExecution;

implementation

{$R *.dfm}

uses udmData;

procedure TfExecution.bAutorizationCompleteClick(Sender: TObject);
begin
    if MessageDlg('Вы подтверждаете, что авторизация выполнена успешно?', mtConfirmation, [mbCancel, mbOK], 0) = mrOk then
    begin
        eAddress.ReadOnly := True;
        bNavigate.Enabled := False;
        bAutorizationComplete.Enabled := False;

        sbMain.Panels[0].Text := 'Ручная авторизация';
        sbMain.Panels[1].Text := TSiteNavigatorStateString[snsComplete];

        case ExecutionMode of
            emFullCycle:
                RunSiteMapCreator;
            emCreateMap:
                RunSiteMapCreator;
            emReflectedXssScan:
                RunSiteReflectedXssFinder;
            emStoredXssScan:
                RunSiteStoredXssFinder;
        end;
    end;
end;

procedure TfExecution.bNavigateClick(Sender: TObject);
begin
    //
    wbMain.Navigate(eAddress.Text);
end;

procedure TfExecution.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //
    SiteLogin.Cancel;
    SiteMapCreator.Cancel;
    SiteReflectedXssFinder.Cancel;
    SiteStoredXssFinder.Cancel;
end;

procedure TfExecution.FormCreate(Sender: TObject);
begin
    wbMain := TMyWebBrowser.Create(Self);
    wbMain.SetParentComponent(Self);
    wbMain.Align := alClient;
    wbMain.AlignWithMargins := True;
    wbMain.Silent := True;
    wbMain.OnNavigateComplete2 := wbMainNavigateComplete2;

    FSiteLogin := TSiteLogin.Create(dmData.adoConnection);
    SiteLogin.OnChangeState := SiteLoginOnChangeState;
    SiteLogin.OnStatusTextChange := SiteLoginOnStatusTextChange;

    FSiteMapCreator := TSiteMapCreator.Create(dmData.adoConnection);
    SiteMapCreator.OnChangeState := SiteMapCreatorOnChangeState;
    SiteMapCreator.OnStatusTextChange := SiteMapCreatorOnStatusTextChange;

    FSiteReflectedXssFinder := TSiteReflectedXssFinder.Create(dmData.adoConnection);
    SiteReflectedXssFinder.OnChangeState := SiteReflectedXssFinderOnChangeState;
    SiteReflectedXssFinder.OnStatusTextChange := SiteReflectedXssFinderOnStatusTextChange;

    FSiteStoredXssFinder := TSiteStoredXssFinder.Create(dmData.adoConnection);
    SiteStoredXssFinder.OnChangeState := SiteStoredXssFinderOnChangeState;
    SiteStoredXssFinder.OnStatusTextChange := SiteStoredXssFinderOnStatusTextChange;

end;

procedure TfExecution.FormShow(Sender: TObject);
begin
    SetFormDefaultState;

    SiteLogin.TaskID := dmData.tTaskID.Value;
    SiteMapCreator.TaskID := dmData.tTaskID.Value;
    SiteReflectedXssFinder.TaskID := dmData.tTaskID.Value;
    SiteStoredXssFinder.TaskID := dmData.tTaskID.Value;


    if SiteLogin.Task.FieldByName('Authorization').AsBoolean then
    begin
        if SiteLogin.Task.FieldByName('AuthorizationManual').AsBoolean then
        begin
            RunSiteManualLogin;
        end
        else
        begin
            RunSiteLogin;
        end;
    end
    else
    begin
        case ExecutionMode of
            emFullCycle:
                RunSiteLogin;
            emCreateMap:
                RunSiteMapCreator;
            emReflectedXssScan:
                RunSiteReflectedXssFinder;
            emStoredXssScan:
                RunSiteStoredXssFinder;
        end;
    end;
end;

procedure TfExecution.RunSiteLogin;
begin
    dmData.TaskSetState(dmData.tTaskID.Value, c_task_state_login);
    SiteLogin.WebBrowser := wbMain;
    SiteLogin.Login;
end;

procedure TfExecution.RunSiteManualLogin;
begin
    dmData.TaskSetState(dmData.tTaskID.Value, c_task_state_login);
    wbMain.OnDocumentComplete := nil;
    wbMain.OnFileDownload := nil;
    wbMain.OnNavigateError := nil;

    wbMain.Navigate(SiteLogin.Task.FieldByName('AuthorizationURL').AsString);
    bAutorizationComplete.Enabled := True;
    eAddress.ReadOnly := False;
    bNavigate.Enabled := True;
    bAutorizationComplete.Enabled := True;

    sbMain.Panels[0].Text := 'Ручная авторизация';
    sbMain.Panels[1].Text := TSiteNavigatorStateString[snsExec];
end;

procedure TfExecution.RunSiteMapCreator;
begin
    dmData.TaskSetState(dmData.tTaskID.Value, c_task_state_create_map);
    SiteMapCreator.WebBrowser := wbMain;
    SiteMapCreator.CreateMap;
end;

procedure TfExecution.RunSiteReflectedXssFinder;
begin
    dmData.TaskSetState(dmData.tTaskID.Value, c_task_state_reflected_xss_scan);
    SiteReflectedXssFinder.WebBrowser := wbMain;
    SiteReflectedXssFinder.Find;
end;

procedure TfExecution.RunSiteStoredXssFinder;
begin
    dmData.TaskSetState(dmData.tTaskID.Value, c_task_state_stored_xss_scan);
    SiteStoredXssFinder.WebBrowser := wbMain;
    SiteStoredXssFinder.Find;
end;

procedure TfExecution.SetExecutionMode(const Value: TExecutionMode);
begin
    FExecutionMode := Value;
end;

procedure TfExecution.SetFormDefaultState;
begin
    eAddress.ReadOnly := True;
    bNavigate.Enabled := False;
    bAutorizationComplete.Enabled := False;
    lMessage.Caption := '';
    sbMain.Panels[0].Text := '';
    sbMain.Panels[1].Text := '';
    sbMain.Panels[2].Text := '';
    pbMain.Position := 0;
end;


procedure TfExecution.SiteLoginOnChangeState(Sender: TObject);
begin
    sbMain.Panels[0].Text := 'Авторизация';
    sbMain.Panels[1].Text := TSiteNavigatorStateString[(Sender as TSiteNavigator).State];

    if (Sender as TSiteNavigator).State = snsError then
    begin
        RunSiteManualLogin;
        MessageDlg('Автоматическая авторизация завершилась неудачно. Попробуйте выполнить ручную авторизацию...', mtInformation, [mbOK], 0);
        Exit;
    end;

    if (Sender as TSiteNavigator).State = snsComplete then
    begin
        case ExecutionMode of
            emFullCycle:
                RunSiteMapCreator;
            emCreateMap:
                RunSiteMapCreator;
            emReflectedXssScan:
                RunSiteReflectedXssFinder;
            emStoredXssScan:
                RunSiteStoredXssFinder;
        end;
    end;
end;

procedure TfExecution.SiteLoginOnStatusTextChange(Sender: TObject; const Text: string);
begin

end;

procedure TfExecution.SiteMapCreatorOnChangeState(Sender: TObject);
begin
    sbMain.Panels[0].Text := 'Построение карты сайта';
    sbMain.Panels[1].Text := TSiteNavigatorStateString[(Sender as TSiteNavigator).State];

    if (Sender as TSiteNavigator).State = snsComplete then
    begin
        if ExecutionMode = emFullCycle then
            RunSiteReflectedXssFinder
        else
            Close;
    end;
end;

procedure TfExecution.SiteMapCreatorOnStatusTextChange(Sender: TObject; const Text: string);
begin
    if SiteMapCreator.State = snsExec then
    begin
        lMessage.Caption := 'Добавлено: ' + Text;
        sbMain.Panels[2].Text := 'Просмотрено ' + IntToStr(SiteMapCreator.VisitedPageCount) + ' из ' + IntToStr(SiteMapCreator.TotalPageCount);
        pbMain.Max := SiteMapCreator.TotalPageCount;
        pbMain.Position := SiteMapCreator.VisitedPageCount;
    end;
end;

procedure TfExecution.SiteReflectedXssFinderOnChangeState(Sender: TObject);
begin
    sbMain.Panels[0].Text := 'Поиск отраженных уязвимостей';
    sbMain.Panels[1].Text := TSiteNavigatorStateString[(Sender as TSiteNavigator).State];

    if (Sender as TSiteNavigator).State = snsComplete then
    begin
        if ExecutionMode = emFullCycle then
            RunSiteStoredXssFinder
        else
            Close;
    end;
end;

procedure TfExecution.SiteReflectedXssFinderOnStatusTextChange(Sender: TObject; const Text: string);
begin
    if SiteReflectedXssFinder.State = snsExec then
    begin
        lMessage.Caption := Text;
        sbMain.Panels[2].Text := 'Проверено ' + IntToStr(SiteReflectedXssFinder.VisitedPageCount) + ' из ' + IntToStr(SiteReflectedXssFinder.TotalPageCount);
        sbMain.Panels[3].Text := 'XSS: ' + IntToStr(SiteReflectedXssFinder.ProblemCount);
        pbMain.Max := SiteReflectedXssFinder.TotalPageCount;
        pbMain.Position := SiteReflectedXssFinder.VisitedPageCount;
    end;
end;

procedure TfExecution.SiteStoredXssFinderOnChangeState(Sender: TObject);
begin
    sbMain.Panels[0].Text := 'Поиск хранимых уязвимостей';
    sbMain.Panels[1].Text := TSiteNavigatorStateString[(Sender as TSiteNavigator).State];

    if (Sender as TSiteNavigator).State = snsComplete then
    begin
        if ExecutionMode = emFullCycle then
            dmData.TaskSetState(dmData.tTaskID.Value, c_task_state_login);
        Close;
    end;
end;

procedure TfExecution.SiteStoredXssFinderOnStatusTextChange(Sender: TObject; const Text: string);
begin
    if SiteStoredXssFinder.State = snsExec then
    begin
        lMessage.Caption := Text;
        sbMain.Panels[2].Text := 'Проверено ' + IntToStr(SiteStoredXssFinder.VisitedPageCount) + ' из ' + IntToStr(SiteStoredXssFinder.TotalPageCount);
        sbMain.Panels[3].Text := 'XSS: ' + IntToStr(SiteStoredXssFinder.ProblemCount);
        pbMain.Max := SiteStoredXssFinder.TotalPageCount;
        pbMain.Position := SiteStoredXssFinder.VisitedPageCount;
    end;
end;

procedure TfExecution.wbMainNavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin
    eAddress.Text := URL;
end;

end.
