object fExecution: TfExecution
  Left = 0
  Top = 0
  Caption = 'XSS '#1057#1082#1072#1085#1077#1088
  ClientHeight = 409
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbMain: TStatusBar
    Left = 0
    Top = 390
    Width = 807
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 358
    Width = 807
    Height = 32
    Align = alBottom
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      803
      28)
    object lMessage: TLabel
      Left = 119
      Top = 6
      Width = 676
      Height = 14
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'lMessage'
      ExplicitWidth = 680
    end
    object pbMain: TProgressBar
      Left = 8
      Top = 5
      Width = 105
      Height = 17
      TabOrder = 0
    end
  end
  object pControl: TPanel
    Left = 0
    Top = 0
    Width = 807
    Height = 41
    Align = alTop
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      803
      37)
    object eAddress: TEdit
      Left = 8
      Top = 8
      Width = 549
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
    end
    object bAutorizationComplete: TButton
      Left = 644
      Top = 6
      Width = 148
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1072
      TabOrder = 1
      OnClick = bAutorizationCompleteClick
    end
    object bNavigate: TButton
      Left = 563
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Default = True
      TabOrder = 2
      OnClick = bNavigateClick
    end
  end
end
