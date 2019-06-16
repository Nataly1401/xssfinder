unit ufParamsEditor;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
    Vcl.Mask, DB, Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh,
    Vcl.ToolWin, Vcl.DBClientActns, Vcl.DBActns, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, DBCtrlsEh;

type
    TfParamsEditor = class(TForm)
        Panel1: TPanel;
        bOk: TButton;
        bCancel: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBMemo1: TDBMemo;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure bOkClick(Sender: TObject);
        procedure FormKeyPress(Sender: TObject; var Key: Char);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    fParamsEditor: TfParamsEditor;

implementation

{$R *.dfm}

uses udmData;

procedure TfParamsEditor.bOkClick(Sender: TObject);
begin
    if (dmData.tParams.State = dsEdit) or (dmData.tParams.State = dsInsert) then
    begin
        dmData.tParams.Post;
    end;
    Close;
end;

procedure TfParamsEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dmData.tParams.Cancel;
end;

procedure TfParamsEditor.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #27 then
        Close;
end;

end.
