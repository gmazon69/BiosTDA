unit ActivaTarj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxGroupBox, cxLabel, StdCtrls, cxButtons,
  ExtCtrls, ActnList, cxMemo, IBDatabase, DB, IBCustomDataSet, IBQuery, xmldom,
  XMLIntf, msxmldom, XMLDoc, ImgList, cxPC;

type
  TfrActivaTarj = class(TForm)
    ActionCapturas: TActionList;
    acGrabar: TAction;
    acCerrar: TAction;
    Panel1: TPanel;
    Bevel2: TBevel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    cxLabel28: TcxLabel;
    cxLabel1: TcxLabel;
    edNombre: TcxTextEdit;
    edPaterno: TcxTextEdit;
    cxLabel2: TcxLabel;
    edMaterno: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    edCel: TcxTextEdit;
    edTel: TcxTextEdit;
    edTarjeta: TcxTextEdit;
    xMemo: TcxMemo;
    qNew: TIBQuery;
    LocalTransaction: TIBTransaction;
    PageControl: TcxPageControl;
    TabActiva: TcxTabSheet;
    TabRepone: TcxTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edoldTarjeta: TcxTextEdit;
    edNewTarjeta: TcxTextEdit;
    cxImageList1: TcxImageList;
    cxButton1: TcxButton;
    imHB: TcxImageList;
    acBusca: TAction;
    qSeek: TIBQuery;
    procedure acGrabarExecute(Sender: TObject);
    procedure acCerrarExecute(Sender: TObject);
    procedure SoloNumeros(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acBuscaExecute(Sender: TObject);
  private
    graba : Boolean;
    FidRem: Integer;
    id :integer;
    Procedure ActivaTarjeta;
    Procedure TransferPtos;
  public
    Property idRem : Integer Read FidRem Write FidRem;
  end;

var
  frActivaTarj: TfrActivaTarj;

implementation

uses Datos, Util, Service1, Globales, DatosRemoto, Operation_Response,
  getTarjeta;

{$R *.dfm}

procedure TfrActivaTarj.FormActivate(Sender: TObject);
begin
  edNombre.SetFocus;
end;

procedure TfrActivaTarj.FormCreate(Sender: TObject);
begin
   KeyPreview := True;
   PageControl.ActivePage :=  TabActiva;
   graba := false;
   id := 0;
end;

procedure TfrActivaTarj.acGrabarExecute(Sender: TObject);
begin
  if PageControl.ActivePage = TabActiva then
    ActivaTarjeta;
  if PageControl.ActivePage = TabRepone then
    TransferPtos;
end;

Procedure LogTransferPtos(aEnvia : BlTransferPointsRequest; SL : TSTringList; Otro : String);
begin
  try
    log(LogLealtad,'-----Manda reposicion de tarjeta-----');
    if Assigned(aEnvia) then
    begin
      log(LogLealtad,'NewPan='        +aEnvia.NewPan);
      log(LogLealtad,'OldPan='        +aEnvia.OldPan);
      log(LogLealtad,'PosTraceNumber='+aEnvia.PosTraceNumber);
      log(LogLealtad,'LocalTime='     +aEnvia.LocalTime);
      log(LogLealtad,'LocalDate='     +aEnvia.LocalDate);
      log(LogLealtad,'TerminalId='    +aEnvia.TerminalId);
      log(LogLealtad,'OperatorId='    +aEnvia.OperatorId);
      log(LogLealtad,'OperatorName='  +aEnvia.OperatorName);
      log(LogLealtad,'SupervisorId='  +aEnvia.SupervisorId);
      log(LogLealtad,'SupervisorName='+aEnvia.SupervisorName);
      log(LogLealtad,'SendMTD='       +aEnvia.SendMTD);
    end;
    if Assigned(sl) then
    begin
      log(LogLealtad,'----- Respuesta -----');
      log(LogLealtad,SL.Text);
    end;

    if Otro <> '' then
      log(LogLealtad,Otro);

    log(LogLealtad,'');
  Except
    log(LogLealtad,'Error log');
  end;
end;

procedure TfrActivaTarj.TransferPtos;
var
  envia : BlTransferPointsRequest;
  resp : OperationResponse;
  sl : TStringList;
  OkOffline : boolean;
  xid : integer;
begin
  inherited;
  if (length(Trim(edOldTarjeta.Text)) <> 13) then Begin
    if (length(Trim(edOldTarjeta.Text)) <> 16) then Begin
      Herror('Tarjeta no valida');
      edOldTarjeta.SetFocus;
      Exit;
    End else begin
      edOldTarjeta.Text := copy(edOldTarjeta.text,4,length(edOldTarjeta.text));
    end;
  End;

  if (length(Trim(edNewTarjeta.Text)) <> 13) then Begin
    if (length(Trim(edNewTarjeta.Text)) <> 16) then Begin
      Herror('Tarjeta no valida');
      edNewTarjeta.SetFocus;
      Exit;
    End else begin
      edNewTarjeta.Text := copy(edNewTarjeta.text,4,length(edNewTarjeta.text));
    end;
  End;

  try
    OkOffline := False;

    Screen.Cursor := crSQLWait;
    acGrabar.Enabled := false;

    envia := BlTransferPointsRequest.Create;
    envia.NewPan := edNewTarjeta.Text;
    envia.OldPan := edoldTarjeta.Text;
    envia.PosTraceNumber := '000003';
    envia.LocalTime := FormatDateTime('HHMMSS', now);
    envia.LocalDate := FormatDateTime('MMDD', Cajas.xFechaLaboral);
    envia.TerminalId := _TerminalID;
    envia.OperatorId := '2';
    envia.OperatorName := Copy(frDatos.NombreUser, 1, 20);
    envia.SupervisorId := '';
    envia.SupervisorName := '';
    envia.SendMTD := '1';

    resp := OperationResponse.Create;
    try
      resp := (frDatos.httpriorLealtad as IService1).BlTransferPoints(envia);
    Except
      on e: Exception do Begin
        Log('Error al validar tarjeta BL: ' + e.Message);
        OkOffline := true;
      End;
    end;

    sl := TStringList.Create;
    sl := GetOperationResponse(resp,'XML_INFO_DATA');

    if sl.Values['RESPONSE_CODE'] <> '00' then
    Begin
      ShowMessage('ERROR ' + sl.Values['RESPONSE_CODE'] + #13 + sl.Values['POS_TEXT']);
      Exit;
    End Else
    Begin
      ShowMessage('Reposicion realizada con exito');
      Close;
    End;


    qNew.Close;
    qNew.SQL.Clear;
    qNew.SQL.Add('insert into tarjetas (idtienda, idtarjeta, idremision, iduser, tarjeta, Tarjeta2, AUTORIZACION,');
    qNew.SQL.Add('fecha, nombre, paterno, materno, celular, telefono, clase, status)');
    qNew.SQL.Add('values (:idtienda, :idtarjeta, :idremision, :iduser, :tarjeta, :Tarjeta2, :AUTORIZACION,');
    qNew.SQL.Add(':fecha, :nombre, :paterno, :materno, :celular, :telefono, 1, :status)');

    xid := maximo(qNew, 'idtarjeta', 'tarjetas');
    qNew.ParamByName('idTienda').AsInteger   := frDatos.idTienda;
    qNew.ParamByName('idTarjeta').AsInteger  := xid;
    qNew.ParamByName('idRemision').AsInteger := -1;
    qNew.ParamByName('idUser').AsInteger     := frDatos.idUser;
    qNew.ParamByName('Tarjeta').AsString     := edoldTarjeta.Text;
    qNew.ParamByName('Tarjeta2').AsString    := edNewTarjeta.Text;
    qNew.ParamByName('AUTORIZACION').AsString:= sl.Values['AUTHORIZATION_ID'];
    qNew.ParamByName('fecha').AsDate         := cajas.xFechaLaboral;
    qNew.ParamByName('nombre').AsString      := '';
    qNew.ParamByName('paterno').AsString     := '';
    qNew.ParamByName('materno').AsString     := '';
    qNew.ParamByName('celular').AsString     := '';
    qNew.ParamByName('telefono').AsString    := '';
    qNew.ParamByName('status').AsInteger     := 1;

    if (OkOffline) then
    begin
      qNew.ParamByName('status').AsInteger     := 0;
      MeteChismes(qNew,frDatos.idTienda,xid,'TR002',LocalTransaction);
      LocalTransaction.Commit;
      ShowMessage('Reposicion offline,'+#13+' Este proceso puede tardar un par de horas en completarse');
    end;

    qNew.ExecSQL;
    LocalTransaction.Commit;
  finally
    edoldTarjeta.Text := '';
    edNewTarjeta.Text := '';
    envia.Free;
    resp.Free;
    sl.Free;
    edOldTarjeta.SetFocus;
    Screen.Cursor := crDefault;
    acGrabar.Enabled := true;
  end;
end;

Procedure LogActivaTarjeta(aActiva : BlActivateRequest; SL : TSTringList; Otro : String);
begin
  try
    log(LogLealtad,'-----Activa tarjeta-----');
    if Assigned(aActiva) then
    begin
      log(LogLealtad,'PosTraceNumber:'  +aActiva.PosTraceNumber);
      log(LogLealtad,'LocalTime:'       +aActiva.LocalTime);
      log(LogLealtad,'LocalDate:'       +aActiva.LocalDate);
      log(LogLealtad,'TerminalId:'      +aActiva.TerminalId);
      log(LogLealtad,'OperatorId:'      +aActiva.OperatorId);
      log(LogLealtad,'OperatorName:'    +aActiva.OperatorName);
      log(LogLealtad,'SupervisorId:'    +aActiva.SupervisorId);
      log(LogLealtad,'SupervisorName:'  +aActiva.SupervisorName);
      log(LogLealtad,'Pan:'             +aActiva.Pan);
      log(LogLealtad,'RegisterData:'    +aActiva.RegisterData);
      log(LogLealtad,'SendMTD:'         +aActiva.SendMTD);
    end;
    if Assigned(sl) then
    begin
      log(LogLealtad,'----- Respuesta -----');
      log(LogLealtad,SL.Text);
    end;

    if Otro <> '' then
      log(LogLealtad,Otro);

    log(LogLealtad,'');
  Except
    log(LogLealtad,'Error log');
  end;
end;

procedure TfrActivaTarj.ActivaTarjeta;
Var
  Envia : BlActivateRequest;
  resp: OperationResponse;
  xStatus, I : Integer;
 // return: TStringList;
  err, auto, empl : String;
//  aNode : IXMLNode;
  sl :  tstringlist;
begin
  xStatus := 0;
  if trim(edNombre.Text) = '' then Begin
    Herror('Campo obligatorio');
    edNombre.SetFocus;
    Exit;
  End;
  if (length(Trim(edTarjeta.Text)) <> 13) then Begin
    if (length(Trim(edTarjeta.Text)) <> 16) then Begin
      Herror('Tarjeta no valida');
      edTarjeta.SetFocus;
      Exit;
    End else begin
      edtarjeta.Text := copy(edtarjeta.text,4,length(edtarjeta.text));
      ActivaTarjeta;
      exit;
    end;
  End;
  if (length(Trim(edCel.Text)) <> 10) or (copy(edCel.Text, 1, 1) = '0') then Begin
    Herror('ERROR: Telefono no valido');
    edCel.SetFocus;
    Exit;
  End;
  if edCel.Text <> edTel.Text then Begin
     Herror('El numero telefonico no coincide');
     Exit;
     edCel.SetFocus;
  End;

  qSeek.Close;
  qSeek.SQL.Clear;
  qSeek.SQL.Add('Select empleado from vendedor');
  qSeek.SQL.Add('where idVendedor = :idVend');
  qSeek.ParamByName('idVend').AsInteger := frDatos.idUser;
  qSeek.Open;
  empl := qSeek.FieldByName('empleado').AsString;

  Try
    Try
      Screen.Cursor := crSQLWait;
      acGrabar.Enabled := false;
      if not(graba) then begin

        qNew.Close;
        qNew.SQL.Clear;
        qNew.SQL.Add('insert into tarjetas (idtienda, idtarjeta, idremision, iduser, tarjeta, AUTORIZACION,');
        qNew.SQL.Add('fecha, nombre, paterno, materno, celular, telefono, clase, status)');
        qNew.SQL.Add('values (:idtienda, :idtarjeta, :idremision, :iduser, :tarjeta, :AUTORIZACION,');
        qNew.SQL.Add(':fecha, :nombre, :paterno, :materno, :celular, :telefono, 1, 0)');

        id := maximo(qNew, 'idtarjeta', 'tarjetas');
        qNew.ParamByName('idTienda').AsInteger   := frDatos.idTienda;
        qNew.ParamByName('idTarjeta').AsInteger  := id;
        qNew.ParamByName('idRemision').AsInteger := idRem;
        qNew.ParamByName('idUser').AsInteger     := frDatos.idUser;
        qNew.ParamByName('Tarjeta').AsString     := edTarjeta.Text;
        qNew.ParamByName('AUTORIZACION').AsString:= '';
        qNew.ParamByName('fecha').AsDate         := cajas.xFechaLaboral;
        qNew.ParamByName('nombre').AsString      := edNombre.Text;
        qNew.ParamByName('paterno').AsString     := edPaterno.Text;
        qNew.ParamByName('materno').AsString     := edMaterno.Text;
        qNew.ParamByName('celular').AsString     := edCel.Text;
        qNew.ParamByName('telefono').AsString    := '';
        qNew.ExecSQL;
        LocalTransaction.Commit;
        graba := true;
      end;
    Except
      on e:Exception do Begin
        Log('Activacion de tarjeta: ' + e.Message);
        Herror('Error activacion de tarjeta');
        LocalTransaction.Rollback;
      End;
    End;

    Envia := BlActivateRequest.Create;
    resp := OperationResponse.Create;
    sl := TStringList.Create;

    envia.PosTraceNumber := ceros(Copy(inttostr(id),length(inttostr(id))-5,6),6,'0');//'000003';
    envia.LocalTime      := FormatDateTime('HHMMSS', now);
    envia.LocalDate      := FormatDateTime('MMDD', Cajas.xFechaLaboral);
    envia.TerminalId     := _TerminalID;
    envia.OperatorId     := Empl;
    envia.OperatorName   := Copy(frDatos.NombreUser, 1, 20);
    envia.SupervisorId   := '';
    envia.SupervisorName := '';
    envia.Pan            := edTarjeta.Text;
    envia.RegisterData   := trim(edNombre.Text+'|'+edPaterno.Text+' '+edMaterno.Text)+'|'+edCel.Text+'|2';
    envia.SendMTD        := '1';  //0 oFF Line

    xStatus := -1;

    try
      resp :=(frDatos.httpriorLealtad as IService1).BlActivate(envia);
    except
      on e: Exception do
      Begin
        Log('Activacion de tarjeta: ' + e.Message);
        xStatus := 0;
        Herror('Tu tarjeta se activara en máximo 24 horas y podras acumular puntos a partir de ese momento.'+#13+
               'No es necesario que lo reportes.');
        close;
        exit;
      End;
    end;

    xmemo.Lines.Add('*** ACTIVACION ***');
    sl :=  tstringlist.Create;
    sl := GetOperationResponse(resp,'XML_INFO_DATA');
    xMemo.Lines.Add(sl.Text);

   { for I := 0 to high(resp.ResponseSource) do Begin
      return.Add(resp.ResponseSource[I].Key + '=' + resp.ResponseSource[I].Value);
      xmemo.Lines.Add(return[I]);
    End;}

   log(sl.Text);
   log('-----------------------');

    if sl.Values['RESPONSE_CODE'] = '00' then Begin
      auto := sl.Values['AUTHORIZATION_ID'];
      qNew.Close;
      qNew.SQL.Clear;
      qNew.SQL.Add('update tarjetas set status = 1,');
      qNew.SQL.Add('tarjeta = :tarjeta,');
      qNew.SQL.Add('AUTORIZACION = :AUTORIZACION,');
      qNew.SQL.Add('nombre = :nombre,');
      qNew.SQL.Add('paterno = :paterno,');
      qNew.SQL.Add('materno = :materno,');
      qNew.SQL.Add('celular = :celular');
      qNew.SQL.Add('where idTienda = :idTda and idTarjeta = :idTar');
      qNew.ParamByName('Tarjeta').AsString     := edTarjeta.Text;
      qNew.ParamByName('AUTORIZACION').AsString:= sl.Values['AUTHORIZATION_ID'];
      qNew.ParamByName('nombre').AsString      := edNombre.Text;
      qNew.ParamByName('paterno').AsString     := edPaterno.Text;
      qNew.ParamByName('materno').AsString     := edMaterno.Text;
      qNew.ParamByName('celular').AsString     := edCel.Text;
      qNew.ParamByName('idTda').AsInteger      := frDatos.idTienda;
      qNew.ParamByName('idTar').AsInteger      := id;
      qNew.ExecSQL;
      xStatus := 1;
      close;
    End;

    if sl.Values['RESPONSE_CODE'] <> '00' then Begin
      err := sl.Values['POS_TEXT']+'-Codigo:'+sl.Values['RESPONSE_CODE'];
      err := StringReplace(err, 'E:', 'ERROR:', [rfReplaceAll, rfIgnoreCase]);
      LogActivaTarjeta(Envia,SL,'');
      ShowMessage(err);
      edTarjeta.Text := '';
      edTarjeta.SetFocus;
    End;

  Finally
    if xStatus = 0 Then Begin
      auto := '';
      qNew.Close;
      qNew.SQL.Clear;
      qNew.SQL.Add('insert into chismes (idtienda, id, clase)');
      qNew.SQL.Add('values (:idtienda, :id, :clase)');
      qNew.ParamByName('idTienda').AsInteger := frDatos.idTienda;
      qNew.ParamByName('id').AsInteger := id;
      qNew.ParamByName('clase').AsString := 'TR001';
      qNew.ExecSQL;
      LocalTransaction.Commit;
    End;
    Envia.Free;
    resp.Free;
    sl.Free;
    Screen.Cursor := crDefault;
    acGrabar.Enabled := true;
  End;
end;

procedure TfrActivaTarj.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Skip(Sender,key,Handle);
end;

procedure TfrActivaTarj.SoloNumeros(Sender: TObject; var Key: Char);
Begin
  if not(Key in ['0' .. '9', #7, #8]) then begin
    Key := #0;
    Beep;
  end;
end;

procedure TfrActivaTarj.acBuscaExecute(Sender: TObject);
Var
  GetTarjeta : TfrGetTarjeta;
begin
  GetTarjeta := TfrGetTarjeta.Create(Self);
  GetTarjeta.ShowModal;
  if GetTarjeta.idStatus <> -1 then Begin
    Herror('Tarjeta no valida para reposicion de puntos');
    edOldTarjeta.Text := '';
    edOldTarjeta.SetFocus;
  End
  Else Begin
    edOldTarjeta.Text := GetTarjeta.xPAN;
    edNewTarjeta.SetFocus;
  End;
  GetTarjeta.Free;
end;

procedure TfrActivaTarj.acCerrarExecute(Sender: TObject);
begin
  Close;
end;

end.
