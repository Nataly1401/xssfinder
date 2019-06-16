unit ufProblem;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.DBClientActns, Vcl.DBActns, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
    Vcl.ActnMan,
    DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
    TfProblem = class(TForm)
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
        tbNavigator: TToolBar;
        ToolButton12: TToolButton;
        ToolButton13: TToolButton;
        ToolButton14: TToolButton;
        ToolButton15: TToolButton;
        ToolButton2: TToolButton;
        ToolButton17: TToolButton;
        ToolButton18: TToolButton;
        ToolButton19: TToolButton;
        ToolButton1: TToolButton;
        ToolButton20: TToolButton;
        ToolButton21: TToolButton;
        ToolButton4: TToolButton;
        ToolButton22: TToolButton;
        DBGridEh1: TDBGridEh;
        StatusBar1: TStatusBar;
        procedure FormKeyPress(Sender: TObject; var Key: Char);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    fProblem: TfProblem;

implementation

{$R *.dfm}

uses udmData;

procedure TfProblem.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #27 then
        Close;
end;

end.
