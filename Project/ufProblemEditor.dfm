object fProblemEditor: TfProblemEditor
  Left = 0
  Top = 0
  Caption = #1059#1103#1079#1074#1080#1084#1086#1089#1090#1100': '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 219
  ClientWidth = 527
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
    Top = 185
    Width = 521
    Height = 31
    Margins.Top = 0
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object bOk: TButton
      AlignWithMargins = True
      Left = 362
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
      Left = 443
      Top = 3
      Width = 75
      Height = 25
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 521
    Height = 179
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
      object DBVertGridEh1: TDBVertGridEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 507
        Height = 145
        Align = alClient
        AllowedSelections = []
        RowCategories.CategoryProps = <>
        DataSource = dmData.dsProblem
        DrawGraphicData = True
        DrawMemoText = True
        Options = [dgvhEditing, dgvhAlwaysShowEditor, dgvhLabelCol, dgvhRowResize, dgvhColLines, dgvhRowLines, dgvhConfirmDelete, dgvhCancelOnExit]
        TabOrder = 0
        LabelColWidth = 84
        Rows = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Title'
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Active'
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'HTML'
      ImageIndex = 2
      object DBMemoEh2: TDBMemoEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 507
        Height = 145
        ScrollBars = ssVertical
        Align = alClient
        AutoSize = False
        DataField = 'Code'
        DataSource = dmData.dsProblem
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1077' '#1079#1072#1076#1072#1085#1086
        TabOrder = 0
        Visible = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
      ImageIndex = 1
      object DBMemoEh1: TDBMemoEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 507
        Height = 145
        ScrollBars = ssVertical
        Align = alClient
        AutoSize = False
        DataField = 'Description'
        DataSource = dmData.dsProblem
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1077' '#1079#1072#1076#1072#1085#1086
        TabOrder = 0
        Visible = True
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1056#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1080
      ImageIndex = 3
      object DBMemoEh3: TDBMemoEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 507
        Height = 145
        ScrollBars = ssVertical
        Align = alClient
        AutoSize = False
        DataField = 'Recommendation'
        DataSource = dmData.dsProblem
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1077' '#1079#1072#1076#1072#1085#1086
        TabOrder = 0
        Visible = True
      end
    end
  end
end
