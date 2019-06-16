object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'XSS Finder v.1.0'
  ClientHeight = 420
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object sbMain: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 398
    Width = 809
    Height = 19
    Panels = <>
  end
  object tbMain: TToolBar
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 809
    Height = 38
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'tbMain'
    DrawingStyle = dsGradient
    Images = dmData.ilMain
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Action = aTaskCreate
    end
    object ToolButton5: TToolButton
      Left = 39
      Top = 0
      Action = aTaskCreateFrom
    end
    object ToolButton6: TToolButton
      Left = 78
      Top = 0
      Action = aTaskDelete
    end
    object ToolButton1: TToolButton
      Left = 117
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton16: TToolButton
      Left = 125
      Top = 0
      Action = aRunCreateMap
    end
    object ToolButton14: TToolButton
      Left = 164
      Top = 0
      Action = aRunReflectedXssScan
    end
    object ToolButton15: TToolButton
      Left = 203
      Top = 0
      Action = aRunStoredXssScan
    end
    object ToolButton12: TToolButton
      Left = 242
      Top = 0
      Action = aRunFullScan
    end
    object ToolButton13: TToolButton
      Left = 281
      Top = 0
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 289
      Top = 0
      Action = aTaskView
    end
    object ToolButton2: TToolButton
      Left = 328
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 336
      Top = 0
      Action = aProblem
    end
    object ToolButton4: TToolButton
      Left = 375
      Top = 0
      Action = aParams
    end
    object ToolButton10: TToolButton
      Left = 414
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton17: TToolButton
      Left = 422
      Top = 0
      Action = aAbout
    end
    object ToolButton11: TToolButton
      Left = 461
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 469
      Top = 0
      Action = aExit
    end
  end
  object DBGridEh1: TDBGridEh
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 809
    Height = 345
    Align = alClient
    AllowedOperations = []
    DataSource = dmData.dsTask
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
    TabOrder = 2
    TitleParams.MultiTitle = True
    TitleParams.RowLines = 3
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'RegistrationDate'
        Footers = <>
        Layout = tlCenter
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Title'
        Footers = <>
        Layout = tlCenter
        Width = 200
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'URL'
        Footers = <>
        Layout = tlCenter
        Width = 200
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'TaskState'
        Footers = <>
        Layout = tlCenter
        Width = 150
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object amMain: TActionManager
    ActionBars = <
      item
        Items.CaptionOptions = coAll
        Items = <>
      end
      item
      end
      item
      end
      item
      end>
    Images = dmData.ilMain
    Left = 112
    Top = 240
    StyleName = 'Platform Default'
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Enabled = False
      Hint = 'Close'
    end
    object WindowCascade1: TWindowCascade
      Category = 'Window'
      Caption = #1050#1072#1089#1082#1072#1076
      Enabled = False
      Hint = 'Cascade'
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077' '#1074#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077
      Enabled = False
      Hint = 'Tile Horizontal'
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077' '#1074#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077
      Enabled = False
      Hint = 'Tile Vertical'
    end
    object WindowMinimizeAll1: TWindowMinimizeAll
      Category = 'Window'
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      Enabled = False
      Hint = 'Minimize All'
    end
    object WindowArrange1: TWindowArrange
      Category = 'Window'
      Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100
      Enabled = False
    end
    object aExit: TAction
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076
      ImageIndex = 7
      OnExecute = aExitExecute
    end
    object aParams: TAction
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      Hint = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 13
      OnExecute = aParamsExecute
    end
    object aProblem: TAction
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081
      ImageIndex = 10
      OnExecute = aProblemExecute
    end
    object aTaskCreate: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1085#1080#1077
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1085#1080#1077
      ImageIndex = 6
      ShortCut = 16457
      OnExecute = aTaskCreateExecute
    end
    object aTaskCreateFrom: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1085#1080#1077' '#1080#1079' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1079#1072#1076#1072#1085#1080#1103
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1085#1080#1077' '#1080#1079' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1079#1072#1076#1072#1085#1080#1103
      ImageIndex = 6
      ShortCut = 16463
      OnExecute = aTaskCreateFromExecute
    end
    object aTaskView: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1072#1076#1072#1085#1080#1103
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1072#1076#1072#1085#1080#1103
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = aTaskViewExecute
    end
    object aTaskDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1076#1072#1085#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1076#1072#1085#1080#1077
      ImageIndex = 8
      ShortCut = 46
      OnExecute = aTaskDeleteExecute
    end
    object aAbout: TAction
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Hint = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      ImageIndex = 11
      OnExecute = aAboutExecute
    end
    object aRunCreateMap: TAction
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1082#1072#1088#1090#1099' '#1089#1072#1081#1090#1072
      Hint = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1082#1072#1088#1090#1099' '#1089#1072#1081#1090#1072
      ImageIndex = 3
      OnExecute = aRunCreateMapExecute
    end
    object aRunReflectedXssScan: TAction
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1086#1090#1088#1072#1078#1077#1085#1085#1099#1093' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081
      Hint = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1086#1090#1088#1072#1078#1077#1085#1085#1099#1093' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081
      ImageIndex = 4
      OnExecute = aRunReflectedXssScanExecute
    end
    object aRunStoredXssScan: TAction
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1093#1088#1072#1085#1080#1084#1099#1093' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081
      Hint = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1086#1080#1089#1082' '#1093#1088#1072#1085#1080#1084#1099#1093' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081
      ImageIndex = 4
      OnExecute = aRunStoredXssScanExecute
    end
    object aRunFullScan: TAction
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1086#1083#1085#1099#1081' '#1094#1080#1082#1083' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1089#1072#1081#1090#1072
      Hint = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1086#1083#1085#1099#1081' '#1094#1080#1082#1083' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1089#1072#1081#1090#1072
      ImageIndex = 2
      OnExecute = aRunFullScanExecute
    end
  end
  object mmMain: TMainMenu
    Left = 64
    Top = 240
    object N10: TMenuItem
      Caption = #1057#1080#1089#1090#1077#1084#1072
      object N7: TMenuItem
        Action = aProblem
      end
      object N13: TMenuItem
        Action = aParams
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Action = aExit
      end
    end
    object N5: TMenuItem
      Caption = #1047#1072#1076#1072#1095#1072
      object N9: TMenuItem
        Action = aTaskCreate
      end
      object N15: TMenuItem
        Action = aTaskCreateFrom
      end
      object N16: TMenuItem
        Action = aTaskDelete
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N18: TMenuItem
        Action = aTaskView
      end
    end
    object N1: TMenuItem
      Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077
      object N14: TMenuItem
        Action = aRunCreateMap
      end
      object N19: TMenuItem
        Action = aRunReflectedXssScan
      end
      object N21: TMenuItem
        Action = aRunStoredXssScan
      end
      object N23: TMenuItem
        Caption = '-'
      end
      object N22: TMenuItem
        Action = aRunFullScan
      end
    end
    object N8: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
      object N6: TMenuItem
        Action = dmReport.aReportMain
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Action = dmReport.aEdit
        AutoCheck = True
      end
    end
    object N11: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N12: TMenuItem
        Action = aAbout
      end
    end
  end
end
