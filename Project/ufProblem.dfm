object fProblem: TfProblem
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081
  ClientHeight = 430
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object tbNavigator: TToolBar
    AlignWithMargins = True
    Left = 3
    Top = 370
    Width = 740
    Height = 38
    Align = alBottom
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'tbMain'
    DisabledImages = dmData.ilDataSet32D_2
    DrawingStyle = dsGradient
    Images = dmData.ilDataSet32E_2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object ToolButton12: TToolButton
      Left = 0
      Top = 0
      Action = DataSetFirst1
    end
    object ToolButton13: TToolButton
      Left = 39
      Top = 0
      Action = DataSetPrior1
    end
    object ToolButton14: TToolButton
      Left = 78
      Top = 0
      Action = DataSetNext1
    end
    object ToolButton15: TToolButton
      Left = 117
      Top = 0
      Action = DataSetLast1
    end
    object ToolButton2: TToolButton
      Left = 156
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton17: TToolButton
      Left = 164
      Top = 0
      Action = DataSetInsert1
    end
    object ToolButton18: TToolButton
      Left = 203
      Top = 0
      Action = DataSetDelete1
    end
    object ToolButton19: TToolButton
      Left = 242
      Top = 0
      Action = DataSetEdit1
    end
    object ToolButton1: TToolButton
      Left = 281
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton20: TToolButton
      Left = 289
      Top = 0
      Action = DataSetPost1
    end
    object ToolButton21: TToolButton
      Left = 328
      Top = 0
      Action = DataSetCancel1
    end
    object ToolButton4: TToolButton
      Left = 367
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton22: TToolButton
      Left = 375
      Top = 0
      Action = DataSetRefresh1
    end
  end
  object DBGridEh1: TDBGridEh
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 740
    Height = 361
    Align = alClient
    AllowedOperations = []
    DataSource = dmData.dsProblem
    DrawMemoText = True
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    EmptyDataInfo.Active = True
    EmptyDataInfo.Text = #1053#1072#1073#1086#1088' '#1076#1072#1085#1085#1099#1093' '#1087#1091#1089#1090
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    RowLines = 3
    RowSizingAllowed = True
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    TitleParams.RowLines = 3
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Title'
        Footers = <>
        Layout = tlCenter
        Width = 250
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Code'
        Footers = <>
        Layout = tlCenter
        Width = 350
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'Active'
        Footers = <>
        Layout = tlCenter
        Width = 75
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 411
    Width = 746
    Height = 19
    Panels = <>
  end
  object amNavigator: TActionManager
    Left = 80
    Top = 120
    StyleName = 'Platform Default'
    object DataSetFirst1: TDataSetFirst
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1055#1077#1088#1074#1072#1103
      Hint = #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 0
    end
    object DataSetPrior1: TDataSetPrior
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103
      Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 1
    end
    object DataSetNext1: TDataSetNext
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1057#1083#1077#1076#1091#1102#1097#1072#1103
      Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 2
    end
    object DataSetLast1: TDataSetLast
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
    end
    object DataSetInsert1: TDataSetInsert
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 4
      ShortCut = 16449
    end
    object DataSetDelete1: TDataSetDelete
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 5
      ShortCut = 16452
    end
    object DataSetEdit1: TDataSetEdit
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1056#1077#1076#1072#1082#1090'.'
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 6
      ShortCut = 16453
    end
    object DataSetPost1: TDataSetPost
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1083#1086#1082#1072#1083#1100#1085#1086
      ImageIndex = 7
      ShortCut = 16467
    end
    object DataSetCancel1: TDataSetCancel
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1054#1090#1084#1077#1085#1072
      Hint = #1054#1090#1084#1077#1085#1072
      ImageIndex = 8
    end
    object DataSetRefresh1: TDataSetRefresh
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 9
    end
    object ClientDataSetApply1: TClientDataSetApply
      Category = #1053#1072#1074#1080#1075#1072#1090#1086#1088
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1041#1044
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1074' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 7
      DisplayErrorDlg = False
    end
  end
end
