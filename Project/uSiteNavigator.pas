unit uSiteNavigator;

interface

uses Classes, SysUtils, DB, ADODB, uDatabaseObject, Forms, Dialogs,
    MSHTML, SHDocVw, idUri, Vcl.ExtCtrls;

type
    /// <summary>
    /// ���������� ������� "��������� �������"
    /// </summary>
    TSiteNavigatorChangeState = procedure(Sender: TObject) of object;
    /// <summary>
    /// ���������� ������� "��������� ������"
    /// </summary>
    TSiteNavigatorChangeData = procedure(Sender: TObject) of object;
    /// <summary>
    /// ���������� ������� "��������� �������"
    /// </summary>
    TSiteStatusTextChange = procedure(Sender: TObject; const Text: string) of object;
    /// <summary>
    /// ��������� ��������� ����������
    /// </summary>
    TSiteNavigatorState = (snsFree, snsExec, snsComplete, snsCancel, snsError);

    /// <summary>
    /// ������� ����� ��� ���������� �����������
    /// </summary>
    TSiteNavigator = class(TDatabaseObject)
    private
        /// <summary>
        /// ������������� ������� ������
        /// </summary>
        FTaskID: Integer;
        /// <summary>
        /// ������� ��������� ����������
        /// </summary>
        FState: TSiteNavigatorState;
        /// <summary>
        /// ������
        /// </summary>
        FTimer: TTimer;
        /// <summary>
        /// �������
        /// </summary>
        FWebBrowser: TWebBrowser;
        /// <summary>
        /// ������� �����
        /// </summary>
        FBaseURL: string;
        /// <summary>
        /// ��������� ���������� �������� ������ �� ������������
        /// </summary>
        FBaseURI: TIdURI;
        /// <summary>
        /// ���������� ������� "��������� �������"
        /// </summary>
        FOnChangeState: TSiteNavigatorChangeState;
        /// <summary>
        /// ���������� ������� "��������� ������"
        /// </summary>
        FOnChangeData: TSiteNavigatorChangeData;
        /// <summary>
        /// ������ ������������ ����������
        /// </summary>
        FUsedExtensionList: TStringList;
        /// <summary>
        /// ������ ������� ������ (������ �� ��)
        /// </summary>
        FTask: TADOQuery;
        /// <summary>
        /// ���������� ������� "��������� �������"
        /// </summary>
        FOnStatusTextChange: TSiteStatusTextChange;
        /// <summary>
        /// ����� ������ ������������� ������� ������
        /// </summary>
        procedure SetTaskID(const Value: Integer);
        /// <summary>
        /// ����� ������ WebBrowser
        /// </summary>
        procedure SetWebBrowser(const Value: TWebBrowser);
        /// <summary>
        /// ����� ������ ���������� ������� "��������� �������"
        /// </summary>
        procedure SetOnChangeState(const Value: TSiteNavigatorChangeState);
        /// <summary>
        /// ����� ������ ���������� ������� "��������� ������"
        /// </summary>
        procedure SetOnChangeData(const Value: TSiteNavigatorChangeData);
        /// <summary>
        /// ��������� ������ ������������ ����������
        /// </summary>
        procedure LoadUsedExtensionList;
        /// <summary>
        /// ����� ������ ���������� ������� "��������� �������"
        /// </summary>
        procedure SetOnStatusTextChange(const Value: TSiteStatusTextChange);

    protected
        /// <summary>
        /// ����� ������ ������ ����������
        /// </summary>
        procedure SetState(const Value: TSiteNavigatorState);
        /// <summary>
        /// ����� ������ � ���� ������
        /// </summary>
        function TaskGet(ID: Integer): TADOQuery;
        /// <summary>
        /// ����� ������ � ���� ������ (�� ID)
        /// </summary>
        function PageGet(ID: Integer): TADOQuery; overload;
        /// <summary>
        /// ����� ������ � ���� ������ (�� URL)
        /// </summary>
        function PageGet(URL: string): TADOQuery; overload;
        /// <summary>
        /// ����� ������ � ���� ������
        /// </summary>
        function ParamsGet: TADOQuery;
        /// <summary>
        /// �������� ���� ��������� ���� ������� ��������� � �������
        /// </summary>
        procedure TaskClearVisitFlag;
        /// <summary>
        /// ����� �������� ���� ��������� ������� ����� �� ���� ������
        /// </summary>
        procedure PageDeleteAll;
        /// <summary>
        /// �������� ��������� �������� � ���� ������
        /// </summary>
        function PageCheckAdd(PageID: Integer; ProblemID: Integer; ProblemTypeID : Integer; Description: string): Integer;
        /// <summary>
        /// �������� ���������� ��������
        /// </summary>
        procedure PageCheckClear(ProblemTypeID: Integer);
        /// <summary>
        /// ���������� ������� "�������� ��������� ���������"
        /// </summary>
        procedure WebBrowserOnDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant); virtual;
        /// <summary>
        /// ���������� ������� "�������� �����"
        /// </summary>
        procedure WebBrowserOnFileDownload(ASender: TObject; ActiveDocument: WordBool; var Cancel: WordBool); virtual;
        /// <summary>
        /// ���������� ������� "������ ���������"
        /// </summary>
        procedure WebBrowserOnNavigateError(ASender: TObject; const pDisp: IDispatch; const URL, Frame, StatusCode: OleVariant; var Cancel: WordBool); virtual;
        /// <summary>
        /// ���������� �������
        /// </summary>
        procedure TimerOnTimer(Sender: TObject); virtual;
        /// <summary>
        /// ������� �������� ������ (�������� �������������� �������� ������). ������� ���������� ��� ���������� ��������� �� ������ �����.
        /// </summary>
        function TestLink(URL: string): Boolean;
        /// <summary>
        /// ����� �������� ����������� ������� ���������� ����������
        /// </summary>
        procedure TestRequirement;

    public
        /// <summary>
        /// ����������� ������
        /// </summary>
        constructor Create(Connection: TADOConnection);
        /// <summary>
        /// ���������� ������
        /// </summary>
        destructor Destroy; override;
        /// <summary>
        /// ������ ��������
        /// </summary>
        procedure Cancel;
        /// <summary>
        /// �������
        /// </summary>
        property WebBrowser: TWebBrowser read FWebBrowser write SetWebBrowser;
        /// <summary>
        /// ������
        /// </summary>
        property Timer: TTimer read FTimer;
        /// <summary>
        /// ������������� ������� ������
        /// </summary>
        property TaskID: Integer read FTaskID write SetTaskID;
        /// <summary>
        /// ������� ��������� ����������
        /// </summary>
        property State: TSiteNavigatorState read FState write SetState;
        /// <summary>
        /// ������� �����
        /// </summary>
        property BaseURL: string read FBaseURL;
        /// <summary>
        /// ��������� ���������� �������� ������ �� ������������
        /// </summary>
        property BaseURI: TIdURI read FBaseURI;
        /// <summary>
        /// ���������� ������� "��������� �������"
        /// </summary>
        property OnChangeState: TSiteNavigatorChangeState read FOnChangeState write SetOnChangeState;
        /// <summary>
        /// ���������� ������� "��������� ������"
        /// </summary>
        property OnChangeData: TSiteNavigatorChangeData read FOnChangeData write SetOnChangeData;
        /// <summary>
        /// ���������� ������� "��������� �������"
        /// </summary>
        property OnStatusTextChange: TSiteStatusTextChange read FOnStatusTextChange write SetOnStatusTextChange;
        /// <summary>
        /// ������ ������� ������ (������ �� ��)
        /// </summary>
        property Task: TADOQuery read FTask;

    end;

const
    // snsFree, snsExec, snsComplete, snsCancel, snsError
    TSiteNavigatorStateString: array [TSiteNavigatorState] of string = ('��������', '�����������', '���������', '��������', '������');

implementation

{ TSiteMapCreator }

procedure TSiteNavigator.Cancel;
begin
    SetState(snsCancel);
end;

constructor TSiteNavigator.Create(Connection: TADOConnection);
begin
    inherited Create(Connection);
    FTaskID := 0;
    FState := snsFree;
    FWebBrowser := nil;
    FBaseURL := '';
    FBaseURI := nil;
    FTask := nil;
    OnChangeState := nil;
    OnChangeData := nil;
    FTimer := TTimer.Create(nil);
    FTimer.Enabled := False;
    FTimer.Interval := 1000;
    FTimer.OnTimer := TimerOnTimer;
    FUsedExtensionList := TStringList.Create;
end;

destructor TSiteNavigator.Destroy;
begin
    FWebBrowser.Free;
    FTimer.Free;
    FUsedExtensionList.Free;
    if Assigned(FBaseURI) then
        FBaseURI.Free;
    if Assigned(FTask) then
        FTask.Free;
    inherited;
end;

procedure TSiteNavigator.LoadUsedExtensionList;
var
    P: TADOQuery;
begin
    FUsedExtensionList.Clear;
    P := ParamsGet;
    try
        FUsedExtensionList.Text := AnsiLowerCase(P.FieldByName('UsedExtension').AsString);
    finally
        P.Free;
    end;
end;

function TSiteNavigator.PageGet(ID: Integer): TADOQuery;
begin
    Result := GetQuery('select * from Page where ID = ' + IntToStr(ID));
    try
        if Result.RecordCount = 0 then
            raise Exception.Create('�������� � ��������������� "' + IntToStr(ID) + '" �� �������');
    except
        Result.Free;
        raise;
    end;
end;

procedure TSiteNavigator.PageDeleteAll;
begin
    ExecQuery('delete from Page where TaskID = ' + IntToStr(TaskID));
end;

procedure TSiteNavigator.PageCheckClear(ProblemTypeID: Integer);
begin
    ExecQuery('delete from PageCheck where PageID in (select ID from Page where TaskID = ' + IntToStr(TaskID) + ') and (ProblemTypeID = ' +
      IntToStr(ProblemTypeID) + ')');
end;

function TSiteNavigator.PageGet(URL: string): TADOQuery;
begin
    Result := GetQuery('select * from Page where URL = ' + QuotedStr(URL));
    try
        if Result.RecordCount = 0 then
            raise Exception.Create('�������� � ������ "' + URL + '" �� �������');
    except
        Result.Free;
        raise;
    end;
end;

function TSiteNavigator.ParamsGet: TADOQuery;
begin
    Result := GetQuery('select * from Params where ID = 1');
    try
        if Result.RecordCount = 0 then
            raise Exception.Create('������� ���� ������ "Params" �����');
    except
        Result.Free;
    end;
end;

function TSiteNavigator.PageCheckAdd(PageID, ProblemID, ProblemTypeID: Integer; Description: string): Integer;
var
    PageCheck: TADOQuery;
begin
    Result := 0;
    PageCheck := GetQuery('select * from PageCheck where PageID = ' + IntToStr(PageID) + ' and ProblemID = ' + IntToStr(ProblemID));
    try
        if PageCheck.RecordCount = 0 then
        begin
            PageCheck.Insert;
            PageCheck.FieldByName('RegistrationDate').AsDateTime := Now;
            PageCheck.FieldByName('PageID').AsInteger := PageID;
            PageCheck.FieldByName('ProblemID').AsInteger := ProblemID;
            PageCheck.FieldByName('ProblemTypeID').AsInteger := ProblemTypeID;
            PageCheck.FieldByName('Description').AsString := Description;
            PageCheck.Post;
        end;
        Result := PageCheck.FieldByName('ID').AsInteger;
    finally
        PageCheck.Free;
    end;
end;

procedure TSiteNavigator.SetOnChangeData(const Value: TSiteNavigatorChangeData);
begin
    FOnChangeData := Value;
end;

procedure TSiteNavigator.SetOnChangeState(const Value: TSiteNavigatorChangeState);
begin
    FOnChangeState := Value;
end;

procedure TSiteNavigator.SetOnStatusTextChange(const Value: TSiteStatusTextChange);
begin
    FOnStatusTextChange := Value;
end;

procedure TSiteNavigator.SetState(const Value: TSiteNavigatorState);
begin
    FState := Value;
    case FState of
        snsFree:
            begin
                FTimer.Enabled := False;
                if Assigned(FWebBrowser) then
                    FWebBrowser.Stop;
            end;
        snsExec:
            begin
                LoadUsedExtensionList;
            end;
        snsComplete:
            begin
                FTimer.Enabled := False;
                if Assigned(FWebBrowser) then
                    FWebBrowser.Stop;
            end;
        snsCancel:
            begin
                FTimer.Enabled := False;
                if Assigned(FWebBrowser) then
                    FWebBrowser.Stop;
            end;
        snsError:
            begin
                FTimer.Enabled := False;
                if Assigned(FWebBrowser) then
                    FWebBrowser.Stop;
            end;
    end;
    if Assigned(FOnChangeState) then
        FOnChangeState(Self);
end;

procedure TSiteNavigator.SetTaskID(const Value: Integer);
begin
    if Assigned(FTask) then
        FTask.Free;
    FTask := TaskGet(Value);
    try
        if Trim(Task.FieldByName('URL').AsString) = '' then
            raise Exception.Create('������� ����� ����� �� �����');
        FBaseURL := Task.FieldByName('URL').AsString;
        if Assigned(FBaseURI) then
            FBaseURI.Free;
        FBaseURI := TIdURI.Create(FBaseURL);
        FTaskID := Value;
    except
        FTask.Free;
        raise;
    end;
end;

procedure TSiteNavigator.SetWebBrowser(const Value: TWebBrowser);
begin
    FWebBrowser := Value;
    if Value <> nil then
    begin
        FWebBrowser.OnDocumentComplete := WebBrowserOnDocumentComplete;
        FWebBrowser.OnFileDownload := WebBrowserOnFileDownload;
        FWebBrowser.OnNavigateError := WebBrowserOnNavigateError;
    end;
end;

procedure TSiteNavigator.TaskClearVisitFlag;
var
    Q: TADOQuery;
    I: Integer;
begin
    Q := GetQuery('select * from Page where TaskID = ' + IntToStr(TaskID));
    try
        for I := 1 to Q.RecordCount do
        begin
            Q.RecNo := I;
            Q.Edit;
            Q.FieldByName('Visited').AsBoolean := False;
            Q.Post;
        end;
    finally
        Q.Free;
    end;
end;

function TSiteNavigator.TaskGet(ID: Integer): TADOQuery;
begin
    Result := GetQuery('select * from Task where ID = ' + IntToStr(ID));
    try
        if Result.RecordCount = 0 then
            raise Exception.Create('������ � ��������������� "' + IntToStr(ID) + '" �� �������');
    except
        Result.Free;
        raise;
    end;
end;

function TSiteNavigator.TestLink(URL: string): Boolean;
var
    URI: TIdURI;
    Ext: String;
begin
    Result := False;
    URI := TIdURI.Create(URL);
    try
        // ShowMessage(URI.Path);

        if (URI.Host <> FBaseURI.Host) then
            Exit;
        Ext := AnsiLowerCase(Trim(ExtractFileExt(URI.Document)));
        if Ext <> '' then
        begin
            if (FUsedExtensionList.IndexOf(Ext) = -1) then
                Exit;
        end;
        Result := True;
    finally
        URI.Free;
    end;
end;

procedure TSiteNavigator.TestRequirement;
begin
    if TaskID = 0 then
        raise Exception.Create('������� �� �������');
    if WebBrowser = nil then
        raise Exception.Create('������� �� �����');
end;

procedure TSiteNavigator.TimerOnTimer(Sender: TObject);
begin

end;

procedure TSiteNavigator.WebBrowserOnDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin

end;

procedure TSiteNavigator.WebBrowserOnFileDownload(ASender: TObject; ActiveDocument: WordBool; var Cancel: WordBool);
begin

end;

procedure TSiteNavigator.WebBrowserOnNavigateError(ASender: TObject; const pDisp: IDispatch; const URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin

end;

end.
