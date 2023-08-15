object frAutoriza: TfrAutoriza
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Autorizacion'
  ClientHeight = 155
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 24
    Top = 24
    AutoSize = False
    Caption = 'Folio'
    Properties.Alignment.Horz = taRightJustify
    Transparent = True
    Height = 17
    Width = 46
    AnchorX = 70
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 57
    AutoSize = False
    Caption = 'Codigo'
    Properties.Alignment.Horz = taRightJustify
    Transparent = True
    Height = 17
    Width = 46
    AnchorX = 70
  end
  object edFolio: TcxTextEdit
    Left = 76
    Top = 18
    TabStop = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 4
    Width = 141
  end
  object edCodigo: TcxTextEdit
    Left = 76
    Top = 51
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.CharCase = ecUpperCase
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Width = 141
  end
  object Panel1: TPanel
    Left = 0
    Top = 119
    Width = 258
    Height = 36
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      258
      36)
    object btAceptar: TcxButton
      Left = 87
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      Colors.Normal = 13168061
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000019591C8035AA3AEF37A13CDF0C230E300000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000186B1A9F44BB4AFFA9EEB2FF90E299FF329537CF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000001068119F38B53DFFA0E8A9FFA0EEACFFB5F5BFFF72D37AFF1F5C
        2280000000000000000000000000000000000000000000000000000000000000
        00000864099F46BB4BFFA0E6A9FF8EE59AFF84E691FF9DEFA9FFAFF3B9FF4ABE
        50FF0B220C300000000000000000000000000000000000000000000000000160
        019F3BB53FFF98E0A1FF84DD8FFF7ADE87FFA8ECB2FF99ECA5FFACF3B7FF97E6
        9FFF2D9332CF00000000000000000000000000000000000000000055008F34B1
        38FF90DB99FF79D685FF7FDA8BFF9FE6A8FF79D480FFA9EDB3FF91EB9EFFB2F3
        BCFF6CD074FF1C5B1E8000000000000000000000000000000000009700FF89D6
        92FF70CF7BFF75D380FF97E0A0FF42B947FF13A315FF82D889FF9DEAA8FF92EA
        9FFFA7EDB1FF43BB48FF0A220B30000000000000000000000000009600FF7ED0
        86FF85D58FFF86D68EFF2FAF32FF0461049F0428054025AB28FFA3E8ACFF87E4
        94FFA1EBACFF8CDF94FF2C9C30DF030B041000000000000000000054008F21A5
        24FF44B649FF11A013FF0056008F000000000000000009640A9F58C45EFF9CE5
        A6FF7ADE88FFA5EAAEFF62C969FF1B641E8F000000000000000000000000001C
        003000390060001D0030000000000000000000000000010A01100D960EEF89DA
        92FF87DE93FF80DD8CFF98E2A1FF3BB640FF0C2C0D4000000000000000000000
        0000000000000000000000000000000000000000000000000000033B04602FAF
        32FF97E0A0FF6BD478FF8CDD96FF7DD485FF26992ADF030B0310000000000000
        0000000000000000000000000000000000000000000000000000000000000676
        07BF67C96EFF89DA93FF5ACB68FF94DE9DFF57C25DFF18621A8F000000000000
        000000000000000000000000000000000000000000000000000000000000011D
        01300FA010FF85D58DFF66CC72FF66CC72FF87D790FF26AC2AFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000024D02803FB543FF88D591FF6FCD79FF89D691FF24AC2AFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000A0010028702DF4CBA52FF66C56DFF4CBA51FF137C15BF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000001300200160019F067606BF0964099F010A0110}
      LookAndFeel.NativeStyle = False
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1005312
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btAceptarClick
    end
    object btCerrar: TcxButton
      Left = 168
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      Colors.Normal = 13156351
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000808648F0C0C7BAF02020B10000000000000000000000000000000000000
        00000000000002020B101D1D8AAF1A1A768F0000000000000000000000000808
        6F9F0606B7FF0909BAFF101092CF02020B100000000000000000000000000000
        000002020B102020A1CF3838EEFF4040F7FF2121889F000000001F1F6B8F0707
        B5FF0606B7FF0909BAFF0C0CBDFF111193CF02020B1000000000000000000202
        0B101C1C9DCF2F2FE4FF3636ECFF3B3BF2FF3D3DF4FF1A1A758F2F2F87AF5454
        CEFF0909B7FF0808B9FF0B0BBCFF0E0EC0FF121295CF02020B1002020B101919
        9ACF2626DAFF2C2CE0FF3131E6FF3535EBFF3636ECFF1C1C89AF02020B103838
        9FCF5555CFFF0B0BB9FF0A0ABBFF0D0DBFFF1111C3FF131395CF161698CF1E1E
        D1FF2323D6FF2727DBFF2B2BE0FF2E2EE3FF1F1FA0CF02020B10000000000202
        0B1038389FCF5555D0FF0C0CBBFF0C0CBEFF0F0FC1FF1313C5FF1717C9FF1B1B
        CEFF1F1FD2FF2222D6FF2525D9FF1C1C9DCF02020B1000000000000000000000
        000002020B1039399FCF5656D0FF0E0EBCFF0E0EBFFF1111C3FF1414C6FF1717
        CAFF1A1ACDFF1E1ED1FF18189ACF02020B100000000000000000000000000000
        00000000000002020B103939A0CF4D4DCFFF0C0CBDFF0E0EC0FF1111C3FF1414
        C6FF1616C9FF161697CF02020B10000000000000000000000000000000000000
        00000000000002020B101E1E95CF2E2EC4FF1D1DC1FF0E0EBEFF0E0EC0FF1010
        C2FF1313C5FF131395CF02020B10000000000000000000000000000000000000
        000002020B101F1F96CF3434C4FF3232C5FF3030C5FF2F2FC6FF2828C5FF2020
        C4FF1F1FC5FF1F1FC6FF1C1C97CF02020B100000000000000000000000000202
        0B10202096CF3939C4FF3636C4FF3434C4FF3232C5FF3030C5FF6868D7FF3131
        C7FF2E2EC7FF2E2EC8FF2D2DC9FF1C1C96CF02020B100000000001010B102323
        97CF3E3EC5FF3B3BC5FF3939C4FF3636C4FF3434C4FF1E1E95CF4040A2CF7070
        D9FF3232C6FF2F2FC6FF2E2EC6FF2E2EC7FF1D1D96CF02020B1039398BAF5454
        CCFF4141C6FF3E3EC5FF3B3BC5FF3939C4FF1F1F96CF02020B1002020B104141
        A2CF7171D8FF3333C5FF3030C5FF3030C5FF3030C5FF19197EAF3838758F9898
        E6FF5353CCFF4141C6FF3E3EC5FF202096CF02020B1000000000000000000202
        0B104141A2CF7272D8FF3535C5FF3232C4FF3232C4FF1616688F000000004141
        849F9898E6FF5454CCFF232397CF02020B100000000000000000000000000000
        000002020B104141A2CF7474D8FF3838C4FF1A1A759F00000000000000000000
        00003838758F39398BAF01010B10000000000000000000000000000000000000
        00000000000002020B10373789AF29296E8F0000000000000000}
      LookAndFeel.NativeStyle = False
      ModalResult = 2
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1179798
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object qSeek: TIBQuery
    Database = frDatos.dbK
    Transaction = frDatos.trK
    SQL.Strings = (
      'Select * from renales')
    Left = 208
    Top = 16
  end
end
