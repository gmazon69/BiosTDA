inherited frBuscaCliente: TfrBuscaCliente
  Caption = 'Buscar cliente'
  ClientHeight = 366
  ClientWidth = 289
  ExplicitWidth = 295
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Top = 320
    Width = 289
    inherited Bevel2: TBevel
      Width = 251
    end
    inherited btAceptar: TcxButton
      Left = 104
    end
    inherited btCerrar: TcxButton
      Left = 196
    end
    inherited cxLabel28: TcxLabel
      Style.IsFontAssigned = True
    end
  end
  object cxGroupBox2: TcxGroupBox [1]
    Left = 8
    Top = 0
    Alignment = alTopCenter
    TabOrder = 1
    Height = 113
    Width = 268
    object Label7: TLabel
      Left = 10
      Top = 15
      Width = 78
      Height = 14
      Caption = 'Apellido paterno'
    end
    object Label8: TLabel
      Left = 47
      Top = 43
      Width = 41
      Height = 14
      Caption = 'Telefono'
    end
    object edApellidoPaterno: TcxTextEdit
      Left = 94
      Top = 12
      TabOrder = 0
      Width = 157
    end
    object edTelefono: TcxCurrencyEdit
      Left = 94
      Top = 40
      Properties.DisplayFormat = '0'
      TabOrder = 1
      Width = 121
    end
    object cxButton1: TcxButton
      Left = 94
      Top = 75
      Width = 112
      Height = 25
      Action = acBuscar
      LookAndFeel.NativeStyle = True
      TabOrder = 2
    end
  end
  object cxGrid1: TcxGrid [2]
    Left = 8
    Top = 119
    Width = 268
    Height = 197
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  inherited LocalTransaction: TIBTransaction
    Left = 408
    Top = 227
  end
  inherited qNew: TIBDataSet
    Left = 373
    Top = 228
  end
  inherited dsNew: TDataSource
    Left = 441
    Top = 227
  end
  inherited ActionCapturas: TActionList
    Left = 480
    Top = 232
    object acBuscar: TAction
      Caption = 'Buscar'
      OnExecute = acBuscarExecute
    end
  end
  object mClientes: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 125
    Top = 150
    object mClientestarjeta: TStringField
      FieldName = 'tarjeta'
      Size = 19
    end
    object mClientesstatus: TStringField
      FieldName = 'status'
    end
    object mClientesNombre: TStringField
      FieldName = 'Nombre'
      Size = 70
    end
  end
  object dsClientes: TDataSource
    DataSet = mClientes
    Left = 75
    Top = 141
  end
end
