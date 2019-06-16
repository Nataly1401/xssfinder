unit ufMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus, Vcl.StdActns, Vcl.DBClientActns, Vcl.DBActns, Vcl.ActnList,
    Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
    DBGridEh, ADODB;

const
    c_scan_confirmation = 'Имеющиеся результаты сканирования будут утеряны. Продолжить?';

type
    TfMain = class(TForm)
        sbMain: TStatusBar;
        amMain: TActionManager;
        WindowClose1: TWindowClose;
        WindowCascade1: TWindowCascade;
        WindowTileHorizontal1: TWindowTileHorizontal;
        WindowTileVertical1: TWindowTileVertical;
        WindowMinimizeAll1: TWindowMinimizeAll;
        WindowArrange1: TWindowArrange;
        aExit: TAction;
        aParams: TAction;
        mmMain: TMainMenu;
        N10: TMenuItem;
        N7: TMenuItem;
        N13: TMenuItem;
        N20: TMenuItem;
        N2: TMenuItem;
        N8: TMenuItem;
        N6: TMenuItem;
        N3: TMenuItem;
        N4: TMenuItem;
        N11: TMenuItem;
        N12: TMenuItem;
        tbMain: TToolBar;
        ToolButton9: TToolButton;
        aProblem: TAction;
        DBGridEh1: TDBGridEh;
        aTaskCreate: TAction;
        aTaskCreateFrom: TAction;
        aTaskView: TAction;
        aTaskDelete: TAction;
        ToolButton3: TToolButton;
        ToolButton5: TToolButton;
        ToolButton6: TToolButton;
        ToolButton7: TToolButton;
        ToolButton8: TToolButton;
        ToolButton1: TToolButton;
        ToolButton2: TToolButton;
        ToolButton10: TToolButton;
        N5: TMenuItem;
        N9: TMenuItem;
        N15: TMenuItem;
        N16: TMenuItem;
        N17: TMenuItem;
        N18: TMenuItem;
        ToolButton4: TToolButton;
        aAbout: TAction;
        ToolButton12: TToolButton;
        aRunReflectedXssScan: TAction;
        ToolButton13: TToolButton;
        aRunStoredXssScan: TAction;
        aRunCreateMap: TAction;
        aRunFullScan: TAction;
        N1: TMenuItem;
        N14: TMenuItem;
        N19: TMenuItem;
        N21: TMenuItem;
        N22: TMenuItem;
        N23: TMenuItem;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton11: TToolButton;
    ToolButton17: TToolButton;
        procedure aExitExecute(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure aProblemExecute(Sender: TObject);
        procedure aTaskDeleteExecute(Sender: TObject);
        procedure aTaskViewExecute(Sender: TObject);
        procedure aTaskCreateFromExecute(Sender: TObject);
        procedure aTaskCreateExecute(Sender: TObject);
        procedure aParamsExecute(Sender: TObject);
        procedure aAboutExecute(Sender: TObject);
        procedure aRunReflectedXssScanExecute(Sender: TObject);
        procedure aRunCreateMapExecute(Sender: TObject);
        procedure aRunStoredXssScanExecute(Sender: TObject);
        procedure aRunFullScanExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    fMain: TfMain;

implementation

{$R *.dfm}

uses udmData, ufProblem, ufTaskEditor, ufExecution, ufParamsEditor;

procedure TfMain.aAboutExecute(Sender: TObject);
begin
    //
    MessageDlg(Caption + #13 + #10 + 'Поиск XSS-уязвимостей', mtInformation, [mbOK], 0);
end;

procedure TfMain.aExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfMain.aParamsExecute(Sender: TObject);
begin
    if fParamsEditor.ShowModal = mrOk then
    begin

    end;
end;

procedure TfMain.aProblemExecute(Sender: TObject);
begin
    fProblem.ShowModal;
end;

procedure TfMain.aRunFullScanExecute(Sender: TObject);
begin
    if MessageDlg(c_scan_confirmation, mtConfirmation, [mbCancel, mbOK], 0) = mrOk then
    begin
        fExecution.ExecutionMode := emFullCycle;
        fExecution.ShowModal;
        dmData.tTask.Refresh;
    end;
end;

procedure TfMain.aRunCreateMapExecute(Sender: TObject);
begin
    if MessageDlg(c_scan_confirmation, mtConfirmation, [mbCancel, mbOK], 0) = mrOk then
    begin
        fExecution.ExecutionMode := emCreateMap;
        fExecution.ShowModal;
        dmData.tTask.Refresh;
    end;
end;

procedure TfMain.aRunReflectedXssScanExecute(Sender: TObject);
begin
    if MessageDlg(c_scan_confirmation, mtConfirmation, [mbCancel, mbOK], 0) = mrOk then
    begin
        fExecution.ExecutionMode := emReflectedXssScan;
        fExecution.ShowModal;
        dmData.tTask.Refresh;
    end;
end;

procedure TfMain.aRunStoredXssScanExecute(Sender: TObject);
begin
    if MessageDlg(c_scan_confirmation, mtConfirmation, [mbCancel, mbOK], 0) = mrOk then
    begin
        fExecution.ExecutionMode := emStoredXssScan;
        fExecution.ShowModal;
        dmData.tTask.Refresh;
    end;
end;

procedure TfMain.aTaskCreateExecute(Sender: TObject);
begin
    dmData.tTask.Insert;
    dmData.tTaskTaskStateID.Value := c_task_state_create;
    dmData.tTaskRegistrationDate.Value := Now;
    fTaskEditor.TaskEditorState := tesAdd;
    if (fTaskEditor.ShowModal = mrOk) then
    begin
        dmData.TaskProblemSet(dmData.tTaskID.Value);
    end;
end;

procedure TfMain.aTaskCreateFromExecute(Sender: TObject);
var
    Task: TADOQuery;
    I: Integer;
begin
    if dmData.tTask.RecordCount = 0 then
        raise Exception.Create('Список заданий пуст');

    Task := dmData.TaskGet(dmData.tTaskID.Value);
    try
        dmData.tTask.Insert;
        for I := 0 to Task.FieldCount - 1 do
        begin
            if Task.Fields[I].FieldName <> 'ID' then
            begin
                dmData.tTask.Fields.FieldByName(Task.Fields[I].FieldName).Value := Task.FieldByName(Task.Fields[I].FieldName).Value;
            end;
        end;
        dmData.tTaskTaskStateID.Value := c_task_state_create;
        dmData.tTaskRegistrationDate.Value := Now;
    finally
        Task.Free;
    end;
    fTaskEditor.TaskEditorState := tesAdd;
    if (fTaskEditor.ShowModal = mrOk) then
    begin
        dmData.TaskProblemSet(dmData.tTaskID.Value);
    end;
end;

procedure TfMain.aTaskDeleteExecute(Sender: TObject);
begin
    if dmData.tTask.RecordCount = 0 then
        raise Exception.Create('Список заданий пуст');

    if (MessageDlg('Подтвердите удаление?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk) then
    begin
        dmData.tTask.Delete;
    end;
end;

procedure TfMain.aTaskViewExecute(Sender: TObject);
begin
    if dmData.tTask.RecordCount = 0 then
        raise Exception.Create('Список заданий пуст');
    fTaskEditor.TaskEditorState := tesView;
    fTaskEditor.ShowModal;
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    CanClose := MessageDlg('Закрыть приложение?', mtConfirmation, [mbCancel, mbOK], 0) = mrOk;
end;

end.
