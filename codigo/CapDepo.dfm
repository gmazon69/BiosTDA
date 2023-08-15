inherited frCapDepo: TfrCapDepo
  Left = 397
  Top = 221
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Depositos'
  ClientHeight = 280
  ClientWidth = 370
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Shape1: TShape [0]
    Left = 4
    Top = 47
    Width = 193
    Height = 2
    Brush.Color = clSilver
    Pen.Color = clSilver
    Pen.Style = psClear
  end
  inherited sbMaster: TdxStatusBar
    Top = 260
    Width = 370
    inherited dxStatusBar1Container1: TdxStatusBarContainerControl
      Left = 168
    end
  end
  object cxLabel7: TcxLabel [2]
    Left = 0
    Top = 0
    Width = 141
    Height = 48
    Caption = 'Depositos'
    ParentFont = False
    Properties.Depth = 2
    Properties.LabelEffect = cxleCool
    Properties.LabelStyle = cxlsLowered
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -29
    Style.Font.Name = 'Comic Sans MS'
    Style.Font.Style = [fsItalic]
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
  end
  object cxLabel1: TcxLabel [3]
    Left = 8
    Top = 72
    Width = 34
    Height = 18
    Caption = 'Fecha'
  end
  object cxLabel2: TcxLabel [4]
    Left = 184
    Top = 72
    Width = 33
    Height = 18
    Caption = 'Venta'
  end
  object cxLabel3: TcxLabel [5]
    Left = 8
    Top = 120
    Width = 38
    Height = 18
    Caption = 'Cuenta'
  end
  object cxLabel4: TcxLabel [6]
    Left = 8
    Top = 144
    Width = 39
    Height = 18
    Caption = 'Importe'
  end
  object Panel1: TPanel [7]
    Left = 0
    Top = 214
    Width = 370
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 6
    DesignSize = (
      370
      46)
    object Bevel2: TBevel
      Left = 43
      Top = 8
      Width = 448
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object btAceptar: TcxButton
      Left = 185
      Top = 17
      Width = 75
      Height = 25
      Action = acGrabar
      Anchors = [akTop, akRight]
      TabOrder = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000800000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000080000000FF000000FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000080000000FF000000FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000FF000000FF000000FF0000008000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000080000000FF000000FF000000FF0000008000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000080000000FF000000FF000000FF000000800000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        0000000080000000FF000000FF00000000000000FF000000FF0000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF000000FF000000FF00FF00FF000000FF000000FF0000008000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF000000FF00FF00FF00FF00FF000000FF000000FF00000080000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
        FF000000800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF000000800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF000000FF0000008000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000FF000000FF000000FF000000FF000000FF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00}
      LookAndFeel.NativeStyle = True
    end
    object btCerrar: TcxButton
      Left = 277
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
      Width = 45
      Height = 19
      Caption = 'Eleczion'
      Enabled = False
      ParentFont = False
      Properties.LabelEffect = cxleExtrude
      Properties.LabelStyle = cxlsLowered
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clSilver
      Style.Font.Height = -11
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clGray
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
    end
  end
  object edFecha: TcxDBDateEdit [8]
    Left = 52
    Top = 72
    Width = 121
    Height = 22
    DataBinding.DataSource = dsDepositos
    Style.StyleController = frDatos.Edits
    StyleDisabled.StyleController = frDatos.Edits
    StyleFocused.StyleController = frDatos.Edits
    StyleHot.StyleController = frDatos.Edits
    TabOrder = 7
  end
  object edVenta: TcxDBDateEdit [9]
    Left = 228
    Top = 72
    Width = 121
    Height = 22
    DataBinding.DataSource = dsDepositos
    Style.StyleController = frDatos.Edits
    StyleDisabled.StyleController = frDatos.Edits
    StyleFocused.StyleController = frDatos.Edits
    StyleHot.StyleController = frDatos.Edits
    TabOrder = 8
  end
  object edImporte: TcxDBCurrencyEdit [10]
    Left = 52
    Top = 138
    Width = 121
    Height = 22
    DataBinding.DataSource = dsDepositos
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.00'
    Style.StyleController = frDatos.Edits
    StyleDisabled.StyleController = frDatos.Edits
    StyleFocused.StyleController = frDatos.Edits
    StyleHot.StyleController = frDatos.Edits
    TabOrder = 9
  end
  object edCta: TcxLookupComboBox [11]
    Left = 52
    Top = 114
    Width = 161
    Height = 22
    Properties.ListColumns = <>
    Style.StyleController = frDatos.Edits
    StyleDisabled.StyleController = frDatos.Edits
    StyleFocused.StyleController = frDatos.Edits
    StyleHot.StyleController = frDatos.Edits
    TabOrder = 10
  end
  object cxLabel5: TcxLabel [12]
    Left = 216
    Top = 4
    Width = 100
    Height = 23
    AutoSize = False
    Caption = 'FOLIO'
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Arial'
    Style.Font.Style = [fsBold]
  end
  object edFolio: TcxTextEdit [13]
    Left = 216
    Top = 24
    Width = 100
    Height = 27
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Arial'
    Style.Font.Style = [fsBold]
    TabOrder = 12
  end
  object ActionCapturas: TActionList
    Left = 188
    Top = 128
    object acGrabar: TAction
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object acCerrar: TAction
      Caption = 'Cerrar'
      ShortCut = 16472
    end
  end
  object Depositos: TIBDataSet
    Database = frDatos.dbK
    Transaction = LocalTransaction
    SelectSQL.Strings = (
      'Select * from depositos'
      'where idDeposito = -1')
    Left = 228
    Top = 176
  end
  object dsDepositos: TDataSource
    DataSet = Depositos
    Left = 264
    Top = 176
  end
  object LocalTransaction: TIBTransaction
    DefaultDatabase = frDatos.dbK
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 300
    Top = 176
  end
end
