inherited frCapAsiste: TfrCapAsiste
  Left = 394
  Top = 179
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Captura de asistencia'
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 14
  inherited sbMaster: TdxStatusBar
    inherited dxStatusBar1Container1: TdxStatusBarContainerControl
      Left = 474
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 326
    Width = 676
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 3
    DesignSize = (
      676
      46)
    object Bevel2: TBevel
      Left = 63
      Top = 8
      Width = 635
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object btAceptar: TcxButton
      Left = 503
      Top = 17
      Width = 75
      Height = 25
      Action = acGrabar
      Anchors = [akTop, akRight]
      TabOrder = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF006B4229006B4229006B4229006B4229006B4229006B4229006B4229006B42
        29006B4229006B4229006B4229006B4229006B4229006B422900FF00FF00CE73
        6B00D6949400CE8C8C00735A4A00C6B5AD00C6BDBD00CEC6BD00CEC6BD00CEC6
        BD00CEC6BD008C7363009442420094424200944242006B422900FF00FF00CE73
        6B00D69C9C00D6949400735A4A00291818005A524200FFFFFF00FFFFFF00FFFF
        FF00F7E7DE008C7363009442420094424200944242006B422900FF00FF00CE73
        6B00DEADA500D69C9C00735A4A000000000031211800FFFFFF00F7F7EF00F7E7
        DE00E7CEBD008C7363009C524A0094424200944242006B422900FF00FF00CE73
        6B00E7B5AD00DEADA500735A4A00735A4A00735A4A00735A4A00735A4A00735A
        4A00735A4A00735A4A00A55A52009C524A00944242006B422900FF00FF00CE73
        6B00EFBDBD00E7B5B500E7ADA500DEA59C00D69C9400CE8C8C00C6848400BD7B
        7B00BD737300B56B6B00AD635A00A55A52009C524A006B422900FF00FF00CE73
        6B00F7C6BD00EFBDBD00E7B5B500E7ADA500DEA59C00D69C9400CE948C00CE8C
        8400C6847B00BD7B7300B56B6B00AD635A00A55A52006B422900FF00FF00CE73
        6B00F7C6BD00F7C6BD00CE635A00CE635A00CE635A00CE635A00CE635A00CE63
        5A00CE635A00CE635A00CE635A00B5736B00AD6363006B422900FF00FF00CE73
        6B00F7C6BD00CE635A00FFF7F700F7EFEF00F7E7E700EFE7DE00EFDED600E7D6
        CE00E7D6C600E7CEBD00E7CEBD00CE635A00B5736B006B422900FF00FF00CE73
        6B00F7C6BD00CE635A00FFFFFF00FFFFF700FFF7EF00F7EFE700F7E7DE00EFDE
        D600EFDECE00E7D6CE00E7CEC600CE635A00BD7B73006B422900FF00FF00CE73
        6B00F7C6BD00CE635A00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7EFE700F7E7
        DE00EFDED600EFDECE00E7D6CE00CE635A00C6847B006B422900FF00FF00CE73
        6B00F7C6BD00CE635A00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7EF
        E700F7E7DE00EFDED600EFDECE00CE635A00CE8C84006B422900FF00FF00CE73
        6B00F7C6BD00CE635A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
        EF00F7EFE700F7E7DE00EFDED600CE635A00D69494006B422900FF00FF00CE73
        6B00F7C6BD00CE635A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        F700FFF7EF00F7EFE700F7E7DE00CE635A00000000006B422900FF00FF00CE73
        6B00F7C6BD00CE635A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFF700FFF7EF00F7EFE700CE635A00CE8C84006B422900FF00FF00CE73
        6B00CE736B00CE736B00CE736B00CE736B00CE736B00CE736B00CE736B00CE73
        6B00CE736B00CE736B00CE736B00CE736B00CE736B00CE736B00}
      LookAndFeel.NativeStyle = True
    end
    object btCerrar: TcxButton
      Left = 595
      Top = 17
      Width = 75
      Height = 25
      Action = acCerrar
      Anchors = [akTop, akRight]
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009C635A006B3131006B3131006B313100FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00946363006B3131006B313100A5525200AD5A5200A55A52006B3131006B31
        31006B3131006B3131006B3131006B3131006B3131006B313100FF00FF009463
        6300A5525200BD635A00BD635A00B5635A00B5635A00A55A52006B313100F794
        9400F7949400F7949400F7949400F7949400F79494006B313100FF00FF009463
        6300C66B6300C66B6300BD636300BD635A00B5635A00AD5A52006B313100004A
        0000004A0000004A0000004A0000295A1000F79494006B313100FF00FF009463
        6300CE6B6300C66B6300C66B6300B5635A00B55A5A00AD5A52006B3131000052
        0000004A0000004A000000630800296B2100F79494006B313100FF00FF009463
        6300CE6B6B00CE6B6B00C6736B00DEB5B5009C5A5A00A55A52006B313100005A
        000000520000005A08000884180029732900F79494006B313100FF00FF009463
        6300D66B6B00CE6B6B00DEB5B500FFF7F700DEB5B500A55A52006B3131000063
        0800105A000029731000108C210031732100F79494006B313100FF00FF009463
        6300D6736B00D6736B00D6736B00DEB5B500C6736B00AD635A006B313100106B
        08008C842100D6A5420031731000D6A54200F79494006B313100FF00FF009463
        6300DE737300D6736B00D6736B00D66B6B00CE6B6B00B5635A006B3131007384
        2900FFC68400FFC68400FFC68400FFC68400F79494006B313100FF00FF009463
        6300DE737300DE737300DE736B00D6736B00D66B6B00B5635A006B313100FFC6
        8400FFC68400FFC68400FFC68400FFC68400F79494006B313100FF00FF009463
        6300E77B7300DE737300DE737300DE736B00D6736B00B5635A006B313100FFC6
        8400FFC68400FFC68400B5B5A50029A5FF00F79494006B313100FF00FF009463
        6300E77B7B00E77B7300E7737300DE737300DE737300BD6363006B313100FFC6
        8400FFC68400B5B5A50021BDF70029A5FF00F79494006B313100FF00FF009463
        6300E77B7300E77B7B00E77B7300E7737300DE737300BD6363006B313100FFC6
        8400B5B5A50018C6FF0018C6FF0021BDF700F79494006B313100FF00FF00FF00
        FF00B5736B0094636300C66B6B00C66B6B00D6737300BD6363006B3131009463
        6300946363009463630094636300946363009463630094636300FF00FF00FF00
        FF00FF00FF00FF00FF00B5736B0094636300C66B6B00C66B6B006B313100FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00B5736B009463630094636300FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.NativeStyle = True
    end
    object cxLabel28: TcxLabel
      Left = 7
      Top = -5
      Caption = 'Eleczion'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clSilver
      Style.Font.Height = -11
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.LabelEffect = cxleExtrude
      Properties.LabelStyle = cxlsLowered
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 676
    Height = 57
    Align = alTop
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 8
      Top = 30
      Caption = 'Tienda'
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 5
      Caption = 'Fecha'
    end
    object edFecha: TcxDateEdit
      Left = 56
      Top = 5
      Style.StyleController = frDatos.Edits
      TabOrder = 0
      Width = 100
    end
    object edTienda: TcxLookupComboBox
      Left = 56
      Top = 30
      Properties.Alignment.Horz = taRightJustify
      Properties.ButtonGlyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD7B6300A573
        5A00945A39008C5239007B4221007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300A5735A00945A39008C5239007B4221007B422100FF00FF00AD7B6300FFFF
        FF00E7CEBD00CEA58C00AD7352007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF00E7CEBD00CEA58C00AD7352007B422100FF00FF00AD7B6300FFFF
        FF00E7CEBD00CEA58C00BD845A007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF00E7CEBD00CEA58C00BD845A007B422100FF00FF00AD7B6300FFFF
        FF00E7CEBD00CEA58C00BD845A007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF00E7CEBD00CEA58C00BD845A007B422100FF00FF00AD7B6300FFFF
        FF00E7CEBD00CEA58C00BD845A007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF00E7CEBD00CEA58C00BD845A007B422100FF00FF00AD7B63009C6B
        4A009C6B4A0094523100945231007B4221007B4221006B422100AD7B63009C6B
        4A009C6B4A0094523100945231007B4221007B422100FF00FF00DEC6AD00AD7B
        6300EFDECE00EFDECE00CEA58C00AD7352007B4221009C6B4A00AD7B6300EFDE
        CE00EFDECE00CEA58C00AD7352007B42210094636300FF00FF00FF00FF00AD7B
        6300FFFFFF00F7EFE700EFD6C600AD7352007B422100CE9C9400AD7B6300FFFF
        FF00F7EFE700EFD6C600AD73520094636300FF00FF00FF00FF00FF00FF00FF00
        FF00AD7B63009C6B4A00945A39007B4221007B4221009C6B4A00AD7B63009C6B
        4A00945A39007B4221007B422100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00AD7B6300FFFFFF00DEC6B500AD7352007B422100FF00FF00AD7B6300FFFF
        FF00DEC6B500AD7352007B422100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00AD7B63009C6B4A00945A39007B4221009C6B4A00FF00FF00AD7B63009C6B
        4A00945A39007B4221009C6B4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AD7B6300FFFFFF007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF007B422100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AD7B6300AD7B63009C6B4A00FF00FF00FF00FF00FF00FF00AD7B
        6300AD7B63009C6B4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Properties.CharCase = ecUpperCase
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'IDTIENDA'
      Properties.ListColumns = <
        item
          Caption = 'Tda '
          FieldName = 'Tda'
        end
        item
          Caption = 'Nick '
          FieldName = 'NICK'
        end
        item
          Caption = 'Nombre '
          FieldName = 'NOMBRE'
        end>
      Properties.ListSource = dsTiendas
      Properties.OnEditValueChanged = edTiendaPropertiesEditValueChanged
      Style.StyleController = frDatos.Edits
      TabOrder = 1
      Width = 50
    end
    object edNombreTienda: TcxLookupComboBox
      Left = 112
      Top = 30
      Properties.ButtonGlyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD7B6300A573
        5A00945A39008C5239007B4221007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300A5735A00945A39008C5239007B4221007B422100FF00FF00AD7B6300FFFF
        FF00E7CEBD00CEA58C00AD7352007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF00E7CEBD00CEA58C00AD7352007B422100FF00FF00AD7B6300FFFF
        FF00E7CEBD00CEA58C00BD845A007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF00E7CEBD00CEA58C00BD845A007B422100FF00FF00AD7B6300FFFF
        FF00E7CEBD00CEA58C00BD845A007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF00E7CEBD00CEA58C00BD845A007B422100FF00FF00AD7B6300FFFF
        FF00E7CEBD00CEA58C00BD845A007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF00E7CEBD00CEA58C00BD845A007B422100FF00FF00AD7B63009C6B
        4A009C6B4A0094523100945231007B4221007B4221006B422100AD7B63009C6B
        4A009C6B4A0094523100945231007B4221007B422100FF00FF00DEC6AD00AD7B
        6300EFDECE00EFDECE00CEA58C00AD7352007B4221009C6B4A00AD7B6300EFDE
        CE00EFDECE00CEA58C00AD7352007B42210094636300FF00FF00FF00FF00AD7B
        6300FFFFFF00F7EFE700EFD6C600AD7352007B422100CE9C9400AD7B6300FFFF
        FF00F7EFE700EFD6C600AD73520094636300FF00FF00FF00FF00FF00FF00FF00
        FF00AD7B63009C6B4A00945A39007B4221007B4221009C6B4A00AD7B63009C6B
        4A00945A39007B4221007B422100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00AD7B6300FFFFFF00DEC6B500AD7352007B422100FF00FF00AD7B6300FFFF
        FF00DEC6B500AD7352007B422100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00AD7B63009C6B4A00945A39007B4221009C6B4A00FF00FF00AD7B63009C6B
        4A00945A39007B4221009C6B4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AD7B6300FFFFFF007B422100FF00FF00FF00FF00FF00FF00AD7B
        6300FFFFFF007B422100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AD7B6300AD7B63009C6B4A00FF00FF00FF00FF00FF00FF00AD7B
        6300AD7B63009C6B4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Properties.CharCase = ecUpperCase
      Properties.DropDownAutoSize = True
      Properties.KeyFieldNames = 'IDTIENDA'
      Properties.ListColumns = <
        item
          Caption = 'Tda '
          FieldName = 'Tda'
        end
        item
          Caption = 'Nick '
          FieldName = 'NICK'
        end
        item
          Caption = 'Sucursal '
          SortOrder = soAscending
          FieldName = 'SUCURSAL'
        end>
      Properties.ListFieldIndex = 2
      Properties.ListSource = dsTiendas
      Properties.OnEditValueChanged = edTiendaPropertiesEditValueChanged
      Style.StyleController = frDatos.Edits
      TabOrder = 2
      Width = 261
    end
  end
  object GridAsiste: TcxGrid [3]
    Left = 0
    Top = 57
    Width = 676
    Height = 269
    Align = alClient
    TabOrder = 1
    OnEnter = GridAsisteEnter
    OnExit = GridAsisteExit
    LookAndFeel.NativeStyle = True
    object tvAsiste: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsAsiste
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = frDatos.tvCapturas
      object tvAsisteIDVENDEDOR: TcxGridDBColumn
        DataBinding.FieldName = 'IDVENDEDOR'
        Visible = False
        Hidden = True
      end
      object tvAsisteIDTIENDA: TcxGridDBColumn
        DataBinding.FieldName = 'IDTIENDA'
        Visible = False
        Hidden = True
      end
      object tvAsisteCTRL: TcxGridDBColumn
        Caption = ' '
        DataBinding.FieldName = 'CTRL'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Asistencia'
          'Falta'
          'Descanso')
        HeaderAlignmentHorz = taCenter
        Width = 63
      end
      object tvAsisteVEND: TcxGridDBColumn
        Caption = 'Vend.'
        DataBinding.FieldName = 'VEND'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 46
      end
      object tvAsisteNOMBRE: TcxGridDBColumn
        Caption = 'Nombre '
        DataBinding.FieldName = 'NOMBRE'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 577
      end
    end
    object lvAsiste: TcxGridLevel
      GridView = tvAsiste
    end
  end
  object ActionsMov: TActionList
    Images = ImageListOpc
    Left = 12
    Top = 244
    object acGrabar: TAction
      Caption = 'Grabar'
      Hint = 'Grabar'
      ImageIndex = 0
      ShortCut = 16455
      OnExecute = acGrabarExecute
    end
    object acCerrar: TAction
      Caption = 'Cerrar'
      Hint = 'Cerrar'
      ImageIndex = 1
      ShortCut = 16472
      OnExecute = acCerrarExecute
    end
    object acDetalle: TAction
      Caption = 'Detalle'
    end
  end
  object ImageListOpc: TImageList
    Left = 44
    Top = 244
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000000000006B4229006B42
      29006B4229006B4229006B4229006B4229006B4229006B4229006B4229006B42
      29006B4229006B4229006B4229006B4229000000000000000000000000000000
      0000000000009C635A006B3131006B3131006B31310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00D6949400CE8C
      8C00735A4A00C6B5AD00C6BDBD00CEC6BD00CEC6BD00CEC6BD00CEC6BD008C73
      63009442420094424200944242006B4229000000000000000000946363006B31
      31006B313100A5525200AD5A5200A55A52006B3131006B3131006B3131006B31
      31006B3131006B3131006B3131006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00D69C9C00D694
      9400735A4A00291818005A524200FFFFFF00FFFFFF00FFFFFF00F7E7DE008C73
      63009442420094424200944242006B4229000000000094636300A5525200BD63
      5A00BD635A00B5635A00B5635A00A55A52006B313100F7949400F7949400F794
      9400F7949400F7949400F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00DEADA500D69C
      9C00735A4A000000000031211800FFFFFF00F7F7EF00F7E7DE00E7CEBD008C73
      63009C524A0094424200944242006B4229000000000094636300C66B6300C66B
      6300BD636300BD635A00B5635A00AD5A52006B313100004A0000004A0000004A
      0000004A0000295A1000F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00E7B5AD00DEAD
      A500735A4A00735A4A00735A4A00735A4A00735A4A00735A4A00735A4A00735A
      4A00A55A52009C524A00944242006B4229000000000094636300CE6B6300C66B
      6300C66B6300B5635A00B55A5A00AD5A52006B31310000520000004A0000004A
      000000630800296B2100F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00EFBDBD00E7B5
      B500E7ADA500DEA59C00D69C9400CE8C8C00C6848400BD7B7B00BD737300B56B
      6B00AD635A00A55A52009C524A006B4229000000000094636300CE6B6B00CE6B
      6B00C6736B00DEB5B5009C5A5A00A55A52006B313100005A000000520000005A
      08000884180029732900F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00F7C6BD00EFBD
      BD00E7B5B500E7ADA500DEA59C00D69C9400CE948C00CE8C8400C6847B00BD7B
      7300B56B6B00AD635A00A55A52006B4229000000000094636300D66B6B00CE6B
      6B00DEB5B500FFF7F700DEB5B500A55A52006B31310000630800105A00002973
      1000108C210031732100F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00F7C6BD00F7C6
      BD00CE635A00CE635A00CE635A00CE635A00CE635A00CE635A00CE635A00CE63
      5A00CE635A00B5736B00AD6363006B4229000000000094636300D6736B00D673
      6B00D6736B00DEB5B500C6736B00AD635A006B313100106B08008C842100D6A5
      420031731000D6A54200F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00F7C6BD00CE63
      5A00FFF7F700F7EFEF00F7E7E700EFE7DE00EFDED600E7D6CE00E7D6C600E7CE
      BD00E7CEBD00CE635A00B5736B006B4229000000000094636300DE737300D673
      6B00D6736B00D66B6B00CE6B6B00B5635A006B31310073842900FFC68400FFC6
      8400FFC68400FFC68400F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00F7C6BD00CE63
      5A00FFFFFF00FFFFF700FFF7EF00F7EFE700F7E7DE00EFDED600EFDECE00E7D6
      CE00E7CEC600CE635A00BD7B73006B4229000000000094636300DE737300DE73
      7300DE736B00D6736B00D66B6B00B5635A006B313100FFC68400FFC68400FFC6
      8400FFC68400FFC68400F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00F7C6BD00CE63
      5A00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7EFE700F7E7DE00EFDED600EFDE
      CE00E7D6CE00CE635A00C6847B006B4229000000000094636300E77B7300DE73
      7300DE737300DE736B00D6736B00B5635A006B313100FFC68400FFC68400FFC6
      8400B5B5A50029A5FF00F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00F7C6BD00CE63
      5A00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7EFE700F7E7DE00EFDE
      D600EFDECE00CE635A00CE8C84006B4229000000000094636300E77B7B00E77B
      7300E7737300DE737300DE737300BD6363006B313100FFC68400FFC68400B5B5
      A50021BDF70029A5FF00F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00F7C6BD00CE63
      5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7EFE700F7E7
      DE00EFDED600CE635A00D69494006B4229000000000094636300E77B7300E77B
      7B00E77B7300E7737300DE737300BD6363006B313100FFC68400B5B5A50018C6
      FF0018C6FF0021BDF700F79494006B3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00F7C6BD00CE63
      5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7EF
      E700F7E7DE00CE635A00000000006B4229000000000000000000B5736B009463
      6300C66B6B00C66B6B00D6737300BD6363006B31310094636300946363009463
      6300946363009463630094636300946363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00F7C6BD00CE63
      5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00F7EFE700CE635A00CE8C84006B4229000000000000000000000000000000
      0000B5736B0094636300C66B6B00C66B6B006B31310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE736B00CE736B00CE73
      6B00CE736B00CE736B00CE736B00CE736B00CE736B00CE736B00CE736B00CE73
      6B00CE736B00CE736B00CE736B00CE736B000000000000000000000000000000
      00000000000000000000B5736B00946363009463630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C000F87F000000008000C00000000000
      8000800000000000800080000000000080008000000000008000800000000000
      8000800000000000800080000000000080008000000000008000800000000000
      8000800000000000800080000000000080008000000000008000C00000000000
      8000F07F000000008000FC7F0000000000000000000000000000000000000000
      000000000000}
  end
  object dsAsiste: TDataSource
    DataSet = Asiste
    Left = 296
    Top = 84
  end
  object Asiste: TIBDataSet
    Database = frDatos.dbK
    Transaction = LocalTransaction
    CachedUpdates = True
    SelectSQL.Strings = (
      'select  '#39'          '#39' Ctrl, idvendedor, idtienda, vend, nombre'
      'from vendedor '
      'Where activo = 1 and idTienda = :idTda'
      'Order by Vend')
    ModifySQL.Strings = (
      'update vendedor set'
      'cp = :cp'
      'Where idTienda = :idTienda and idVendedor = :idVendedor')
    Left = 296
    Top = 120
    object AsisteCTRL: TIBStringField
      FieldName = 'CTRL'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object AsisteIDVENDEDOR: TLargeintField
      FieldName = 'IDVENDEDOR'
      Origin = '"VENDEDOR"."IDVENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object AsisteIDTIENDA: TLargeintField
      FieldName = 'IDTIENDA'
      Origin = '"VENDEDOR"."IDTIENDA"'
      Required = True
    end
    object AsisteVEND: TIBStringField
      FieldName = 'VEND'
      Origin = '"VENDEDOR"."VEND"'
      Required = True
      FixedChar = True
      Size = 5
    end
    object AsisteNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = '"VENDEDOR"."NOMBRE"'
      Size = 70
    end
  end
  object LocalTransaction: TIBTransaction
    DefaultDatabase = frDatos.dbK
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 332
    Top = 84
  end
  object dsTiendas: TDataSource
    DataSet = frDatos.Tiendas
    Left = 392
    Top = 188
  end
  object qNew: TIBQuery
    Database = frDatos.dbK
    Transaction = LocalTransaction
    Left = 332
    Top = 120
  end
  object ibSeek: TIBQuery
    Database = frDatos.dbK
    Transaction = LocalTransaction
    SQL.Strings = (
      'Select * from asiste'
      'Where idTienda = :idTda and fecha = :wDate and activo = 1')
    Left = 364
    Top = 120
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
end
