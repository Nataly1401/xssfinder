unit uMyWebBrowser;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
    WinInet, Vcl.AppEvnts, MSHTML, ActiveX;

type
    IDocHostShowUI = interface(IUnknown)
        ['{c4d244b0-d43e-11cf-893b-00aa00bdce1a}']
        function ShowMessage(hwnd: THandle; lpstrText: POleStr; lpstrCaption: POleStr; dwType: longint; lpstrHelpFile: POleStr; dwHelpContext: longint;
          var plResult: LRESULT): HRESULT; stdcall;
    end;

    TShowMessageEvent = function(Sender: TObject; hwnd: THandle; lpstrText: POleStr; lpstrCaption: POleStr; dwType: longint; lpstrHelpFile: POleStr;
      dwHelpContext: longint; var plResult: LRESULT): HRESULT of object;

    TMyWebBrowser = class(SHDocVw.TWebBrowser, IDocHostShowUI)
    private
        fOnShowMessage: TShowMessageEvent;
    protected
        function ShowMessage(hwnd: THandle; lpstrText: POleStr; lpstrCaption: POleStr; dwType: longint; lpstrHelpFile: POleStr; dwHelpContext: longint;
          var plResult: LRESULT): HRESULT; stdcall;
    published
        property OnShowMessage: TShowMessageEvent read fOnShowMessage write fOnShowMessage;
    end;

implementation

function TMyWebBrowser.ShowMessage(hwnd: THandle; lpstrText, lpstrCaption: POleStr; dwType: Integer; lpstrHelpFile: POleStr; dwHelpContext: Integer;
  var plResult: LRESULT): HRESULT;
begin
    if Assigned(fOnShowMessage) then
        Result := fOnShowMessage(Self, hwnd, lpstrText, lpstrCaption, dwType, lpstrHelpFile, dwHelpContext, plResult)
    else
        Result := S_OK;
end;

end.
