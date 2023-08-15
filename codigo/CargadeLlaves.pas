unit CargadeLlaves;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, cxTextEdit, cxLabel,
  DBXJSON, Character, cxCurrencyEdit, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrCargadeLlaves = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    bCarga: TcxButton;
    Panel2: TPanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    bCerrar: TcxButton;
    bImprime: TcxButton;
    procedure bCargaClick(Sender: TObject);
    procedure bCerrarClick(Sender: TObject);
    procedure bImprimeClick(Sender: TObject);
  private
    function StripNonJson(s: string): string;
  public
    { Public declarations }
  end;

var
  frCargadeLlaves: TfrCargadeLlaves;

implementation

uses TPIWrapper_TLB, Datos, Globales, FtoBBVA, FtoBBVACancel, Util;

{$R *.dfm}

procedure TfrCargadeLlaves.bCerrarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrCargadeLlaves.bCargaClick(Sender: TObject);
Var
  TPI : TXTPI;
  Respuesta: WideString;
  txtEnvia: String;
  i: Integer;
//  jo : TJSONObject;
  return : TStringList;
begin
  //Log('Inicia carga de llavez','Carga de LLaves');
  return := TStringList.Create;
//  jo:= TJSONObject.Create;
  try
    txtEnvia := Concat(
    '{                                                                       ',
    ' "POS_TRACE_NUMBER"             : "00001",                              ',
    ' "LOCAL_DATE"                   : "',FormatDateTime('MMdd',now),  '",   ',
    ' "LOCAL_TIME"                   : "',FormatDateTime('hhmmss',now),'",   ',
    ' "TERMINAL_ID"                  : "', _TerminalID, '" ,',
    ' "OPERATOR_ID"                  : "',IntToStr(Abs(frDatos.idUser)),'"   ',
    '}                                                                       ');
    TPI := TXTPI.Create(self);
    GrabaLog('Request cargar llaves =====> ');
    GrabaLog(txtEnvia);
    Respuesta := TPI.SendTrx('9999', txtEnvia, RutaConfigTPI);

//    jo := TJsonObject(TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(StripNonJson(Respuesta)),0));
//    return.Clear;
//    for i := 0 to jo.Size-1 do
//    Begin
//      return.Add(jo.Get(i).JsonString.Value + '=' + jo.Get(i).JsonValue.Value);
//      GrabaLog('Response =====>');
//      GrabaLog(jo.Get(i).JsonString.Value + '=' + jo.Get(i).JsonValue.Value);
//    End;

    if return.Values['status'] <> '0' then
    Begin
      showmessage( Concat('ERROR: ', return.Values['status'], #10, return.Values['message'] ) );
      GrabaLog( Concat('ERROR: ', return.Values['status'], #10, return.Values['message'] ) );
      ModalResult := mrCancel;
      Exit;
    End;
    if return.Values['RESPONSE_CODE'] <> '00' then
    Begin
      ShowMessage(return.Values['RESPONSE_CODE']+' '+ return.Values['POS_TEXT']);
      GrabaLog(return.Values['RESPONSE_CODE']+' '+ return.Values['POS_TEXT']);
      ModalResult := mrCancel;
      Exit;
    End
    else
    begin
      ShowMessage('Carga de llaves correcta');
      ModalResult := mrOK;
      Close;
    end;
  TPI.Free;
  Except
    on e : Exception do
    begin
      Log('Carga de LLaves: '+ e.Message);
      ShowMessage('ERROR: al cargar llaves');
    end;
  end;
end;

procedure TfrCargadeLlaves.bImprimeClick(Sender: TObject);
Var
  IdPago: Integer;
  FtoC: TFtoBBVACancel;
  Fto: TFtoBBVA;
  qNew: TIBQuery;
begin
  qNew := TIBQuery.Create(Application);
  qNew.Database := frDatos.dbK;
  qNew.SQL.Text:= Concat(
  ' select first 1 max(idpago)idpago, activo from pagotarjeta ',
  ' where fecha = :Fecha ',
  ' group by 2 ',
  ' order by 1 desc ');
  qNew.ParamByName('Fecha').AsDate := Cajas.xFechaLaboral;
  qNew.Open;

  if qNew.IsEmpty then
  begin
    ShowMessage('No hay Tickets para Imprimir');
    bCerrarClick(sender);
  end;

  if qNew.FieldByName('activo').AsInteger = 1 then
  begin
    Fto:= TFtoBBVA.Create(Self);
    Fto.idPago := qNew.FieldByName('idpago').AsInteger;
    Fto.DB := qNew;
    Fto.Imprime;
    Fto.Free;
  end
  else
  begin
    FtoC:= TFtoBBVACancel.Create(Self);
    FtoC.idPago := qNew.FieldByName('idpago').AsInteger;
    FtoC.DB := qNew;
    FtoC.Imprime;
    FtoC.Free;
  end;
  bCerrarClick(sender);
end;

function TfrCargadeLlaves.StripNonJson(s: string): string;
var
  ch: char;
  inString: boolean;
begin
  Result := '';
  inString := false;
  for ch in s do
  begin
    if ch = '"' then
      inString := not inString;
    if TCharacter.IsWhiteSpace(ch) and not inString then
      continue;
    Result := Result + ch;
  end;
end;

end.
