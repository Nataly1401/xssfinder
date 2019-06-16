unit ufProblemEditor;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
    Vcl.Mask, DB, Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh,
    Vcl.ToolWin, Vcl.DBClientActns, Vcl.DBActns, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, DBCtrlsEh;

type
    TfProblemEditor = class(TForm)
        Panel1: TPanel;
        bOk: TButton;
        bCancel: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBVertGridEh1: TDBVertGridEh;
    DBMemoEh1: TDBMemoEh;
    TabSheet4: TTabSheet;
    DBMemoEh2: TDBMemoEh;
    DBMemoEh3: TDBMemoEh;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure bOkClick(Sender: TObject);
        procedure FormKeyPress(Sender: TObject; var Key: Char);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    fProblemEditor: TfProblemEditor;

implementation

{$R *.dfm}

uses udmData;

procedure TfProblemEditor.bOkClick(Sender: TObject);
begin
    if (dmData.tProblem.State = dsEdit) or (dmData.tProblem.State = dsInsert) then
    begin
        dmData.tProblem.Post;
        dmData.tProblem.Refresh;
    end;
    Close;
end;

procedure TfProblemEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmData.tProblem.Cancel;
end;

procedure TfProblemEditor.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #27 then
        Close;
end;

end.
