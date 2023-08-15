inherited frCierre: TfrCierre
  Caption = 'Cierre total de cajas'
  ClientHeight = 585
  ClientWidth = 910
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  ExplicitWidth = 926
  ExplicitHeight = 624
  PixelsPerInch = 96
  TextHeight = 14
  inherited sbMaster: TdxStatusBar
    Top = 565
    Width = 910
    ExplicitTop = 565
    ExplicitWidth = 910
    inherited dxStatusBar1Container1: TdxStatusBarContainerControl
      Left = 694
      ExplicitLeft = 694
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 488
    Width = 910
    Height = 77
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      910
      77)
    object Bevel2: TBevel
      Left = 0
      Top = 8
      Width = 920
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object btAceptar: TcxButton
      Left = 680
      Top = 16
      Width = 131
      Height = 48
      Anchors = [akTop, akRight]
      Caption = 'C&ierre total de cajas'
      Colors.Normal = 13168061
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000000
        0000000000000000000019591C8035AA3AEF37A13CDF0C230E30000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000186B1A9F44BB4AFFA9EEB2FF90E299FF329537CF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00001068119F38B53DFFA0E8A9FFA0EEACFFB5F5BFFF72D37AFF1F5C22800000
        0000000000000000000000000000000000000000000000000000000000000864
        099F46BB4BFFA0E6A9FF8EE59AFF84E691FF9DEFA9FFAFF3B9FF4ABE50FF0B22
        0C300000000000000000000000000000000000000000000000000160019F3BB5
        3FFF98E0A1FF84DD8FFF7ADE87FFA8ECB2FF99ECA5FFACF3B7FF97E69FFF2D93
        32CF00000000000000000000000000000000000000000055008F34B138FF90DB
        99FF79D685FF7FDA8BFF9FE6A8FF79D480FFA9EDB3FF91EB9EFFB2F3BCFF6CD0
        74FF1C5B1E8000000000000000000000000000000000009700FF89D692FF70CF
        7BFF75D380FF97E0A0FF42B947FF13A315FF82D889FF9DEAA8FF92EA9FFFA7ED
        B1FF43BB48FF0A220B30000000000000000000000000009600FF7ED086FF85D5
        8FFF86D68EFF2FAF32FF0461049F0428054025AB28FFA3E8ACFF87E494FFA1EB
        ACFF8CDF94FF2C9C30DF030B041000000000000000000054008F21A524FF44B6
        49FF11A013FF0056008F000000000000000009640A9F58C45EFF9CE5A6FF7ADE
        88FFA5EAAEFF62C969FF1B641E8F000000000000000000000000001C00300039
        0060001D0030000000000000000000000000010A01100D960EEF89DA92FF87DE
        93FF80DD8CFF98E2A1FF3BB640FF0C2C0D400000000000000000000000000000
        00000000000000000000000000000000000000000000033B04602FAF32FF97E0
        A0FF6BD478FF8CDD96FF7DD485FF26992ADF030B031000000000000000000000
        0000000000000000000000000000000000000000000000000000067607BF67C9
        6EFF89DA93FF5ACB68FF94DE9DFF57C25DFF18621A8F00000000000000000000
        0000000000000000000000000000000000000000000000000000011D01300FA0
        10FF85D58DFF66CC72FF66CC72FF87D790FF26AC2AFF00000000000000000000
        000000000000000000000000000000000000000000000000000000000000024D
        02803FB543FF88D591FF6FCD79FF89D691FF24AC2AFF00000000000000000000
        000000000000000000000000000000000000000000000000000000000000000A
        0010028702DF4CBA52FF66C56DFF4CBA51FF137C15BF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000001300200160019F067606BF0964099F010A0110}
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = 1005312
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = btAceptarClick
    end
    object btCerrar: TcxButton
      Left = 817
      Top = 17
      Width = 75
      Height = 48
      Anchors = [akTop, akRight]
      Caption = '&Cerrar'
      Colors.Normal = 13156351
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000000000000000000808
        648F0C0C7BAF02020B1000000000000000000000000000000000000000000000
        000002020B101D1D8AAF1A1A768F00000000000000000000000008086F9F0606
        B7FF0909BAFF101092CF02020B10000000000000000000000000000000000202
        0B102020A1CF3838EEFF4040F7FF2121889F000000001F1F6B8F0707B5FF0606
        B7FF0909BAFF0C0CBDFF111193CF02020B10000000000000000002020B101C1C
        9DCF2F2FE4FF3636ECFF3B3BF2FF3D3DF4FF1A1A758F2F2F87AF5454CEFF0909
        B7FF0808B9FF0B0BBCFF0E0EC0FF121295CF02020B1002020B1019199ACF2626
        DAFF2C2CE0FF3131E6FF3535EBFF3636ECFF1C1C89AF02020B1038389FCF5555
        CFFF0B0BB9FF0A0ABBFF0D0DBFFF1111C3FF131395CF161698CF1E1ED1FF2323
        D6FF2727DBFF2B2BE0FF2E2EE3FF1F1FA0CF02020B100000000002020B103838
        9FCF5555D0FF0C0CBBFF0C0CBEFF0F0FC1FF1313C5FF1717C9FF1B1BCEFF1F1F
        D2FF2222D6FF2525D9FF1C1C9DCF02020B100000000000000000000000000202
        0B1039399FCF5656D0FF0E0EBCFF0E0EBFFF1111C3FF1414C6FF1717CAFF1A1A
        CDFF1E1ED1FF18189ACF02020B10000000000000000000000000000000000000
        000002020B103939A0CF4D4DCFFF0C0CBDFF0E0EC0FF1111C3FF1414C6FF1616
        C9FF161697CF02020B1000000000000000000000000000000000000000000000
        000002020B101E1E95CF2E2EC4FF1D1DC1FF0E0EBEFF0E0EC0FF1010C2FF1313
        C5FF131395CF02020B1000000000000000000000000000000000000000000202
        0B101F1F96CF3434C4FF3232C5FF3030C5FF2F2FC6FF2828C5FF2020C4FF1F1F
        C5FF1F1FC6FF1C1C97CF02020B1000000000000000000000000002020B102020
        96CF3939C4FF3636C4FF3434C4FF3232C5FF3030C5FF6868D7FF3131C7FF2E2E
        C7FF2E2EC8FF2D2DC9FF1C1C96CF02020B100000000001010B10232397CF3E3E
        C5FF3B3BC5FF3939C4FF3636C4FF3434C4FF1E1E95CF4040A2CF7070D9FF3232
        C6FF2F2FC6FF2E2EC6FF2E2EC7FF1D1D96CF02020B1039398BAF5454CCFF4141
        C6FF3E3EC5FF3B3BC5FF3939C4FF1F1F96CF02020B1002020B104141A2CF7171
        D8FF3333C5FF3030C5FF3030C5FF3030C5FF19197EAF3838758F9898E6FF5353
        CCFF4141C6FF3E3EC5FF202096CF02020B10000000000000000002020B104141
        A2CF7272D8FF3535C5FF3232C4FF3232C4FF1616688F000000004141849F9898
        E6FF5454CCFF232397CF02020B10000000000000000000000000000000000202
        0B104141A2CF7474D8FF3838C4FF1A1A759F0000000000000000000000003838
        758F39398BAF01010B1000000000000000000000000000000000000000000000
        000002020B10373789AF29296E8F0000000000000000}
      TabOrder = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = 1179798
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = btCerrarClick
    end
  end
  object bContenedor: TScrollBox [2]
    Left = 0
    Top = 0
    Width = 910
    Height = 150
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    object pValida: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 226
      Height = 144
      Align = alLeft
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      OnMouseLeave = pValidaMouseLeave
      OnMouseMove = pValidaMouseMove
      object Label1: TLabel
        Left = 20
        Top = 28
        Width = 182
        Height = 18
        Caption = 'Ingresa la venta global del d'#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
      end
      object edVentaGlobal: TcxCalcEdit
        Left = 48
        Top = 62
        EditValue = 0.000000000000000000
        Properties.Alignment.Horz = taRightJustify
        Properties.ButtonGlyph.SourceDPI = 96
        Properties.ButtonGlyph.Data = {
          424D360400000000000036000000280000001000000010000000010020000000
          000000000000C40E0000C40E00000000000000000000FFFFFF00E8D5BBFFA15B
          00FFA15B00FFA15B00FFA15B00FFA15B00FFA15B00FFA15B00FFA15B00FFA15B
          00FFA15B00FFA15B00FFE8D5BBFFFFFFFF00FFFFFF00FFFFFF00A15B00FFCF9E
          52FFF8D99AFFF8D99AFFF9D89AFFF8D99AFFF8D999FFF9D999FFF8D99AFFF9D9
          99FFF8D89AFFCF9E52FFA15B00FFFFFFFF00FFFFFF00FFFFFF00A35C00FFF9DB
          9FFFF8DB9FFFF9DBA0FFF8DBA0FFF9DBA0FFF8DBA0FFF8DBA0FFF9DB9FFFF8DB
          A0FFF9DA9FFFF8DB9FFFA35C00FFFFFFFF00FFFFFF00FFFFFF00A45E00FFF9DE
          A6FFF9DDA7FFB36C00FFF9DDA7FFB36C00FFF9DDA7FFB36C00FFF9DDA7FFB36C
          00FFF9DEA6FFFADEA7FFA55F00FFFFFFFF00FFFFFF00FFFFFF00A76100FFF9E1
          AEFFF9E1AEFFFAE1AFFFFAE1AFFFFAE1AFFFFAE1AFFFFAE1AFFFFAE1AFFFFAE1
          AFFFFAE1AFFFFAE1AEFFA76100FFFFFFFF00FFFFFF00FFFFFF00A96300FFFBE4
          B8FFFAE4B7FFB36C00FFFAE4B7FFB36C00FFFAE4B7FFB36C00FFFAE4B7FFB36C
          00FFFAE4B7FFFBE4B8FFAA6300FFFFFFFF00FFFFFF00FFFFFF00AD6600FFFBE8
          C0FFFBE7C1FFFBE8C0FFFBE8C0FFFBE8C0FFFBE8C0FFFBE8C0FFFBE8C0FFFBE8
          C0FFFBE8C0FFFBE7C1FFAC6600FFFFFFFF00FFFFFF00FFFFFF00AF6900FFFCEB
          CAFFFBEBCAFFB36C00FFFBEBCAFFB36C00FFFBEBCAFFB36C00FFFBEBCAFFB36C
          00FFFBEBCAFFFCEBCAFFB06900FFFFFFFF00FFFFFF00FFFFFF00B36C00FFFCEE
          D4FFFCEED3FFFCEED3FFFCEFD4FFFCEED3FFFCEED4FFFCEFD3FFFCEFD3FFFCEF
          D4FFFCEED4FFFCEED3FFB36C00FFFFFFFF00FFFFFF00FFFFFF00B66E00FFFDF2
          DCFFFCF2DDFFFDF2DCFFFDF2DDFFFDF2DCFFFDF2DCFFFDF2DDFFFDF2DCFFFDF2
          DCFFFDF2DDFFFCF2DCFFB56F00FFFFFFFF00FFFFFF00FFFFFF00B87200FFFEF5
          E5FFFEF6E6FF3C970DFF3C970DFF3C970DFF3C970DFF3C970DFF3C970DFF3C97
          0DFFFEF5E5FFFDF6E5FFB87100FFFFFFFF00FFFFFF00FFFFFF00BB7400FFFEF8
          EEFFFEF8EDFF30AE4CFF30AE4CFF30AE4CFF30AE4CFF30AE4CFF30AE4CFF30AE
          4CFFFEF8EEFFFEF8EEFFBA7400FFFFFFFF00FFFFFF00FFFFFF00BC7600FFFFFB
          F5FFFEFBF4FF25C284FF25C284FF25C284FF25C284FF25C284FF25C284FF25C2
          84FFFEFCF5FFFEFBF4FFBD7500FFFFFFFF00FFFFFF00FFFFFF00BE7700FFFFFE
          FAFFFFFDFAFFFEFDFBFFFFFDFBFFFFFEFBFFFEFEFBFFFEFDFBFFFFFEFBFFFFFD
          FBFFFFFDFAFFFFFDFBFFBE7700FFFFFFFF00FFFFFF00FFFFFF00BE7700FFE6D3
          BAFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00E6D3BAFFBE7700FFFFFFFF00FFFFFF00FFFFFF00E8D5BBFFBE77
          00FFBE7700FFBE7700FFBE7700FFBE7700FFBE7700FFBE7700FFBE7700FFBE77
          00FFBE7700FFBE7700FFE8D5BBFFFFFFFF00FFFFFF00}
        Properties.DisplayFormat = ',0.00'
        Properties.ImmediatePost = True
        Style.LookAndFeel.NativeStyle = True
        Style.StyleController = frDatos.Edits
        Style.ButtonTransparency = ebtAlways
        Style.PopupBorderStyle = epbsSingle
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Width = 133
      end
    end
    object G1: TcxGrid
      Left = 680
      Top = 0
      Width = 230
      Height = 150
      Align = alRight
      TabOrder = 1
      Visible = False
      object t1: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00'
            Kind = skSum
            Column = t1_2
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object t1_1: TcxGridColumn
          Width = 140
        end
        object t1_2: TcxGridColumn
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00'
          Properties.ReadOnly = True
          FooterAlignmentHorz = taRightJustify
          Width = 88
        end
      end
      object l1: TcxGridLevel
        GridView = t1
      end
    end
  end
  inherited ilMaster: TImageList
    Left = 164
    Top = 65520
  end
  inherited tiMaster: TTimer
    Left = 200
    Top = 65520
  end
  object Maestro: TIBQuery
    Database = frDatos.dbK
    Transaction = frDatos.trK
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 448
    Top = 296
  end
  object Detalle: TIBQuery
    Database = frDatos.dbK
    Transaction = frDatos.trK
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 504
    Top = 296
  end
  object qNew: TIBQuery
    Database = frDatos.dbK
    Transaction = frDatos.trK
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 264
    Top = 296
  end
  object qNotas: TIBQuery
    Database = frDatos.dbK
    Transaction = frDatos.trK
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select count(*) notas from remision'
      'where idtienda = :idtienda'
      'and cajero = :cajero'
      'and fecha = :fecha'
      'and activo = 1')
    Left = 264
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtienda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cajero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  object ActionList1: TActionList
    Left = 432
    Top = 184
    object acPrintFtoCierre: TAction
      Caption = '&Imprimir formato de cierre'
      OnExecute = acPrintFtoCierreExecute
    end
  end
  object dxPrinter: TdxComponentPrinter
    Version = 0
    Left = 600
    Top = 296
    PixelsPerInch = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 392
    Top = 184
    object Imprimirformatodecierre1: TMenuItem
      Action = acPrintFtoCierre
    end
  end
  object LocalTransaction: TIBTransaction
    DefaultDatabase = frDatos.dbK
    Left = 504
    Top = 360
  end
  object ibSeek: TIBQuery
    Database = frDatos.dbK
    Transaction = frDatos.trK
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select p.idTienda, p.cajero caja, p.pago, sum(p.importe) importe'
      'from pagos p'
      'where p.idTienda = :idTda and p.fecha = :wDate and p.activo = 1'
      'group by p.idTienda, p.cajero, p.pago'
      '')
    Left = 352
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idTda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wDate'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = ibSeek
    Left = 360
    Top = 424
  end
end
