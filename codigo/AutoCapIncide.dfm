inherited frAutoCapIncide: TfrAutoCapIncide
  ActiveControl = nil
  Caption = 'Captura de incidencias'
  ClientHeight = 165
  ExplicitHeight = 194
  PixelsPerInch = 96
  TextHeight = 13
  inherited edQuien: TcxRadioGroup
    ItemIndex = 1
    Visible = False
  end
  inherited cxLabel2: TcxLabel
    Top = 31
    ExplicitTop = 31
  end
  inherited cxLabel3: TcxLabel
    Top = 55
    ExplicitTop = 55
  end
  inherited edUser: TcxTextEdit
    Top = 30
    Style.StyleController = frDatos.Edits
    ExplicitTop = 30
  end
  inherited edClave: TcxTextEdit
    Top = 53
    Style.StyleController = frDatos.Edits
    ExplicitTop = 53
  end
  inherited Panel1: TPanel
    Top = 119
    ExplicitTop = 119
    inherited cxLabel28: TcxLabel
      Style.IsFontAssigned = True
    end
  end
end
