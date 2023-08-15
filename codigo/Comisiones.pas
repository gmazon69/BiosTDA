unit Comisiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomReportes, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxBar,
  Menus, ActnList, dxPSCore, dxPScxCommon, IBCustomDataSet,
  IBQuery, ExtCtrls, ImgList, StdCtrls, cxButtons, cxSplitter, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxImage, cxTextEdit,
  cxMaskEdit, cxCalendar, cxLabel, cxGroupBox, cxContainer, cxProgressBar,
  dxStatusBar,  cxLookAndFeels, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, cxCheckBox, IBDatabase, cxPC;

type
  TfrComisiones = class(TfrCustomReporte)
    dsVendedor: TDataSource;
    edVend: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    edNombreVend: TcxLookupComboBox;
    tvReporteIDTIENDA: TcxGridDBColumn;
    tvReporteIDREMISION: TcxGridDBColumn;
    tvReporteREFER: TcxGridDBColumn;
    tvReporteFECHA: TcxGridDBColumn;
    tvReporteNOMBRE: TcxGridDBColumn;
    tvReporteIMPORTE: TcxGridDBColumn;
    tvReporteUNIDADES: TcxGridDBColumn;
    tvReporteIDVENDEDOR: TcxGridDBColumn;
    tvReporteVEND: TcxGridDBColumn;
    tvReporteCOMISION: TcxGridDBColumn;
    tvReporteICOMISION: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure edVendPropertiesEditValueChanged(Sender: TObject);
    procedure acVerExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
  private
    FidVend: Integer;
    FidTda: Integer;
    procedure SetidVend(const Value: Integer);
  public
    Property idTda : Integer Read FidTda Write FidTda;
    Property idVend : Integer Read FidVend Write SetidVend;
  end;

var
  frComisiones: TfrComisiones;

implementation

uses Datos, Util;

{$R *.dfm}

procedure TfrComisiones.FormCreate(Sender: TObject);
begin
  inherited;
  Clave := _Sale;
  idTda := frDatos.idTienda;
  FBusca.FTitulos.Add('remision');
  FBusca.Ftitulos.Add('Fecha');
  FBusca.Ftitulos.Add('Total');

  FBusca.FCampos.Add('Refer');
  FBusca.FCampos.Add('Fecha');
  FBusca.FCampos.Add('Importe');
end;

procedure TfrComisiones.SetidVend(const Value: Integer);
begin
  FidVend := Value;
end;

procedure TfrComisiones.edVendPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if TcxLookupComboBox(Sender).EditValue = Null Then
    idVend := -1
  Else
    idVend := TcxLookupComboBox(Sender).EditValue;
end;

procedure TfrComisiones.acVerExecute(Sender: TObject);
begin
  inherited;
  Reporte.Close;
  if idVend <= 0 Then Begin
    Herror('Vendedor no valido');
    edVend.SetFocus;
    Exit;
  End;

  FechasToTxtT(wDate1.Date, wDate2.Date, TxtFechas, 'Re.Fecha');
  Reporte.SQL.Clear;
  Reporte.SQL.Add('select  Re.idtienda, Re.idremision, Re.refer, Re.fecha, Re.nombre,');
  Reporte.SQL.Add('Re.importe, Re.unidades, Re.idvendedor, Ven.Vend, Ven.Comision, Re.Importe * (Ven.Comision/100) iComision, Re.activo');
  Reporte.SQL.Add('from remision Re');
  Reporte.SQL.Add('Left join Vendedor Ven on Ven.idVendedor = Re.idVendedor');
  Reporte.SQL.Add('Where Re.Activo = 1 and Re.idVendedor = :idVend '+TxtFechas);
  Reporte.SQL.Add('Order by Re.Fecha, Re.Refer');
  Reporte.ParamByName('idVend').AsInteger := idVend;
  Reporte.Open;
  GridReporte.SetFocus;
end;

procedure TfrComisiones.acPrintExecute(Sender: TObject);
begin
  dxPrinter.ReportLink[0].ReportTitle.Text := 'Reporte de comisiones'+#10+
  FechasTexto(wDate1.date, wDate2.Date)+#10+
  'Vendedor: ' + edNombreVend.Text;
  inherited;
end;

end.
