unit CambioClave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomCapturas, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, dxGDIPlusClasses, cxImage, cxTextEdit,
  ActnList, DB, IBCustomDataSet, IBDatabase, cxLabel, StdCtrls, cxButtons,
  ExtCtrls, IBQuery;

const
  simbolos = '!@#$%^&*()_+[]{}"\|,./<>?`~';

type
  TfrCambioClave = class(TfrCustomCapturas)
    cxLabel1: TcxLabel;
    edAnterior: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNueva: TcxTextEdit;
    cxLabel3: TcxLabel;
    edConfirma: TcxTextEdit;
    cxImage1: TcxImage;
    qUser: TIBQuery;
    procedure acGrabarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acCerrarExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FidUser: Integer;
    FaHuevo: Boolean;
  public
    property idUser : Integer Read FidUser Write FidUser;
    Property aHuevo: Boolean read FaHuevo Write FaHuevo;
  end;

var
  frCambioClave: TfrCambioClave;

implementation

uses Datos, Util, Globales;

{$R *.dfm}

procedure TfrCambioClave.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (aHuevo) and (ModalResult <> mrOK) then
  Begin
    ModalResult := mrNone;
    if MessageBox(0, 'Se requiere cambiar la clave, '+#10+'Deseas salir?', 'BiosTDA',
       mb_TaskModal+mb_IconQuestion+mb_YesNo + mb_DefButton2) = idYes Then
       Application.Terminate;
  End;
  CanClose := ((ModalResult = mrOk) or (ModalResult = mrCancel));
end;

procedure TfrCambioClave.FormCreate(Sender: TObject);
begin
  inherited;
  aHuevo := False;
  acCerrar.Enabled := not aHuevo;
end;

procedure TfrCambioClave.acGrabarExecute(Sender: TObject);
Var
  I, A: Integer;
  aChar : Char;
  antes: TStringList;
  s, ss: String;
begin
  inherited;
  ModalResult := mrNone;

  qNew.Close;
  if idUser > 0 then
    qNew.ParamByName('idUser').AsInteger := idUser
  else
    qNew.ParamByName('idUser').AsInteger := frDatos.idUser;
  qNew.Open;


  if qNew.FieldByName('clave').AsString <> edAnterior.Text then Begin
    Herror('ERROR: La clave anterior no es correcta');
    edAnterior.SetFocus;
    Exit;
  End;

  if Trim(edNueva.Text) = '' then Begin
    Herror('ERROR: La clave no puede estar en blanco');
    edNueva.SetFocus;
    Exit;
  End;

  if edNueva.Text <> edConfirma.Text then Begin
    Herror('ERROR: La clave nueva no coincide con la confirmacion');
    edNueva.SetFocus;
    Exit;
  End;

  if edNueva.Text = edAnterior.Text then
  Begin
    Herror('ERROR: La clave no puede ser la misma que la anterior');
    edAnterior.SetFocus;
    Exit;
  End;

  //Validacion Clave Fuerte
  if Length(Trim(edNueva.Text)) < 8 then
  Begin
    Herror('ERROR: La clave no puede ser menor a 8 caracteres');
    edNueva.SetFocus;
    Exit;
  End;

  if Length(Trim(edNueva.Text)) > 15 then
  Begin
    Herror('ERROR: La clave no puede ser mayor a 15 caracteres');
    edNueva.SetFocus;
    Exit;
  End;

  I := 65;
  a := 0;

  //Mayusculas
  while (I <= 90) and (a=0) do
  Begin
    a := pos( chr(I), edNueva.Text );
    Inc(I);
  End;
  if (a = 0) and (Sucursal.Params.Mayuscula=1) then
  Begin
    Herror('ERROR: La clave debe de incluir una letra Mayuscula');
    edNueva.SetFocus;
    Exit;
  End;

  //Minuscalas
  I := 97;
  a := 0;
  while (I <= 122) and (a=0) do
  Begin
    a := pos( chr(I), edNueva.Text );
    Inc(I);
  End;
  if (a = 0) and (Sucursal.Params.Minuscula=1) then
  Begin
    Herror('ERROR: La clave debe de incluir una letra Minuscula');
    edNueva.SetFocus;
    Exit;
  End;

  //Numeros
  I := 48;
  a := 0;
  while (I <= 57) and (a=0) do
  Begin
    a := pos( chr(I), edNueva.Text );
    Inc(I);
  End;
  if (a = 0) and (Sucursal.Params.Numero=1) then
  Begin
    Herror('ERROR: La clave debe de incluir un numero');
    edNueva.SetFocus;
    Exit;
  End;

  //Especial
  a := 0;
  for I := 0 to length(simbolos) do
  Begin
    a := pos( simbolos[I], edNueva.Text );
    if a <> 0 then
      Break;
  End;
  if (a = 0) and (Sucursal.Params.Especial=1) then
  Begin
    Herror('ERROR: La clave debe de incluir un caracter especial');
    edNueva.SetFocus;
    Exit;
  End;

  //Espacio en blanco
  a := pos(' ', edNueva.Text );
  if a <> 0 then
  Begin
    Herror('ERROR: La clave no debe de incluir espacios en blanco');
    edNueva.SetFocus;
    Exit;
  End;

  // Vida de clave
  if (Sucursal.Params.VidaMin > 0) and (qNew.FieldByName('dias').AsInteger <= Sucursal.Params.VidaMin) then
  Begin
    Herror('ERROR: La clave no se puede cambiar, todavia no cumple su vigencia');
    edNueva.SetFocus;
    Exit;
  End;

  // Claves anteriores
  antes := TStringList.Create;
  antes.Delimiter := '|';
//  antes.QuoteChar := '|';
  antes.DelimitedText := qNew.FieldByName('history').AsString;
  for i := 0 to pred(antes.Count) do
  Begin
    if i <= (Sucursal.Params.History-2) then
      ss := concat(ss, antes[i], '|');
    if antes[i] = GetMD5String(trim(edNueva.Text)) then
    Begin
      Herror('ERROR: Esa clave ya es registro anteriormente');
      edNueva.SetFocus;
      Exit;
    End;
  End;

  ss := concat( GetMD5String(trim(edAnterior.Text)), '|', ss);
  qNew.Edit;
  qNew.FieldByName('Clave').AsString := Trim(edNueva.Text);
  qNew.Post;

  qUser.Close;
  qUser.ParamByName('last_rst').AsDateTime  := now;
  qUser.ParamByName('idVendedor').AsInteger := idUser;
  qUser.ParamByName('intento').AsInteger    := 0;
  qUser.ParamByName('last_ok').AsDateTime   := now;
  qUser.ParamByName('last_no').AsDateTime   := now;
  qUser.ParamByName('History').AsString     := ss;
  qUser.ExecSQL;

  Try
    LocalTransaction.Commit;
    ModalResult := mrOK;
  Except
    on e : exception do
    begin
      Log('Cambio de contraseña: '+ e.Message);
      Herror('Error cambio de contraseña');
      LocalTransaction.Rollback;
    end;
  End;
end;

procedure TfrCambioClave.acCerrarExecute(Sender: TObject);
begin
  inherited;
  if aHuevo then
  Begin
    ModalResult := mrNone;
    if MessageBox(0, 'Se requiere cambiar la clave, '+#10+'Deseas salir?', 'BiosTDA',
       mb_TaskModal+mb_IconQuestion+mb_YesNo + mb_DefButton2) = idYes Then
       Application.Terminate;
  End;
end;

end.
