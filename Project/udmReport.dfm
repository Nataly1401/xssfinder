object dmReport: TdmReport
  OldCreateOrder = False
  Height = 585
  Width = 829
  object frxReport: TfrxReport
    Version = '4.13.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42513.919056145800000000
    ReportOptions.LastChange = 43121.986920601850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 64
    Top = 32
    Datasets = <
      item
        DataSet = frxPage
        DataSetName = 'frxPage'
      end
      item
        DataSet = frxPageCheck
        DataSetName = 'frxPageCheck'
      end
      item
        DataSet = frxParams
        DataSetName = 'frxParams'
      end
      item
        DataSet = frxTask
        DataSetName = 'frxTask'
      end
      item
        DataSet = frxTaskProblem
        DataSetName = 'frxTaskProblem'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 75.590600000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        DataSet = frxTask
        DataSetName = 'frxTask'
        RowCount = 0
        object Memo37: TfrxMemoView
          Left = 151.181200000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'RegistrationDate'
          DataSet = frxTask
          DataSetName = 'frxTask'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxTask."RegistrationDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Width = 151.181102362205000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'frxProvider'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 151.181200000000000000
          Top = 18.897650000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Title'
          DataSet = frxTask
          DataSetName = 'frxTask'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxTask."Title"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Top = 18.897650000000200000
          Width = 151.181102362205000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'frxProvider'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1053#1072#1079#1074#1072#1085#1080#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 151.181200000000000000
          Top = 37.795300000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'URL'
          DataSet = frxTask
          DataSetName = 'frxTask'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxTask."URL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Top = 37.795300000000220000
          Width = 151.181102362205000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'frxProvider'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'URL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 151.181200000000000000
          Top = 56.692949999999990000
          Width = 566.929499999999900000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TaskState'
          DataSet = frxTask
          DataSetName = 'frxTask'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxTask."TaskState"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Top = 56.692950000000220000
          Width = 151.181102362205000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSetName = 'frxProvider'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1057#1090#1072#1090#1091#1089)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 502.677490000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Left = 264.567100000000000000
          Width = 453.543600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#] '#1080#1079' [TotalPages#]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[<Date>] [<Time>]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 94.488225590000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1054#1073#1097#1080#1077' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1079#1072#1076#1072#1095#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Align = baWidth
          Top = 56.692950000000010000
          Width = 718.110700000000000000
          Height = 37.795275590000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1072#1076#1072#1085#1080#1103)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 423.307360000000000000
        Width = 718.110700000000000000
        DataSet = frxTaskProblem
        DataSetName = 'frxTaskProblem'
        RowCount = 0
        Stretched = True
        object Memo14: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 94.488250000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'Title'
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxTaskProblem."Title"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        Height = 37.795275590000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1057#1087#1080#1089#1086#1082' '#1087#1088#1086#1074#1077#1088#1103#1077#1084#1099#1093' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000001000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1102' '#1079#1072#1076#1072#1095#1080' '#1087#1086#1080#1089#1082#1072' XSS '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081)
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader2: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1102' '#1079#1072#1076#1072#1095#1080' '#1087#1086#1080#1089#1082#1072' XSS '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081)
          ParentFont = False
        end
      end
      object Header3: TfrxHeader
        Height = 94.488225590000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1086' '#1082#1072#1078#1076#1086#1081' '#1089#1090#1088#1072#1085#1080#1094#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 60.472480000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13421772
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 139.842610000000000000
          Top = 56.692950000000000000
          Width = 147.401670000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13421772
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1053#1072#1079#1074#1072#1085#1080#1077)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 287.244280000000000000
          Top = 56.692950000000000000
          Width = 226.771800000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13421772
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'URL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 514.016080000000000000
          Top = 56.692950000000000000
          Width = 68.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13421772
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1055#1088#1086#1089#1084#1086#1090'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 650.079160000000000000
          Top = 56.692950000000000000
          Width = 68.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13421772
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1055#1088#1086#1074#1077#1088#1077#1085'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 582.047620000000000000
          Top = 56.692950000000000000
          Width = 68.031540000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = 13421772
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1044#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        DataSet = frxPage
        DataSetName = 'frxPage'
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Memo21: TfrxMemoView
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 60.472480000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clBtnFace
          DataField = 'RegistrationDate'
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxPage."RegistrationDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 139.842610000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clBtnFace
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxPage."Title"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 287.244280000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clBtnFace
          DataField = 'URL'
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxPage."URL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 514.016080000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clBtnFace
          DataField = 'Visited'
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxPage."Visited"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 650.079160000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clBtnFace
          DataField = 'Checked'
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxPage."Checked"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 582.047620000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Color = clBtnFace
          DataField = 'ForChecking'
          DataSet = frxPage
          DataSetName = 'frxPage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxPage."ForChecking"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        DataSet = frxPageCheck
        DataSetName = 'frxPageCheck'
        RowCount = 0
        Stretched = True
        object Memo35: TfrxMemoView
          Left = 139.842610000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 188.976500000000000000
          Width = 529.134200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'Problem'
          DataSet = frxPageCheck
          DataSetName = 'frxPageCheck'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxPageCheck."Problem"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header4: TfrxHeader
        Height = 22.677180000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        object Memo36: TfrxMemoView
          Left = 139.842610000000000000
          Width = 578.268090000000000000
          Height = 22.677155590000000000
          ShowHint = False
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1054#1073#1085#1072#1088#1091#1078#1077#1085#1085#1099#1077' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1080)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer2: TfrxFooter
        Height = 22.677180000000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        object Memo39: TfrxMemoView
          Left = 139.842610000000000000
          Width = 578.268090000000000000
          Height = 22.677155590000000000
          ShowHint = False
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            #1042#1089#1077#1075#1086' '#1086#1073#1085#1072#1088#1091#1078#1077#1085#1086' '#1085#1072' '#1089#1090#1088#1072#1085#1080#1094#1077': [COUNT(DetailData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 430.866420000000000000
        Width = 718.110700000000000000
        object Memo20: TfrxMemoView
          Align = baWidth
          Left = 264.567100000000000000
          Width = 453.543600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#] '#1080#1079' [TotalPages#]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[<Date>] [<Time>]')
          ParentFont = False
        end
      end
    end
    object Page3: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter3: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        object Memo51: TfrxMemoView
          Align = baWidth
          Left = 264.567100000000000000
          Width = 782.362710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#] '#1080#1079' [TotalPages#]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[<Date>] [<Time>]')
          ParentFont = False
        end
      end
      object Header5: TfrxHeader
        Height = 94.488225590000000000
        Top = 102.047310000000000000
        Width = 1046.929810000000000000
        object Memo53: TfrxMemoView
          Align = baWidth
          Width = 1046.929810000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #1048#1090#1086#1075#1080' '#1087#1086#1080#1089#1082#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Top = 56.692950000000000000
          Width = 37.795300000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 37.795300000000000000
          Top = 56.692950000000000000
          Width = 188.976500000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = 13421772
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1059#1103#1079#1074#1080#1084#1086#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 226.771800000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = 13421772
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1053#1072#1081#1076#1077#1085#1086
            '('#1082#1086#1083'-'#1074#1086')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 453.543600000000000000
          Top = 56.692950000000000000
          Width = 302.362400000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = 13421772
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1054#1087#1080#1089#1072#1085#1080#1077' '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 287.244280000000000000
          Top = 56.692950000000000000
          Width = 166.299320000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = 13421772
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1050#1086#1076' '#1087#1088#1086#1074#1077#1088#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 755.906000000000000000
          Top = 56.692950000000000000
          Width = 291.023810000000000000
          Height = 37.795275590000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = 13421772
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #1056#1077#1082#1086#1084#1077#1085#1076#1072#1094#1080#1080)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader3: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo58: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000000000
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1102' '#1079#1072#1076#1072#1095#1080' '#1087#1086#1080#1089#1082#1072' XSS '#1091#1103#1079#1074#1080#1084#1086#1089#1090#1077#1081)
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        Height = 18.897650000000000000
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        DataSet = frxTaskProblem
        DataSetName = 'frxTaskProblem'
        RowCount = 0
        Stretched = True
        object Memo48: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 37.795300000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'Title'
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxTaskProblem."Title"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 226.771800000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'ProblemCount'
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxTaskProblem."ProblemCount"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 453.543600000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'Description'
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxTaskProblem."Description"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 287.244280000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'Code'
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxTaskProblem."Code"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 755.906000000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'Recommendation'
          DataSet = frxTaskProblem
          DataSetName = 'frxTaskProblem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxTaskProblem."Recommendation"]')
          ParentFont = False
        end
      end
    end
  end
  object amReport: TActionManager
    Images = dmData.ilMain
    Left = 64
    Top = 80
    StyleName = 'Platform Default'
    object aEdit: TAction
      AutoCheck = True
      Caption = #1056#1077#1078#1080#1084' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1103' '#1086#1090#1095#1077#1090#1086#1074
      OnExecute = aEditExecute
    end
    object aReportMain: TAction
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1102' '#1079#1072#1076#1072#1095#1080
      OnExecute = aReportMainExecute
    end
  end
  object frxParams: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frxParams'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'UsedExtension=UsedExtension')
    DataSource = dmData.dsParams
    BCDToCurrency = False
    Left = 200
    Top = 32
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 64
    Top = 304
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 64
    Top = 352
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 64
    Top = 256
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 64
    Top = 216
  end
  object frxBIFFExport1: TfrxBIFFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    RowHeightScale = 1.000000000000000000
    ChunkSize = 0
    Inaccuracy = 10.000000000000000000
    FitPages = False
    Pictures = True
    ParallelPages = 0
    Left = 64
    Top = 176
  end
  object frxTask: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frxTask'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'RegistrationDate=RegistrationDate'
      'Title=Title'
      'URL=URL'
      'TaskState=TaskState'
      'TaskStateID=TaskStateID'
      'Description=Description'
      'Authorization=Authorization'
      'AuthorizationURL=AuthorizationURL'
      'AuthorizationManual=AuthorizationManual'
      'AuthorizationCompleteURL=AuthorizationCompleteURL'
      'LoginFormName=LoginFormName'
      'LoginFormID=LoginFormID'
      'LoginFormClass=LoginFormClass'
      'LoginFieldName=LoginFieldName'
      'LoginFieldID=LoginFieldID'
      'LoginFieldClass=LoginFieldClass'
      'LoginFieldValue=LoginFieldValue'
      'PasswordFieldName=PasswordFieldName'
      'PasswordFieldID=PasswordFieldID'
      'PasswordFieldClass=PasswordFieldClass'
      'PasswordFieldValue=PasswordFieldValue')
    DataSource = dmData.dsTask
    BCDToCurrency = False
    Left = 200
    Top = 80
  end
  object frxPage: TfrxDBDataset
    UserName = 'frxPage'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'TaskID=TaskID'
      'RegistrationDate=RegistrationDate'
      'Title=Title'
      'URL=URL'
      'Visited=Visited'
      'ForChecking=ForChecking'
      'Checked=Checked'
      'ErrorMessage=ErrorMessage'
      'Error=Error'
      'ProblemCount=ProblemCount')
    DataSource = dmData.dsPage
    BCDToCurrency = False
    Left = 200
    Top = 128
  end
  object frxPageCheck: TfrxDBDataset
    UserName = 'frxPageCheck'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'RegistrationDate=RegistrationDate'
      'PageID=PageID'
      'ProblemID=ProblemID'
      'Problem=Problem'
      'TaskID=TaskID'
      'ProblemTypeID=ProblemTypeID'
      'ProblemType=ProblemType')
    DataSource = dmData.dsPageCheck
    BCDToCurrency = False
    Left = 200
    Top = 176
  end
  object frxTaskProblem: TfrxDBDataset
    UserName = 'frxTaskProblem'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'TaskID=TaskID'
      'ProblemID=ProblemID'
      'Title=Title'
      'Description=Description'
      'Code=Code'
      'Recommendation=Recommendation'
      'Active=Active'
      'ProblemCount=ProblemCount')
    DataSource = dmData.dsTaskProblem
    BCDToCurrency = False
    Left = 200
    Top = 224
  end
end
