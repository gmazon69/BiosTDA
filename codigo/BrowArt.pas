unit BrowArt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomCatalogos, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, dxPSCore, dxPScxCommon, 
  IBCustomDataSet, dxBarExtItems, dxBar, ActnList, ExtCtrls, ImgList,
  cxGridLevel, cxGridCardView, cxGridDBCardView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLabel, cxContainer, cxProgressBar,
  dxStatusBar, cxDBLookupComboBox, Menus, cxCurrencyEdit, IBDatabase, Diccionario,
   cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxPageControlProducer, ExtDlgs, IBQuery;

type
  TfrBrowArt = class(TfrCustomCatalogos)
    tvCatalogosIDARTICULO: TcxGridDBColumn;
    tvCatalogosMODELO: TcxGridDBColumn;
    tvCatalogosCODIGO: TcxGridDBColumn;
    tvCatalogosDESCRIPCION: TcxGridDBColumn;
    tvCatalogosMARCA: TcxGridDBColumn;
    tvCatalogosPV: TcxGridDBColumn;
    tvCatalogosLINEA: TcxGridDBColumn;
    tvCatalogosCVE_PRO: TcxGridDBColumn;
    tvCatalogosInventario: TcxGridDBColumn;
    dxBarButton3: TdxBarButton;
    SaveTextFileDialog: TSaveTextFileDialog;
    qArt: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure CatalogosAfterOpen(DataSet: TDataSet);
    procedure dxBarButton3Click(Sender: TObject);
  private
    FxPv: String;
  public
    Property xPv : String Read FxPv Write FxPv;
  end;

var
  frBrowArt: TfrBrowArt;

implementation

uses Datos, Util;

{$R *.dfm}

procedure TfrBrowArt.FormCreate(Sender: TObject);
begin
  inherited;

  tvCatalogosCodigo.Caption := gpxCodigo;
  tvCatalogosDescripcion.Caption := gpxDescripcion;
  tvCatalogosLinea.Caption := gpxLinea;
  tvCatalogospv.Caption    := gpxPrecio;
  tvCatalogosMarca.Caption := gpxMarca;
  tvCatalogosInventario.Caption := gpxInventario;
  tvCatalogosCve_pro.Caption    := gpxProv; 

  FBusca.Ftitulos.Add(gpxCodigo);
  FBusca.FTitulos.Add(gpxDescripcion);
  FBusca.FTitulos.Add(gpxMarca);
  FBusca.FTitulos.Add(gpxLinea);
  FBusca.FTitulos.Add(gpxProv);

  FBusca.FCampos.Add('Codigo');
  FBusca.FCampos.Add('Descripcion');
  FBusca.FCampos.Add('Marca');
  FBusca.FCampos.Add('Linea');
  FBusca.FCampos.Add('Prov');
  xPv := 'Prec.Pv'+IntTostr(frDatos.xPrecio)+' pv';

end;

procedure TfrBrowArt.acImprimirExecute(Sender: TObject);
begin
  dxPrinter.ReportLink[0].ReportTitle.Text := 'Catalogo de articulos';
  inherited;
end;

procedure TfrBrowArt.CatalogosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  Catalogos.AfterOpen := Nil;
  Catalogos.SelectSQL.Clear;
  Catalogos.SelectSQL.Add('select  Art.idarticulo, Art.modelo, Art.codigo, Art.descripcion, Art.Marca, ');
  Catalogos.SelectSQL.Add(xPv+', Li.Linea, Prov.cve_pro, Inv.Inventario, Art.activo');
  Catalogos.SelectSQL.Add('from articulos Art');
  Catalogos.SelectSQL.Add('Left Join Precios Prec on Prec.idArticulo = Art.idArticulo');
  Catalogos.SelectSQL.Add('Left Join Lineas Li on Li.idLinea = Art.idLinea');
  Catalogos.SelectSQL.Add('Left Join Proveedor Prov on Prov.idProveedor = Art.idProveedor');
  Catalogos.SelectSQL.Add('Left Join Inventarios Inv on Inv.idArticulo = Art.idArticulo');
  Catalogos.SelectSQL.Add('where Art.Activo = 1');
  Catalogos.SelectSQL.Add('and ((art.servicio= 0) or (art.servicio = 3) or (art.servicio is null))');
  Catalogos.SelectSQL.Add('Order by Codigo');
  Catalogos.Open;
  Catalogos.AfterOpen := CatalogosAfterOpen;
end;

procedure TfrBrowArt.dxBarButton3Click(Sender: TObject);
var F : TextFile;
begin
  inherited;
  qArt.Close;
  qArt.Open;

  if qArt.IsEmpty then
    exit;

  if not (SaveTextFileDialog.Execute) then
    exit;

  qArt.DisableControls;
  AssignFile(F,SaveTextFileDialog.FileName);
  Rewrite(F);
  qArt.First;
  while not (qArt.Eof) do begin
      WriteLn(F, IntToStr(qArt.FieldByName('idarticulo').AsInteger) + '|' +
              trim(qArt.FieldByName('codigo').AsString) + '|' +
              qArt.FieldByName('descripcion').AsString + '|' +
              qArt.FieldByName('depto').AsString + '|' +
              qArt.FieldByName('DeptoDesc').AsString);
      qArt.Next;
    end;

  CloseFile(F);
  qArt.EnableControls;
  ShowMessage('Archivo exportado con exito');
end;

end.
