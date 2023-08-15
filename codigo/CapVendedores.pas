unit CapVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomCapturas, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls, cxContainer, cxEdit, cxCurrencyEdit, cxDBEdit, cxImage, cxButtonEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDropDownEdit, cxCalendar, cxGroupBox, cxTextEdit, cxMaskEdit, cxRadioGroup, cxPC, ActnList, DB, IBCustomDataSet, IBDatabase, cxLabel, StdCtrls, cxButtons, ExtCtrls, IBQuery,
  DBClient, ImgList, ExtDlgs, Camera, jpeg, dxmdaset;

  const TamanioIMG = 500;

type
  TfrCapVendedores = class(TfrCustomCapturas)
    cdVend: TClientDataSet;
    ibSeek: TIBQuery;
    ibSeekIDVENDEDOR: TLargeintField;
    ibSeekIDTIENDA: TLargeintField;
    ibSeekALTA: TDateField;
    ibSeekVEND: TIBStringField;
    ibSeekNOMBRE: TIBStringField;
    ibSeekDIRECCION: TIBStringField;
    ibSeekCOLONIA: TIBStringField;
    ibSeekESTADO: TIBStringField;
    ibSeekCIUDAD: TIBStringField;
    ibSeekCP: TIBStringField;
    ibSeekTELEFONO: TIBStringField;
    ibSeekCAJERO: TIBStringField;
    ibSeekSUELDO: TIBBCDField;
    ibSeekBONO: TIBBCDField;
    ibSeekUSERNAME: TIBStringField;
    ibSeekCLAVE: TIBStringField;
    ibSeekCOMISION: TIBBCDField;
    ibSeekOBSER: TIBStringField;
    ibSeekACTIVO: TSmallintField;
    ibSeekTIPO: TIBStringField;
    ibSeekINFONAVIT: TIBBCDField;
    ibSeekNSS: TIBStringField;
    ibSeekCURP: TIBStringField;
    ibSeekCAPINCIDE: TLargeintField;
    cxPageControl1: TcxPageControl;
    taGenerales: TcxTabSheet;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    edSexo: TcxRadioGroup;
    cxLabel29: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel4: TcxLabel;
    edBaja: TcxDBDateEdit;
    cxLabel5: TcxLabel;
    edMotivoBaja: TcxComboBox;
    cxLabel12: TcxLabel;
    edVend: TcxDBTextEdit;
    edPaterno: TcxDBTextEdit;
    edMaterno: TcxDBTextEdit;
    edNombre: TcxDBTextEdit;
    edNacio: TcxDBDateEdit;
    edIMSS: TcxDBTextEdit;
    edObserBaja: TcxDBTextEdit;
    edLugar: TcxComboBox;
    edRFC: TcxDBButtonEdit;
    edCURP: TcxDBButtonEdit;
    taPersonales: TcxTabSheet;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    edDireccion: TcxDBTextEdit;
    edColonia: TcxDBTextEdit;
    edCiudad: TcxDBTextEdit;
    edEstado: TcxDBTextEdit;
    edCP: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    edTelefono1: TcxDBTextEdit;
    cxLabel31: TcxLabel;
    edObser: TcxDBTextEdit;
    cdVendIDVENDEDOR: TLargeintField;
    cdVendIDTIENDA: TLargeintField;
    cdVendSTATUS: TSmallintField;
    cdVendALTA: TDateField;
    cdVendALTA_IMSS: TDateField;
    cdVendBAJA: TDateField;
    cdVendNACIMIENTO: TDateField;
    cdVendVEND: TWideStringField;
    cdVendPATERNO: TWideStringField;
    cdVendMATERNO: TWideStringField;
    cdVendNOMBRES: TWideStringField;
    cdVendNOMBRE: TWideStringField;
    cdVendDIRECCION: TWideStringField;
    cdVendCOLONIA: TWideStringField;
    cdVendESTADO: TWideStringField;
    cdVendCIUDAD: TWideStringField;
    cdVendCP: TWideStringField;
    cdVendTELEFONO: TWideStringField;
    cdVendCAJERO: TWideStringField;
    cdVendSUELDO: TBCDField;
    cdVendBONO: TBCDField;
    cdVendUSERNAME: TWideStringField;
    cdVendCLAVE: TWideStringField;
    cdVendCOMISION: TBCDField;
    cdVendOBSER: TWideStringField;
    cdVendACTIVO: TSmallintField;
    cdVendLUGAR: TWideStringField;
    cdVendSEXO: TSmallintField;
    cdVendINFONAVIT: TBCDField;
    cdVendNSS: TWideStringField;
    cdVendCURP: TWideStringField;
    cdVendRFC: TWideStringField;
    cdVendMOTIVO_BAJA: TSmallintField;
    cdVendOBSER_BAJA: TWideStringField;
    cdVendDEPTO: TIntegerField;
    cdVendPUESTO: TIntegerField;
    cdVendFOTO: TWideStringField;
    cdVendCTA: TWideStringField;
    cdVendBANCO: TIntegerField;
    cdVendFORMA_PAGO: TIntegerField;
    cdVendTIPO: TWideStringField;
    cdVendCLABE: TWideStringField;
    cdVendCAPINCIDE: TLargeintField;
    PopupMenu: TPopupMenu;
    Copiar1: TMenuItem;
    Borrar1: TMenuItem;
    N1: TMenuItem;
    Leer1: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    cxSmallImages: TcxImageList;
    acLeer: TAction;
    acBorrar: TAction;
    acCopiar: TAction;
    qGerSub: TIBQuery;
    qVend: TIBQuery;
    cdId: TClientDataSet;
    edCta: TcxDBTextEdit;
    cxLabel15: TcxLabel;
    edBanco: TcxLookupComboBox;
    cxLabel16: TcxLabel;
    edClabe: TcxDBTextEdit;
    cxLabel32: TcxLabel;
    dsBancos: TDataSource;
    Bancos: TClientDataSet;
    ValidaEmpleado: TClientDataSet;
    bOut: TcxButton;
    bIn: TcxButton;
    mFotos: TdxMemData;
    mFotosFoto: TBlobField;
    mFotosidEntrada: TIntegerField;
    Panel2: TPanel;
    pPhoto: TPanel;
    edFoto: TcxDBImage;
    dsFotos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure acLeerExecute(Sender: TObject);
    procedure acBorrarExecute(Sender: TObject);
    procedure acCopiarExecute(Sender: TObject);
    procedure acGrabarExecute(Sender: TObject);
    procedure edVendExit(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure edRFCPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure cdVendBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure edCURPPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure bOutClick(Sender: TObject);
    procedure bInClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    nFile : String;
    FPhoto: String;
    FidPuesto: Integer;
    procedure SetPhoto(const Value: String);
    procedure SetidPuesto(const Value: Integer);
    Property Photo: String read FPhoto write SetPhoto;
    Property idPuesto: Integer read FidPuesto write SetidPuesto;
    procedure DesglosaNombre;
    Procedure DesglosaCURP;
    function SizeJPG(imgJPG: TJpegImage; imgRUTA : String): TJpegImage;
    function Tarchivo: Double;
  public
    idVend : integer;
    xTipo : integer;
    Procedure Alta;
    Procedure Baja(idVendedor : integer);
  end;

var
  frCapVendedores: TfrCapVendedores;
   cam: TWebcam;

implementation

uses Datos, Support, DatosRemoto, Util, ArchivosDataSnap;

{$R *.dfm}

{ TfrCapVendedores }


procedure TfrCapVendedores.acBorrarExecute(Sender: TObject);
begin
  inherited;
// edFoto.Clear;
  mFotos.Delete;
end;

procedure TfrCapVendedores.acCopiarExecute(Sender: TObject);
begin
  inherited;
edFoto.CopyToClipboard;
end;

procedure TfrCapVendedores.acGrabarExecute(Sender: TObject);
var
fecha : Tdate;
begin
  inherited;
  try

 if (xTipo = 2) then begin
  if VarIsNull(edBaja.EditValue) then Begin
    Herror('Favor de indicar la fecha de baja');
    taGenerales.SetFocus;
    edBaja.SetFocus;
    ModalResult := mrNone;
    Exit;
  End;
  if edMotivoBaja.ItemIndex <= 0 then Begin
    Herror('Favor de indicar el motivo de la baja');
    taGenerales.SetFocus;
    edMotivoBaja.SetFocus;
    ModalResult := mrNone;
    Exit;
  End;

  if MessageBox(0,'Estas por dar de baja este empleado.' +slineBreak +
                 '¿Está seguro de continuar', 'gpxSOFT',
                 mb_TaskModal + mb_IconQuestion + mb_YesNo + mb_DefButton2) = idNO Then begin
   ModalResult := mrNone;
   exit;
 end;

  frDatosRemoto.Conecta;
  qVend.Close;
  qVend.SQL.Clear;
  qVend.SQL.Add('update vendedor set activo = 0');
  qVend.SQL.Add('where idVendedor = :idVend');
  qVend.ParamByName('idVend').AsInteger := idVend;
  qVend.ExecSQL;

  cdVend.Edit;
  cdVend.FieldByName('Motivo_Baja').AsInteger := edMotivoBaja.ItemIndex;
  cdVend.FieldByName('Activo').AsInteger := 0;
  cdVend.Post;

 end;

 if (xTipo = 1) then begin


    if length(Trim(edCURP.Text)) <> 18 then begin
      Herror('CURP No valido');
      ModalResult := mrNone;
      cxPageControl1.ActivePage := taGenerales;
      edCURP.SetFocus;
      Exit;
  end;

  if edIMSS.Text = '' then begin
      Herror('IMSS no valido');
      ModalResult := mrNone;
      cxPageControl1.ActivePage := taGenerales;
      edIMSS.SetFocus;
      Exit;
  end;

    if not(ValidaNSS(edIMSS.Text)) then begin
      Herror('IMSS no valido');
      ModalResult := mrNone;
      cxPageControl1.ActivePage := taGenerales;
      edIMSS.SetFocus;
      Exit;
  end;

    if edCta.Text = '' then begin
  Herror('Número de cuenta no valido');
  cxPageControl1.ActivePage := taPersonales;
  edCta.SetFocus;
   ModalResult := mrNone;
   Exit;
  end;

  if edBanco.EditValue < 1 then begin
   Herror('Banco no valido');
   cxPageControl1.ActivePage := taPersonales;
   edBanco.SetFocus;
   modalResult := mrNone;
   Exit;
  end;

  qVend.Close;
  qVend.SQL.Clear;
  qVend.SQL.Add('select * from vendedor');
  qVend.SQL.Add('where vend = :vend');
  qVend.SQL.Add('and activo = 1');
  qVend.ParamByName('vend').AsString := edVend.Text;
  qVend.Open;

  if not (qVend.IsEmpty) then begin
       Herror('El número de empleado ya está siendo utilizado'+slinebreak+
       'Favor de colocar un número distinto');
      ModalResult := mrNone;
      cxPageControl1.ActivePage := taGenerales;
      edVend.SetFocus;
      edVend.SelectAll;
      Exit;
  end;

ValidaEmpleado.Close;
ValidaEmpleado.Params.ParamByName('nss').AsString := edIMSS.EditValue;
ValidaEmpleado.Params.ParamByName('curp').AsString := edRFC.EditValue;
ValidaEmpleado.Open;

if not ValidaEmpleado.IsEmpty then begin
 Herror('Empleado ya dado de alta anteriormente,');
 ModalResult := mrCancel;
 exit;
end;

   qVend.Close;
   qVend.SQL.Clear;
   qVend.SQL.Add('insert into vendedor (idvendedor, idtienda, alta, vend, nombre, direccion,');
   qVend.SQL.Add('colonia, estado, ciudad, cp, telefono, cajero, obser, activo, nss, curp)');
   qVend.SQL.Add('values (:idvendedor, :idtienda, :alta, :vend, :nombre, :direccion,');
   qVend.SQL.Add(':colonia, :estado, :ciudad, :cp, :telefono, :cajero, :obser, :activo, :nss, :curp)');

  frDatosRemoto.Conecta;
  cdId.Close;
  cdId.Open;
  idVend := cdId.FieldByName('id').AsInteger;
  fecha := cdId.FieldByName('fecha').AsDateTime;

    Try
    if not(DirectoryExists(ExtractFilePath(ParamStr(0))+'Personal\')) then
       CreateDir(ExtractFilePath(ParamStr(0))+'Personal\');

      nFile :='Personal\'+IntToStr(idVend)+'.jpg';
      TBlobField(mFotos.FieldByName('foto')).SaveToFile(ExtractFilePath(ParamStr(0))+ nFile);
      cdVend.FieldByName('Foto').AsString    := nFile;
    Except
      //
    End;

   if mFotos.IsEmpty then
    cdVend.FieldByName('Foto').AsString    := '';

  cdVend.FieldByName('idVendedor').AsInteger := idVend;
  cdVend.FieldByName('idTienda').AsInteger := frDatos.idTienda;
  cdVend.FieldByName('cajero').AsInteger := 0;
  cdVend.FieldByName('alta').AsDateTime:= fecha;
  cdVend.FieldByName('Sexo').AsInteger   := edSexo.ItemIndex;
  cdVend.FieldByName('Nombre').AsString  := cdVend.FieldByName('Paterno').AsString + ' '+
                                            cdVend.FieldByName('Materno').AsString + ' '+
                                            cdVend.FieldByName('Nombres').AsString;

  cdVend.FieldByName('Lugar').AsString   := edLugar.Text;

  cdVend.FieldByName('banco').AsInteger  := edBanco.EditValue;
  cdVend.FieldByName('activo').AsInteger := 1;
  cdVend.Post;

  qVend.Close;
  qVend.ParamByName('idVendedor').AsInteger := cdVend.FieldByName('idVendedor').AsInteger;
  qVend.ParamByName('idTienda').AsInteger   := cdVend.FieldByName('idTienda').AsInteger;
  qVend.ParamByName('alta').AsDateTime      := cdVend.FieldByName('alta').AsDateTime;
  qVend.ParamByName('vend').AsString        := cdVend.FieldByName('vend').AsString;
  qVend.ParamByName('nombre').AsString      := cdVend.FieldByName('nombre').AsString;
  qVend.ParamByName('direccion').AsString   := cdVend.FieldByName('direccion').AsString;
  qVend.ParamByName('colonia').AsString     := cdVend.FieldByName('colonia').AsString;
  qVend.ParamByName('estado').AsString      := cdVend.FieldByName('estado').AsString;
  qVend.ParamByName('ciudad').AsString      := cdVend.FieldByName('ciudad').AsString;
  qVend.ParamByName('cp').AsString          := cdVend.FieldByName('cp').AsString;
  qVend.ParamByName('telefono').AsString    := cdVend.FieldByName('telefono').AsString;
  qVend.ParamByName('cajero').AsInteger     := cdVend.FieldByName('cajero').AsInteger;
  qvend.ParamByName('obser').AsString       := cdVend.FieldByName('obser').AsString;
  qVend.ParamByName('activo').AsInteger     := cdVend.FieldByName('activo').AsInteger;
//  qVend.ParamByName('infonavit').AsString   := cdVend.FieldByName('infonavit').AsString;
  qVend.ParamByName('nss').AsString         := cdVend.FieldByName('nss').AsString;
  qVend.ParamByName('curp').AsString        := cdVend.FieldByName('curp').AsString;
  qVend.ExecSQL;

 end;

 if (cdVend.ApplyUpdates(0) = 0) then
   LocalTransaction.Commit;

 Except
   on e : exception do begin
    LocalTransaction.Rollback;
    frDatosRemoto.Desconecta;
    ModalResult := mrNone;
    Log('Error al eliminar '+ e.Message);
    Herror('Error al eliminar');
   end;
  end;
  frDatosRemoto.Desconecta;
end;

procedure TfrCapVendedores.acLeerExecute(Sender: TObject);
function CuantosBytes(archivo: string): Double;
var
  FHandle: integer;
begin
  FHandle := FileOpen(archivo, 0);
  try
    Result := getfilesize(FHandle,nil);
  finally
    FileClose(FHandle);
  end;
end;
begin
  inherited;
    if OpenPictureDialog.Execute then begin
      mFotos.Append;
      TBlobField(mFotos.FieldByName('foto')).Assign(SizeJPG(nil,OpenPictureDialog.FileName));
      mFotos.post;
      //Photo := OpenPictureDialog.FileName;
    End;
end;

procedure TfrCapVendedores.Alta;
begin
  Caption := 'Alta de empleados';
  xTipo := 1;

  frDatosRemoto.Conecta;
  cdVend.Close;
  cdVend.Params.ParamByName('idVend').AsInteger := -1;
  cdVend.Open;
  bancos.Close;
  bancos.Open;
  frDatosRemoto.Desconecta;
   cdVend.Append;
  ShowModal;
end;

procedure TfrCapVendedores.Baja(idVendedor: integer);
begin
idVend := idVendedor;
  Caption := 'Baja de empleados';
  xTipo := 2;
  btAceptar.Caption := 'Eliminar';

  frDatosRemoto.Conecta;
  cdVend.Close;
  cdVend.Params.ParamByName('idVend').AsInteger := idVendedor;
  cdVend.Open;
  bancos.Close;
  Bancos.Open;
  frDatosRemoto.Desconecta;

  Photo := cdVend.FieldByName('Foto').AsString;
  nFile := cdVend.FieldByName('Foto').AsString;

    Try
      mFotos.Append;
      TBlobField(mFotos.FieldByName('foto')).LoadFromFile(ExtractFilePath(ParamStr(0))+photo);
      mFotos.Post;
    Except
      //
    End;

  edSexo.ItemIndex := cdVend.FieldByName('Sexo').AsInteger;
  edMotivoBaja.ItemIndex :=  cdVend.FieldByName('Motivo_Baja').AsInteger;

  edLugar.Text := cdVend.FieldByName('Lugar').AsString;

  if Trim(cdVend.FieldByName('Nombres').AsString + cdVend.FieldByName('paterno').AsString +
     cdVend.FieldByName('Materno').AsString) = '' then
       DesglosaNombre;

  if (Length(cdVend.FieldByName('curp').AsString) = 18) Then
    DesglosaCURP;

    edBanco.EditValue := cdVend.FieldByName('banco').AsInteger;

  edMotivoBaja.Enabled := true;
  edObserBaja.Enabled := true;
  edBaja.Enabled  := true;

  edBanco.Enabled:= false;
  edClabe.Enabled := false;
  edCta.Enabled := false;
  edVend.Enabled := false;
  edPaterno.Enabled := false;
  edMaterno.Enabled := false;
  edNombre.Enabled := false;
  edRFC.Enabled := false;
  edCurp.Enabled := false;
  edImss.Enabled := false;
  edNacio.Enabled := false;
  edLugar.Enabled := false;
  edSexo.Enabled := false;
  edDireccion.Enabled := false;
  edColonia.Enabled := false;
  edCiudad.Enabled := false;
  edEstado.Enabled := false;
  edCP.Enabled := false;
  edTelefono1.Enabled := false;
  edObser.Enabled := false;
  edFoto.Enabled := false;
  bOut.Enabled := false;
  bIn.Enabled := false;

ShowModal;
end;

procedure TfrCapVendedores.bInClick(Sender: TObject);
var
  PanelDC: HDC;
  img : TCXImage;
  JpegImg: TJpegImage;
begin
  inherited;
img := TCXImage.Create(self);
JpegImg := TJpegImage.Create;
if not Assigned(img.Picture.Bitmap) then
    img.Picture.Bitmap := TBitmap.Create
  else begin
    img.Picture.Bitmap.Free;
    img.picture.Bitmap := TBitmap.Create;
  end;
  img.Picture.Bitmap.Height := pPhoto.Height;
  img.Picture.Bitmap.Width  := pPhoto.Width;
  img.Properties.Stretch := True;
  PanelDC := GetDC(pPhoto.Handle);
  try
    BitBlt(img.Picture.Bitmap.Canvas.Handle,0,0,pPhoto.Width, pPhoto.Height, PanelDC, 0,0, SRCCOPY);
    JpegImg.Assign(img.Picture.Bitmap);
    mFotos.Append;
    TBlobField(mFotos.FieldByName('foto')).Assign(SizeJPG(JpegImg,''));
    mFotos.post;
  finally
    img.Free;
    JpegImg.Free;
    ReleaseDC(Handle, PanelDC);
    cam.Disconnect;
    pPhoto.Visible := false;
    bOut.Hint := 'Encender';
    bin.Enabled := false;
  end;
end;

procedure TfrCapVendedores.bOutClick(Sender: TObject);
 const
  str_Connect = 'Encender';
  str_Disconn = 'Apagar';
begin
  inherited;
try
  if (Sender as TcxButton).Hint = str_Connect then  begin
    pPhoto.Align := alClient;
    pPhoto.Visible := true;
    cam := TWebcam.Create('captura',  pPhoto.Handle, 0, 0, 4000, 4000);//*
    cam.Connect;
    cam.Preview(true);
    cam.PreviewRate(4);
    (Sender as TcxButton).Hint:=str_Disconn;
    bIn.Enabled := true;
  end
  else begin
    cam.Disconnect;
    (Sender as TcxButton).Hint:=str_Connect;
    bIn.Enabled := false;
    pPhoto.Visible := false;
  end;
Except
 pPhoto.Visible := false;
end;
end;

procedure TfrCapVendedores.cdVendBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
  var
 ms : TmemoryStream;
 Temp : TimgClient;
 //name : string;
begin
  inherited;
  try
  ms := TmemoryStream.Create;
  //ms.LoadFromFile(photo);
  TBlobField(mFotos.FieldByName('foto')).SaveToStream(ms);
  //ms.Seek(0, soFromBeginning);
  ms.Seek(0, soFromBeginning);
  temp := TimgClient.Create(FrdatosRemoto.Connection.DBXConnection);
  if ms.size > 0 then
    temp.GuardarArchivo(MemoryStreamToOleVariant(ms),inttostr(idVend),1);
  Except
   //
  end;
end;

procedure TfrCapVendedores.DesglosaCURP;
Var
  i : Integer;
  S : String;
  D : TDateTime;
begin
  S := cdVend.FieldByName('curp').AsString;

  {Busca lugar de nacimiento}
  if cdVend.FieldByName('Lugar').AsString = '' then Begin
    for I := Low(_ClaveEdo) to High(_ClaveEdo) do
      if _ClaveEdo[I] = Copy(S, 12, 2) Then
        edLugar.ItemIndex := I;
  End;

  {Busca Sexo}
  if VarIsNull(cdVend.FieldByName('Sexo').Value) then
    case S[11] of
      'H' : edSexo.EditValue := 1;
      'M' : edSexo.EditValue := 2;
    end;

  {Fecha de Nacimiento}
  if VarisNull(cdVend.FieldByName('Nacimiento').Value) then
    if TryStrToDate(Copy(S, 9, 2)+'/'+Copy(S, 7, 2)+'/'+Copy(S, 5, 2), D) Then
      cdVend.FieldByName('Nacimiento').Value := D;
end;

procedure TfrCapVendedores.DesglosaNombre;
Var
  s : String;
begin
  s := trim(cdVend.FieldByName('Nombre').AsString);
  edPaterno.Text := Copy(S, 1, pos(' ', s));
  Delete(S, 1, pos(' ', s));
  edMaterno.Text := Copy(S, 1, pos(' ', s));
  Delete(S, 1, pos(' ', s));
  edNombre.Text := S;
end;

procedure TfrCapVendedores.edCURPPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
myCURP : TRFC;
begin
  inherited;
  if edNombre.Text = '' then
  exit;
  if edpaterno.Text = '' then
  exit;
  if edmaterno.Text = '' then
  exit;
    if ednacio.Text = '' then
  exit;

  myCURP := TRFC.Create(Self);
  myCURP.aNombre := edNombre.Text;
  myCURP.aPaterno := edPaterno.Text;
  myCURP.aMaterno := edMaterno.Text;
  myCURP.aFecha := edNacio.Date;
  myCURP.aSexo := edSexo.ItemIndex;
  myCURP.aEstado := edLugar.ItemIndex;
  cdVend.FieldByName('CURP').AsString := myCURP.GetCURP;
  myCURP.Free;
end;

procedure TfrCapVendedores.edRFCPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
Var
  myRFC : TRFC;
begin
  inherited;
  if edNombre.Text = '' then
  exit;
  if edpaterno.Text = '' then
  exit;
  if edmaterno.Text = '' then
  exit;
    if ednacio.Text = '' then
  exit;

  myRFC := TRFC.Create(Self);
  myRFC.aNombre := edNombre.Text;
  myRFC.aPaterno := edPaterno.Text;
  myRFC.aMaterno := edMaterno.Text;
  myRFC.aFecha := edNacio.Date;
  cdVend.FieldByName('RFC').AsString := myRFC.GetRFC;
  myRFC.Free;
end;

procedure TfrCapVendedores.edVendExit(Sender: TObject);
begin
  inherited;
  if edVend.Text <> '' Then Begin
    cdVend.FieldByName('Vend').AsString := Ceros(edVend.Text,5);
    btAceptar.Enabled := True;
  End;
end;

procedure TfrCapVendedores.FormCreate(Sender: TObject);
var
 i : integer;
begin
  inherited;
    for I := low(_Estados) to High(_Estados) do
    edLugar.Properties.Items.Add(_Estados[I]);

    mFotos.Close;
    mFotos.Open;
end;

procedure TfrCapVendedores.FormShow(Sender: TObject);
begin
  inherited;
cxPageControl1.ActivePage := taGenerales;
if edVend.Enabled then
  edVend.SetFocus;
end;

procedure TfrCapVendedores.Panel1Click(Sender: TObject);
begin
  inherited;
if not(frDatosRemoto.DSPC.Connected) then
   ShowMessage('desconectado');
end;

procedure TfrCapVendedores.SetidPuesto(const Value: Integer);
begin
  FidPuesto := Value;
end;

procedure TfrCapVendedores.SetPhoto(const Value: String);
begin
 FPhoto := Value;
end;

function TfrCapVendedores.SizeJPG(imgJPG: TJpegImage; imgRUTA: String): TJpegImage;
var
  Nuevajpg : TJpegImage;
   bmp:  TBitmap;
begin
  Nuevajpg := TJpegImage.Create;
  bmp  := TBitmap.Create;

    if imgRUTA = '' then
      Nuevajpg.Assign(imgJPG)
    else begin
     Nuevajpg.LoadFromFile(imgRuta);
    end;

    bmp.Assign(Nuevajpg);
    Nuevajpg.Assign(bmp);

    Nuevajpg.SaveToFile(ExtractFilePath(ParamStr(0))+'dpk.upk');
    if Tarchivo > TamanioIMG then begin
     Nuevajpg.CompressionQuality := nuevajpg.CompressionQuality div 6;
    Nuevajpg.Compress;
    Nuevajpg.SaveToFile(ExtractFilePath(ParamStr(0))+'dpk.upk');
    end;

 if Tarchivo > TamanioIMG then begin
   bmp.Free;
   Nuevajpg.Free;
   Result := nil;
   mFotos.Cancel;
   raise Exception.Create('Error: imagen muy grande');
 end else
  Result := Nuevajpg;
   bmp.Free;
end;

function TfrCapVendedores.Tarchivo: Double;
var
  hdl: THandle;
  FileData: TWin32FindData;
  Size:int64;
begin
     Size := 0;
     hdl := FindFirstFile(PChar(ExtractFilePath(ParamStr(0))+'dpk.upk'), FileData);
  if (hdl <> INVALID_HANDLE_VALUE) then begin
    Windows.FindClose(hdl);
    Int64Rec(Size).Lo := FileData.nFileSizeLow;
    Int64Rec(Size).Hi := FileData.nFileSizeHigh;
  end;
   Result := (Size / 1024);
end;

end.
