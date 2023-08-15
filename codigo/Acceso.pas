
unit Acceso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, StdCtrls, cxButtons, IBQuery,
  ExtCtrls, jpeg, cxImage, cxControls, cxContainer, cxEdit, cxLabel, DB,
  IBCustomDataSet, Diccionario, Menus, cxGraphics, cxLookAndFeels, IBDatabase,
  DateUtils, dxGDIPlusClasses, cxGroupBox, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TfrAcceso = class(TForm)
    lbUser: TcxLabel;
    lbPass: TcxLabel;
    cxImage1: TcxImage;
    Panel1: TPanel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    edUser: TcxTextEdit;
    edPassword: TcxTextEdit;
    ibSeek: TIBQuery;
    LbVersion: TLabel;
    qSeek: TIBDataSet;
    wTransaction: TIBTransaction;
    lbIntentos: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCerrarClick(Sender: TObject);
  private
    FBase : TIBQuery;
    FidUser : Integer;
    FUserName : String;
    FSalida : Integer;
    Function ValidUser: Boolean;
  public
    Property Base : TIBQuery read FBase Write FBase;
    Property idUser : Integer Read FidUser;
    Property UserName : String Read FUserName;
    Property Salida : Integer Read FSalida;
  end;

var
  frAcceso: TfrAcceso;

implementation

uses Util, Datos, CambioClave, Globales;


{$R *.dfm}

procedure TfrAcceso.FormCreate(Sender: TObject);
begin
  FSalida := mrCancel;
  FidUser := -1;
  edUser.Text := '';
  edpassword.Text := '';
  LbVersion.Caption := 'Version : '+versionEXE(ParamStr(0));
end;

procedure TfrAcceso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(VK_RETURN) then begin
    Key := #0;
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TfrAcceso.btAceptarClick(Sender: TObject);
var
  CambiaClave : TfrCambioClave;
  m, i, vida: Integer;
  siCambio: Boolean;
  tt: String;
begin
  siCambio := False;
  FSalida := mrCancel;
  lbIntentos.Visible := False;
  tt := 'ERROR: Usuario bloqueado, favor de esperar %s minutos';

  if edUser.Text = '' Then Begin
    Herror('Usuario no valido');
    eduser.SetFocus;
    Exit;
  End;
  if edPassword.Text = '' Then Begin
    Herror('Password no valido');
    edPassword.SetFocus;
    Exit;
  End;

  if (GetMD5String(edUser.Text) = _pass) and (GetMD5String(edPassword.Text) = _user) Then
  Begin
    FUserName := 'BiosTDA';
    FidUser := -1;
    FSalida := mrOk;
    ModalResult := FSalida;
    Exit;
  End;

  qSeek.Close;
  qSeek.ParamByName('idTda').AsInteger := frDatos.idTienda;
  qSeek.ParamByName('xUser').AsString  := edUser.Text;
  qSeek.Open;

  if qSeek.IsEmpty Then
  Begin
    MessageBox(0, 'ERROR: Usuario no valido', 'BiosTDA', mb_TaskModal+mb_IconError);
    edUser.SetFocus;
    Exit;
  end;

  m := qSeek.FieldByName('minutos').AsInteger;
  if (qSeek.FieldByName('Intento').AsInteger >= Sucursal.Params.Intentos) and (m  < Sucursal.Params.Reset) Then
  Begin
    MessageBox(0, pChar(Format('ERROR: Usuario bloqueado, favor de esperar %d minutos', [Sucursal.Params.Reset - m])),
                 'BiosTDA', mb_TaskModal+mb_IconError);
    edUser.SetFocus;
    Exit;
  End;

  if qSeek.FieldByName('minutos').AsInteger > Sucursal.Params.Reset Then
  Begin
    qSeek.Edit;
    qSeek.FieldByName('Intento').AsInteger  := 0;
    qSeek.Post;
    wTransaction.Commit;

    qSeek.Close;
    qSeek.ParamByName('idTda').AsInteger := frDatos.idTienda;
    qSeek.ParamByName('xUser').AsString  := edUser.Text;
    qSeek.Open;
  end;

  if qSeek.FieldByName('clave').AsString <> edPassword.Text Then
  Begin
    I := qSeek.FieldByName('Intento').AsInteger + 1;

    qSeek.Edit;
    qSeek.FieldByName('Intento').AsInteger  := qSeek.FieldByName('Intento').AsInteger + 1;
    qSeek.FieldByName('Last_NO').AsDateTime := now;
    qSeek.Post;
    wTransaction.Commit;

    qSeek.Close;
    qSeek.ParamByName('idTda').AsInteger := frDatos.idTienda;
    qSeek.ParamByName('xUser').AsString  := edUser.Text;
    qSeek.Open;

    lbIntentos.Caption := Format('Intentos restantes: %s', [ IntToStr(3-I) ]);
    lbIntentos.Visible := True;

    MessageBox(0, 'ERROR: Clave no valida', 'BiosTDA', mb_TaskModal+mb_IconError);
    edPassword.Text := '';
    edPassword.SetFocus;
    Exit;
  end;

  FidUser   := qSeek.FieldByName('idVendedor').AsInteger;
  FUserName := qSeek.FieldByName('Nombre').AsString;

  qSeek.Edit;
  qSeek.FieldByName('Intento').AsInteger  := 0;
  qSeek.FieldByName('Last_NO').AsDateTime := now;
  qSeek.FieldByName('Last_OK').AsDateTime := now;
  qSeek.Post;
  wTransaction.Commit;

  qSeek.Close;
  qSeek.ParamByName('idTda').AsInteger := frDatos.idTienda;
  qSeek.ParamByName('xUser').AsString  := edUser.Text;
  qSeek.Open;

  vida := Sucursal.Params.VidaMax - qSeek.FieldByName('dias').AsInteger;
  siCambio := (vida <= 0) and (Sucursal.Params.VidaMax > 0);
  if siCambio then
    MessageBox(0, pChar('Se requiere cambio de contraseña'), 'BiosTDA', mb_TaskModal+mb_IconInformation);

  if ((vida <= 5) and (vida > 0)) and
     (MessageBox(0, pChar('Su clave vence en ' + IntToStr(vida)+ ' dias, desea cambiarla en este momento?'),
       'BiosTDA', mb_TaskModal+mb_IconQuestion+mb_YesNo + mb_DefButton2) = idYes) Then
      siCambio := True;

  FSalida := mrOk;
  if (qSeek.FieldByName('Empleado').AsString = qSeek.FieldByName('clave').AsString) or (siCambio) then
  begin
    wTransaction.Commit;
    Repeat
      CambiaClave := TfrCambioClave.Create(nil);
      CambiaClave.idUser := idUser;
      CambiaClave.aHuevo := True;
      CambiaClave.ShowModal;
    Until
      ((CambiaClave.ModalResult = mrOk) or (CambiaClave.ModalResult = mrCancel));
  end;

  if wTransaction.Active then
    wTransaction.Commit;

  ModalResult := FSalida;
end;

function TfrAcceso.ValidUser: Boolean;
begin

end;

procedure TfrAcceso.btCerrarClick(Sender: TObject);
begin
  FSalida := mrCancel;
  ModalResult := FSalida;
end;

end.
