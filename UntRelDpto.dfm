inherited FrmRelatorioDpto: TFrmRelatorioDpto
  Caption = 'FrmRelatorioDpto'
  ExplicitWidth = 353
  ExplicitHeight = 292
  PixelsPerInch = 96
  TextHeight = 13
  inherited FDQuery1: TFDQuery
    Active = True
    SQL.Strings = (
      'select * from departamento order by ID')
  end
  inherited frxReport1: TfrxReport
    ReportOptions.LastChange = 42865.963632824100000000
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited MasterData1: TfrxMasterData
        Top = 200.315090000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        object Memo9: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<line> mod 2 = 1 '
          Highlight.FillType = ftGradient
          Highlight.Fill.StartColor = clSilver
          Highlight.Fill.EndColor = clSilver
          Highlight.Fill.GradientStyle = gsHorizontal
          ParentFont = False
        end
        object frxDBDataset1id: TfrxMemoView
          Left = 98.267780000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'id'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."id"]')
        end
        object frxDBDataset1descricao: TfrxMemoView
          Left = 400.630180000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataField = 'descricao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."descricao"]')
        end
      end
      inherited PageFooter1: TfrxPageFooter
        Top = 283.464750000000000000
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
        end
        inherited Memo2: TfrxMemoView
          Memo.UTF8W = (
            '[Date] - [Time]')
        end
      end
      inherited PageHeader1: TfrxPageHeader
        inherited Memo3: TfrxMemoView
          Memo.UTF8W = (
            'Sisticket - Sistema de Chamados de T.I')
        end
        inherited Memo4: TfrxMemoView
          Top = 12.118120000000000000
          Memo.UTF8W = (
            'www.sisticket.com.br')
        end
        inherited Memo5: TfrxMemoView
          Memo.UTF8W = (
            'Relat'#243'rio')
        end
        object Memo8: TfrxMemoView
          Left = 347.716760000000000000
          Top = 37.795300000000000000
          Width = 207.874150000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'de Departamentos')
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 60.472480000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo do departamento')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 377.953000000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome do Departamento')
          ParentFont = False
        end
      end
    end
  end
end
