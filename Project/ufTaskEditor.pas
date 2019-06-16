unit ufTaskEditor;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
    Vcl.Mask, DB, Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh,
    Vcl.ToolWin, Vcl.DBClientActns, Vcl.DBActns, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, DBCtrlsEh;

type
    TTaskEditorState = (tesAdd, tesView);

    TfTaskEditor = class(TForm)
        Panel1: TPanel;
        bOk: TButton;
        bCancel: TButton;
        PageControl1: TPageControl;
    tsCommon: TTabSheet;
    tsTaskProblem: TTabSheet;
    dbvgCommon: TDBVertGridEh;
    tsPages: TTabSheet;
        DBGridEh1: TDBGridEh;
        DBGridEh2: TDBGridEh;
        Splitter1: TSplitter;
    DBGridEh3: TDBGridEh;
    bReportMain: TButton;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure bOkClick(Sender: TObject);
        procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    private
        FTaskEditorState: TTaskEditorState;
        procedure SetTaskEditorState(const Value: TTaskEditorState);
        { Private declarations }
    public
        { Public declarations }
        property TaskEditorState: TTaskEditorState read FTaskEditorState write SetTaskEditorState;
    end;

var
    fTaskEditor: TfTaskEditor;

implementation

{$R *.dfm}

uses udmData, udmReport;

procedure TfTaskEditor.bOkClick(Sender: TObject);
begin
    if (dmData.tTask.State = dsEdit) or (dmData.tTask.State = dsInsert) then
    begin
        dmData.tTask.Post;
    end;
    ModalResult := mrOk;
end;

procedure TfTaskEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmData.tTask.Cancel;
end;

procedure TfTaskEditor.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #27 then
        Close;
end;

procedure TfTaskEditor.FormShow(Sender: TObject);
begin
    //
    dmData.cdsPage.Refresh;
    dmData.cdsPageCheck.Refresh;
    dmData.cdsTaskProblem.Refresh;
end;

procedure TfTaskEditor.SetTaskEditorState(const Value: TTaskEditorState);
begin
    FTaskEditorState := Value;
    case Value of
        tesAdd:
            begin
                Caption := 'Задача: Добавление';
                tsPages.TabVisible := False;
                tsTaskProblem.TabVisible := False;
                dbvgCommon.ReadOnly := False;
                bCancel.Visible := True;
                bOk.Visible := True;
                bReportMain.Visible := False;
            end;
        tesView:
            begin
                Caption := 'Задача: Просмотр';
                tsPages.TabVisible := True;
                tsTaskProblem.TabVisible := True;
                dbvgCommon.ReadOnly := True;
                bCancel.Visible := False;
                bOk.Visible := False;
                bReportMain.Visible := True;
            end;
    end;
end;

end.
