unit Asistencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomCatalogos, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, IBDatabase, Menus,
  dxPSCore, dxPScxCommon,  IBCustomDataSet, dxBar, dxBarExtItems,
  cxClasses, ActnList, ExtCtrls, ImgList, cxGridLevel, cxGridCardView,
  cxGridDBCardView, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLabel, cxProgressBar, dxStatusBar, IBQuery,
  cxGroupBox, cxRadioGroup, dxmdaset, cxImageComboBox, cxTimeEdit, cxCheckBox,
  Registry;

type
  TfrAsistencias = class(TfrCustomCatalogos)
    acCheckAsist: TAction;
    qCheck: TIBQuery;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    r2Check: TcxRadioGroup;
    qNew: TIBQuery;
    tvCatalogosIDVENDEDOR: TcxGridDBColumn;
    tvCatalogosIDTIENDA: TcxGridDBColumn;
    tvCatalogosNOMBRE: TcxGridDBColumn;
    tvCatalogosFECHA: TcxGridDBColumn;
    tvCatalogosE: TcxGridDBColumn;
    tvCatalogosSC: TcxGridDBColumn;
    tvCatalogosEC: TcxGridDBColumn;
    tvCatalogosS: TcxGridDBColumn;
    tvCatalogosACTIVO: TcxGridDBColumn;
    tvCatalogosSTATUS: TcxGridDBColumn;
    mCatalogos: TdxMemData;
    mCatalogosNombre: TStringField;
    mCatalogosFecha: TDateField;
    mCatalogosE: TTimeField;
    mCatalogossc: TTimeField;
    mCatalogosec: TTimeField;
    mCatalogoss: TTimeField;
    mCatalogosidVendedor: TIntegerField;
    mCatalogosidtienda: TIntegerField;
    mCatalogosce: TIntegerField;
    mCatalogoscsc: TIntegerField;
    mCatalogoscec: TIntegerField;
    mCatalogoscs: TIntegerField;
    tvCatalogosRecId: TcxGridDBColumn;
    tvCatalogosce: TcxGridDBColumn;
    tvCatalogoscsc: TcxGridDBColumn;
    tvCatalogoscec: TcxGridDBColumn;
    tvCatalogoscs: TcxGridDBColumn;
    ImageList1: TImageList;
    acSaveCheck: TAction;
    dxBarButton3: TdxBarButton;
    acCerrarDia: TAction;
    Checar1: TMenuItem;
    N1: TMenuItem;
    dxBarButton5: TdxBarButton;
    mCatalogosidasistencia: TIntegerField;
    tvCatalogosidasistencia: TcxGridDBColumn;
    acIncidencias: TAction;
    bIncidencias: TdxBarButton;
    mCatalogosvend: TStringField;
    tvCatalogosvend: TcxGridDBColumn;
    Seek: TIBQuery;
    mCatalogosincidencia: TStringField;
    tvCatalogosincidencia: TcxGridDBColumn;
    mCatalogosidReporta: TIntegerField;
    tvCatalogosidReporta: TcxGridDBColumn;
    Incidencias1: TMenuItem;
    mCatalogosME: TDateTimeField;
    mCatalogosMSC: TDateTimeField;
    mCatalogosMEC: TDateTimeField;
    mCatalogosMS: TDateTimeField;
    qAdd: TIBQuery;
    LocalTransaction: TIBTransaction;
    qSeek: TIBQuery;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    chDescripcion: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure acCheckAsistExecute(Sender: TObject);
    procedure CatalogosAfterOpen(DataSet: TDataSet);
    procedure mCatalogosCalcFields(DataSet: TDataSet);
    procedure tvCatalogosCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure acSaveCheckExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCerrarDiaExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acIncidenciasExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure mCatalogosAfterPost(DataSet: TDataSet);
    procedure chDescripcionClick(Sender: TObject);
    procedure acEliminarExecute(Sender: TObject);
    procedure acBuscarExecute(Sender: TObject);
  private
    FLastFecha: TDate;
    FDiaCerrado: Boolean;
    FWhoClose: Integer;
    FTipoCheck: Integer;
    procedure Checa;
    procedure NewCheck;
    procedure NextHora2Check;
    procedure CanCheck(Valor: Boolean);
    function ValidaCheck: Boolean;
    function CanCloseDay: Boolean;
    function NextAsistencia: Integer;
    function Asistieron: Boolean;
    procedure GetDescr;
    property WhoClose: Integer read FWhoClose write FWhoClose;
    property LastFecha: TDate read FLastFecha write FLastFecha;
    property DiaCerrado: Boolean read FDiaCerrado write FDiaCerrado;
    property TipoCheck: Integer read FTipoCheck write FTipoCheck;
  public
  end;

var
  frAsistencias: TfrAsistencias;

implementation

uses Datos, FPVerify, FPIdentify, Globales, CapIncidencias, AsistManual, AutoCapIncide, Util;

{$R *.dfm}

procedure TfrAsistencias.acBuscarExecute(Sender: TObject);
begin
  //inherited;
  FBusca.Busca(TibDataSet(mCatalogos));
end;

procedure TfrAsistencias.acCerrarDiaExecute(Sender: TObject);
var
  frIdentify: TMyIdentify;
  ValCajero: Integer;
  r: Integer;
begin
  inherited;
  if CanCloseDay then begin
    ValCajero := 2;
    frIdentify := TMyIdentify.Create;
    try
      frIdentify.Rango := ValCajero;
      frIdentify.frIdentify.Caption := 'Cerrar dia laboral';
      r := frIdentify.frIdentify.ShowModal;
      DiaCerrado := r = mrOK;
      if DiaCerrado then begin
        WhoClose := frDatos.idVendedor;
        Close;
      end else if Sender is TfrAsistencias then Close;
    finally
      frIdentify.Free;
    end;
  end;
end;

procedure TfrAsistencias.acCheckAsistExecute(Sender: TObject);
var
  frVerify: TMyVerify;
  AsistManual: TfrAsistManual;
  BM: TBookmark;
begin
  if not ValidaCheck then
    Exit;

  BM:= mCatalogos.Bookmark;
  case TipoCheck of
    0 : begin
      frVerify := TMyVerify.Create;
      try
        frVerify.frVerify.Caption := 'Coloca tu dedo en el lector';
        frVerify.idVendedor := mCatalogos.FieldByName('idVendedor').AsInteger;
        if frVerify.frVerify.ShowModal = mrOK then begin
          Checa;
        end;
      finally
        frVerify.Free;
      end;
    end;

    1 : Begin
      AsistManual := TfrAsistManual.Create(Nil);
      try
        AsistManual.ShowBarra := False;
        if AsistManual.ShowModal = mrOK then
         Checa;
      finally
        AsistManual.Free;
      end;
    End;
  end;

  mCatalogos.GotoBookmark(BM);
  mCatalogos.FreeBookmark(BM);

end;

procedure TfrAsistencias.acEliminarExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrAsistencias.acImprimirExecute(Sender: TObject);
begin
  dxPrinter.ReportLink[0].ReportTitle.Text := frDatos.aSuc + ' '+ frDatos.aTienda+#10+
    #10+'Reporte de Asistencias'+#10+
    DateToStr(Cajas.xFechaLaboral)+#10+' ';
  inherited;
end;

procedure TfrAsistencias.acIncidenciasExecute(Sender: TObject);
var
  frIncidencias: TfrCapIncidencias;
  frIdentify: TMyIdentify;
  AutoCapIncide: TfrAutoCapIncide;

  r, idReporta: Integer;
begin
  inherited;
{  if (mCatalogos.FieldByName('ce').AsInteger >= 1) or
    (Trim(mCatalogos.FieldByName('incidencia').AsString) <> '') then
    Exit;  }

  case TipoCheck of
    0 : begin

      frIdentify := TMyIdentify.Create;
      try
        frIdentify.frIdentify.Caption := 'Captura de incidencias';
        r := frIdentify.frIdentify.ShowModal;

        if r = mrOK then begin
          idReporta := frDatos.idVendedor;

          Seek.Close;
          Seek.ParamByName('idVend').AsInteger := idReporta;
          Seek.Open;

          if Seek.FieldByName('capincide').AsInteger <> 1 then begin
            ShowMessage('No tienes permiso para realizar este proceso');
            Exit;
          end;
        end else Exit;
      finally
        frIdentify.Free;
      end;
    end;
    1 : begin
      AutoCapIncide := TfrAutoCapIncide.Create(Self);
      try
        AutoCapIncide.MiFecha := False;
        AutoCapIncide.ShowModal;
        if AutoCapIncide.ModalResult = mrCancel then
          Exit;
        idReporta := frDatos.idVendedor;
      finally
        AutoCapIncide.Free;
      end;
    end;
  end;

  frIncidencias := TfrCapIncidencias.Create(Application);
  frIncidencias.idVend := mCatalogos.FieldByName('idVendedor').AsInteger;
  frIncidencias.idReporta := idReporta;
  frIncidencias.ShowBarra := False;
  frIncidencias.Muestra;
  frIncidencias.Free;
end;

procedure TfrAsistencias.acSaveCheckExecute(Sender: TObject);
var
  Stat, C, idAsist: Integer;
  SalGte: TTime;
  //Posicion: TBookmarkStr;
begin
  inherited;
  if not mCatalogos.Active then
    Exit;

  if Asistieron then begin
    mCatalogos.DisableControls;
    //Posicion := mCatalogos.GetBookmark;
    try
      mCatalogos.First;
      while not mCatalogos.Eof do begin
        Stat := 1;
        C := -1;
        idAsist := mCatalogos.FieldByName('idasistencia').AsInteger;
        SalGte := mCatalogos.FieldByName('s').AsDateTime;
        if DiaCerrado then begin
          Stat := 0;
          C := WhoClose;

          if (mCatalogos.FieldByName('idvendedor').AsInteger = WhoClose) and
          (mCatalogoscs.Value = 0) and (mCatalogosce.Value = 1) then
            SalGte := Now;
        end;

        if idAsist = -1 then begin
          idAsist := NextAsistencia;

          mCatalogos.AfterPost := Nil;
          mCatalogos.Edit;
          mCatalogos.FieldByName('idasistencia').AsInteger := idAsist;
          mCatalogos.Post;
          mCatalogos.AfterPost := mCatalogosAfterPost;
        end;

        qCheck.Close;
        qCheck.ParamByName('idtienda').AsInteger := frDatos.idTienda;
        qCheck.ParamByName('idasistencia').AsInteger := idAsist;
        qCheck.ParamByName('idvendedor').AsInteger := mCatalogos.FieldByName('idvendedor').AsInteger;
        qCheck.ParamByName('fecha').AsDate := mCatalogos.FieldByName('fecha').AsDateTime;
        qCheck.ParamByName('e').AsTime := mCatalogos.FieldByName('e').AsDateTime;
        qCheck.ParamByName('sc').AsTime := mCatalogos.FieldByName('sc').AsDateTime;
        qCheck.ParamByName('ec').AsTime := mCatalogos.FieldByName('ec').AsDateTime;
        qCheck.ParamByName('s').AsTime := SalGte;
        qCheck.ParamByName('me').AsTime := mCatalogos.FieldByName('me').AsDateTime;
        qCheck.ParamByName('msc').AsTime := mCatalogos.FieldByName('msc').AsDateTime;
        qCheck.ParamByName('mec').AsTime := mCatalogos.FieldByName('mec').AsDateTime;
        qCheck.ParamByName('ms').AsTime := mCatalogos.FieldByName('ms').AsDateTime;
        qCheck.ParamByName('abrio').AsInteger := -1;
        qCheck.ParamByName('cerro').AsInteger := C;//El dia se cierra automaticamente, asi que siempre guardará -1 en este campo
        qCheck.ParamByName('activo').AsInteger := 1;
        qCheck.ParamByName('status').AsInteger := Stat;
        qCheck.ParamByName('incidencia').AsString := mCatalogos.FieldByName('incidencia').AsString;
        qCheck.ParamByName('reporta').AsInteger := mCatalogos.FieldByName('idreporta').AsInteger;
        qCheck.ExecSQL;

        mCatalogos.Next;
      end;

      IBTCatalogos.CommitRetaining;
    Except
      on e: exception do
      begin
        Log('Error al guardar horarios: '+e.Message);
        herror('Error al guardar horarios');
        IBTCatalogos.RollbackRetaining;
      end;
    end;
    mCatalogos.EnableControls;
  end;
end;

function TfrAsistencias.Asistieron: Boolean;
var
  Checked: Integer;
begin
  mCatalogos.DisableControls;
  mCatalogos.First;

  Checked := 0;
  Result := False;

  while not mCatalogos.Eof do begin
    if mCatalogosce.AsInteger >= 1 then
      inc(Checked);
    mCatalogos.Next;
  end;

  Result := Checked > 0;

  mCatalogos.EnableControls;
end;

procedure TfrAsistencias.CanCheck(Valor: Boolean);
var
  i: Integer;
begin
  For i := 0 to ActionCatalogo.ActionCount -1 do
     TAction(ActionCatalogo.Actions[i]).Enabled := Valor;
end;

function TfrAsistencias.CanCloseDay: Boolean;
begin
  Result := False;
  mCatalogos.DisableControls;
  mCatalogos.First;
  while not mCatalogos.Eof do begin
    if mCatalogosce.Value = 1 then begin
      Result := true;
      Break;
    end;
    mCatalogos.Next;
  end;
  mcatalogos.First;
  mcatalogos.EnableControls;
end;

procedure TfrAsistencias.CatalogosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  Catalogos.DisableControls;
  mCatalogos.DisableControls;
  Catalogos.First;

  mCatalogos.Close;
  mCatalogos.Open;
  while not Catalogos.Eof do begin
    mCatalogos.Append;
    mCatalogos.FieldByName('idtienda').Value := Catalogos.FieldByName('idtienda').AsInteger;
    mCatalogos.FieldByName('idasistencia').Value := Catalogos.FieldByName('idAsistencia').AsInteger;
    mCatalogos.FieldByName('idvendedor').Value := Catalogos.FieldByName('idvendedor').AsInteger;
    mCatalogos.FieldByName('Vend').Value := Catalogos.FieldByName('Vend').AsString;
    mCatalogos.FieldByName('Nombre').Value := Catalogos.FieldByName('nombre').AsString;
    mCatalogos.FieldByName('fecha').Value := Catalogos.FieldByName('fecha').AsDateTime;
    mCatalogos.FieldByName('e').Value := Catalogos.FieldByName('e').AsDateTime;
    mCatalogos.FieldByName('sc').Value := Catalogos.FieldByName('sc').AsDateTime;
    mCatalogos.FieldByName('ec').Value := Catalogos.FieldByName('ec').AsDateTime;
    mCatalogos.FieldByName('s').Value := Catalogos.FieldByName('s').AsDateTime;
    mCatalogos.FieldByName('me').Value := Catalogos.FieldByName('me').Value;
    mCatalogos.FieldByName('msc').Value := Catalogos.FieldByName('msc').Value;
    mCatalogos.FieldByName('mec').Value := Catalogos.FieldByName('mec').Value;
    mCatalogos.FieldByName('ms').Value := Catalogos.FieldByName('ms').Value;
    mCatalogos.FieldByName('incidencia').Value := Catalogos.FieldByName('incidencia').AsString;
    mCatalogos.FieldByName('idReporta').Value := Catalogos.FieldByName('Reporta').AsInteger;
    mCatalogos.Post;

    Catalogos.Next;
  end;
  mCatalogos.First;
  Catalogos.EnableControls;
  mCatalogos.EnableControls;
  Catalogos.Close;
end;

procedure TfrAsistencias.chDescripcionClick(Sender: TObject);
var
  isVisible: Boolean;
  AStoreKey, ASaveViewName: string;
  AOptions: TcxGridStorageOptions;
  I : Integer;
begin
  inherited;
  isVisible := TcxImageComboBoxProperties(tvCatalogosce.Properties).ShowDescriptions;
  TcxImageComboBoxProperties(tvCatalogosce.Properties).ShowDescriptions := Not isVisible;
  TcxImageComboBoxProperties(tvCatalogoscsc.Properties).ShowDescriptions := Not isVisible;
  TcxImageComboBoxProperties(tvCatalogoscec.Properties).ShowDescriptions:= Not isVisible;
  TcxImageComboBoxProperties(tvCatalogoscs.Properties).ShowDescriptions:= Not isVisible;

  WriteReg(HKEY_CURRENT_USER,  '\Software\Eleczion\Setup',  'ChkDescr', rdString, BoolToStr(Not isVisible));
end;

procedure TfrAsistencias.Checa;
var
  Hora2Check: String;
  FechaHora: TDateTime;
begin
  case r2Check.ItemIndex of
    0: Hora2Check := 'e';
    1: Hora2Check := 'sc';
    2: Hora2Check := 'ec';
    3: Hora2Check := 's';
  end;

  FechaHora := Now;
  ReplaceDate(FechaHora, Cajas.xFechaLaboral);
  mCatalogos.Edit;
  mCatalogos.FieldByName(Hora2Check).AsDateTime :=  FechaHora;
  mCatalogos.FieldByName('incidencia').AsString := 'A';
  mCatalogos.Post;
end;

procedure TfrAsistencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  acSaveCheckExecute(Sender);
  inherited;
end;

procedure TfrAsistencias.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  frAsistencias := Nil;
end;

procedure TfrAsistencias.FormCreate(Sender: TObject);
var
  OpenedD: Boolean;
begin
  inherited;
  FBusca.Ftitulos.Add('Nombre');
  FBusca.FCampos.Add('NOMBRE');

  DiaCerrado := False;
  WhoClose := -1;

  qNew.Close;
  qNew.SQL.Clear;
  qNew.SQL.Add('Select TipoAsist from tiendas');
  qNew.SQL.Add('where idtienda = :idtienda and activo = 1');
  qNew.ParamByName('idtienda').AsInteger := frDatos.idTienda;
  qNew.Open;
  TipoCheck := 0;
  if not qNew.IsEmpty then
    TipoCheck := qNew.FieldByName('TipoAsist').AsInteger;

  qNew.Close;
  qNew.SQL.Clear;
  qNew.SQL.Add('Select max(fecha) fecha, count(fecha) reg from asistencias');
  qNew.SQL.Add('where idtienda = :idtienda and status = 1');
  qNew.ParamByName('idtienda').AsInteger := frDatos.idTienda;
  qNew.Open;

  OpenedD := qNew.FieldByName('reg').AsInteger > 0;
  LastFecha := qNew.FieldByName('fecha').AsDateTime;

  if LastFecha < Cajas.xFechaLaboral then begin
    qNew.Close;
    qNew.SQL.Clear;
    qNew.SQL.Add('Update asistencias set status = 0');
    qNew.SQL.Add('where idtienda = :idtienda and fecha = :fecha');
    qNew.ParamByName('idtienda').AsInteger := frDatos.idTienda;
    qNew.ParamByName('fecha').AsDate := LastFecha;
    qNew.Open;

    OpenedD := False;
  end else if LastFecha > Cajas.xFechaLaboral then begin
    MessageBox(0,'La fecha no es valida',
                  'gpxSOFT',mb_TaskModal+mb_IconError+mb_OK);
    Close;
    Exit;
  end;

  if OpenedD then begin
    qSeek.Close;
    qSeek.SQL.Clear;
    qSeek.SQL.Add('Select v.idVendedor from vendedor v');
    qSeek.SQL.Add('where not (v.idvendedor in (');
    qSeek.SQL.Add('    select a.idvendedor from asistencias a');
    qSeek.SQL.Add('    where a.idtienda = :idtienda');
    qSeek.SQL.Add('    and a.activo = 1');
    qSeek.SQL.Add('    and a.fecha = :fecha');
    qSeek.SQL.Add('    )');
    qSeek.SQL.Add(')');
    qSeek.SQL.Add('and v.idtienda = :idtienda and v.activo = 1');
    qSeek.ParamByName('idtienda').AsInteger := frDatos.idTienda;
    qSeek.ParamByName('fecha').AsDate := qNew.FieldByName('fecha').AsDateTime;
    qSeek.Open;

    while not qSeek.Eof do begin
      try
        qAdd.Close;
        qAdd.ParamByName('idtienda').AsInteger := frDatos.idTienda;
        qAdd.ParamByName('idasistencia').AsInteger := Maximo(qNew, 'idasistencia', 'asistencias');
        qAdd.ParamByName('idvendedor').AsInteger := qSeek.FieldByName('idvendedor').AsInteger;
        qAdd.ParamByName('fecha').AsDate := qNew.FieldByName('fecha').AsDateTime;
        qAdd.ExecSQL;

        LocalTransaction.Commit;
      except
        on e: exception do
        begin
          Log('Error nuevo vendedor: ' + e.Message);
          Herror('Error nuevo vendedor');
          LocalTransaction.Rollback;
        end;
      end;

      qSeek.Next;
    end;

    Catalogos.Close;
    Catalogos.SelectSQL.Clear;
    Catalogos.SelectSQL.Add('select v.idvendedor, a.idasistencia, v.idtienda, v.vend, v.nombre,');
    Catalogos.SelectSQL.Add(' a.fecha, a.e, a.sc, a.ec, a.s,');
    Catalogos.SelectSQL.Add(' a.me, a.msc, a.mec, a.ms,');
    Catalogos.SelectSQL.Add('a.activo, a.status, a.incidencia, a.reporta');
    Catalogos.SelectSQL.Add('from vendedor v');
    Catalogos.SelectSQL.Add('    left join asistencias a on (a.idvendedor = v.idvendedor)');
    Catalogos.SelectSQL.Add('where v.idtienda = :idtienda and v.activo = 1');
    Catalogos.SelectSQL.Add('and a.fecha = :fecha');
    Catalogos.SelectSQL.Add('Order by v.Vend');

    Catalogos.ParamByName('idtienda').AsInteger := frDatos.idTienda;
    Catalogos.ParamByName('fecha').AsDate := qNew.FieldByName('fecha').AsDateTime;
    Catalogos.Open;
    GetDescr;

    Exit;
  end;

  NewCheck;
  GetDescr;
end;

procedure TfrAsistencias.GetDescr;
var
  Vis: String;
begin
  Vis := '-1';
  try
    Vis := ReadReg(HKEY_CURRENT_USER, '\Software\Eleczion\Setup', 'ChkDescr');
  Except
    //
  end;
//  if Vis = '' then

  chDescripcion.EditValue := StrToBool(Vis);
  TcxImageComboBoxProperties(tvCatalogosce.Properties).ShowDescriptions  := chDescripcion.EditValue;
  TcxImageComboBoxProperties(tvCatalogoscsc.Properties).ShowDescriptions := chDescripcion.EditValue;
  TcxImageComboBoxProperties(tvCatalogoscec.Properties).ShowDescriptions := chDescripcion.EditValue;
  TcxImageComboBoxProperties(tvCatalogoscs.Properties).ShowDescriptions  := chDescripcion.EditValue;
end;

procedure TfrAsistencias.mCatalogosAfterPost(DataSet: TDataSet);
begin
  inherited;
//  mCatalogos.AfterPost := Nil;
  acSaveCheckExecute(Self);
//  mCatalogos.AfterPost := mCatalogosAfterPost;
end;

procedure TfrAsistencias.mCatalogosCalcFields(DataSet: TDataSet);
  function CaseOfString(s: string; const a: array of string): Integer; begin
    Result := 0;
    while (Result < Length(a)) and (not (SameText(a[Result], s))) do
      Inc(Result);
    if not SameText(a[Result], s) then Result := -1;
  end;
var
  Ent, SCom, ECom, Sal: TTime;
  hT, hComida: TTime;
begin
  inherited;
  mCatalogos.OnCalcFields := Nil;

  {CanCheck(True);
  if not frDatos.LectorConectado then
    CanCheck(False);}

  mCatalogosce.AsInteger := 0;
  mCatalogoscsc.AsInteger := 0;
  mCatalogoscec.AsInteger := 0;
  mCatalogoscs.AsInteger := 0;

  if mCatalogose.Value <> 0 then
    mCatalogosce.AsInteger := 1;
  if mCatalogossc.Value <> 0 then
    mCatalogoscsc.AsInteger := 1;
  if mCatalogosec.Value <> 0 then
    mCatalogoscec.AsInteger := 1;
  if mCatalogoss.Value <> 0 then
    mCatalogoscs.AsInteger := 1;

  case CaseOfString(Trim(mCatalogosIncidencia.AsString), ['D','F','I','V']) of
    0: mCatalogosce.AsInteger := 2;
    1: mCatalogosce.AsInteger := 3;
    2: mCatalogosce.AsInteger := 4;
    3: mCatalogosce.AsInteger := 5;
  end;
  case CaseOfString(Trim(mCatalogosIncidencia.AsString), ['D','F','I','V']) of
    0: mCatalogoscSC.AsInteger := 2;
    1: mCatalogoscSC.AsInteger := 3;
    2: mCatalogoscSC.AsInteger := 4;
    3: mCatalogoscSC.AsInteger := 5;
  end;
  case CaseOfString(Trim(mCatalogosIncidencia.AsString), ['D','F','I','V']) of
    0: mCatalogoscEC.AsInteger := 2;
    1: mCatalogoscEC.AsInteger := 3;
    2: mCatalogoscEC.AsInteger := 4;
    3: mCatalogoscEC.AsInteger := 5;
  end;
  case CaseOfString(Trim(mCatalogosIncidencia.AsString), ['D','F','I','V']) of
    0: mCatalogoscS.AsInteger := 2;
    1: mCatalogoscS.AsInteger := 3;
    2: mCatalogoscS.AsInteger := 4;
    3: mCatalogoscS.AsInteger := 5;
  end;






  { *** Calcula las horas trabajadas ***
  mCatalogoshTrab.AsString := 'N/P';
  if mCatalogosce.Value = 1 then begin
    Sal := Now;
    if mCatalogoscs.Value = 1 then
      Sal := mCatalogoss.Value;

    Ent := mCatalogose.AsDateTime;
    SCom := mCatalogossc.AsDateTime;
    ECom := mCatalogosec.AsDateTime;

    hT := Ent - Sal;
    hComida := SCom - ECom;
    mCatalogoshTrab.AsString := FormatDateTime('hh.mm.ss',hT - hComida);
  end;  }

  NextHora2Check;

  mCatalogos.OnCalcFields := mCatalogosCalcFields;
end;

procedure TfrAsistencias.NewCheck;
var
  Hora: String;
  I: Integer;
  _Tentativa: TDateTime;
begin
  qNew.Close;
  qNew.SQL.Clear;
  qNew.SQL.Add('Select Max(fecha) fecha from asistencias');
  qNew.Open;

  {if qNew.FieldByName('fecha').AsDateTime >= Date then begin
     MessageBox(0,'Este dia laboral se encuentra ya cerrado',
                  'gpxSOFT',mb_TaskModal+mb_IconError+mb_OK);
    Close;
    Exit;
  end;  }

  {_Tentativa := qNew.FieldByName('fecha').AsDateTime +1;
  if Date > _Tentativa then begin
     if MessageBox(0,'El sistema ha detectado un dia sin chequeo de asistencias.'+#13+#10+
                  'Seguro que desea continuar con este proceso?',
                  'gpxSOFT',mb_TaskModal+mb_IconQuestion+mb_YesNo + mb_DefButton2) = idNO Then
        Close;
  end; }

  LastFecha := Cajas.xFechaLaboral;
  Hora := QuotedStr(TimeToStr(0));
  Catalogos.Close;
  Catalogos.SelectSQL.Clear;
  Catalogos.SelectSQL.Add('select idvendedor, -1 idasistencia, idtienda, vend, nombre,');
  Catalogos.SelectSQL.Add(QuotedStr(DateToStr(LastFecha))+' fecha, '+Hora+' e,');
  Catalogos.SelectSQL.Add(Hora+' sc, '+Hora+' ec, '+Hora+' s, 1 activo, 1 status,');
  Catalogos.SelectSQL.Add(Hora+' me, ' + Hora + ' msc, '+Hora+' mec, '+Hora+' ms,');
  Catalogos.SelectSQL.Add(QuotedStr(' ') + ' incidencia, -1 reporta');
  Catalogos.SelectSQL.Add('from vendedor');
  Catalogos.SelectSQL.Add('where idtienda = :idtienda and activo = 1');
  Catalogos.ParamByName('idtienda').AsInteger := frDatos.idTienda;

  Catalogos.Open;
end;

function TfrAsistencias.NextAsistencia: Integer;
begin
  qNew.Close;
  qNew.SQL.Clear;
  qNew.SQL.Add('Select max(idasistencia) idasistencia from asistencias');
  qNew.Open;

  Result := qNew.FieldByName('idasistencia').AsInteger +1;
end;

procedure TfrAsistencias.NextHora2Check;
begin
  r2Check.Enabled := True;
  r2Check.ItemIndex := 0;
  if mCatalogos.FieldByName('ce').AsInteger >= 1 then
    r2Check.ItemIndex := 1;
  if mCatalogos.FieldByName('csc').AsInteger >= 1 then
    r2Check.ItemIndex := 2;
  if mCatalogos.FieldByName('cec').AsInteger >= 1 then
    r2Check.ItemIndex := 3;
  if mCatalogos.FieldByName('cs').AsInteger >= 1 then begin
    r2Check.ItemIndex := -1;
    r2Check.Enabled := False;
  end;
end;

procedure TfrAsistencias.tvCatalogosCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  acCheckAsistExecute(Sender);
end;

function TfrAsistencias.ValidaCheck: Boolean;
var
  Hora2Check: String;
begin
  inherited;
  ValidaCheck := True;

  if r2Check.ItemIndex = -1 then begin
    ValidaCheck := False;
    Exit;
  end;

  if (r2Check.ItemIndex > 0) and (mCatalogos.FieldByName('ce').AsInteger = 0) then begin
    MessageBox(0,'Primero debes checar tu entrada a laborar', PChar(Caption), mb_TaskModal+mb_IconWarning+mb_OK);
    r2Check.ItemIndex := 0;
    ValidaCheck := False;
    Exit;
  end;

  if (r2Check.ItemIndex = 2) and (mCatalogos.FieldByName('csc').AsInteger = 0) then begin
    MessageBox(0,'Primero debes checar tu salida a comer', PChar(Caption), mb_TaskModal+mb_IconWarning+mb_OK);
    r2Check.ItemIndex := 1;
    ValidaCheck := False;
    Exit;
  end;

  if (r2Check.ItemIndex = 3) and ((mCatalogos.FieldByName('csc').AsInteger = 1) and(mCatalogos.FieldByName('cec').AsInteger = 0)) then begin
    MessageBox(0,'Primero debes checar tu entrada de comer', PChar(Caption), mb_TaskModal+mb_IconWarning+mb_OK);
    r2Check.ItemIndex := 2;
    ValidaCheck := False;
    Exit;
  end;

  case r2Check.ItemIndex of
    0: Hora2Check := 'ce';
    1: Hora2Check := 'csc';
    2: Hora2Check := 'cec';
    3: Hora2Check := 'cs';
  end;

  if mCatalogos.FieldByName(Hora2Check).AsInteger = 1 then
   ValidaCheck := False;
end;

end.
