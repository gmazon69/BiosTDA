inherited frCodeBar: TfrCodeBar
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Codigos de barra'
  ClientHeight = 408
  ClientWidth = 281
  Position = poMainFormCenter
  ExplicitWidth = 297
  ExplicitHeight = 447
  PixelsPerInch = 96
  TextHeight = 14
  inherited sbMaster: TdxStatusBar
    Top = 388
    Width = 281
    ExplicitTop = 388
    ExplicitWidth = 281
    inherited dxStatusBar1Container1: TdxStatusBarContainerControl
      Left = 65
      ExplicitLeft = 65
    end
  end
  object cxLabel2: TcxLabel [1]
    Left = 15
    Top = 25
    Caption = 'Codigo'
  end
  object edCodigo: TcxLookupComboBox [2]
    Left = 58
    Top = 21
    Properties.ButtonGlyph.SourceDPI = 96
    Properties.ButtonGlyph.Data = {
      424D360400000000000036000000280000001000000010000000010020000000
      000000000000C40E0000C40E00000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD7B63FFA5735AFF945A
      39FF8C5239FF7B4221FF7B4221FFFF00FF00FF00FF00FF00FF00AD7B63FFA573
      5AFF945A39FF8C5239FF7B4221FF7B4221FFFF00FF00AD7B63FFFFFFFFFFE7CE
      BDFFCEA58CFFAD7352FF7B4221FFFF00FF00FF00FF00FF00FF00AD7B63FFFFFF
      FFFFE7CEBDFFCEA58CFFAD7352FF7B4221FFFF00FF00AD7B63FFFFFFFFFFE7CE
      BDFFCEA58CFFBD845AFF7B4221FFFF00FF00FF00FF00FF00FF00AD7B63FFFFFF
      FFFFE7CEBDFFCEA58CFFBD845AFF7B4221FFFF00FF00AD7B63FFFFFFFFFFE7CE
      BDFFCEA58CFFBD845AFF7B4221FFFF00FF00FF00FF00FF00FF00AD7B63FFFFFF
      FFFFE7CEBDFFCEA58CFFBD845AFF7B4221FFFF00FF00AD7B63FFFFFFFFFFE7CE
      BDFFCEA58CFFBD845AFF7B4221FFFF00FF00FF00FF00FF00FF00AD7B63FFFFFF
      FFFFE7CEBDFFCEA58CFFBD845AFF7B4221FFFF00FF00AD7B63FF9C6B4AFF9C6B
      4AFF945231FF945231FF7B4221FF7B4221FF6B4221FFAD7B63FF9C6B4AFF9C6B
      4AFF945231FF945231FF7B4221FF7B4221FFFF00FF00DEC6ADFFAD7B63FFEFDE
      CEFFEFDECEFFCEA58CFFAD7352FF7B4221FF9C6B4AFFAD7B63FFEFDECEFFEFDE
      CEFFCEA58CFFAD7352FF7B4221FF946363FFFF00FF00FF00FF00AD7B63FFFFFF
      FFFFF7EFE7FFEFD6C6FFAD7352FF7B4221FFCE9C94FFAD7B63FFFFFFFFFFF7EF
      E7FFEFD6C6FFAD7352FF946363FFFF00FF00FF00FF00FF00FF00FF00FF00AD7B
      63FF9C6B4AFF945A39FF7B4221FF7B4221FF9C6B4AFFAD7B63FF9C6B4AFF945A
      39FF7B4221FF7B4221FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD7B
      63FFFFFFFFFFDEC6B5FFAD7352FF7B4221FFFF00FF00AD7B63FFFFFFFFFFDEC6
      B5FFAD7352FF7B4221FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD7B
      63FF9C6B4AFF945A39FF7B4221FF9C6B4AFFFF00FF00AD7B63FF9C6B4AFF945A
      39FF7B4221FF9C6B4AFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00AD7B63FFFFFFFFFF7B4221FFFF00FF00FF00FF00FF00FF00AD7B63FFFFFF
      FFFF7B4221FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00AD7B63FFAD7B63FF9C6B4AFFFF00FF00FF00FF00FF00FF00AD7B63FFAD7B
      63FF9C6B4AFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    Properties.CharCase = ecUpperCase
    Properties.DropDownAutoSize = True
    Properties.KeyFieldNames = 'IDARTICULO'
    Properties.ListColumns = <
      item
        Caption = 'Codigo '
        FieldName = 'CODIGO'
      end
      item
        Caption = 'Descripcion '
        FieldName = 'DESCRIPCION'
      end>
    Properties.ListSource = dsArticulos
    Properties.OnEditValueChanged = edCodigoPropertiesEditValueChanged
    Style.StyleController = frDatos.Edits
    TabOrder = 2
    Width = 145
  end
  object ListCodigos: TcxListBox [3]
    Left = 58
    Top = 48
    Width = 214
    Height = 272
    ItemHeight = 14
    Style.StyleController = frDatos.Edits
    TabOrder = 3
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 326
    Width = 281
    Height = 62
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 4
    DesignSize = (
      281
      62)
    object Bevel2: TBevel
      Left = 63
      Top = 8
      Width = 228
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object cxLabel28: TcxLabel
      Left = 7
      Top = -5
      Caption = 'gpxSOFT'
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
    object bImprimir: TcxButton
      Left = 87
      Top = 15
      Width = 90
      Height = 41
      Action = acPrint
      Colors.Normal = 16637900
      Default = True
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D361000000000000036000000280000002000000020000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008C8C8CFF8C8C8CFF8C8C8CFFFF00FF00FF00FF00FF00FF008C8C
        8CFF8C8C8CFF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00848484FF4A4A4AFF4A4A4AFF5A5A5AFF8C8C8CFF737373FF737373FF6B6B
        6BFF4A4A4AFF525252FF737373FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00737373FF4A4A
        4AFF4A4A4AFF5A5A5AFF313131FF393939FF424242FF4A4A4AFF424242FF8463
        63FFB5A5A5FF636363FF393939FF4A4A4AFF636363FFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF005A5A5AFF424242FF9494
        94FFF7F7F7FFC6C6C6FFA5A5A5FF6B6B6BFF524A4AFF846363FFC69494FFBD94
        94FFDED6D6FFFFFFFFFFE7E7E7FF848484FF424242FF4A4A4AFF5A5A5AFFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00737373FF424242FF848484FFEFEFEFFFF7F7
        F7FFEFEFEFFFBDBDBDFFB5B5B5FFB5B5B5FFBDADADFFAD8484FF7B6B6BFF6B6B
        6BFF7B7B7BFF9C9C9CFFD6D6D6FFF7F7F7FFF7F7F7FFA5A5A5FF525252FF4242
        42FF5A5A5AFF848484FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00737373FF4A4A4AFF6B6B6BFFD6D6D6FFF7F7F7FFF7F7F7FFEFEF
        EFFFEFEFEFFFBDBDBDFFADADADFFB5B5B5FFADADADFF393939FF525252FF5A5A
        5AFF6B6B6BFF7B7B7BFF8C8C8CFF9C9C9CFFC6C6C6FFEFEFEFFFFFFFFFFFCECE
        CEFF737373FF424242FF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00737373FF5A5A5AFFC6C6C6FFFFFFFFFFF7F7F7FFF7F7F7FFEFEFEFFFEFEF
        EFFFE7E7E7FFB5B5B5FFADADADFFADADADFFB5B5B5FF8C8C8CFF6B6B6BFF5252
        52FF5A5A5AFF6B6B6BFF7B7B7BFF8C8C8CFF9C9C9CFFADADADFFC6C6C6FFE7E7
        E7FFFFFFFFFF6B6B6BFF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF009C9C
        9CFFA5A5A5FFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFEFEFEFFFEFEFEFFFE7E7
        E7FFE7E7E7FFADADADFFA5A5A5FFADADADFFADADADFFB5B5B5FFB5B5B5FFB5B5
        B5FF9C9C9CFF848484FF737373FF7B7B7BFF8C8C8CFF9C9C9CFFA5A5A5FF8C8C
        8CFF737373FF4A4A4AFF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF009C9C
        9CFFD6D6D6FFFFFFFFFFF7F7F7FFF7F7F7FFEFEFEFFFEFEFEFFFE7E7E7FFB5B5
        B5FF737373FF636363FF7B7B7BFF8C8C8CFFA5A5A5FFADADADFFB5B5B5FFB5B5
        B5FFB5B5B5FFBDBDBDFFB5B5B5FFA5A5A5FF949494FF4A4A4AFF313131FFBDBD
        BDFF7B7B7BFF4A4A4AFF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF009C9C
        9CFFCECECEFFF7F7F7FFF7F7F7FFEFEFEFFFE7E7E7FFA5A5A5FF737373FF9494
        94FFC6C6C6FFADADADFF8C8C8CFF848484FF6B6B6BFF737373FF8C8C8CFFA5A5
        A5FFB5B5B5FFB5B5B5FFBDBDBDFFBDBDBDFFBDBDBDFFC6C6C6FFA5A5A5FFCECE
        CEFF8C8C8CFF4A4A4AFF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF009C9C
        9CFFCECECEFFF7F7F7FFE7E7E7FFADADADFF737373FF949494FFCECECEFFDEDE
        DEFFD6D6D6FFB5B5B5FF9C9C9CFFA5A5A5FFA5A5A5FF9C9C9CFF848484FF7373
        73FF737373FF8C8C8CFFA5A5A5FFBDBDBDFFBDBDBDFFBDBDBDFF73A584FF5AAD
        73FF737373FF4A4A4AFF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF008484
        84FFB5B5B5FF9C9C9CFF6B6B6BFFA5A5A5FFDEDEDEFFDEDEDEFFDEDEDEFFD6D6
        D6FFD6D6D6FFEFEFEFFFE7E7E7FFCECECEFFBDBDBDFFADADADFFA5A5A5FFADAD
        ADFFA5A5A5FF8C8C8CFF737373FF737373FF8C8C8CFFADADADFF6B9C7BFF52BD
        7BFF636363FF4A4A4AFF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF007B7B
        7BFF737373FFBDBDBDFFE7E7E7FFE7E7E7FFDEDEDEFFDEDEDEFFD6D6D6FFD6D6
        D6FFDEDEDEFFEFEFEFFFE7E7E7FFEFEFEFFFEFEFEFFFEFEFEFFFDEDEDEFFC6C6
        C6FFB5B5B5FFADADADFFB5B5B5FFADADADFF949494FF848484FF636363FF6363
        63FF7B7B7BFF4A4A4AFF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF007B7B
        7BFFD6D6D6FFE7E7E7FFE7E7E7FFDEDEDEFFDEDEDEFFD6D6D6FFD6D6D6FFD6D6
        D6FFF7F7F7FFBDBDBDFFBDBDBDFFB5B5B5FFBDBDBDFFD6D6D6FFE7E7E7FFE7E7
        E7FFE7E7E7FFE7E7E7FFCECECEFFC6C6C6FFB5B5B5FFB5B5B5FFB5B5B5FFA5A5
        A5FF737373FF525252FF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF007B7B
        7BFFE7E7E7FFE7E7E7FFDEDEDEFFDEDEDEFFD6D6D6FFD6D6D6FFCECECEFFEFEF
        EFFFD6D6D6FFC6C6C6FFEFEFEFFFEFEFEFFFEFEFEFFFD6D6D6FFBDBDBDFFB5B5
        B5FFBDBDBDFFCECECEFFE7E7E7FFE7E7E7FFE7E7E7FFDEDEDEFFCECECEFFC6C6
        C6FF8C8C8CFF525252FF8C8C8CFFFF00FF00FF00FF00FF00FF00FF00FF008C8C
        8CFFDEDEDEFFDEDEDEFFDEDEDEFFD6D6D6FFD6D6D6FFD6D6D6FFEFEFEFFFD6D6
        D6FFBDBDBDFFF7F7F7FFF7F7F7FFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEF
        EFFFDEDEDEFFCECECEFFB5B5B5FFB5B5B5FFBDBDBDFFCECECEFFE7E7E7FFDEDE
        DEFF8C8C8CFF6B6B6BFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008C8C8CFFDEDEDEFFD6D6D6FFD6D6D6FFD6D6D6FFDEDEDEFFB5B5B5FF9C9C
        9CFFD6D6D6FFF7F7F7FFF7F7F7FFF7F7F7FFEFEFEFFFEFEFEFFFEFEFEFFFEFEF
        EFFFEFEFEFFFEFEFEFFFE7E7E7FFE7E7E7FFDEDEDEFFBDBDBDFFADADADFFD6D6
        D6FF636363FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF007B7B7BFF949494FF949494FFADADADFF9C9C9CFFB5B5B5FFADAD
        ADFF949494FF8C8C8CFF949494FFA5A5A5FFBDBDBDFFD6D6D6FFEFEFEFFFEFEF
        EFFFEFEFEFFFEFEFEFFFEFEFEFFFE7E7E7FFE7E7E7FFB5B5B5FFCECECEFF7B7B
        7BFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009C9C9CFFEFEFEFFFEFEFEFFFEFEFEFFFB5B5
        B5FFADADADFFB5B5B5FFBDBDBDFFBDBDBDFFADADADFF9C9C9CFF8C8C8CFF9C9C
        9CFFA5A5A5FFC6C6C6FFE7E7E7FFDEDEDEFFB5B5B5FFC6C6C6FF7B7B7BFFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009C9C9CFFF7F7F7FFFFFFFFFFFFFFFFFFDEDE
        DEFFC6C6C6FFC6C6C6FFB5B5B5FFBDBDBDFFBDBDBDFFC6C6C6FFCECECEFFD6D6
        D6FFD6D6D6FFA5A5A5FFADADADFFB5B5B5FFA5A5A5FF848484FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00949494FFBDB5B5FFE7B5ADFFFFB5A5FFFFB5
        A5FFFFC6BDFFFFD6CEFFFFE7DEFFF7E7DEFFEFEFEFFFE7E7E7FFD6D6D6FFD6D6
        D6FFD6D6D6FFA5A5A5FF6B6B6BFFADADADFFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD948CFFE7BD9CFFFFD6ADFFFFD6
        ADFFFFCEADFFFFCEA5FFFFC6A5FFFFC69CFFFFBD9CFFFFCEADFFFFD6BDFFF7D6
        C6FFD6CECEFF848484FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00B58C8CFFFFD6B5FFFFDEB5FFFFDE
        B5FFFFDEB5FFFFDEB5FFFFDEB5FFFFDEB5FFFFDEB5FFFFDEB5FFFFD6B5FFE7BD
        9CFF6B5A5AFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00AD847BFFFFDEBDFFFFDEBDFFFFDE
        BDFFFFDEBDFFFFDEBDFFFFDEBDFFFFDEBDFFFFDEBDFFFFDEBDFFFFDEBDFFCEA5
        94FF6B5A5AFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD948CFFFFE7CEFFFFE7CEFFFFE7
        CEFFFFE7CEFFFFE7CEFFFFE7CEFFFFE7CEFFFFE7CEFFFFE7CEFFFFE7CEFFBD94
        8CFF7B7B7BFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD948CFFDEB5ADFFFFE7CEFFFFE7CEFFFFE7
        CEFFFFE7CEFFFFE7CEFFFFE7CEFFFFE7CEFFFFE7CEFFFFE7CEFFFFE7CEFF946B
        6BFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00AD8C8CFFF7DECEFFFFEFDEFFFFEFDEFFFFEF
        DEFFFFEFDEFFFFEFDEFFFFEFDEFFFFEFDEFFFFEFDEFFFFEFDEFFF7DECEFF735A
        5AFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00AD847BFFFFF7E7FFFFF7E7FFFFF7E7FFFFF7
        E7FFFFF7E7FFFFF7E7FFFFF7E7FFFFF7E7FFFFF7E7FFFFF7E7FFDEBDB5FF7B73
        73FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD948CFFDEBDBDFFFFF7EFFFFFF7EFFFFFF7EFFFFFF7
        EFFFFFF7EFFFFFF7EFFFFFF7EFFFFFF7EFFFFFF7EFFFFFF7EFFFA58484FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00A57B7BFFFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFFFF
        F7FFFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFF7E7DEFF8C7373FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B58C8CFFEFE7DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD9494FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CEB5B5FFCEB5B5FFCEB5B5FFCEB5B5FFCEB5B5FFCEB5B5FFCEB5
        B5FFCEB5B5FFCEB5B5FFCEB5B5FFCEB5B5FFC6ADADFFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      TabOrder = 1
    end
    object bCerrar: TcxButton
      Left = 183
      Top = 15
      Width = 90
      Height = 41
      Action = acSalir
      Anchors = [akTop, akRight]
      Colors.Normal = 4737279
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424DBE1100000000000036000000280000002200000021000000010020000000
        000000000000C40E0000C40E00000000000000000000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000808080FF808080FFC0C0C000C0C0
        C000C0C0C000808080FF808080FFC0C0C000C0C0C000C0C0C000808080FF8080
        80FFC0C0C000C0C0C000C0C0C000000000FF000000FF000000FFC0C0C000C0C0
        C000808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000808080FFC0C0C000C0C0C000C0C0
        C000808080FF808080FFC0C0C000C0C0C000C0C0C000808080FF808080FFC0C0
        C000C0C0C000C0C0C000808080FF808080FFC0C0C000000000FFFFFF00FFFFFF
        00FF000000FFC0C0C000C0C0C000C0C0C000808080FF808080FFC0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
        80FF808080FFC0C0C000C0C0C000C0C0C000808080FF808080FFC0C0C000C0C0
        C000C0C0C000808080FF808080FFC0C0C000C0C0C000C0C0C000808080FF0000
        00FFFFFF00FFFFFF00FF808000FF000000FF808080FFC0C0C000C0C0C000C0C0
        C000808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0C000808080FF8080
        80FFC0C0C000C0C0C000C0C0C000808080FF808080FFC0C0C000C0C0C000C0C0
        C000808080FF808080FFC0C0C000C0C0C000C0C0C000808080FF808080FFC0C0
        C000C0C0C000000000FFFFFF00FFFFFF00FF808000FF808000FF000000FF8080
        80FF808080FFC0C0C000C0C0C000C0C0C000808080FF808080FFC0C0C000C0C0
        C000C0C0C000C0C0C000808080FF808080FFC0C0C000C0C0C000C0C0C0008080
        80FF808080FFC0C0C000C0C0C000C0C0C000808080FF808080FFC0C0C000C0C0
        C000C0C0C000808080FF808080FF000000FFFFFF00FFFFFF00FF808000FF8080
        00FF808000FF000000FF000000FF808080FF808080FFC0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000808080FFC0C0C000C0C0C000C0C0C000808080FF8080
        80FFC0C0C000C0C0C000C0C0C000808080FF808080FFC0C0C000C0C0C000C0C0
        C000808080FF808080FFC0C0C000C0C0C000C0C0C000000000FFFFFF00FFFFFF
        00FF808000FF808000FF808000FF808000FF000000FF000000FF000000FF8080
        80FF808080FFC0C0C000C0C0C000C0C0C000000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FFC0C0C000C0C0C000C0C0C000808080FF808080FFC0C0C0000000
        00FFFFFF00FFFFFF00FF808000FF808000FF808000FF808000FF808000FF0000
        00FF000000FF000000FF000000FF000000FFC0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000000000FF808080FF808080FFC0C0C000C0C0C000C0C0
        C000808080FF000000FFFFFF00FFFFFF00FF808000FF808000FF808000FF8080
        00FF808000FF000000FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000000000FF000000FF000000FF8080
        80FF808080FFC0C0C000C0C0C000000000FFFFFF00FFFFFF00FF808000FF8080
        00FF808000FF808000FF808000FF000000FF808080FF808080FFC0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000808080FFC0C0C000000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF
        00FF808000FF808000FF808000FF808000FF808000FF000000FF808080FF8080
        80FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000FF808080FF8080
        80FF000000FF808080FF808080FF808080FF808080FF808080FF808080FF0000
        00FFFFFF00FFFFFF00FF808000FF808000FF808000FF808000FF808000FF0000
        00FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
        00FF000000FF808080FF000000FF808080FF808080FF808080FF808080FF8080
        80FF808080FF000000FFFFFF00FFFFFF00FF808000FF808000FF808000FF8080
        00FF808000FF000000FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000000000FF808000FF000000FF000000FF808080FF808080FF8080
        80FF808080FF808080FF808080FF000000FFFFFF00FFFFFF00FF808000FF8080
        00FF808000FF808000FF808000FF000000FF808080FF808080FFC0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000000000FF808000FF808000FF000000FF8080
        80FF808080FF808080FF808080FF808080FF808080FF000000FFFFFF00FFFFFF
        00FF808000FF000000FF000000FF808000FF808000FF000000FF808080FF8080
        80FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000808080FF808080FF808080FF808080FF808080FF000000FFFFFF00FF8080
        00FF808000FF000000FF808080FF808080FF808080FF808080FF808080FF0000
        00FFFFFF00FFFFFF00FF000000FF808080FF000000FF808000FF808000FF0000
        00FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000808080FF808080FF808080FF808080FF808080FF808080FF0000
        00FFFFFF00FFFFFF00FF808000FF808000FF000000FF808080FF808080FF8080
        80FF808080FF000000FFFFFF00FFFFFF00FF000000FFFFFFFFFF000000FF8080
        00FF808000FF000000FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF808000FF808000FF0000
        00FF808080FF808080FF808080FF000000FFFFFF00FFFFFF00FF808000FF0000
        00FF000000FF808000FF808000FF000000FF808080FF808080FFC0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000000000FF808000FF808000FF808000FF8080
        00FF808000FF808000FF808000FF808000FFFFFF00FFFFFF00FFFFFF00FFFFFF
        00FF808000FF808000FF000000FF808080FF808080FF000000FFFFFF00FFFFFF
        00FF808000FF808000FF808000FF808000FF808000FF000000FF808080FF8080
        80FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000FFFFFF00FFFFFF
        00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF
        00FFFFFF00FFFFFF00FFFFFF00FF808000FF808000FF000000FF808080FF0000
        00FFFFFF00FFFFFF00FF808000FF808000FF808000FF808000FF808000FF0000
        00FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
        00FFFFFF00FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FF808000FF0000
        00FF808080FF000000FFFFFF00FFFFFF00FF808000FF808000FF808000FF8080
        00FF808000FF000000FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF
        00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFFFFFFF00FFFFFF00FF8080
        00FF000000FF808080FF808080FF000000FFFFFF00FFFFFF00FF808000FF8080
        00FF808000FF808000FF808000FF000000FF808080FF808080FFC0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFFFF00FFFFFFFFFFFFFF00FFFFFF
        00FF808000FF000000FF808080FF808080FF808080FF000000FFFFFF00FFFFFF
        00FF808000FF808000FF808000FF808000FF808000FF000000FF808080FF8080
        80FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000FFFFFF00FFFFFF
        00FFFFFF00FF808000FF000000FF808080FF808080FF808080FF808080FF0000
        00FFFFFF00FFFFFF00FF808000FF808000FF808000FF808000FF808000FF0000
        00FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
        00FFFFFF00FFFFFF00FF808000FF000000FF808080FF808080FF808080FF8080
        80FF808080FF000000FFFFFF00FFFFFF00FF808000FF808000FF808000FF8080
        00FF808000FF000000FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000000000FFFFFF00FF808000FF000000FF808080FF808080FF8080
        80FF808080FF808080FF808080FF000000FFFFFF00FFFFFF00FF808000FF8080
        00FF808000FF808000FF808000FF000000FF808080FF808080FFC0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000000000FF808000FF000000FF000000FF8080
        80FF808080FF808080FF808080FF808080FF808080FF808080FF000000FFFFFF
        00FFFFFF00FF808000FF808000FF808000FF808000FF000000FF808080FF8080
        80FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000FF000000FFC0C0
        C000000000FF808080FF808080FF808080FF808080FF808080FF808080FF8080
        80FF808080FF000000FFFFFF00FFFFFF00FF808000FF808000FF808000FF0000
        00FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000000000FF808080FF808080FF808080FF808080FF8080
        80FF808080FF808080FF808080FF808080FF000000FFFFFF00FFFFFF00FF8080
        00FF808000FF000000FF808080FF808080FFC0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000000000FF808080FF808080FF8080
        80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF0000
        00FFFFFF00FFFFFF00FF808000FF000000FF808080FF808080FFC0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000FF8080
        80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
        80FF808080FF808080FF000000FFFFFF00FFFFFF00FF000000FF808080FFC0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FFC0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
      TabOrder = 2
    end
  end
  object dsArticulos: TDataSource
    DataSet = frDatos.Articulos
    Left = 221
    Top = 5
  end
  object ActionReportes: TActionList
    Left = 107
    Top = 18
    object acPrint: TAction
      Category = 'Menu'
      Caption = 'Imprimir'
      ShortCut = 16464
      OnExecute = acPrintExecute
    end
    object acSalir: TAction
      Category = 'Menu'
      Caption = 'Salir'
      ShortCut = 16472
      OnExecute = acSalirExecute
    end
  end
  object ibSeek: TIBQuery
    Database = frDatos.dbK
    Transaction = frDatos.trK
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select a.idarticulo, a.codigo, a.descripcion, a.marca, p.pv1'
      'from articulos a'
      'join precios p on p.idArticulo = a.idArticulo'
      'where a.idArticulo = :idArt')
    Left = 128
    Top = 124
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idArt'
        ParamType = ptUnknown
      end>
  end
end
