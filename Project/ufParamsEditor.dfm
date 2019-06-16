object fParamsEditor: TfParamsEditor
  Left = 0
  Top = 0
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099': '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 340
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 306
    Width = 455
    Height = 31
    Margins.Top = 0
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 132
    ExplicitWidth = 394
    object bOk: TButton
      AlignWithMargins = True
      Left = 296
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'OK'
      TabOrder = 0
      OnClick = bOkClick
      ExplicitLeft = 235
    end
    object bCancel: TButton
      AlignWithMargins = True
      Left = 377
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 316
    end
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 455
    Height = 300
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 673
    ExplicitHeight = 354
    object TabSheet1: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082' '#1076#1086#1087#1091#1089#1090#1080#1084#1099#1093' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1081
      ExplicitWidth = 671
      ExplicitHeight = 332
      object DBMemo1: TDBMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 441
        Height = 266
        Align = alClient
        DataField = 'UsedExtension'
        DataSource = dmData.dsParams
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
end
