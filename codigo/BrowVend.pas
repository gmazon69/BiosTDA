unit BrowVend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomCatalogos, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, dxPSCore, dxPScxCommon, 
  IBCustomDataSet, dxBar, ActnList, ExtCtrls, ImgList, cxGridLevel,
  cxGridCardView, cxGridDBCardView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLabel, cxContainer, cxProgressBar,
  dxStatusBar, dxBarExtItems, Menus, IBDatabase, 
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, cxCheckBox, IBQuery, dxmdaset, DBClient, cxImage, cxSplitter;

type
  TfrBrowVend = class(TfrCustomCatalogos)
    tvCatalogosVEND: TcxGridDBColumn;
    tvCatalogosNOMBRE: TcxGridDBColumn;
    tvCatalogosDIRECCION: TcxGridDBColumn;
    tvCatalogosCOLONIA: TcxGridDBColumn;
    tvCatalogosTELEFONO: TcxGridDBColumn;
    bFPEnrollment: TdxBarButton;
    acFPEnrollment: TAction;
    qHuellas: TIBQuery;
    cHuellas: TcxGridDBColumn;
    mCatalogos: TdxMemData;
    mCatalogosidvendedor: TIntegerField;
    mCatalogosidtienda: TIntegerField;
    mCatalogosalta: TDateTimeField;
    mCatalogosvend: TStringField;
    mCatalogosnombre: TStringField;
    mCatalogosdireccion: TStringField;
    mCatalogoscolonia: TStringField;
    mCatalogosestado: TStringField;
    mCatalogosciudad: TStringField;
    mCatalogoscp: TStringField;
    mCatalogostelefono: TStringField;
    mCatalogoscajero: TStringField;
    mCatalogossueldo: TFloatField;
    mCatalogosbono: TFloatField;
    mCatalogosusername: TStringField;
    mCatalogosclave: TStringField;
    mCatalogoscomision: TFloatField;
    mCatalogosinfonavit: TFloatField;
    mCatalogosnss: TStringField;
    mCatalogoscurp: TStringField;
    mCatalogosobser: TStringField;
    mCatalogostipo: TStringField;
    mCatalogosactivo: TIntegerField;
    mCatalogoschuella: TIntegerField;
    Panel1: TPanel;
    edFoto: TcxImage;
    cxSplitter22: TcxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure CatalogosBeforeOpen(DataSet: TDataSet);
    procedure acFPEnrollmentExecute(Sender: TObject);
    procedure CatalogosAfterOpen(DataSet: TDataSet);
    procedure mCatalogosCalcFields(DataSet: TDataSet);
    procedure acEliminarExecute(Sender: TObject);
    procedure acAgregarExecute(Sender: TObject);
    procedure tvCatalogosCanFocusRecord(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure tvCatalogosFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
  private
    FCantDedos: Integer;
    FPhoto: String;
    procedure SetPhoto(const Value: String);
    property CantDedos: Integer read FCantDedos write FCantDedos;
    Property Photo: String read FPhoto write SetPhoto;
    procedure FillmCatalogos;
  public
  end;

var
  frBrowVend: TfrBrowVend;

implementation

uses Datos, Util, FPEnrollment, DatosRemoto, CapVendedores;

{$R *.dfm}

procedure TfrBrowVend.FillmCatalogos;
begin
  mCatalogos.Close;
  mCatalogos.Open;
  mCatalogos.DisableControls;
  while not Catalogos.Eof do Begin
    mCatalogos.Append;
    mCatalogos.FieldByName('idvendedor').Value := Catalogos.FieldByName('idvendedor').AsInteger;
    mCatalogos.FieldByName('idtienda').Value   := Catalogos.FieldByName('idTienda').AsInteger;
    mCatalogos.FieldByName('alta').Value       := Catalogos.FieldByName('alta').AsDateTime;
    mCatalogos.FieldByName('vend').Value       := Catalogos.FieldByName('Vend').AsString;
    mCatalogos.FieldByName('nombre').Value     := Catalogos.FieldByName('nombre').AsString;
    mCatalogos.FieldByName('direccion').Value  := Catalogos.FieldByName('direccion').AsString;
    mCatalogos.FieldByName('colonia').Value    := Catalogos.FieldByName('colonia').AsString;
    mCatalogos.FieldByName('estado').Value     := Catalogos.FieldByName('estado').AsString;
    mCatalogos.FieldByName('ciudad').Value     := Catalogos.FieldByName('ciudad').AsString;
    mCatalogos.FieldByName('cp').Value         := Catalogos.FieldByName('cp').AsString;
    mCatalogos.FieldByName('telefono').Value   := Catalogos.FieldByName('telefono').AsString;
    mCatalogos.FieldByName('cajero').Value     := Catalogos.FieldByName('cajero').AsString;
    mCatalogos.FieldByName('sueldo').Value     := Catalogos.FieldByName('sueldo').AsFloat;
    mCatalogos.FieldByName('bono').Value       := Catalogos.FieldByName('bono').AsFloat;
    mCatalogos.FieldByName('username').Value   := Catalogos.FieldByName('username').AsString;
    mCatalogos.FieldByName('clave').Value      := Catalogos.FieldByName('clave').AsString;
    mCatalogos.FieldByName('comision').Value   := Catalogos.FieldByName('comision').AsFloat;
    mCatalogos.FieldByName('infonavit').Value  := Catalogos.FieldByName('infonavit').AsFloat;
    mCatalogos.FieldByName('nss').Value        := Catalogos.FieldByName('nss').AsString;
    mCatalogos.FieldByName('curp').Value       := Catalogos.FieldByName('curp').AsString;
    mCatalogos.FieldByName('obser').Value      := Catalogos.FieldByName('obser').AsString;
    mCatalogos.FieldByName('tipo').Value       := Catalogos.FieldByName('tipo').AsString;
    mCatalogos.FieldByName('activo').Value     := Catalogos.FieldByName('activo').AsInteger;
    mCatalogos.Post;
    Catalogos.Next;
  End;
  mCatalogos.First;
  mCatalogos.EnableControls;
end;

procedure TfrBrowVend.FormCreate(Sender: TObject);
begin
  CantDedos := 1;
  if frDatos.aFingers then
    CantDedos := 10;

  inherited;
  FBusca.Ftitulos.Add('Nombre');
  FBusca.FTitulos.Add('Vend');

  FBusca.FCampos.Add('NOMBRE');
  FBusca.FCampos.Add('Vend');
  cxSplitter22.CloseSplitter;

  acEliminar.Caption := 'Baja    ';
  acAgregar.Caption  := 'Alta    ';
end;

procedure TfrBrowVend.mCatalogosCalcFields(DataSet: TDataSet);
begin
  inherited;
  mCatalogos.OnCalcFields := Nil;

  qHuellas.Close;
  qHuellas.ParamByName('idVend').AsInteger := mCatalogosidVendedor.AsInteger;
  qHuellas.Open;
  qHuellas.Last;

  if frDatos.aFingers then begin
    case qHuellas.RecordCount of
      0:    mCatalogoschuella.AsInteger := 0;
      1..9: mCatalogoschuella.Clear;
      10:   mCatalogoschuella.AsInteger :=  1;
    end;
  end else begin
    mCatalogoschuella.AsInteger := 0;
    if qHuellas.RecordCount > 0 then
      mCatalogoschuella.AsInteger :=  1;
  end;

   mCatalogos.OnCalcFields := mCatalogosCalcFields;
end;

procedure TfrBrowVend.SetPhoto(const Value: String);
begin
  FPhoto := Value;
    Try
     FPhoto := 'Personal\'+Photo+'.jpg';
    if fileExists(FPhoto) then
      edFoto.Picture.LoadFromFile(FPhoto)
      else
     edFoto.Clear;
    Except
      //
    End;
end;

procedure TfrBrowVend.tvCatalogosCanFocusRecord(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
  inherited;
//Photo := inttostr(mCatalogos.FieldByName('idVendedor').AsInteger)
end;

procedure TfrBrowVend.tvCatalogosFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
Photo := inttostr(mCatalogos.FieldByName('idVendedor').AsInteger)
end;

procedure TfrBrowVend.acAgregarExecute(Sender: TObject);
var
Alta : TfrCapVendedores;
begin
  inherited;
 Alta := TfrCapVendedores.Create(Application);
 Alta.Alta;
 if alta.ModalResult = mrOk then begin
  catalogos.Close;
  Catalogos.Open;
  catalogos.Locate('idVendedor',alta.idvend,[]);
 end;
end;

procedure TfrBrowVend.acEliminarExecute(Sender: TObject);
var
Baja : TfrCapVendedores;
begin
 // inherited;
  Baja := TfrCapVendedores.Create(Application);
  Baja.Baja(mCatalogos.FieldByName('idVendedor').AsInteger);
 if baja.ModalResult = mrOk then begin
  catalogos.Close;
  Catalogos.Open;
 end;
end;

procedure TfrBrowVend.acFPEnrollmentExecute(Sender: TObject);
var
  frEnrollment: TMyEnroll;
begin
  inherited;

  if mCatalogos.FieldByName('cHuella').AsInteger < CantDedos then begin
    try
      frEnrollment := TMyEnroll.Create;
      frEnrollment.idVendedor := mCatalogos.FieldByName('idVendedor').AsInteger;
      frEnrollment.AllFingers := frDatos.aFingers;
      frEnrollment.frEnrollment.Caption := 'Registro de huellas';
      if frEnrollment.frEnrollment.ShowModal = mrOK then begin
        With frDatos do begin
          try
            qFPVendedores.Close;
            qFPVendedores.ParamByName('idvendedor').Value := mCatalogos.FieldByName('idvendedor').AsInteger;
            qFPVendedores.ParamByName('idtienda').Value   := mCatalogos.FieldByName('idTienda').AsInteger;
            qFPVendedores.ParamByName('alta').Value       := mCatalogos.FieldByName('alta').AsDateTime;
            qFPVendedores.ParamByName('vend').Value       := mCatalogos.FieldByName('Vend').AsString;
            qFPVendedores.ParamByName('nombre').Value     := mCatalogos.FieldByName('nombre').AsString;
            qFPVendedores.ParamByName('direccion').Value  := mCatalogos.FieldByName('direccion').AsString;
            qFPVendedores.ParamByName('colonia').Value    := mCatalogos.FieldByName('colonia').AsString;
            qFPVendedores.ParamByName('estado').Value     := mCatalogos.FieldByName('estado').AsString;
            qFPVendedores.ParamByName('ciudad').Value     := mCatalogos.FieldByName('ciudad').AsString;
            qFPVendedores.ParamByName('cp').Value         := mCatalogos.FieldByName('cp').AsString;
            qFPVendedores.ParamByName('telefono').Value   := mCatalogos.FieldByName('telefono').AsString;
            qFPVendedores.ParamByName('cajero').Value     := mCatalogos.FieldByName('cajero').AsString;
            qFPVendedores.ParamByName('sueldo').Value     := mCatalogos.FieldByName('sueldo').AsFloat;
            qFPVendedores.ParamByName('bono').Value       := mCatalogos.FieldByName('bono').AsFloat;
            qFPVendedores.ParamByName('username').Value   := mCatalogos.FieldByName('username').AsString;
            qFPVendedores.ParamByName('clave').Value      := mCatalogos.FieldByName('clave').AsString;
            qFPVendedores.ParamByName('comision').Value   := mCatalogos.FieldByName('comision').AsFloat;
            qFPVendedores.ParamByName('infonavit').Value  := mCatalogos.FieldByName('infonavit').AsFloat;
            qFPVendedores.ParamByName('nss').Value        := mCatalogos.FieldByName('nss').AsString;
            qFPVendedores.ParamByName('curp').Value       := mCatalogos.FieldByName('curp').AsString;
            qFPVendedores.ParamByName('obser').Value      := mCatalogos.FieldByName('obser').AsString;
            qFPVendedores.ParamByName('tipo').Value       := mCatalogos.FieldByName('tipo').AsString;
            qFPVendedores.ParamByName('activo').Value     := mCatalogos.FieldByName('activo').AsInteger;
            qFPVendedores.ExecSQL;

            FPIBT.Commit;
          Except
            on e: Exception do
            begin
              log('Vendedores: '+e.Message);
              Herror('Error vendedores');
              FPIBT.Rollback;
            end;
          end;
        end;
      end;
    finally
      frEnrollment.Free;
      Catalogos.Close;
      Catalogos.Open;
    end;
  end;
end;

procedure TfrBrowVend.acImprimirExecute(Sender: TObject);
begin
  dxPrinter.ReportLink[0].ReportTitle.Text := 'Catalogo de vendedores';
  inherited;
end;

procedure TfrBrowVend.CatalogosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FillmCatalogos;
end;

procedure TfrBrowVend.CatalogosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  Catalogos.ParamByName('idTda').AsInteger := frDatos.idTienda;
end;

end.
