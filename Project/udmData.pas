unit udmData;

interface

uses
    System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.AppEvnts, Vcl.DBClientActns, Vcl.DBActns,
    Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ImgList, Vcl.Controls, IniFiles, Forms, Dialogs,
    ufExecution, Datasnap.Provider, Datasnap.DBClient;

const
    c_Settings_File = 'Settings.ini';
    c_Settings_Section_Server = 'Server';
    c_Settings_Section_DB = 'Database';

    c_task_state_create = 1;
    c_task_state_login = 2;
    c_task_state_create_map = 3;
    c_task_state_reflected_xss_scan = 4;
    c_task_state_stored_xss_scan = 5;
    c_task_state_complete = 6;



type
    TdmData = class(TDataModule)
        ilMain: TImageList;
        ilDataSet32E_1: TImageList;
        ilDataSet32D_1: TImageList;
        ilDataSet32E_2: TImageList;
        ilDataSet32D_2: TImageList;
        amNavigator: TActionManager;
        DataSetFirst1: TDataSetFirst;
        DataSetPrior1: TDataSetPrior;
        DataSetNext1: TDataSetNext;
        DataSetLast1: TDataSetLast;
        DataSetInsert1: TDataSetInsert;
        DataSetDelete1: TDataSetDelete;
        DataSetEdit1: TDataSetEdit;
        DataSetPost1: TDataSetPost;
        DataSetCancel1: TDataSetCancel;
        DataSetRefresh1: TDataSetRefresh;
        ClientDataSetApply1: TClientDataSetApply;
        aeMain: TApplicationEvents;
        adoConnection: TADOConnection;
        tProblem: TADOTable;
        dsProblem: TDataSource;
        tProblemID: TAutoIncField;
        tProblemTitle: TWideStringField;
        tProblemDescription: TWideMemoField;
        tProblemCode: TWideMemoField;
        tProblemRecommendation: TWideMemoField;
        tProblemActive: TBooleanField;
        tTask: TADOTable;
        dsTask: TDataSource;
        tTaskState: TADOTable;
        dsTaskState: TDataSource;
        dsPage: TDataSource;
        dsPageCheck: TDataSource;
        tTaskID: TAutoIncField;
        tTaskRegistrationDate: TDateTimeField;
        tTaskTaskStateID: TIntegerField;
        tTaskTitle: TWideStringField;
        tTaskURL: TWideStringField;
        tTaskTaskState: TStringField;
        tTaskDescription: TWideMemoField;
        tTaskAuthorization: TBooleanField;
        qPage: TADOQuery;
        qPageCheck: TADOQuery;
        tTaskLoginFormName: TWideStringField;
        tTaskLoginFormID: TWideStringField;
        tTaskLoginFormClass: TWideStringField;
        tTaskLoginFieldName: TWideStringField;
        tTaskLoginFieldID: TWideStringField;
        tTaskLoginFieldClass: TWideStringField;
        tTaskLoginFieldValue: TWideStringField;
        tTaskPasswordFieldName: TWideStringField;
        tTaskPasswordFieldID: TWideStringField;
        tTaskPasswordFieldClass: TWideStringField;
        tTaskPasswordFieldValue: TWideStringField;
        tTaskAuthorizationURL: TWideStringField;
        tParams: TADOTable;
        dsParams: TDataSource;
        tParamsID: TIntegerField;
        tParamsUsedExtension: TWideMemoField;
        cdsPage: TClientDataSet;
        dspPage: TDataSetProvider;
        cdsPageCheck: TClientDataSet;
        dspPageCheck: TDataSetProvider;
        cdsPageID: TAutoIncField;
        cdsPageTaskID: TIntegerField;
        cdsPageRegistrationDate: TDateTimeField;
        cdsPageTitle: TWideStringField;
        cdsPageURL: TWideStringField;
        cdsPageVisited: TBooleanField;
        cdsPageChecked: TBooleanField;
        cdsPageCheckID: TAutoIncField;
        cdsPageCheckRegistrationDate: TDateTimeField;
        cdsPageCheckPageID: TIntegerField;
        cdsPageCheckProblemID: TIntegerField;
        cdsPageCheckProblem: TWideStringField;
        cdsPageCheckTaskID: TIntegerField;
        cdsPageErrorMessage: TWideStringField;
        cdsPageError: TBooleanField;
        cdsPageCheckProblemTypeID: TIntegerField;
        tProblemType: TADOTable;
        dsProblemType: TDataSource;
        cdsPageCheckProblemType: TWideStringField;
        dsTaskProblem: TDataSource;
        qTaskProblem: TADOQuery;
        cdsTaskProblem: TClientDataSet;
        dspTaskProblem: TDataSetProvider;
        cdsTaskProblemID: TAutoIncField;
        cdsTaskProblemTaskID: TIntegerField;
        cdsTaskProblemProblemID: TIntegerField;
    cdsTaskProblemTitle: TWideStringField;
    tTaskAuthorizationManual: TBooleanField;
    tTaskAuthorizationCompleteURL: TWideStringField;
    cdsPageForChecking: TBooleanField;
    cdsPageProblemCount: TIntegerField;
    cdsTaskProblemDescription: TWideMemoField;
    cdsTaskProblemCode: TWideMemoField;
    cdsTaskProblemRecommendation: TWideMemoField;
    cdsTaskProblemActive: TBooleanField;
    cdsPageCheckDescription: TWideMemoField;
    cdsTaskProblemProblemCount: TFloatField;
        procedure DataModuleCreate(Sender: TObject);
        procedure CommonBeforeDelete(DataSet: TDataSet);
        procedure tProblemAfterInsert(DataSet: TDataSet);
        procedure tProblemAfterEdit(DataSet: TDataSet);
        procedure qPageBeforeOpen(DataSet: TDataSet);
        procedure qPageCheckBeforeOpen(DataSet: TDataSet);
        procedure qTaskProblemBeforeOpen(DataSet: TDataSet);
    private
        { Private declarations }
        FSettings: TIniFile;
        FShowOpForms: Boolean;
        procedure ExecForm(F: TForm);
        procedure SiteMapCreatorOnNewLink(Sender: TObject; URL: string; Title: string);


    public
        { Public declarations }
        /// <summary>
        /// Задает список анализируемых уязвимостей для указанной задачи
        /// </summary>
        procedure TaskProblemSet(TaskID: Integer);
        /// <summary>
        /// Найти задачу в базе данных
        /// </summary>
        function TaskGet(ID: Integer): TADOQuery;

        procedure TaskSetState (TaskID : Integer; TaskStateID : Integer);

        function GetTable(TableName: String): TADOTable;
        function GetQuery(SQL: String): TADOQuery;
        procedure DataSetsActive(Active: Boolean);
        property Settings: TIniFile read FSettings;
        property ShowOpForms: Boolean read FShowOpForms write FShowOpForms;

    end;

var
    dmData: TdmData;

implementation

// {%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses ufProblemEditor, ufTaskEditor;

procedure TdmData.DataSetsActive(Active: Boolean);
begin
    tTaskState.Active := Active;
    tProblemType.Active := Active;
    tParams.Active := Active;
    tProblem.Active := Active;
    tTask.Active := Active;
    cdsPage.Active := Active;
    cdsPageCheck.Active := Active;
    cdsTaskProblem.Active := Active;
end;

procedure TdmData.ExecForm(F: TForm);
begin
    if (FShowOpForms = True) then
    begin
        if F.Visible = False then
            F.ShowModal;
    end;
end;

function TdmData.GetTable(TableName: String): TADOTable;
begin
    Result := TADOTable.Create(nil);
    try
        Result.Connection := adoConnection;
        Result.TableName := TableName;
        Result.Open;
    except
        on E: Exception do
        begin
            Result.Free;
            raise;
        end;
    end;
end;

procedure TdmData.qPageBeforeOpen(DataSet: TDataSet);
begin
    //
    (DataSet as TADOQuery).Parameters.ParamByName('TaskID').Value := tTaskID.Value;
end;

procedure TdmData.qPageCheckBeforeOpen(DataSet: TDataSet);
begin
    (DataSet as TADOQuery).Parameters.ParamByName('TaskID').Value := tTaskID.Value;
end;

procedure TdmData.qTaskProblemBeforeOpen(DataSet: TDataSet);
begin
    (DataSet as TADOQuery).Parameters.ParamByName('TaskID').Value := tTaskID.Value;
end;

procedure TdmData.SiteMapCreatorOnNewLink(Sender: TObject; URL, Title: string);
begin
    //
    fExecution.sbMain.Panels[0].Text := Title + ' ' + URL;
end;

function TdmData.TaskGet(ID: Integer): TADOQuery;
begin
    Result := GetQuery('select * from Task where ID = ' + IntToStr(ID));
    try
        if Result.RecordCount = 0 then
            raise Exception.Create('Задача с идентификатором "' + IntToStr(ID) + '" не найдена');
    except
        Result.Free;
        raise;
    end;
end;

procedure TdmData.TaskProblemSet(TaskID: Integer);
var
    Task, Problem, TaskProblem: TADOQuery;
    I: Integer;
begin
    Task := TaskGet(TaskID);
    try
        Problem := GetQuery('select * from Problem where Active = True');
        try
            TaskProblem := GetQuery('select * from TaskProblem where TaskID = ' + IntToStr(TaskID));
            try
                for I := 1 to TaskProblem.RecordCount do
                    TaskProblem.Delete;
                for I := 1 to Problem.RecordCount do
                begin
                    Problem.RecNo := I;
                    TaskProblem.Insert;
                    TaskProblem.FieldByName('TaskID').AsInteger := TaskID;
                    TaskProblem.FieldByName('ProblemID').AsInteger := Problem.FieldByName('ID').AsInteger;
                    TaskProblem.Post;
                end;
            finally
                TaskProblem.Free;
            end;
        finally
            Problem.Free;
        end;
    finally
        Task.Free;
    end;
end;

procedure TdmData.TaskSetState(TaskID, TaskStateID: Integer);
var
    Task : TADOQuery;
begin
    Task := TaskGet(TaskID);
    try
        Task.Edit;
        Task.FieldByName('TaskStateID').AsInteger := TaskStateID;
        Task.Post;
    finally
        Task.Free;
    end;
end;

procedure TdmData.tProblemAfterEdit(DataSet: TDataSet);
begin
    ExecForm(fProblemEditor);
end;

procedure TdmData.tProblemAfterInsert(DataSet: TDataSet);
begin
    tProblemActive.Value := True;
    ExecForm(fProblemEditor);
end;

function TdmData.GetQuery(SQL: String): TADOQuery;
begin
    Result := TADOQuery.Create(nil);
    try
        Result.Connection := adoConnection;
        Result.SQL.Text := SQL;
        Result.Open;
    except
        on E: Exception do
        begin
            Result.Free;
            raise;
        end;
    end;
end;

procedure TdmData.DataModuleCreate(Sender: TObject);

    function GetDataBaseName: String;
    begin
        try
            Result := FSettings.ReadString(c_Settings_Section_DB, 'Database', 'Base.mdb');
            if (ExtractFilePath(Result) = '') then
            begin
                Result := ExtractFilePath(Application.ExeName) + Result;
            end;
        except
        end;
    end;

begin
    try
        FShowOpForms := True;
        FSettings := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\' + c_Settings_File);
        adoConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;Data Source=' + GetDataBaseName;
        adoConnection.Connected := True;


        // FSiteMapCreator.OnNewLink := SiteMapCreatorOnNewLink;

        DataSetsActive(True);
    except
        on E: Exception do
        begin
            MessageDlg(E.Message + #13 + #10 + 'Приложение будет закрыто.', mtError, [mbOK], 0);
            Application.Terminate;
        end;
    end;
end;

procedure TdmData.CommonBeforeDelete(DataSet: TDataSet);
begin
    //
    if (MessageDlg('Подтвердите удаление?', mtConfirmation, [mbOK, mbCancel], 0) <> mrOk) then
    begin
        //
        Abort;
    end;
end;

end.
