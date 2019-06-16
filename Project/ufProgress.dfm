object fProgress: TfProgress
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1042#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1072#1085#1072#1083#1080#1079' '#1089#1072#1081#1090#1072
  ClientHeight = 60
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  DesignSize = (
    420
    60)
  PixelsPerInch = 96
  TextHeight = 13
  object lMessage: TLabel
    Left = 8
    Top = 31
    Width = 404
    Height = 18
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    ExplicitWidth = 257
  end
  object pbMain: TProgressBar
    Left = 8
    Top = 8
    Width = 404
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    ExplicitWidth = 327
  end
end
