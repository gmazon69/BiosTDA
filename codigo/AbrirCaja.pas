unit AbrirCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Master, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit, cxLabel,
  cxButtons, ExtCtrls, ImgList, cxProgressBar, dxStatusBar, DB, IBCustomDataSet,
  IBQuery, ButtonGroup, IBDatabase, IBEvents, DateUtils, ClipBrd;

type
  TfrAbrirCaja = class(TfrMaster)
    Panel1: TPanel;
    Bevel2: TBevel;
    btCerrar: TcxButton;
    cxLabel28: TcxLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    TimerHora: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    edDateTime: TcxDateEdit;
    edDateTime2: TcxDateEdit;
    qCajas: TIBQuery;
    bCajas: TButtonGroup;
    LocalTransaction: TIBTransaction;
    iCajas: TcxImageList;
    evCajas: TIBEvents;
    procedure TimerHoraTimer(Sender: TObject);
    procedure edDateTimeEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btCerrarClick(Sender: TObject);
    procedure bCajasButtonClicked(Sender: TObject; Index: Integer);
    procedure evCajasEventAlert(Sender: TObject; EventName: string; EventCount: Integer; var CancelAlerts: Boolean);
    procedure edDateTimeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FAbrioLabores: Boolean;
    procedure SetHoraFecha;
    procedure LoadCajas;
    procedure CreateCaja(Sender: TObject);
    function FirstMayusc(S: String): String;
    Procedure CheckOpened;
  public
    property AbrioLabores: Boolean read FAbrioLabores write FAbrioLabores;
  end;

var
  frAbrirCaja: TfrAbrirCaja;

implementation

uses Datos, Tools, Util, Globales, Main;
{$R *.dfm}

procedure TfrAbrirCaja.bCajasButtonClicked(Sender: TObject; Index: Integer);
var
  xDia: Integer;
  qInsert: TIBQuery;
begin
  inherited;
  qInsert := TIBQuery.Create(Self);
  try
    qInsert.Database := frDatos.dbK;
    qInsert.Transaction := LocalTransaction;
    try
      if bCajas.Items[Index].ImageIndex = 1 then
        Exit;

      if edDateTime.Enabled then begin
        if edDateTime.Text <> edDateTime2.Text then begin
          Herror
            ('La fecha y hora de apertura no coindiden con la confirmacion');
          edDateTime.SetFocus;
          Exit;
        end;

        qInsert.Close;
        qInsert.SQL.Clear;
        qInsert.SQL.Add('select max(fecha) fecha from remision');
        qInsert.SQL.Add('where idtienda = :idTda and activo = 1');
        qInsert.ParamByName('idTda').AsInteger := frDatos.idTienda;
        qInsert.Open;

        if qInsert.FieldByName('fecha').AsDateTime >= edDateTime.Date then begin
          Herror('Fecha laboral invalida');
          edDateTime.SetFocus;
          Exit;
        end;

        qInsert.Close;
        qInsert.SQL.Clear;
        qInsert.SQL.Add('select * from dias');
        qInsert.SQL.Add(
          'where idtienda = :idTda and fecha = :xfecha and activo = 0');
        qInsert.ParamByName('idTda').AsInteger := frDatos.idTienda;
        qInsert.ParamByName('xfecha').AsDate := edDateTime.Date;
        qInsert.Open;

        if not qInsert.IsEmpty then begin
          Herror('Fecha laboral invalida');
          edDateTime.SetFocus;
          Exit;
        end;
      end;

      if (bCajas.Items[Index].ImageIndex <> 4) and (frdatos.GetGuidUnit <> '') then begin
        if Application.MessageBox(
          'Esta maquina se ha abierto habitualmente con otro numero de caja' +
            #13 + '¿Esta seguro que desea cambiar el nombre de la caja?',
          '¡Advertencia!', MB_YesNo or MB_ICONWARNING) <> mrYes then
          Exit;
      end;

      AbrioLabores := True;

      if edDateTime.Enabled then begin
        SetHoraFecha;

        qInsert.Close;
        qInsert.SQL.Clear;
        qInsert.SQL.Add('select max(iddia) iddia from dias');
        qInsert.SQL.Add('where idtienda = :idTda');
        qInsert.ParamByName('idTda').AsInteger := frDatos.idTienda;
        qInsert.Open;

        xDia := qInsert.FieldByName('iddia').AsInteger + 1;

        qInsert.Close;
        qInsert.SQL.Clear;
        qInsert.SQL.Add('insert into dias (idtienda, iddia, fecha, activo)');
        qInsert.SQL.Add('values (:idtienda, :iddia, :fecha, :activo)');
        qInsert.ParamByName('idtienda').AsInteger := frDatos.idTienda;
        qInsert.ParamByName('iddia').AsInteger := xDia;
        qInsert.ParamByName('fecha').AsDate := edDateTime.Date;
        qInsert.ParamByName('activo').AsInteger := 1;
        qInsert.ExecSQL;
      end;

         if frDatos.GetGuidUnit = '' then
            frDatos.GetGuidUnitNew;

      qInsert.Close;
      qInsert.SQL.Clear;
      qInsert.SQL.Add('update cajas');
      qInsert.SQL.Add('set');
      qInsert.SQL.Add('    mac = :mac,');
      qInsert.SQL.Add('    activa = 1,');
      qInsert.SQL.Add('    lastcut = -1');
      qInsert.SQL.Add('where idtienda = :idTda and idCaja = :idcaja');
      qInsert.ParamByName('idtda').AsInteger := frDatos.idTienda;
      qInsert.ParamByName('idcaja').AsInteger := Index + 1;
      qInsert.ParamByName('mac').AsString := frdatos.GetGuidUnit;//GetMacAddress;
      qInsert.ExecSQL;

      LocalTransaction.Commit;
      frMain.CheckCaja;

      {Verifica si ya se elaboro la factura global del dia anterior}
      qInsert.Close;
      qInsert.SQL.Clear;
      qInsert.SQL.Add('Select * from CFDI');
      qInsert.SQL.Add('Where (idTienda = :idTda) and (fecha_venta = :w) and (idCliente <= 0)  and (idRemision <= 0)');
      qInsert.ParamByName('idTda').AsInteger := frDatos.idTienda;
      qInsert.ParamByName('w').AsDate := edDateTime.Date - 1;
      qInsert.Open;
      if qInsert.IsEmpty then
        MessageBox(0, 'No se elaboro la factura global del dia anterior' + #10+
        'Favor de checar', 'gpxSOFT', mb_TaskModal + MB_ICONEXCLAMATION + mb_OK);

      Close;
    Except
      on e: exception do
      begin
        Log('AbriCaja ' + e.Message);
        Herror('Error al abrir caja');
        LocalTransaction.Rollback;
      end;
    end;
  finally
    bCajas.ItemIndex := -1; ;
    qInsert.Free;
  end;
end;

procedure TfrAbrirCaja.btCerrarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrAbrirCaja.CheckOpened;
begin
  edDateTime.Date := Cajas.xFechaLaboral;
  edDateTime2.Date := Cajas.xFechaLaboral;
  edDateTime.Enabled := Cajas.xFechaLaboral = 0;
  edDateTime2.Enabled := Cajas.xFechaLaboral = 0;
  TimerHora.Enabled := Cajas.xFechaLaboral = 0;

  if Cajas.xFechaLaboral = 0 then begin
    edDateTime.Date := Now;
    edDateTime2.Clear;
  end;
end;

procedure TfrAbrirCaja.CreateCaja(Sender: TObject);
var
  qNewCaja: TIBQuery;
  idNew: Integer;
begin
  qNewCaja := TIBQuery.Create(Self);
  try
    qNewCaja.Database := frDatos.dbK;
    qNewCaja.Transaction := LocalTransaction;
    qNewCaja.Close;
    qNewCaja.SQL.Clear;
    qNewCaja.SQL.Add('select max(idcaja) idcaja from cajas');
    qNewCaja.SQL.Add('where idtienda = :idtda');
    qNewCaja.ParamByName('idtda').AsInteger := frDatos.idTienda;
    qNewCaja.Open;

    idNew := qNewCaja.FieldByName('idcaja').AsInteger + 1;

    try
      qNewCaja.Close;
      qNewCaja.SQL.Clear;
      qNewCaja.SQL.Add('insert into cajas (idtienda, idcaja, mac, nomcaja, activa, lastcut)');
      qNewCaja.SQL.Add('values (:idtienda, :idcaja, :mac, :nomcaja, :activa, :lastcut)');
      qNewCaja.ParamByName('idtienda').AsInteger := frDatos.idTienda;
      qNewCaja.ParamByName('idcaja').AsInteger := idNew;
      qNewCaja.ParamByName('mac').AsString := frdatos.GetGuidUnit;//GetMacAddress;
      qNewCaja.ParamByName('nomcaja').AsString := 'CAJA ' + IntToStr(idNew);
      qNewCaja.ParamByName('activa').AsInteger := 0;
      qNewCaja.ParamByName('lastcut').AsInteger := -1;
      qNewCaja.ExecSQL;

      LocalTransaction.Commit;
    except
      on e: exception do
      begin
        Log('AbrirCaja ' + e.Message);
        Herror('Error apertura de caja');
        LocalTransaction.Rollback;
      end;
    end;
  finally
    qNewCaja.Free;
  end;
end;

procedure TfrAbrirCaja.edDateTimeEnter(Sender: TObject);
begin
  inherited;
  Clipboard.Clear;
  TimerHora.Enabled := False;
end;

procedure TfrAbrirCaja.edDateTimeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((ssCtrl in Shift) AND (Key = ord('V'))) then begin
    if Clipboard.HasFormat(CF_TEXT) then
      Clipboard.Clear;
    Key := 0;
  end;
end;

procedure TfrAbrirCaja.evCajasEventAlert(Sender: TObject; EventName: string;
  EventCount: Integer; var CancelAlerts: Boolean);
var
  currIdx: Integer;
begin
  inherited;
  if EventName = '$$CAJAS$$' then begin
    currIdx := bCajas.ItemIndex;
    LoadCajas;
    bCajas.ItemIndex := currIdx;
  end;

  if EventName = '$$CAJASNEW$$' then begin
    Screen.Cursor := crHourGlass;
    Self.Enabled := False;
    Sleep(1000);
    LoadCajas;
    Self.Enabled := True;
    Screen.Cursor := crDefault;
  end;

  if (EventName = '$$OPENCAJAS$$') and (not AbrioLabores) then begin
    frMain.CheckCaja;
    CheckOpened;
  end;
end;

function TfrAbrirCaja.FirstMayusc(S: String): String;
var
  indice: Integer;
  Temp, Cadena: string;
begin
  S := LowerCase(S);
  Temp := StringReplace(S, S[1], AnsiUppercase(S[1]), []);
  Cadena := Temp;
  while Pos(' ', Temp) > 0 do begin
    indice := Pos(' ', Temp);
    Cadena := StringReplace(Cadena, ' ' + Cadena[indice + 1],
      ' ' + AnsiUppercase(Cadena[indice + 1]), []);
    Temp[Pos(' ', Temp)] := '_';
  end;
  Result := Cadena;
end;

procedure TfrAbrirCaja.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  frAbrirCaja := nil;
end;

procedure TfrAbrirCaja.FormCreate(Sender: TObject);
begin
  inherited;
  frMain.CheckCaja;

  evCajas.Events.Add('$$CAJAS$$');
  evCajas.Events.Add('$$CAJASNEW$$');
  evCajas.Events.Add('$$OPENCAJAS$$');
  evCajas.RegisterEvents;

  AbrioLabores := False;

  { edDateTime.Date := Cajas.xFechaLaboral;
    edDateTime2.Date := Cajas.xFechaLaboral;
    edDateTime.Enabled := Cajas.xFechaLaboral = 0;
    edDateTime2.Enabled := Cajas.xFechaLaboral = 0;
    TimerHora.Enabled := Cajas.xFechaLaboral = 0;

    if Cajas.xFechaLaboral = 0 then begin
    edDateTime.Date := Now;
    edDateTime2.Clear;
    end; }
  CheckOpened;
  LoadCajas;
end;

procedure TfrAbrirCaja.LoadCajas;
var
  i: Integer;
begin
  qCajas.Close;
  qCajas.SQL.Clear;
  qCajas.SQL.Add('Select * from cajas');
  qCajas.SQL.Add('where idtienda = :idtda');
  qCajas.SQL.Add('order by idcaja');
  qCajas.ParamByName('idtda').AsInteger := frDatos.idTienda;
  qCajas.Open;

  qCajas.First;
  bCajas.Items.Clear;
  i := 0;
  while not qCajas.Eof do begin
    bCajas.Items.Add.Caption := FirstMayusc
      (qCajas.FieldByName('nomcaja').AsString);

    i := bCajas.Items.Count - 1;
    bCajas.Items[i].Hint := FirstMayusc(qCajas.FieldByName('nomcaja').AsString);
    bCajas.Items[i].ImageIndex := qCajas.FieldByName('activa').AsInteger;

    if qCajas.FieldByName('activa').AsInteger = 1 then
      bCajas.Items[i].OnClick := nil;

    if qCajas.FieldByName('mac').AsString = frdatos.GetGuidUnit {GetMacAddress;}then
      bCajas.Items[i].ImageIndex := 4;

    qCajas.Next;
  end;
  bCajas.Items.Add.Hint := FirstMayusc('Añadir Caja');
  i := bCajas.Items.Count - 1;
  bCajas.Items[i].Caption := FirstMayusc('Añadir Caja');
  bCajas.Items[i].ImageIndex := 2;
  bCajas.Items[i].OnClick := CreateCaja;

  bCajas.ItemIndex := -1;
end;

procedure TfrAbrirCaja.SetHoraFecha;
var
  MyNewTime: _SYSTEMTIME;
begin
  with MyNewTime do begin
    wYear := YearOf(edDateTime.Date);
    wMonth := MonthOfTheYear(edDateTime.Date);
    wDayOfWeek := DayOfWeek(edDateTime.Date);
    wDay := DayOfTheMonth(edDateTime.Date);
    wHour := HourOf(edDateTime.Date);
    wMinute := MinuteOf(edDateTime.Date);
    wSecond := SecondOf(edDateTime.Date); ;
    wMilliseconds := MilliSecondOf(edDateTime.Date);
  end;

  SetLocalTime(MyNewTime);
end;

procedure TfrAbrirCaja.TimerHoraTimer(Sender: TObject);
begin
  inherited;
  edDateTime.Date := Now;
end;

end.
