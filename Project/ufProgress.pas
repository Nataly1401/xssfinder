unit ufProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfProgress = class(TForm)
    pbMain: TProgressBar;
    lMessage: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProgress: TfProgress;

implementation

{$R *.dfm}



procedure TfProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //
end;

end.
