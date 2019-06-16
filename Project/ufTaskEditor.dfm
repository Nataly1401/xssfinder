object fTaskEditor: TfTaskEditor
  Left = 0
  Top = 0
  Caption = #1047#1072#1076#1072#1095#1072': '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 524
  ClientWidth = 830
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 490
    Width = 824
    Height = 31
    Margins.Top = 0
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object bOk: TButton
      AlignWithMargins = True
      Left = 665
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = bOkClick
    end
    object bCancel: TButton
      AlignWithMargins = True
      Left = 746
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object bReportMain: TButton
      Left = 4
      Top = 3
      Width = 194
      Height = 25
      Action = dmReport.aReportMain
      TabOrder = 2
    end
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 824
    Height = 484
    ActivePage = tsCommon
    Align = alClient
    TabOrder = 1
    object tsCommon: TTabSheet
      Caption = #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
      object dbvgCommon: TDBVertGridEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 810
        Height = 450
        Align = alClient
        AllowedSelections = []
        RowCategories.Active = True
        RowCategories.CategoryProps = <
          item
            Name = 'Task'
            DisplayText = #1047#1072#1076#1072#1095#1072
            DefaultExpanded = True
          end
          item
            Name = 'Site'
            DisplayText = #1057#1072#1081#1090
            DefaultExpanded = True
          end
          item
            Name = 'Authorization'
            DisplayText = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
            DefaultExpanded = True
          end>
        DataSource = dmData.dsTask
        DrawGraphicData = True
        DrawMemoText = True
        Options = [dgvhEditing, dgvhAlwaysShowEditor, dgvhLabelCol, dgvhRowResize, dgvhColLines, dgvhRowLines, dgvhConfirmDelete, dgvhCancelOnExit]
        TabOrder = 0
        LabelColWidth = 329
        Rows = <
          item
            Color = clMoneyGreen
            DynProps = <>
            EditButtons = <>
            FieldName = 'RegistrationDate'
            ReadOnly = True
            CategoryName = 'Task'
          end
          item
            Color = clMoneyGreen
            DynProps = <>
            EditButtons = <>
            FieldName = 'TaskState'
            ReadOnly = True
            CategoryName = 'Task'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Title'
            CategoryName = 'Task'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'URL'
            CategoryName = 'Site'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Authorization'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'AuthorizationURL'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'AuthorizationCompleteURL'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'AuthorizationManual'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LoginFormName'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LoginFormID'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LoginFormClass'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LoginFieldName'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LoginFieldID'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LoginFieldClass'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'LoginFieldValue'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PasswordFieldName'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PasswordFieldID'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PasswordFieldClass'
            CategoryName = 'Authorization'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PasswordFieldValue'
            CategoryName = 'Authorization'
          end>
      end
    end
    object tsTaskProblem: TTabSheet
      Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1086#1074#1077#1088#1103#1077#1084#1099#1093' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081
      ImageIndex = 1
      object DBGridEh3: TDBGridEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 810
        Height = 450
        Align = alClient
        AllowedOperations = []
        DataSource = dmData.dsTaskProblem
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
        TabOrder = 0
        TitleParams.MultiTitle = True
        TitleParams.RowLines = 3
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Title'
            Footers = <>
            Layout = tlCenter
            Width = 645
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'ProblemCount'
            Footers = <>
            Layout = tlCenter
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsPages: TTabSheet
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1088#1086#1074#1077#1088#1082#1080
      ImageIndex = 2
      object Splitter1: TSplitter
        Left = 0
        Top = 283
        Width = 816
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 0
        ExplicitWidth = 183
      end
      object DBGridEh1: TDBGridEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 810
        Height = 277
        Align = alClient
        AllowedOperations = []
        DataSource = dmData.dsPage
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
        TabOrder = 0
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
            Width = 75
            WordWrap = True
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Title'
            Footers = <>
            Layout = tlCenter
            Width = 150
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'URL'
            Footers = <>
            Layout = tlCenter
            Width = 200
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Error'
            Footers = <>
            Width = 60
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ErrorMessage'
            Footers = <>
            Width = 180
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'ProblemCount'
            Footers = <>
            Layout = tlCenter
            Width = 80
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object DBGridEh2: TDBGridEh
        AlignWithMargins = True
        Left = 3
        Top = 289
        Width = 810
        Height = 164
        Align = alBottom
        AllowedOperations = []
        DataSource = dmData.dsPageCheck
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
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'RegistrationDate'
            Footers = <>
            Layout = tlCenter
            Width = 75
            WordWrap = True
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Problem'
            Footers = <>
            Layout = tlCenter
            Width = 275
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ProblemType'
            Footers = <>
            Layout = tlCenter
            Width = 150
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Description'
            Footers = <>
            Layout = tlCenter
            Width = 250
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
end
