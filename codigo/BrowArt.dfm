inherited frBrowArt: TfrBrowArt
  Left = 339
  Top = 296
  Caption = 'Articulos'
  ExplicitWidth = 690
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 14
  inherited Titulo: TcxLabel
    Caption = 'Catalogo de articulos'
    Style.IsFontAssigned = True
  end
  inherited GridCatalogos: TcxGrid
    inherited tvCatalogos: TcxGridDBTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = tvCatalogosInventario
        end>
      OptionsView.Footer = True
      Styles.Background = nil
      Styles.Content = nil
      Styles.ContentEven = nil
      Styles.ContentOdd = nil
      Styles.FilterBox = nil
      Styles.Inactive = nil
      Styles.IncSearch = nil
      Styles.Selection = nil
      Styles.Footer = nil
      Styles.Group = nil
      Styles.GroupByBox = nil
      Styles.Header = nil
      Styles.Indicator = nil
      Styles.NewItemRowInfoText = nil
      object tvCatalogosIDARTICULO: TcxGridDBColumn
        DataBinding.FieldName = 'IDARTICULO'
        Visible = False
        VisibleForCustomization = False
      end
      object tvCatalogosMODELO: TcxGridDBColumn
        Caption = 'Modelo '
        DataBinding.FieldName = 'MODELO'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
      object tvCatalogosCODIGO: TcxGridDBColumn
        Caption = 'Codigo '
        DataBinding.FieldName = 'CODIGO'
        HeaderAlignmentHorz = taCenter
        Width = 66
      end
      object tvCatalogosDESCRIPCION: TcxGridDBColumn
        Caption = 'Descripcion '
        DataBinding.FieldName = 'DESCRIPCION'
        HeaderAlignmentHorz = taCenter
        Width = 272
      end
      object tvCatalogosMARCA: TcxGridDBColumn
        Caption = 'Marca '
        DataBinding.FieldName = 'MARCA'
        HeaderAlignmentHorz = taCenter
        Width = 116
      end
      object tvCatalogosLINEA: TcxGridDBColumn
        Caption = 'Linea '
        DataBinding.FieldName = 'LINEA'
        HeaderAlignmentHorz = taCenter
        Width = 33
      end
      object tvCatalogosCVE_PRO: TcxGridDBColumn
        Caption = 'Prov.'
        DataBinding.FieldName = 'CVE_PRO'
        HeaderAlignmentHorz = taCenter
        Width = 42
      end
      object tvCatalogosPV: TcxGridDBColumn
        Caption = 'Venta '
        DataBinding.FieldName = 'PV'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00'
        HeaderAlignmentHorz = taCenter
        Width = 65
      end
      object tvCatalogosInventario: TcxGridDBColumn
        Caption = 'Inv.'
        DataBinding.FieldName = 'INVENTARIO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 71
      end
    end
    inherited cvCatalogos: TcxGridDBCardView
      Styles.Background = nil
      Styles.Content = nil
      Styles.CardBorder = nil
      Styles.RowCaption = nil
    end
  end
  inherited ActionCatalogo: TActionList
    inherited acAgregar: TAction
      Enabled = False
      Visible = False
    end
    inherited acModificar: TAction
      Enabled = False
      Visible = False
    end
    inherited acEliminar: TAction
      Enabled = False
      ShortCut = 0
      Visible = False
    end
  end
  inherited dxBarManager1: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      26
      0)
    inherited dxBarManager1Bar1: TdxBar
      ItemLinks = <
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'bAgregar'
        end
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'bModificar'
        end
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'bEliminar'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'bBuscar'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'bImprimir'
        end
        item
          Visible = True
          ItemName = 'PicTaref'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end>
      OldName = 'Barra1'
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Exporta articulos'
      Category = 0
      Hint = 'Exporta articulos'
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000120000
        002C0F0F04721616068716160687161606871616068716160687161606871616
        06871616068716160687161606870F0F04720000002C00000012000000090000
        00161D1D0C82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFEFDFFFEFEFCFFFDFD
        FBFFFDFDFAFFFCFCF8FFFEFEF9FF1D1D0C820000001600000009000000000000
        00002323127BFFFFFFFFFFFFFFFFFEFEFEFFFDFDFCFFFDFDFBFFFCFCF9FFFBFB
        F8FF828281FFD1D1CEFFFBFBF6FF2323127B0000000000000000000000000000
        000027271677FFFFFFFFFEFEFEFFFDFDFCFFFDFDFBFFFCFCF9FFFBFBF8FFFAFA
        F6FFF8F8F4FF636363FFFBFBF5FF272716770000000000000000000000000000
        000029291876FFFFFEFFFDFDFCFFFDFDFBFFFCFCF9FFFBFBF8FFFAFAF6FFF8F8
        F4FF919190FF6E6E6EFFFAFAF3FF2929187600000000000000001D6837C0268A
        48FF268A48FF268A48FF268A48FF268A48FF268A48FF268A48FF5BA673FFF7F7
        F2FF7A7A7AFF7A7A7AFFFAFAF2FF2A2A197400000000000000002C8D4EFFECFC
        ECFFE8F8E8FFE8F8E8FFE8F8E8FFE8F8E8FFE8F8E8FFECFCECFF2C8D4EFFF6F6
        F0FFF5F5EEFFF4F4ECFFF9F9EFFF2B2B1A720000000000000000349156FFEBF9
        EBFF8DC29EFF8DC29EFF8DC29EFF349156FF349156FFEBF9EBFF349156FFF5F5
        EEFFF4F4ECFFF1F1E7FFF7F7EAFF2D2D1B7100000000000000003D965FFFEFFA
        EFFF68AD82FF3D965FFF3D965FFFBFDDC7FF3D965FFFEFFAEFFF3D965FFFF4F4
        ECFFF1F1E7FFECECDFFFF4F4E5FF2E2E1D6F0000000000000000479A69FFF4FC
        F4FFC6E0CEFF479A69FFC5E0CEFF479A69FFC5E0CEFFF4FCF4FF479A69FFF1F1
        E7FFECECDFFFE8E8D9FFF3F3E2FF2F2F1D6D0000000000000000509F72FFF8FD
        F8FF509F72FFCCE4D5FF509F72FF509F72FF7AB693FFF8FDF8FF509F72FFECEC
        DFFFE8E8D9FFE6E6D5FFF2F2E1FF30301E6C000000000000000058A37AFFFCFE
        FCFF58A37AFF58A37AFFD2E6DBFF81BA9AFF58A37AFFFCFEFCFF58A37AFFE8E8
        D9FFE6E6D5FFE5E5D4FFF2F2E1FF3131206B000000000000000060A782FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60A782FFE6E6
        D5FFA4A493FFA4A493FFA4A493FF2323127C00000000000000004C8066C065AA
        87FF65AA87FF65AA87FF65AA87FF65AA87FF65AA87FF65AA87FF85B99AFFE5E5
        D4FFB6B6A5FFFFFFFFFF3232216812120C250000000000000000000000000000
        000032322267FCFCF5FFF9F9EFFFF6F6EAFFF4F4E5FFF3F3E2FFF2F2E1FFF2F2
        E1FFC2C2B1FF3232226712120C25000000000000000000000000000000000000
        000026261A4D3333226633332266333322663333226633332266333322663333
        22663333226612120C2400000000000000000000000000000000}
      PaintStyle = psCaptionGlyph
      OnClick = dxBarButton3Click
    end
  end
  inherited Catalogos: TIBDataSet
    SelectSQL.Strings = (
      
        'select  Art.idarticulo, Art.modelo, Art.codigo, Art.descripcion,' +
        ' Art.Marca, Prec.pc1 pc, inv.inventario,'
      'Prec.pv1 pv, Li.Linea, Prov.cve_pro, Art.activo'
      'from articulos Art'
      'Left Join Precios Prec on prec.idArticulo = Art.idArticulo'
      'Left Join Lineas Li on li.idLinea = Art.idLinea'
      'Left Join Proveedor Prov on Prov.idProveedor = Art.idProveedor'
      'Left join inventarios inv on inv.idarticulo = art.idArticulo'
      'where Art.Activo = 1'
      'Order by Art.Codigo')
    ModifySQL.Strings = (
      'update articulos'
      'set activo = :activo'
      'where idArticulo = :idArticulo')
  end
  inherited dxPrinter: TdxComponentPrinter
    inherited dxPrinterLink1: TdxGridReportLink
      ReportDocument.CreationDate = 39205.416620868040000000
      BuiltInReportLink = True
    end
  end
  object SaveTextFileDialog: TSaveTextFileDialog
    DefaultExt = '*.csv'
    Filter = 'CSV|*.CSV'
    Left = 280
    Top = 170
  end
  object qArt: TIBQuery
    Database = frDatos.dbK
    Transaction = frDatos.trK
    SQL.Strings = (
      
        'select idarticulo, codigo, descripcion, '#39'1'#39' depto, '#39'ROPA ELECZIO' +
        'N'#39' DeptoDesc from'
      '    ('
      
        '        select art.idarticulo, art.codigo, art.descripcion from ' +
        'articulos art where ((art.servicio= 0) or (art.servicio = 3) or ' +
        '(art.servicio is null))'
      '        and art.activo = 1'
      '        union all'
      '        select a.idarticulo, a.alias, art.descripcion'
      '        from alias a'
      
        '        join articulos art on art.idarticulo = a.idarticulo and ' +
        '((art.servicio= 0) or (art.servicio = 3) or (art.servicio is nul' +
        'l))'
      '        where art.activo = 1'
      '    )'
      'where ((codigo <> '#39#39') or (codigo <> null))'
      'and ((descripcion <> '#39#39') or (descripcion <> null))')
    Left = 400
    Top = 170
  end
end
