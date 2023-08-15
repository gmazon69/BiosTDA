unit CapRem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomMov, cxGraphics, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxDBLookupComboBox, cxCurrencyEdit, cxDBEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, ActnList, IBQuery, IBDatabase,
  IBCustomDataSet, ExtCtrls, ImgList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, cxButtons, cxImage, cxTextEdit,
  cxMaskEdit, cxCalendar, cxLabel, cxContainer, cxProgressBar, dxStatusBar,
  cxButtonEdit, Math, Menus, IdBaseComponent, IdComponent, IdRawBase,
  IdRawClient, cxLookAndFeels, Grids, DBGrids, dxmdaset, Tabs, DockTabSet,
  cxMemo, StrUtils, dxGDIPlusClasses, EnviosMG, PromoVtas,
  EnviosDinero, PagosRemesas, Globales, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, System.Actions,
  System.ImageList;

type
  TfrCapRem = class(TfrCustomMov)
    ActionListVentas: TActionList;
    acCobrar: TAction;
    acCancelar: TAction;
    acSalir: TAction;
    dsClientes: TDataSource;
    dsVendedor: TDataSource;
    edCte: TcxLookupComboBox;
    edNombre: TcxDBTextEdit;
    Panel3: TPanel;
    cxLabel6: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    laImporte: TcxCurrencyEdit;
    laDescuento: TcxCurrencyEdit;
    laTotal: TcxCurrencyEdit;
    laPrendas: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    bCancelar: TcxButton;
    bSalir: TcxButton;
    qKardex: TIBQuery;
    bCobrar: TcxButton;
    pVendedores: TPanel;
    edVend: TcxPopupEdit;
    tvVend: TcxGridDBTableView;
    lvVend: TcxGridLevel;
    GridVend: TcxGrid;
    tvVendIDVENDEDOR: TcxGridDBColumn;
    tvVendVEND: TcxGridDBColumn;
    tvVendNOMBRE: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxLabel4: TcxLabel;
    ibSeek2: TIBQuery;
    Panel4: TPanel;
    cxLabel3: TcxLabel;
    edNota: TcxDBTextEdit;
    cxLabel99: TcxLabel;
    edDescuento: TcxDBCurrencyEdit;
    edSerie: TcxComboBox;
    DetallePSINIVA: TIBBCDField;
    qValArt: TIBQuery;
    DetallePCCONIVA: TIBBCDField;
    DetalleIDALIAS: TLargeintField;
    qPagosT: TIBQuery;
    qDepositos: TIBQuery;
    iDescuentos: TIBQuery;
    ibArticulos: TIBQuery;
    xBusca: TIBQuery;
    DetalleIVA: TIntegerField;
    DetalleALLOW: TIBStringField;
    SeekFA: TIBQuery;
    qCancela: TIBQuery;
    qServicios: TIBQuery;
    mServicios: TdxMemData;
    mServiciosidServicio: TIntegerField;
    mServiciosCodigo: TStringField;
    mServiciosClase: TIntegerField;
    mServiciosSKU: TStringField;
    mServicioscelular: TStringField;
    mServiciosStatus: TIntegerField;
    mServiciosmonto: TFloatField;
    mServiciosReferencia: TStringField;
    mServiciosDV: TStringField;
    mServicioscodigoBarra: TStringField;
    mServiciosidPago: TIntegerField;
    mServiciosempresa: TStringField;
    acPagoServicios: TAction;
    qDescuentos: TIBQuery;
    DetalleSERVICIO: TIntegerField;
    acClientes: TAction;
    qPuntos: TIBQuery;
    cxButton3: TcxButton;
    acServicios: TAction;
    cxLabel2: TcxLabel;
    edCliente: TcxTextEdit;
    LogoCardxxx: TcxImage;
    LogoCard: TcxImage;
    qPuntosRedime: TIBQuery;
    DetalleTIPOIMPUESTO: TIntegerField;
    DetalleTOTIMP: TFloatField;
    DeImpuestos: TIBQuery;
    DetalleFACTOR: TIBBCDField;
    DetallePSINIMP: TIBBCDField;
    qNewImpuestos: TIBQuery;
    tvCapTIPOIMPUESTO: TcxGridDBColumn;
    tvCapTOTIMP: TcxGridDBColumn;
    tvCapFACTOR: TcxGridDBColumn;
    tvCapPSINIMP: TcxGridDBColumn;
    Detallefacturable: TIntegerField;
    cxButton5: TcxButton;
    acBuscar: TAction;
    qDetalleCancela: TIBQuery;
    acPagoServiciosDL: TAction;
    acHerbalife: TAction;
    acRemesas: TAction;
    acEnviosDinero: TAction;
    DetalleDescNeto: TFloatField;
    Detalleimpuesto: TFloatField;
    acVentaSeguros: TAction;
    acCobrosVD: TAction;
    acCteMayoreo: TAction;
    mDetalle: TdxMemData;
    mDetalleid: TIntegerField;
    mDetalleRegistro: TIntegerField;
    mDetalleidArticulo: TIntegerField;
    mDetalleidAlias: TIntegerField;
    mDetalleCodigo: TStringField;
    mDetalleDescripcion: TStringField;
    mDetalleCantidad: TFloatField;
    mDetalleCantidad2: TFloatField;
    mDetallePrecio: TFloatField;
    mDetalleVenta: TFloatField;
    mDetalleCosto: TFloatField;
    mDetalleDescuento: TFloatField;
    mDetalleImpuesto: TFloatField;
    mDetalleAllow: TStringField;
    mDetalleServicio: TSmallintField;
    mDetalleTipoImpuesto: TIntegerField;
    mDetalleFactor: TFloatField;
    mDetalleCambia_precio: TSmallintField;
    cxButton2: TcxButton;
    acVtaContado: TAction;
    mDetallepv_esp: TFloatField;
    Procedure Termina(Sender: TObject; Salida : Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edCtePropertiesEditValueChanged(Sender: TObject);
    procedure tvCapDataControllerSummaryAfterSummary(ASender: TcxDataSummary);
    procedure acCobrarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acSalirExecute(Sender: TObject);
    procedure edDescuentoExit(Sender: TObject);
    procedure edVendPropertiesCloseUp(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure edVendPropertiesPopup(Sender: TObject);
    procedure edSeriePropertiesEditValueChanged(Sender: TObject);
    procedure tvCapCodigoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure acPagoServiciosExecute(Sender: TObject);
    procedure acClientesExecute(Sender: TObject);
    procedure acServiciosExecute(Sender: TObject);
    procedure edClientePropertiesEditValueChanged(Sender: TObject);
    procedure DetalleCalcFields(DataSet: TDataSet);
    procedure DeImpuestosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure acBuscarExecute(Sender: TObject);
    procedure acPagoServiciosDLExecute(Sender: TObject);
    procedure acHerbalifeExecute(Sender: TObject);
    procedure acRemesasExecute(Sender: TObject);
    procedure acEnviosDineroExecute(Sender: TObject);
    procedure DetalleAfterPost(DataSet: TDataSet);
    procedure tvCapCANTIDADPropertiesEditValueChanged(Sender: TObject);
    procedure tvCapDESCUENTOCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvCapEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure acVentaSegurosExecute(Sender: TObject);
    procedure acCteMayoreoExecute(Sender: TObject);
    procedure acVtaContadoExecute(Sender: TObject);
  private
    FNivelAutorizacion: Integer;
    FxSerie: String;
    function GetNivelAutorizacion: Integer;
  private
    FidRem: Integer;
    FidVend: Integer;
    FidCte: Integer;
    FidTda: Integer;
    FLastDate: TDate;
    FpCant: Integer;
    FReinicia: Integer;
    FsiReinicia: Boolean;
    FMaxID: Integer;
    FTipoServicio: integer;
    FnTarjeta: String;
    FxAmountLealtad: string;
    _idVend : string;
    _nomb : String;
    FxResultado: Boolean;
    FPuntosAcumula: Double;
    FPuntosRedime: Double;
    FPosTraceNumber: String;
    FxCliente: String;
    FYaTieneTarjeta: Boolean;
    FNumTarjetasLealtad: integer;
    FNotaFacturable: integer;
    FxComision: String;
    FxSKU: String;
    FxReferencia: String;
    FxCompania: String;
    FxPayment: String;
    FxSevTelcel: String;
    FxMONTO: String;
    FTipo_Operacion: integer;
    F_Cobimptot: Double;
    F_CobListaDetalle: String;
    F_Cobimpuesto: Double;
    F_CobTotalImpuestos: Double;
    F_CobsiTarjeta: Boolean;
    F_Cobciva: Double;
    F_CobImp_Desc: Double;
    F_CobxCosto: Double;
    FidPagoSer: integer;
    PromoVtas: TfrPromoVtas;
    FDesc_Neto: Double;
    FDesc_Bruto: Double;
    FCteMayor: String;
    FVtaContado: integer;
    procedure SetnTarjeta(const Value: String);
    Property xResultado : Boolean read FxResultado write FxResultado;
    Property PuntosAcumula : Double read FPuntosAcumula write FPuntosAcumula;
    Function ValidaNota: Boolean;
    Procedure PonTotales;
    procedure SetidCte(const Value: Integer);
    procedure SetidVend(const Value: Integer);
    Function ValidaDepo: Boolean;
    Function GetRefer: String;
    Function GetFolio: Integer;
    procedure SetTipoServicio(const Value: integer);
    Procedure ValidaVtaContado;
  public
    Procedure Inicializa;
    Procedure MetePago(aClase: String; aImporte:Double; xid: Integer; aCambio: Double; aPago : Integer;
                       Tarjeta: String = ''; WaldosPay: String = ''; Autoriza: String = '');
    Property idCte : Integer Read FidCte Write SetidCte;
    Property idVend : Integer Read FidVend Write SetidVend;
    Property idRem : Integer Read FidRem Write FidRem;
    Property idTda : Integer Read FidTda Write FidTda;
    Property LastDate : TDate Read FLastDate Write FLastDate;
    Property NivelAutorizacion : Integer Read GetNivelAutorizacion Write FNivelAutorizacion;
    Property xSerie: String Read FxSerie Write FxSerie;
    Property pCant: Integer Read FpCant Write FpCant;
    Property Reinicia: Integer Read FReinicia Write FReinicia;
    Property MaxID: Integer Read FMaxID Write FMaxID;
    Property siReinicia: Boolean Read FsiReinicia Write FsiReinicia;
    Property TipoServicio: integer read FTipoServicio write SetTipoServicio;
    Property Tipo_Operacion: integer read FTipo_Operacion write FTipo_Operacion;
    Property nTarjeta: String Read FnTarjeta Write SetnTarjeta;
    Property xAmountLealtad: string read FxAmountLealtad write FxAmountLealtad;
    Property xCliente: String Read FxCliente Write FxCliente;
    Property NewPosTraceNumber: String read FPosTraceNumber write FPosTraceNumber;
    Property NumTarjetasLealtad: integer read FNumTarjetasLealtad write FNumTarjetasLealtad;
    Property NotaFacturable: integer read FNotaFacturable write FNotaFacturable;
    Property VtaContado: integer read FVtaContado write FVtaContado;

    Property xSKU: String read FxSKU write FxSKU;
    Property xReferencia: String read FxReferencia write FxReferencia;
    Property xPayment: String read FxPayment write FxPayment;
    Property xCompania: String read FxCompania write FxCompania;
    Property xMONTO: String read FxMONTO write FxMONTO;
    Property xComision: String read FxComision write FxComision;
    Property xSevTelcel: String read FxSevTelcel write FxSevTelcel;

    Procedure AsignaArticulo; override;
    procedure Desglosa(vIVA, Valor: Double; var Iva, Neto: Double);
    procedure MasIVA(vIVA, Valor: Double; var Iva, ConIVA: Double);
    function isGrabado(idArt: Integer): Boolean;
    function ValidaArt (idArt: integer; Permiso: String): Boolean;
    function VAttribArt(idArt, Cantidad: Integer): Boolean;
    function ValidaArticulo(idServicio : integer): Boolean;
    procedure RemisionCancelada;
    Function AcumulaPuntos(lDetalle: String) : Boolean;

    Property idPagoSer: integer read FidPagoSer write FidPagoSer;
    Property _CobListaDetalle: String read F_CobListaDetalle write F_CobListaDetalle;
    Property _CobsiTarjeta : Boolean read F_CobsiTarjeta  write F_CobsiTarjeta;
    Property _Cobciva :Double  read F_Cobciva  write F_Cobciva;
    Property _CobxCosto :Double read F_CobxCosto  write F_CobxCosto;
    Property _CobImp_Desc :Double read F_CobImp_Desc  write F_CobImp_Desc;
    Property _CobTotalImpuestos: Double read F_CobTotalImpuestos write F_CobTotalImpuestos;
    Property _Cobimpuesto :Double read F_Cobimpuesto  write F_Cobimpuesto;
    Property _Cobimptot :Double read F_Cobimptot  write F_Cobimptot;
    Property Desc_Bruto: Double read FDesc_Bruto Write FDesc_Bruto;
    Property Desc_Neto: Double read FDesc_Neto Write FDesc_Neto;


    function Cob_DesgloseIva: Boolean;
    function Cob_FormasPago(var salida : integer): Boolean;
    function Cob_CalDeRemImp(Cant: Double; idDe_Rem: integer): Boolean;
    function Cob_Pagos: Boolean;
    function Cob_Grabar: Boolean;
    function Cob_AbonaServicio: Boolean;
    function Cob_ImprimeTicket: Boolean;
//    function Cob_ImprimeCompTarjera: Boolean;
    function Cob_ImprimeCompServicio: Boolean;
    function Cob_ImprimeCompSeguro: Boolean;
    function Cob_ImprimeCompWp: Boolean;
    function Cob_ActivaTarjeta: Boolean;
    function Cob_CancelaRemServ(_idTda, _idRem:integer): Boolean;
    function Cob_EnvioDineroCommit(idRem:integer): Boolean;
    Function GrabaVD: Boolean;
  end;

var
  frCapRem: TfrCapRem;
  EnviosDinero: TfrEnviosDinero;
  PagosRemesas: TfrPagosRemesas;
  //EnviosMG: TfrEnviosMG;
  //IVA: Currency;

implementation

uses Datos, Util, FormasPago, ValidaCaja, Tools,
  FtosVoucher, FPVerifyAuto, Servicios, Empresas, FtosTiempoAire,
  ActivaTarj, getTarjeta, Service1, Operation_Response, DatosRemoto,
  PideAuto, SelectServicio, Services, VeArticulos, RetiroCaja, PagoServicios, FtoSeguros,
  FtoWpasComprobante, FtoCanceladas, AvisodePrivWU, CteMayoreo, Autoriza,
  FtoTicket;

{$R *.dfm}

procedure TfrCapRem.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if Application.MessageBox('Realmente quiere cerrar?','Cerrar',
  MB_ICONWARNING or MB_YESNO or MB_APPLMODAL) = mrYes then
  begin
    RemisionCancelada;
    //Destruye promociones
    PromoVtas.Free;
  end
  else
    abort;
end;

procedure TfrCapRem.FormCreate(Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  CanLoadTxt := False;
  FieldCantidad := '';

  Clave := _Entra;
  onTermina := Termina;
  idTda := frDatos.idTienda;
  Precio := frDatos.sPrecio;

  edSerie.Properties.Items.Clear;
  For I := 1 to Length(frDatos.Series) do
    edSerie.Properties.Items.Add(frDatos.Series[I]);

  edSerie.ItemIndex := 0;
  edSerie.Visible := (Length(frDatos.Series) > 1);
  xSerie := edSerie.EditingValue;
  xSerie := '';
  edSerie.Visible := False; // Bloqueado hasta nuevo aviso

  qNew.Close;
  qNew.SQL.Clear;
  qNew.SQL.Add('Select Max(fecha), max(idRemision) idRem from remision');
  qNew.SQL.Add('Where idTienda = :idtda and activo >= 1');
  qNew.ParamByName('idTda').AsInteger := idTda;
  qNew.Open;
  LastDate := qNew.FieldByName('Max').AsDateTime;
  MaxID := qNew.FieldByName('idRem').AsInteger;


  qNew.Close;

  tvCapCodigo.PropertiesClass := TcxTextEditProperties;
  tvCapCodigo.Properties.OnValidate := tvCapCodigoPropertiesValidate;

  DeImpuestos.Close;
  DeImpuestos.Open;

  //Crea promociones
  PromoVtas := TfrPromoVtas.Create(Self);
  PromoVtas.mData := Detalle;
  PromoVtas.wDate := Cajas.xFechaLaboral;

end;

procedure TfrCapRem.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  inherited;
  if GetKeyState(VK_CONTROL) < 0 then
      if msg.CharCode = ord('X') then
        if Application.MessageBox('Realmente quiere cerrar?','Cerrar',
          MB_ICONWARNING or MB_YESNO or MB_APPLMODAL) = mrYes then
            RemisionCancelada;
end;

procedure TfrCapRem.Termina(Sender: TObject; Salida: Boolean);
begin
  inherited;
  Inicializa;
end;

procedure TfrCapRem.Inicializa;
Var
  RetiroCaja : TfrRetiroCaja;
  mResult : integer;
begin

  {if Date < LastDate Then Begin
    Herror('ERROR: Fecha no valida'+#10+'Favor de verificar');
    Close;
    Exit;
  End;   }

  VtaContado := 0;
  acVtaContado.Enabled := False;
  acVtaContado.Visible := False;

  acClientes.Enabled := true;
  nTarjeta := '';
  edCliente.Text := '';
  NotaFacturable := -1;
  TipoServicio := -1;
  Tipo_Operacion := -1;
  xAmountLealtad := '0';
  xCliente := '';
  NewPosTraceNumber := '';
  nTarjeta := '';
  _idVend := '';
  _nomb := '';
  Desc_Bruto := 0;
  Desc_Neto := 0;
  FCteMayor := '';

  mServicios.Close;
  mServicios.Open;

  siReinicia := False;
  Reinicia := -1;
  if Cajas.xFechaLaboral <> LastDate Then Begin
    {if MessageBox(0,'Cambio de fecha'+#10+'Desea continuar','BiosTDA',
      mb_TaskModal+mb_IconQuestion+mb_YesNo + mb_DefButton2) = idNo Then
      Close; }

    {Reinicia concecutivo}
    siReinicia := False;
    qNew.Close;
    qNew.SQL.Clear;
    qNew.SQL.Add('Select * from folios');
    qNew.SQL.Add('Where idTienda = :idTda and fecha <= :wDate and activo = 1');
    qNew.ParamByName('idTda').AsInteger := idTda;
    qNew.ParamByName('wDate').AsDate    := Cajas.xFechaLaboral;
    qNew.Open;
    while not qNew.Eof do Begin
      if qNew.FieldByName('Fecha').AsDateTime >= Cajas.xFechaLaboral then Begin
        Reinicia := qNew.FieldByName('id').AsInteger;
        siReinicia := True;
      End;
      qNew.Next;
    End;
  End;


  qNew.Close;
  qNew.SQL.Clear;
  qNew.SQL.Add('Select Max(Fecha_venta) from CFDI');
  qNew.SQL.Add('Where (idTienda = :idTda) and (((idCliente is NULL) and (idRemision is NULL))or ((idcliente <= 0 )and (idremision <= 0)))');
  qNew.ParamByName('idTda').AsInteger := frDatos.idTienda;
  qNew.Open;


  if qNew.FieldByName('Max').AsDateTime >= Cajas.xFechaLaboral  then Begin
    raise Exception.Create('ERROR: Ya se genero la factura global de la venta'+#10+
                           'del dia ' + FormatDateTime('dd/mm/yyyy', Cajas.xFechaLaboral)+#10+
                           'imposible generar mas ventas. ');
  End;


  Maestro.Close;
  Maestro.Open;
  Maestro.Insert;

  Detalle.CancelUpdates;
  Detalle.close;
  Detalle.Open;
  Detalle.Insert;

  edSerie.ItemIndex := 0;

  Maestro.FieldByName('Fecha').AsDateTime   := Cajas.xFechaLaboral;
  Maestro.FieldByName('Refer').AsString     := GetRefer;
  Maestro.FieldByName('Nombre').AsString    := 'PUBLICO EN GENERAL';
  Maestro.FieldByName('Descuento').AsFloat  := 0;
  PonTotales;
  idVend := -1;
  idCte := -1;
  edVend.SetFocus;
  edVend.DroppedDown := True;
  pCant := 1;
  nTarjeta := '';

  if frDatos.NotiRetiroCaja > 0  then
  begin
    frDatos.qSaldoRetiro.Close;
    frDatos.qSaldoRetiro.ParamByName('idsesion').AsInteger := cajas.xidSesion;
    frDatos.qSaldoRetiro.Open;
    if frDatos.qSaldoRetiro.FieldByName('VENTA_ACUMULA').AsFloat >= frDatos.NotiRetiroCaja then
    begin
      if frDatos.qSaldoRetiro.FieldByName('VENTA_ACUMULA').AsFloat >= frDatos.BloqRetiroCaja then
      begin
        Application.MessageBox(pchar('Superaste $ '+FormatFloat(',0.00',frDatos.BloqRetiroCaja)+
                                     ' permitido por caja '+#13+'Es necesario realizar retiro de caja'+#13+#13+
        'De lo contrario no podra seguir cobrando'), pchar('BiosTda'), (MB_OK + MB_ICONINFORMATION));
        RetiroCaja := TfrRetiroCaja.Create(application);
        RetiroCaja.ShowModal;
        mResult := RetiroCaja.ModalResult;
        RetiroCaja.Free;
        if mResult = mrOk then
          Inicializa
        else
          close;
      end else
      begin
        Application.MessageBox(pchar('Superaste $ '+FormatFloat(',0.00',frDatos.NotiRetiroCaja)+
                                      ' Permitido por caja'+
                                     #13+' Es necesario realizar retiro de caja'),
        pchar('BiosTda'), (MB_OK + MB_ICONINFORMATION));
        RetiroCaja := TfrRetiroCaja.Create(application);
        RetiroCaja.ShowModal;
        RetiroCaja.Free;
      end;
    end;
  end;

  mDetalle.Close;
  mDetalle.Open;

  {inicializa las promociones}
  PromoVtas.inicializa;

end;

function TfrCapRem.isGrabado(idArt: Integer): Boolean;
var
  q: TIBQuery;
begin
  q := TIBQuery.Create(Nil);
  try
    q.Database := frDatos.dbK;
    q.Transaction := frDatos.trK;
    q.SQL.Add('Select * from Precios where idArticulo = :idArticulo');
    q.ParamByName('idArticulo').AsInteger := idArt;
    q.Open;

    Result := q.FieldByName('iva').AsInteger > 0;
  finally
    q.Free;
  end;
end;

procedure TfrCapRem.RemisionCancelada;
var
  x_Costo: Double;
  Cant : Integer;
  id_Rem, idDe_Rem : integer;
  nPzas : integer;
  impuesto, imptot: Double;
  Fto : TFtoCanceladas;
begin
  try
    if (Detalle.IsEmpty) then
      Exit;

    if Detalle.RecordCount < 1 then
      Exit;

    PonTotales;

    x_Costo  := 0;
    nPzas    := 0;
    idDe_Rem := 1;
    impuesto := 0;
    imptot   := 0;

    qDetalleCancela.Close;
    qDetalleCancela.SQL.Clear;
    qDetalleCancela.SQL.Add('Insert into de_remcancelada (id, idtienda, idremision, idarticulo, idalias,');
    qDetalleCancela.SQL.Add('cantidad, precio, costo, pvneto, pciva, descuento, impuesto, IMP_DESC, Tipo_Impuesto, activo)');
    qDetalleCancela.SQL.Add('Values (:id, :idtienda, :idremision, :idarticulo, :idalias,');
    qDetalleCancela.SQL.Add(':cantidad, :precio, :costo, :pvneto, :pciva, :descuento, :Impuesto, :IMP_DESC, :Tipo_Impuesto, 1)');

    Detalle.First;
    While not Detalle.Eof do
    Begin
      Cant := Detalle.FieldByName('Cantidad').AsInteger;
      if (Cant <= 0) then
        Cant := 1;

      nPzas := nPzas + Cant;
      x_Costo := x_Costo + (Cant * Detalle.FieldByName('Costo').AsFloat);

      {calculo de impuestos}
      DeImpuestos.Filtered := false;
      DeImpuestos.Filtered := true;
      DeImpuestos.First;
      while not (DeImpuestos.Eof) do
      begin
        impuesto := (Detalle.FieldByName('pSinImp').AsFloat * Cant) + impuesto;
        impuesto := impuesto * DeImpuestos.FieldByName('valor').AsFloat/100;
        impuesto := impuesto * (1-(edDescuento.EditingValue/100));
        imptot   := imptot +  impuesto;
        DeImpuestos.Next;
      end;

      qDetalleCancela.Close;
      qDetalleCancela.ParamByName('idTienda').AsInteger   := idTda;
      qDetalleCancela.ParamByName('id').AsInteger         := idDe_Rem;
      qDetalleCancela.ParamByName('idRemision').AsInteger := idRem;
      qDetalleCancela.ParamByName('idArticulo').AsInteger := Detalle.FieldByName('idArticulo').AsInteger;
      qDetalleCancela.ParamByName('idalias').AsInteger    := Detalle.FieldByName('idalias').AsInteger;
      qDetalleCancela.ParamByName('Cantidad').AsInteger   := Cant;
      qDetalleCancela.ParamByName('Precio').AsFloat       := Detalle.FieldByName('Precio').AsFloat;
      qDetalleCancela.ParamByName('Costo').AsFloat        := Detalle.FieldByName('Costo').AsFloat;
      qDetalleCancela.ParamByName('PvNeto').AsCurrency    := Detalle.FieldByName('pSinImp').AsCurrency;
      qDetalleCancela.ParamByName('IMP_DESC').AsCurrency  := ((Detalle.FieldByName('pSinImp').AsCurrency * cant)*(maestro.FieldByName('Descuento').AsFloat/100)) ;
      qDetalleCancela.ParamByName('PcIVA').AsCurrency     := Detalle.FieldByName('pcconIVA').AsCurrency;
      qDetalleCancela.ParamByName('Descuento').AsFloat    := StrToFloat(edDescuento.Text);
      qDetalleCancela.ParamByName('Impuesto').AsFloat     := imptot;
      qDetalleCancela.ParamByName('Tipo_Impuesto').AsInteger := Detalle.FieldByName('TipoImpuesto').AsInteger;
      qDetalleCancela.ExecSQL;

      idDe_Rem := idDe_Rem + 1;
      Detalle.Next;
    End;
    id_Rem := -1;
    Detalle.EnableControls;

    qCancela.Close;
    qCancela.SQL.Clear;
    qCancela.SQL.Add('insert into remision_cancelada (idtienda, idremision, fecha, hora,');
    qCancela.SQL.Add(' importe, costo, unidades, idvendedor, idUser, tipo_operacion, activo)');
    qCancela.SQL.Add('values (:idtienda, :idremision, :fecha, :hora,');
    qCancela.SQL.Add(' :importe, :costo, :unidades, :idvendedor, :idUser, :tipo_operacion, :activo)');
    qCancela.ParamByName('idTienda').AsInteger    := idTda;
    qCancela.ParamByName('idRemision').AsInteger  := id_Rem;
    qCancela.ParamByName('Fecha').AsDateTime      := Cajas.xFechaLaboral;
    qCancela.ParamByName('Hora').AsDateTime       := Time;
    qCancela.ParamByName('Importe').AsFloat       := laTotal.EditValue;
    qCancela.ParamByName('Costo').AsFloat         := x_Costo;
    qCancela.ParamByName('Unidades').AsInteger    := nPzas;
    qCancela.ParamByName('idVendedor').AsInteger  := idVend;
    qCancela.ParamByName('idUser').AsInteger      := frDAtos.idUser;
    qCancela.ParamByName('Tipo_operacion').AsInteger := Tipo_Operacion;
    qCancela.ParamByName('Activo').AsInteger      := 1;
    qCancela.ExecSQL;
    LocalTransaction.Commit;

    qNew.Close;
    qNew.SQL.Clear;
    qNew.SQL.Add('Select Max(fecha), max(idRemision) idRem from remision_cancelada');
    qNew.SQL.Add('Where idTienda = :idtda and activo >= 1');
    qNew.ParamByName('idTda').AsInteger := idTda;
    qNew.Open;
    id_Rem := qNew.FieldByName('idRem').AsInteger;

    Fto := TFtoCanceladas.Create(Self);
    Fto.idRem := id_Rem;
    Fto.DB := qNew; // frDatos.User;
    Fto.Imprime;
    Fto.Free;

  Except
    on e:Exception do
    Begin
      Log('Remisiones graba(2) : ' + e.Message);
      ShowMessage('Remisiones graba(2) : ');
      LocalTransaction.Rollback;
    End;
  end;
end;

procedure TfrCapRem.SetidCte(const Value: Integer);
begin
  FidCte := Value;
  edCte.Properties.OnEditValueChanged := Nil;
  edCte.EditValue := FidCte;
  edCte.Properties.OnEditValueChanged := edCtePropertiesEditValueChanged;

  if FidCte> 0 Then
  Begin
    frDatos.Clientes.Locate('idCliente',FidCte,[]);
    Maestro.FieldByName('Nombre').AsString := frDatos.Clientes.FieldByName('Nombre').AsString;
  End;
end;

procedure TfrCapRem.edClientePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  //LogoCard.Visible := edCliente.Text <> '';
end;

procedure TfrCapRem.edCtePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if TcxLookupComboBox(Sender).EditValue = Null Then
    idCte := -1
  Else
    idCte := TcxLookupComboBox(Sender).EditValue;
end;

procedure TfrCapRem.SetidVend(const Value: Integer);
begin
  FidVend := Value;

  if FidVend > 0 Then
  Begin
    frDatos.Vendedor.Locate('idVendedor',FidVend,[]);
    edVend.Text := frDatos.Vendedor.FieldByName('Nombre').AsString;
  End;
end;

procedure TfrCapRem.SetnTarjeta(const Value: String);
begin
  FnTarjeta := Value;
  LogoCard.Visible := nTarjeta <> '';
end;

procedure TfrCapRem.SetTipoServicio(const Value: integer);
begin
  FTipoServicio := Value;
  tvCapCANTIDAD.Options.Focusing := not(FTipoServicio = 1);
  edDescuento.Enabled := not(FTipoServicio = 1);
  if FTipoServicio = 1 then
   Maestro.FieldByName('Descuento').AsFloat := 0;
end;

procedure TfrCapRem.tvCapDataControllerSummaryAfterSummary(ASender: TcxDataSummary);
begin
  inherited;
  //PonTotales;
end;

function TfrCapRem.ValidaNota: Boolean;
Var
  Return : Boolean;
  ArtCero: Boolean;
  ArtDesc: Boolean;
  Txt : String;
  xCant: Integer;
  Auto : TAutorizaciones;
  Autoriza: TfrAutoriza;
begin
  Return := True;
  NumTarjetasLealtad := 0;

  if (laDescuento.EditValue >= laImporte.EditValue) and (laDescuento.EditValue > 0)  then
  Begin
     Herror('No se permite un descuento mayor a la venta');
     Return := False;
     ValidaNota := Return;
     exit;
  End;

  Txt := 'Where idTienda = ' + IntToStr(idTda);
  if xSerie <> '' Then
    Txt := Txt + ' and Serie = ' + '''' + xSerie + '''';

  Maestro.FieldByName('Refer').AsString := GetRefer;
  //Ceros(Consecutivo(Maestro,'Refer','Remision','Where idTienda = '+IntToStr(idTda)),10);

  if idVend <= 0 then
  Begin
     Herror('Favor de ingresar un numero de vendedor ');
     edVend.SetFocus;
     Return := False;
  End;

  Maestro.FieldByName('Refer').AsString := GetRefer;

  Detalle.DisableControls;
  Detalle.First;
  ArtCero := False;
  ArtDesc := False;
  xCant   := 0;

  While not Detalle.Eof do
  Begin
    if Detalle.FieldByName('Cantidad').AsInteger = 0 Then
      ArtCero := True;
    if Detalle.FieldByName('Descuento').AsInteger > 0 Then
      ArtDesc := True;
    if detalle.FieldByName('servicio').AsInteger = 3 then
      NumTarjetasLealtad := NumTarjetasLealtad + Detalle.FieldByName('cantidad').AsInteger;
    xCant := xCant + Detalle.FieldByName('cantidad').AsInteger;
    Detalle.Next;
  End;
  Detalle.EnableControls;

  if ArtCero Then
  begin
    Return := false;
    MessageDlg('La nota tiene articulos en CERO'+#10+'Favor de verificar',mtInformation, [mbOK], 1);
    Exit;
   { Return := MessageBox(0,'La nota tiene articulos en CERO'+#10+'Desea continuar','gpxSOFT',
      mb_TaskModal+mb_IconQuestion+mb_YesNo + mb_DefButton2) = idYes;}
  end;

  if NumTarjetasLealtad > 1 then
  begin
    Return := false;
    MessageDlg('La nota solo puede contener una tarjeta lealtad'+#10+'Favor de verificar',mtInformation, [mbOK], 1);
    Exit;
  end;

  if edDescuento.EditValue = Null Then
     Maestro.FieldByName('Descuento').AsFloat := 0;

  //if (edDescuento.EditValue > 0) and (ArtDesc) Then
  if PromoVtas.Cascada then
  Begin
     MessageBox(0,'ERROR: Venta no valida, no se permiten descuentos sobre descuentos','Ventas',
     mb_TaskModal+mb_IconStop+mb_Ok);
     GridCap.SetFocus;
     Return := False;
     Exit;
  End;

  Detalle.First;
  if Detalle.Eof  Then
  Begin
     Herror('No existen datos');
     GridCap.SetFocus;
     Return := False;
  End;

  if NivelAutorizacion in [1..29] then
  begin
   Auto := TAutorizaciones.Create;
   Auto.DataSet := Maestro;                           // Dataset
   Auto.Fa := Maestro.FieldByName('refer').AsString;  // Refer de la venta
   Auto.descuento := edDescuento.EditValue;           // Decuento
   Auto.ishuella := true;                             // es por huella o no?
   Auto.dondeValidaHuella := dValidaLocal;            // Valida local o al servidor DataSnap supervisor
  end;

  Case NivelAutorizacion of
  {  1..19: If Not AutorizaEnc(Maestro, Maestro.FieldByName('refer').AsString) Then Return := False;
       20: If Not AutorizaDescuento(Maestro, Maestro.FieldByName('refer').AsString, edDescuento.EditValue) Then Return := False;
   21..29: If Not AutorizaOfi(Maestro, Maestro.FieldByName('refer').AsString) Then Return := False;  }

   1..19: Return := Auto.Autoriza(AutoEnc);
      20: begin
            Auto.isHuella := false;
            Return := auto.Autoriza(AutoDescuentos);
          end;
  21..29: Begin
           Auto.isHuella := false;
           Return := Auto.Autoriza(AutoOfi);
         End;
  End;

  if (VtaContado = 1) then
  Begin
    Autoriza := TfrAutoriza.Create(Self);
    Autoriza.Factor := xCant;
    Autoriza.Muestra;
    Return := (Autoriza.ModalResult = mrOK);
    Autoriza.Free;
  End;
  ValidaNota := Return;
end;

procedure TfrCapRem.ValidaVtaContado;
Var
  yes: Boolean;
begin
  yes := false;
  mDetalle.First;
  while (not mDetalle.Eof) and ( not yes) do
  Begin
    yes := (mDetalle.FieldByName('Cambia_precio').AsInteger = 1);
    mDetalle.Next;
  End;
  acVtaContado.Enabled := yes;
  acVtaContado.Visible := yes;
end;

function TfrCapRem.VAttribArt(idArt, Cantidad: Integer): Boolean;
var
  Return : Boolean;
begin
  Return := True;
  if edDescuento.EditValue > 0 then
  begin
    //if ValidaArt(idArt, 'D') then begin
    if Pos('D', Detalle.FieldByName('allow').AsString) > 0 Then
    Begin
      Herror('El codigo "'+Trim(Detalle.FieldByName('codigo').AsString)+'" no admite descuentos!');
      Return := False;
    end;
  end;

  if Cantidad < 0 then
  begin
    //if ValidaArt(idArt, 'C') then begin
    if Pos('C', Detalle.FieldByName('allow').AsString) > 0 Then
    Begin
      Herror('El codigo "'+Trim(Detalle.FieldByName('codigo').AsString)+'" no admite cambios ni devoluciones!');
      Return := False
    end;
  end;
  Result := Return;
end;

procedure TfrCapRem.acClientesExecute(Sender: TObject);
Var
  getTarjeta : TfrGetTarjeta;
  gBalance: BlGetBalanceRequest;
  responde: OperationResponse;
  sl : TStringList;
begin
  inherited;
  GetTarjeta := TfrGetTarjeta.Create(Self);

  if nTarjeta <> '' then
  Begin
    GetTarjeta.YA := True;
    GetTarjeta.edTarjeta.Text := nTarjeta;
    GetTarjeta.edSaldo.EditValue := xAmountLealtad;
    GetTarjeta.edCliente.Text := xCliente;
  End;

  GetTarjeta.ShowModal;
  if (GetTarjeta.idStatus <= 0) and (nTarjeta = '') and (GetTarjeta.xTipo <> xException) then
  Begin
    GetTarjeta.Free;
    Herror('Tarjeta no valida para acumulacion de puntos');
    GridCap.SetFocus;
    exit;
  end;

  if (GetTarjeta.idStatus >= 1) or (GetTarjeta.xTipo = xException) then
  Begin
    nTarjeta := GetTarjeta.xPAN;
    xAmountLealtad := GetTarjeta.xAmount;
    xCliente := GetTarjeta.xTarNombre;
    edCliente.Text := xCliente;
  End;

  if (nTarjeta = '') <> (GetTarjeta.xTipo = xException) then
  Begin
    ShowMessage('Error de comunicacion, no se puede validar la tarjeta'+#10+'Los puntos se acumularan posteriormente');
    nTarjeta := GetTarjeta.xPAN;
    xAmountLealtad := '0';
    xCliente := GetTarjeta.xTarNombre;
    edCliente.Text := nTarjeta + ' '+ xCliente;
  End;
  GridCap.SetFocus;
end;

procedure TfrCapRem.acCobrarExecute(Sender: TObject);
var
  salida: Integer;
begin
  inherited;
  PonTotales;
  if not ValidaNota Then
    Exit;

  if ((nTarjeta = '') and (TipoServicio = -1)) or ((nTarjeta = '') and (TipoServicio = 2)) then
    acClientesExecute(acClientes);

  _idVend := '';
  _nomb   := '';
  _CobsiTarjeta      := False;
  _CobListaDetalle   := '';
  _CobTotalImpuestos := 0;
  PuntosAcumula      := 0;
  salida := 1;

  Try
    Try
      if not Cob_DesgloseIva Then
        raise Exception.Create('[ ERROR ]: Desglose Ivas');

      if not Cob_FormasPago(salida) Then
      begin
        if salida = 0 then
          exit;
        raise Exception.Create('[ ERROR ]: Generar pago');
      end;

      if not Cob_Grabar Then
        raise Exception.Create('[ ERROR ]: Grabar informacion');

      if not frFormasPago.mServicios.IsEmpty then
        if not Cob_AbonaServicio then
        begin
          Cob_CancelaRemServ(idTda, idRem);
          raise Exception.Create('[ ERROR ]: Abonar servicio');
        end;

      if ((Tipo_Operacion = 6) and (Assigned(EnviosDinero))) then
      begin
        if not Cob_EnvioDineroCommit(idRem) then
        begin
         Cob_CancelaRemServ(idTda, idRem);
          raise Exception.Create('[ ERROR ]: Imposible confirmar envio de dinero');
        end;
      end;

      // Pagos Venta Directa
      if Tipo_Operacion = 10 then
        if not GrabaVD Then
        Begin
          Cob_CancelaRemServ(idTda, idRem);
          raise Exception.Create('No se pudo generar cobro');
        End;


//      if frFormasPago.Tarjeta <> 0 Then
//        if not Cob_ImprimeCompTarjera then
//          Errorlog('[ ERROR ]: Imprimir Comprobante tarjeta: ');

      if (Tipo_Operacion <> 6) and (Tipo_Operacion <> 9) then
        if not Cob_ImprimeTicket then
          Errorlog('[ ERROR ]: Imprimir ticket: ');

      if ((tipoServicio = 1) and (Pos(inttostr(Tipo_Operacion),'15') > 0))then
        if not Cob_ImprimeCompServicio then
          Errorlog('[ ERROR ]: Imprimir Comprobante servicio: ');

      if (tipoServicio = 2) and (Tipo_Operacion = 9) then
        if not Cob_ImprimeCompSeguro then
          Errorlog('[ ERROR ]: Imprimir Comprobante de seguro: ');

      if _CobsiTarjeta then
        if not Cob_ActivaTarjeta then
          Errorlog('[ ERROR ]: Activa tarjeta');
    Except
      on e : exception do
      begin
        Log('Remision: Favor de volver a grabar ' + e.Message );
        ShowMessage('Remision: Favor de volver a grabar ');
        Exit;
      end;
    End;
  Finally
    if salida = 1 then
    begin
      MaxID := idRem;
      Inicializa;
    end;
  End;
end;

procedure TfrCapRem.acCteMayoreoExecute(Sender: TObject);
Var
  CteMayoreo : TfrCteMayoreo;
begin
  inherited;
  CteMayoreo := TfrCteMayoreo.Create(Self);
  CteMayoreo.Muestra;
  edCliente.Text := CteMayoreo.mData.FieldByName('nombre').AsString;
  FCteMayor := CteMayoreo.idMayoreo;
  CteMayoreo.Free;
  GridCap.SetFocus;
end;

procedure TfrCapRem.acEnviosDineroExecute(Sender: TObject);
var
  Comp : Tfrempresas;
  ClaseServicios, idEmp: Integer;
  Aviso: TfrAvisodePrivWU;
begin
  try
    if not(ValidaArticulo(1)) then
      Exit;

    if detalle.RecordCount > 0 then
      exit;

    idEmp := -1;

    Comp := Tfrempresas.Create(nil);
    Comp.ClaseServicios := 6;
    Comp.Muestra;

    if Comp.ModalResult = mrOk then
      idEmp := Comp.mEmpresas.FieldByName('id').AsInteger;

    FreeAndNil(Comp);

    if idEmp <= 0 then
      Exit;

    if Assigned(EnviosDinero) then
      FreeAndNil(EnviosDinero);

    EnviosDinero := TfrEnviosDinero.Create(nil);
    EnviosDinero.compania  := 'ENVIO DE DINERO';
    EnviosDinero.idEmpresa := idEmp;
    EnviosDinero.ShowBarra := False;

    if (idEmp = 58) then
    begin
      if not FileExists(ExtractFilePath(ParamStr(0))+'AVISO DE PRIVACIDAD WU.txt') then
      begin
        ShowMessage('Solicite su aviso de privacidad al departamento de Sistemas');
        exit;
      end;
      Aviso := TfrAvisodePrivWU.Create(Self);
      Aviso.ShowModal;
      if Aviso.ModalResult = mrCancel then
        exit;
    end;
    if EnviosDinero.Tipo_Op <> 6 then
	  begin
      ShowMessage('Error: Tipo_Operación incorrecto, favor de reportar a sistemas.');
       if Assigned(EnviosDinero) then
        FreeAndNil(EnviosDinero);
      Exit;
    end;
    EnviosDinero.acLealtadExecute(self);
    EnviosDinero.ShowModal;

    if EnviosDinero.ModalResult <> mrOK then
    begin
        if Assigned(EnviosDinero) then
        FreeAndNil(EnviosDinero);
      exit;
    end;

    Tabla.Close;
    Tabla.ParamByName('pnom').AsString := EnviosDinero.codigo;
    Tabla.Open;

    Tipo_Operacion := Tabla.FieldByName('Tipo_Operacion').AsInteger;

    if NotaFacturable = -1 then
      NotaFacturable := tabla.FieldByName('facturable').AsInteger;

    if NotaFacturable <> tabla.FieldByName('facturable').AsInteger then
    begin
      detalle.Cancel;
      raise Exception.Create('No se pueden cobrar articulos " facturables " y " NO facturables "'+#13 +'en la misma venta');
      exit;
    end;

    if Tabla.IsEmpty then
      raise Exception.Create('Error: articulo no registrado para su venta');

    ibArticulos.Close;
    ibArticulos.ParamByName('idArt').AsInteger := EnviosDinero.idArticulo;
    ibArticulos.Open;

    if ibArticulos.IsEmpty then
      raise Exception.Create('Error: articulo no registrado para su venta');

    DetalleCodigo.OnChange := nil;
    Detalle.Append;
    Detalle.FieldByName('Descuento').AsFloat      := 0;
    Detalle.FieldByName('iva').AsInteger          := ibArticulos.FieldByName('iva').AsInteger;
    Detalle.FieldByName('allow').AsString         := ibArticulos.FieldByName('allow').AsString;
    Detalle.FieldByName('Cantidad').AsInteger     := 1;
    Detalle.FieldByName('idalias').AsInteger      := Tabla.FieldByName('idalias').AsInteger;
    Detalle.FieldByName('IdArticulo').AsInteger   := Tabla.FieldByName('idArticulo').AsInteger;
    Detalle.FieldByName('Codigo').AsString        := Tabla.fieldByName('Codigo').AsString;
    Detalle.FieldByName('Descripcion').AsString   := Tabla.fieldByName('Descripcion').AsString;
    Detalle.FieldByName('TipoImpuesto').AsInteger := tabla.FieldByName('TIPO_IMPUESTO').AsInteger;
    Detalle.FieldByName('factor').AsFloat         := tabla.FieldByName('factor').AsFloat;
    Detalle.FieldByName('pSinImp').AsFloat        := EnviosDinero.edEnviar.EditValue;{EnviosDinero.edTotal.EditValue / (1+tabla.FieldByName('factor').AsFloat)};
    Detalle.FieldByName('Precio').AsFloat         := EnviosDinero.edEnviar.EditValue;{EnviosDinero.edTotal.EditValue ;}
    Detalle.FieldByName('Costo').AsFloat          := 0;//EnviosMG.Costo;
    DetalleTOTIMP.AsFloat := (DetallePRECIO.AsFloat - DetallePSINIMP.AsFloat) * DetalleCANTIDAD.AsFloat;
    Detalle.FieldByName('facturable').AsInteger := tabla.FieldByName('facturable').AsInteger;
    nReg := nReg + 1;
    Detalle.FieldByName('id').AsInteger := nReg;
    Detalle.Post;
    TipoServicio := 1;
    Detalle.Append;
    DetalleCodigo.OnChange := DetalleCodigoChange;
	  EnviosDinero.qArticulosC.Close;
    Enviosdinero.qArticulosC.ParamByName('idarticulo').AsInteger := EnviosDinero.idArticulo;
    EnviosDinero.qArticulosC.Open;

    if EnviosDinero.qArticulosC.FieldByName('sku_c').AsString <> '' then
      begin
        Tabla.Close;
        Tabla.ParamByName('pnom').AsString := EnviosDinero.qArticulosC.FieldByName('codigo_c').AsString;
        Tabla.Open;

        if Tabla.IsEmpty then
          raise Exception.Create('Error: articulo_comision no registrado para su venta');

        ibArticulos.Close;
        ibArticulos.ParamByName('idArt').AsInteger := EnviosDinero.qArticulosC.FieldByName('idArticulo_c').AsInteger;
        ibArticulos.Open;

        if ibArticulos.IsEmpty then
          raise Exception.Create('Error: articulo_comision no registrado para su venta');

        DetalleCodigo.OnChange := nil;
        Detalle.Append;
        Detalle.FieldByName('Descuento').AsFloat      := 0;
        Detalle.FieldByName('iva').AsInteger          := ibArticulos.FieldByName('iva').AsInteger;
        Detalle.FieldByName('allow').AsString         := ibArticulos.FieldByName('allow').AsString;
        Detalle.FieldByName('Cantidad').AsInteger     := 1;
        Detalle.FieldByName('idalias').AsInteger      := Tabla.FieldByName('idalias').AsInteger;
        Detalle.FieldByName('IdArticulo').AsInteger   := Tabla.FieldByName('idArticulo').AsInteger;
        Detalle.FieldByName('Codigo').AsString        := Tabla.fieldByName('Codigo').AsString;
        Detalle.FieldByName('Descripcion').AsString   := Tabla.fieldByName('Descripcion').AsString;
        Detalle.FieldByName('TipoImpuesto').AsInteger := tabla.FieldByName('TIPO_IMPUESTO').AsInteger;
        Detalle.FieldByName('factor').AsFloat         := tabla.FieldByName('factor').AsFloat;
        Detalle.FieldByName('pSinImp').AsFloat        := StrToFloat(EnviosDinero.edComision.Text) / (1+tabla.FieldByName('factor').AsFloat);
        Detalle.FieldByName('Precio').AsFloat         := StrToFloat(EnviosDinero.edComision.Text)+ StrToFloat(EnviosDinero.edIVA.Text);
        Detalle.FieldByName('Costo').AsFloat          := 0;
        DetalleTOTIMP.AsFloat := (DetallePRECIO.AsFloat - DetallePSINIMP.AsFloat) * DetalleCANTIDAD.AsFloat;
        Detalle.FieldByName('facturable').AsInteger := tabla.FieldByName('facturable').AsInteger;
        nReg := nReg + 1;
        Detalle.FieldByName('id').AsInteger := nReg;
        Detalle.Post;
        Detalle.Append;
        DetalleCodigo.OnChange := DetalleCodigoChange;
      end;
    if nTarjeta <> '' then
    begin
      acClientes.Enabled := false;
      nTarjeta := '';
    end;
  Except
    on e:Exception do
    Begin
      Log(e.Message);
      ShowMessage('ERROR: Envio de dinero');
      if Assigned(EnviosDinero) then
        FreeAndNil(EnviosDinero);
    End;
  End;
  if Detalle.RecordCount > 0 then
    acCobrarExecute(self);
end;

procedure TfrCapRem.acHerbalifeExecute(Sender: TObject);
begin
  //
end;

procedure TfrCapRem.acPagoServiciosDLExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrCapRem.acPagoServiciosExecute(Sender: TObject);
var
  PS : TfrServicios;
  Comp : Tfrempresas;
  cod : Variant;
  ClaseServicios: Integer;
begin
  inherited;
  try

    if not(ValidaArticulo(1)) then
      Exit;

    if detalle.RecordCount > 0 then
      exit;

    if Sender = acPagoServicios then
      ClaseServicios := 1
    else
      ClaseServicios := 2;

    Comp := Tfrempresas.Create(Application);
    Comp.ClaseServicios := ClaseServicios;
    Comp.Muestra;

    if Comp.ModalResult <> mrOk then
      exit;

    PS := TfrServicios.Create(Application);
    PS.compania := Comp.Compania;
    PS.ClaseServicios := ClaseServicios;
    PS.muestra;

    if PS.ModalResult = mrOk then
    begin
      xSKU         := PS.xSKU;
      xReferencia  := PS.xReferenciaDeServicio;
      xMONTO       := PS.xMonto;
      xPayment     := PS.xPayment;
      xCompania    := PS.Compania;
      xSevTelcel   := PS.xSerTelcel;
      xComision    := PS.xComision;

      mServicios.Close;
      mServicios.Open;

      mServicios.Append;
      mServicios.FieldByName('idservicio').AsInteger  := PS.idServicio;
      mServicios.FieldByName('codigo').AsString       := Ps.mServicios.FieldByName('codigo').AsString;
      mServicios.FieldByName('clase').AsInteger       := PS.clase;
      mServicios.FieldByName('monto').AsFloat         := PS.edMonto.EditValue;
      mServicios.FieldByName('Sku').AsString          := PS.mServicios.FieldByName('SKU').AsString;
      mServicios.FieldByName('Celular').AsString      := PS.edCel1.Text;
      mServicios.FieldByName('status').AsInteger      := 0;
      mServicios.FieldByName('Referencia').AsString   := PS.edReferencia.Text;
      mServicios.FieldByName('DV').AsString           := PS.edDV.Text;
      mServicios.FieldByName('codigoBarra').AsString  := PS.edCodigo.Text;
      mServicios.FieldByName('idPago').AsInteger      := -1;
      mServicios.FieldByName('empresa').AsString      := PS.mServicios.FieldByName('empresa').AsString;

      Tabla.Close;
      Tabla.ParamByName('pnom').AsString := Ps.mServicios.FieldByName('codigo').AsString;
      Tabla.Open;

      Tipo_Operacion := Tabla.FieldByName('Tipo_Operacion').AsInteger;

    if NotaFacturable = -1 then
      NotaFacturable := tabla.FieldByName('facturable').AsInteger;

    if NotaFacturable <> tabla.FieldByName('facturable').AsInteger then
    begin
      detalle.Cancel;
      raise Exception.Create('No se pueden cobrar articulos " facturables " y " NO facturables "'+#13 +'en la misma venta');
      exit;
    end;

      if Tabla.IsEmpty then
        raise Exception.Create('Error: articulo no registrado para su venta');

      ibArticulos.Close;
      ibArticulos.ParamByName('idArt').AsInteger := Ps.mServicios.FieldByName('idArticulo').AsInteger;
      ibArticulos.Open;

      if ibArticulos.IsEmpty then
        raise Exception.Create('Error: articulo no registrado para su venta');

      mServicios.Post;

      DetalleCodigo.OnChange := nil;
      Detalle.Append;
      Detalle.FieldByName('Descuento').AsFloat      := 0;
      Detalle.FieldByName('iva').AsInteger          := ibArticulos.FieldByName('iva').AsInteger;
      Detalle.FieldByName('allow').AsString         := ibArticulos.FieldByName('allow').AsString;
      Detalle.FieldByName('Cantidad').AsInteger     := 1;
      Detalle.FieldByName('idalias').AsInteger      := Tabla.FieldByName('idalias').AsInteger;
      Detalle.FieldByName('IdArticulo').AsInteger   := Tabla.FieldByName('idArticulo').AsInteger;
      Detalle.FieldByName('Codigo').AsString        := Tabla.fieldByName('Codigo').AsString;
      Detalle.FieldByName('Descripcion').AsString   := Tabla.fieldByName('Descripcion').AsString;
      Detalle.FieldByName('TipoImpuesto').AsInteger := tabla.FieldByName('TIPO_IMPUESTO').AsInteger;
      Detalle.FieldByName('factor').AsFloat         := tabla.FieldByName('factor').AsFloat;
      Detalle.FieldByName('pSinImp').AsFloat        := PS.Precio / (1+tabla.FieldByName('factor').AsFloat);
      Detalle.FieldByName('Precio').AsFloat         := PS.Precio;
      Detalle.FieldByName('Costo').AsFloat          := Ps.Costo;
      DetalleTOTIMP.AsFloat := (DetallePRECIO.AsFloat - DetallePSINIMP.AsFloat) * DetalleCANTIDAD.AsFloat;
      Detalle.FieldByName('facturable').AsInteger := tabla.FieldByName('facturable').AsInteger;
      nReg := nReg + 1;
      Detalle.FieldByName('id').AsInteger := nReg;
      Detalle.Post;
      TipoServicio := 1;
      Detalle.Append;
      DetalleCodigo.OnChange := DetalleCodigoChange;

      if Ps.mServicios.FieldByName('sku_c').AsString <> '' then
      begin
        Tabla.Close;
        Tabla.ParamByName('pnom').AsString := Ps.mServicios.FieldByName('codigo_c').AsString;
        Tabla.Open;

        if Tabla.IsEmpty then
          raise Exception.Create('Error: articulo_comision no registrado para su venta');

        ibArticulos.Close;
        ibArticulos.ParamByName('idArt').AsInteger := Ps.mServicios.FieldByName('idArticulo_c').AsInteger;
        ibArticulos.Open;

        if ibArticulos.IsEmpty then
          raise Exception.Create('Error: articulo_comision no registrado para su venta');

        DetalleCodigo.OnChange := nil;
        Detalle.Append;
        Detalle.FieldByName('Descuento').AsFloat      := 0;
        Detalle.FieldByName('iva').AsInteger          := ibArticulos.FieldByName('iva').AsInteger;
        Detalle.FieldByName('allow').AsString         := ibArticulos.FieldByName('allow').AsString;
        Detalle.FieldByName('Cantidad').AsInteger     := 1;
        Detalle.FieldByName('idalias').AsInteger      := Tabla.FieldByName('idalias').AsInteger;
        Detalle.FieldByName('IdArticulo').AsInteger   := Tabla.FieldByName('idArticulo').AsInteger;
        Detalle.FieldByName('Codigo').AsString        := Tabla.fieldByName('Codigo').AsString;
        Detalle.FieldByName('Descripcion').AsString   := Tabla.fieldByName('Descripcion').AsString;
        Detalle.FieldByName('TipoImpuesto').AsInteger := tabla.FieldByName('TIPO_IMPUESTO').AsInteger;
        Detalle.FieldByName('factor').AsFloat         := tabla.FieldByName('factor').AsFloat;
        Detalle.FieldByName('pSinImp').AsFloat        := StrToFloat(PS.edComision.Text) / (1+tabla.FieldByName('factor').AsFloat);
        Detalle.FieldByName('Precio').AsFloat         := StrToFloat(PS.edComision.Text);
        Detalle.FieldByName('Costo').AsFloat          := 0;
        DetalleTOTIMP.AsFloat := (DetallePRECIO.AsFloat - DetallePSINIMP.AsFloat) * DetalleCANTIDAD.AsFloat;
        Detalle.FieldByName('facturable').AsInteger := tabla.FieldByName('facturable').AsInteger;
        nReg := nReg + 1;
        Detalle.FieldByName('id').AsInteger := nReg;
        Detalle.Post;
        Detalle.Append;
        DetalleCodigo.OnChange := DetalleCodigoChange;
      end;
    end;
    if nTarjeta <> '' then
      ShowMessage('No se permite acumular puntos en compra de tiempo aire o pago de serivcios');
    acClientes.Enabled := false;
    nTarjeta := '';
    Except
    on e : exception do
    begin
      Log('Error pago de servicios ' + e.Message);
      MessageDlg('Error pago de servicios ', mtError, [mbOK], 1);
    end;
  end;
end;

procedure TfrCapRem.acRemesasExecute(Sender: TObject);
var
  Comp : Tfrempresas;
  ClaseServicios, idEmp: Integer;
  Compania : String;
begin
  try
    if not(ValidaArticulo(1)) then
      Exit;

    if detalle.RecordCount > 0 then
      exit;

    idEmp := -1;
    if Assigned(PagosRemesas) then
      FreeAndNil(PagosRemesas);

    PagosRemesas := TfrPagosRemesas.Create(nil);
    PagosRemesas.Compania := 'REMESAS';
    PagosRemesas.ShowBarra := False;
    PagosRemesas.acLealtadExecute(self);
    PagosRemesas.ShowModal;

    if PagosRemesas.ModalResult <> mrOK then
    begin
      if Assigned(PagosRemesas) then
        FreeAndNil(PagosRemesas);
      exit;
    end;
  Except
    on e:Exception do
    Begin
      Log(e.Message);
      if Assigned(PagosRemesas) then
        FreeAndNil(PagosRemesas);
    End;
  End;
  FreeAndNil(PagosRemesas);
  Exit;
end;

procedure TfrCapRem.acBuscarExecute(Sender: TObject);
var
  art : TfrVeArticulos;
  i : integer;
  cod : Variant;
  a : TCaption;
  t : Boolean;
begin
  inherited;
  try
    art := TfrVeArticulos.Create(self);
    art.ShowModal;
    if art.ModalResult = mrOk then
    begin
      tvCap.ViewData.DataController.Cancel;
      tvCap.ViewData.DataController.AppendRecord;
      i := tvCap.ViewData.RowCount-1;
      tvCap.ViewData.Records[i].Values[0] := art.qSeek.FieldByName('codigo').AsString;
      cod := art.qSeek.FieldByName('codigo').AsString;
      t := true;
      tvCapCodigoPropertiesValidate(tvCap,Cod,a,t);
      Detalle.Cancel;
      Detalle.Append;
      DetalleCODIGO.AsString := art.qSeek.FieldByName('codigo').AsString;
    end;
  finally
    art.Free;
    GridCap.SetFocus;
    detalle.Append;
  end;
end;

procedure TfrCapRem.acCancelarExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Realmente quiere Cancelar?','Cerrar',
  MB_ICONWARNING or MB_YESNO or MB_APPLMODAL) = mrYes then
  begin
    RemisionCancelada;
    Inicializa;
  end;
end;

procedure TfrCapRem.acSalirExecute(Sender: TObject);
begin
  if Application.MessageBox('Realmente quiere cerrar?','Cerrar',
  MB_ICONWARNING or MB_YESNO or MB_APPLMODAL) = mrYes then
  begin
    RemisionCancelada;
    inherited;
    Detalle.CancelUpdates;
    Detalle.Close;
    Maestro.Close;
    close;
  end;
end;

procedure TfrCapRem.acServiciosExecute(Sender: TObject);
var
 ser: TfrSelectServicio;
 DiaActivo : TIBQuery;
begin
  inherited;
  if pVendedores.Visible then
    cxButton1Click(Self);

  DiaActivo := TIBQuery.Create(Application);
  try
    DiaActivo.Database := frDatos.dbK;
    DiaActivo.Close;
    DiaActivo.SQL.Clear;
    DiaActivo.SQL.Add('select * from Dias');
    DiaActivo.SQL.Add('where idtienda = :idTda and fecha = :xFecha');
    DiaActivo.ParamByName('idTda').AsInteger := frDatos.idTienda;
    DiaActivo.ParamByName('xFecha').AsDate := Cajas.xFechaLaboral;
    DiaActivo.Open;
    if DiaActivo.FieldByName('activo').AsInteger  <> 1 then
    begin
      ShowMessage('El sistema de cobro no esta disponible por el momento.');
      Inicializa;
      Exit;
    end;
  finally
    DiaActivo.Close;
    DiaActivo.Free;
  end;

  ser := TfrSelectServicio.Create(Application);

  if ser._Cerrar then
  begin
    ser.Free;
    Exit;
  end;

  ser.ShowModal;
  if ser.ModalResult <> mrOk then
    exit;

  if ((ser.mServiciosTipo_Operacion.AsInteger = 3) and (TipoServicio = 1)) then
    exit;

  case ser.mServiciosTipo_Operacion.AsInteger of
    1 : acPagoServiciosExecute(acPagoServicios);
    2 : acHerbalifeExecute(acHerbalife);
    3 : acClientesExecute(acClientes);
    4 : acRemesasExecute(acRemesas);
    5 : acPagoServiciosExecute(acPagoServiciosDL);
    6 : acEnviosDineroExecute(acEnviosDinero);
    9 : acVentaSegurosExecute(acVentaSeguros);
   10 : acCteMayoreoExecute(Self); // acCobrosVDExecute(Self);
  end;
  ser.Free;
end;

procedure TfrCapRem.MetePago(aClase: String; aImporte: Double; xid: Integer; aCambio: Double; aPago: Integer;
                             tarjeta: String = ''; WaldosPay: String = ''; Autoriza: String = '');
begin
  qNew.Close;
  qNew.ParamByName('id').AsInteger         := xId;
  qNew.ParamByName('idTienda').AsInteger   := idTda;
  qNew.ParamByName('idRefer').AsInteger    := idRem;
  qNew.ParamByName('Cajero').AsInteger     := Cajas.xidCaja;
  qNew.ParamByName('Fecha').AsDate         := edFecha.Date;
  qNew.ParamByName('Importe').AsFloat      := aImporte - aCambio;
  qNew.ParamByName('Cambio').AsFloat       := aCambio;
  qNew.ParamByName('Pago').AsString        := aClase;
  qNew.ParamByName('tipo_pago').AsInteger  := aPago;
  qNew.ParamByName('Clase').AsString       := 'RE';
  qNew.ParamByName('tarjeta').AsString     := tarjeta;
  qNew.ParamByName('Tipo_Operacion').AsInteger := Tipo_Operacion;
  qNew.ParamByName('WaldosPay').AsString   := WaldosPay;
  qNew.ParamByName('Autoriza').AsString    := Autoriza;
  qNew.ExecSQL;
end;

function TfrCapRem.GetFolio: Integer;
Var
  q : TIBQuery;
  m, n : Integer;
begin
  Try
    q := TIBQuery.Create(Self);
    q.Database := Maestro.Database;
    q.Transaction := Maestro.Transaction;

    n := -1;

    if siReinicia then
    Begin
      q.Close;
      q.SQL.Clear;
      q.SQL.Add('Select * from folios');
      q.SQL.Add('Where id = :xID');
      q.ParamByName('xid').AsInteger := Reinicia;
      q.Open;

      if q.FieldByName('activo').AsInteger = 1 then
      begin
//        n := q.FieldByName('Folio').AsInteger;
        qNew := TIBQuery.Create(nil);
        qNew.Database := Maestro.Database;
        qNew.Transaction := Maestro.Transaction;
        qNew.Close;
        qNew.SQL.Clear;
        qNew.SQL.Add('SET GENERATOR gen_remision_folio TO '+inttostr(q.FieldByName('Folio').AsInteger)+';');
        qNew.ExecSQL;
      end;
    End;

   // if n = -1 then Begin
     { q.Close;
      q.SQL.Clear;
      q.SQL.Add('Select max(folio) from remision');
      q.SQL.Add('Where idTienda = :idTda and idRemision >= :id');
      q.ParamByName('idTda').AsInteger := idTda;
      q.ParamByName('id').AsInteger    := maxID; //m;
      q.Open;
      n := q.FieldByName('Max').AsInteger + 1; }
      n := MaximoGenerador(maestro,'GEN_REMISION_FOLIO');
   // End;
  Finally
    q.Close;
    q.Free;
  End;
  GetFolio := n
end;

function TfrCapRem.GetNivelAutorizacion: Integer;
Var
  Menos : Boolean;
begin
  Detalle.DisableControls;
  Menos := False;
  Detalle.First;

  While not Detalle.Eof do
  Begin
    if Detalle.FieldByName('Cantidad').AsInteger < 0 Then
      Menos := True;
    Detalle.Next;
  End;

  Detalle.EnableControls;
  FNivelAutorizacion := 0;

  if Menos Then
    FNivelAutorizacion := 1;
  if Importe < -3 Then
    FNivelAutorizacion := 21;
  if Maestro.FieldByName('Descuento').AsFloat > frDatos.TdaLocal.FieldByName('Descuento').AsFloat Then
    FNivelAutorizacion := 20;
  if edDescuento.Value > frDatos.TdaLocal.FieldByName('Descuento').AsFloat Then
    FNivelAutorizacion := 20;

  Result := FNivelAutorizacion;
end;

procedure TfrCapRem.edDescuentoExit(Sender: TObject);
begin
  inherited;
  PromoVtas.dGlobal := edDescuento.EditValue;
  PromoVtas.ValidaPromo;
//  edCliente.Text := FormatDateTime('hh:mm:ss.zzz', PromoVtas.Tiempo);
  PonTotales;
end;

Procedure LogAcumulaPuntos(aEnvia : BlCollectRequest; SL : TSTringList; Otro : String);
begin
  try
    log(LogLealtad,'Manda acumulacion ---');

    if Assigned(aEnvia) then
    begin
      log(LogLealtad,'Pan='+aEnvia.Pan);
      log(LogLealtad,'PosTraceNumber='+aEnvia.PosTraceNumber);
      log(LogLealtad,'LocalTime='+aEnvia.LocalTime);
      log(LogLealtad,'LocalDate='+aEnvia.LocalDate);
      log(LogLealtad,'TerminalId='+aEnvia.TerminalId);
      log(LogLealtad,'OperatorId='+aEnvia.OperatorId);
      log(LogLealtad,'OperatorName='+aEnvia.OperatorName);
      log(LogLealtad,'SupervisorName='+aEnvia.SupervisorName);
      log(LogLealtad,'SupervisorId='+aEnvia.SupervisorId);
      log(LogLealtad,'PayMTD='+aEnvia.PayMTD);
      log(LogLealtad,'TrxAmount='+aEnvia.TrxAmount);
      log(LogLealtad,'TrxTotalAmount='+aEnvia.TrxTotalAmount);
      log(LogLealtad,'Products='+aEnvia.Products);
    end;

    if Assigned(sl) then
    begin
      log(LogLealtad,'----- Respuesta -----');
      log(LogLealtad,SL.Text);
    end;

    log(LogLealtad,Otro);
    log(LogLealtad,'');
  Except
    log(LogLealtad,'Error log');
  end;
end;

function TfrCapRem.AcumulaPuntos(lDetalle: String) : Boolean;
var
  Envia : BlCollectRequest;
  resp: OperationResponse;
  PuntosOk : Boolean;
  sl :  tstringlist;
//  lPagos : string;
  SupervisorName : String;
  SupervisorId : String;
  PideAuto: TfrPIdeAuto;
  xCode : String;
begin
  try
    // Acumulacion de puntos
    xResultado := true;
    if (frFormasPago.Importe - frFormasPago.Lealtad) <= 0 then
      Exit;

    if nTarjeta <> '' then
    Begin
      try
        xResultado := false;
        Envia := BlCollectRequest.Create;
        envia.Pan := nTarjeta;
        envia.PosTraceNumber := NewPosTraceNumber;
        envia.LocalTime := FormatDateTime('HHMMSS', now);
        envia.LocalDate := FormatDateTime('MMDD', Cajas.xFechaLaboral);
        envia.TerminalId := _TerminalID;
        envia.OperatorId := IntToStr(Abs(frDatos.idUser));
        envia.OperatorName := Copy(frDatos.NombreUser, 1, 20);
        envia.SupervisorName := copy(_nomb,0,20);
        envia.SupervisorId := _idvend;
        envia.PayMTD := frFormasPago.LPagos;
        envia.TrxAmount := FormatFloat('0.00', frFormasPago.Importe - frFormasPago.Lealtad);
        envia.TrxTotalAmount := FormatFloat('0.00', frFormasPago.Importe);
        envia.Products := LDetalle;

//        Log('Pan '+nTarjeta, 'Blue');
//        Log('PosTraceNumber '+NewPosTraceNumber, 'Blue');
//        Log('LocalTime '+FormatDateTime('HHMMSS', now), 'Blue');
//        Log('LocalDate '+FormatDateTime('MMDD', Cajas.xFechaLaboral), 'Blue');
//        Log('TerminalId '+_TerminalID, 'Blue');
//        Log('OperatorId '+IntToStr(Abs(frDatos.idUser)), 'Blue');
//        Log('OperatorName '+Copy(frDatos.NombreUser, 1, 20), 'Blue');
//        Log('SupervisorName '+copy(_nomb,0,20), 'Blue');
//        Log('SupervisorId '+_idvend, 'Blue');
//        Log('PayMTD '+frFormasPago.LPagos, 'Blue');
//        Log('TrxAmount '+FormatFloat('0.00', frFormasPago.Importe - frFormasPago.Lealtad), 'Blue');
//        Log('TrxTotalAmount '+FormatFloat('0.00', frFormasPago.Importe), 'Blue');
//        Log('Products '+LDetalle, 'Blue');

        try
          PuntosOk := true;
          resp := OperationResponse.Create;
          resp := (frDatos.httpriorLealtad as IService1).BlCollect(envia);
        except
          on e: Exception do
          Begin
            PuntosOk := false;
            xResultado := true;
            Log('Error al acumular puntos : ' +e.Message);
          End;
        end;

        if PuntosOk then
        begin
          sl :=  tstringlist.Create;
          sl := GetOperationResponse(resp,'XML_INFO_DATA');

          if sl.Values['RESPONSE_CODE'] = '00' then
          begin
            qPuntos.Close;
            qPuntos.ParamByName('idtienda').AsInteger := idTda;
            qPuntos.ParamByName('idremision').AsInteger := idRem;
            qPuntos.ParamByName('Tarjeta').AsString := nTarjeta;
            qPuntos.ParamByName('fecha').AsDate := cajas.xFechaLaboral;
            qPuntos.ParamByName('autorizacion').AsString := sl.Values['AUTHORIZATION_ID'];
            qPuntos.ParamByName('puntos').AsFloat := StrToFloat(sl.Values['TransactionPoints']);
            qPuntos.ParamByName('total_puntos').AsFloat := StrToFloat(sl.Values['TotalPoints']);
            qPuntos.ParamByName('status').AsInteger := 1;
            qPuntos.ExecSQL;
            PuntosAcumula := StrToFloat(sl.Values['TransactionPoints']);
            xResultado := true;
          end else
          begin
            Log(sl.Values['POS_TEXT']);
            xCode := GetCodigo(sl.Values['POS_TEXT'],' ',1);

            if MatchStr(xCode,_aAcumula) then
            begin
              Herror('Se requiere autorizacion para realizar este movimiento  : '+#13+sl.Values['POS_TEXT']);
              PideAuto := TfrPIdeAuto.Create(Self);

              try
                PideAuto.MiFecha := False;
                PideAuto.ShowModal;
                if PideAuto.ModalResult = mrCancel then
                begin
                  if MessageBox(0,pchar('Autorizacion no valida, NO se acumularan puntos a la tarejta '+#13+'Desea continuar'),
                                'gpxSOFT',mb_TaskModal+mb_IconQuestion+mb_YesNo + mb_DefButton2) = idYes Then
                    xResultado := true
                  else
                  begin
                    xResultado := false;
                    _idVend := '';
                    _nomb :=  '';
                    AcumulaPuntos(lDetalle);
                  end;
                  exit;
                end;

                _idVend := inttostr(PideAuto.iSeek.FieldByName('id').AsInteger);
                _nomb :=  PideAuto.iSeek.FieldByName('nombre').AsString;
                _nomb := StringReplace(_nomb, 'Ñ', 'N', [rfReplaceAll]);
                _nomb := StringReplace(_nomb, 'ñ', 'n', [rfReplaceAll]);
                _nomb := StringReplace(_nomb, '?', '', [rfReplaceAll]);
                AcumulaPuntos(lDetalle);
              finally
                PideAuto.Free;
              end;
            end else
            begin
              LogAcumulaPuntos(Envia,SL,'');
              Herror('No se permite acumular puntos : '+#13+sl.Values['POS_TEXT']);
            end;
          end; // if RESPONSE_CODE = 00
        end else
        begin  // if PuntosOk
          MeteChismes(Maestro,idtda,idrem,'TR003',LocalTransaction);
          qPuntos.Close;
          qPuntos.ParamByName('idtienda').AsInteger := idTda;
          qPuntos.ParamByName('idremision').AsInteger := idRem;
          qPuntos.ParamByName('Tarjeta').AsString := nTarjeta;
          qPuntos.ParamByName('fecha').AsDate := cajas.xFechaLaboral;
          qPuntos.ParamByName('autorizacion').AsInteger := -1;
          qPuntos.ParamByName('puntos').AsFloat := 0;
          qPuntos.ParamByName('total_puntos').AsFloat := 0;
          qPuntos.ParamByName('status').AsInteger := 0;
          qPuntos.ExecSQL;
        end;
      finally
       sl.Free;
       resp.Free;
       Envia.Free;
      end;
    End;
  finally
    Result := xResultado;
  end;
end;

procedure TfrCapRem.acVentaSegurosExecute(Sender: TObject);
var
  Comp : Tfrempresas;
  datos: TfrDatos;
  ClaseServicios, idEmp: Integer;
  qCodigo: TIBQuery;
begin

  try
    if not(ValidaArticulo(0)) then
      Exit;

    if detalle.RecordCount > 0 then
      exit;

    idEmp := -1;

    Comp := Tfrempresas.Create(nil);
    Comp.ClaseServicios := 9;
    Comp.Muestra;

    if Comp.ModalResult = mrOk then
      idEmp := Comp.mEmpresas.FieldByName('id').AsInteger;

    FreeAndNil(Comp);

    if idEmp <= 0 then
      Exit;
   qCodigo := TIBQuery.Create(nil);
   qCodigo.Database := frDatos.dbK;
   qCodigo.Close;
   qCodigo.SQL.Clear;
   qCodigo.SQL.Add('select a.idarticulo, a.codigo, a.descripcion, s.empresa, s.orden,');
   qCodigo.SQL.Add('s.sku_c, a.tipo_operacion, s.idservicio from articulos a');
   qCodigo.SQL.Add('join servicios s on s.idarticulo = a.idarticulo');
   qCodigo.SQL.Add('where s.idempresa = :idEmp');
   qCodigo.ParamByName('idEmp').AsInteger := idEmp;
   qCodigo.Open;


    Tabla.Close;
    Tabla.ParamByName('pnom').AsString := qCodigo.FieldByName('codigo').Asstring;
    Tabla.Open;

    Tipo_Operacion := Tabla.FieldByName('Tipo_Operacion').AsInteger;

    if NotaFacturable = -1 then
      NotaFacturable := tabla.FieldByName('facturable').AsInteger;

    if NotaFacturable <> tabla.FieldByName('facturable').AsInteger then
    begin
      detalle.Cancel;
      raise Exception.Create('No se pueden cobrar articulos " facturables " y " NO facturables "'+#13 +'en la misma venta');
      exit;
    end;

    if Tabla.IsEmpty then
      raise Exception.Create('Error: articulo no registrado para su venta');

    ibArticulos.Close;
    ibArticulos.ParamByName('idArt').AsInteger := qCodigo.FieldByName('idArticulo').AsInteger;
    ibArticulos.Open;

    if ibArticulos.IsEmpty then
      raise Exception.Create('Error: articulo no registrado para su venta');

    DetalleCodigo.OnChange := nil;
    Detalle.Append;
    Detalle.FieldByName('Descuento').AsFloat      := 0;
    Detalle.FieldByName('iva').AsInteger          := ibArticulos.FieldByName('iva').AsInteger;
    Detalle.FieldByName('allow').AsString         := ibArticulos.FieldByName('allow').AsString;
    Detalle.FieldByName('Cantidad').AsInteger     := 1;
    Detalle.FieldByName('idalias').AsInteger      := Tabla.FieldByName('idalias').AsInteger;
    Detalle.FieldByName('IdArticulo').AsInteger   := Tabla.FieldByName('idArticulo').AsInteger;
    Detalle.FieldByName('Codigo').AsString        := Tabla.fieldByName('Codigo').AsString;
    Detalle.FieldByName('Descripcion').AsString   := Tabla.fieldByName('Descripcion').AsString;
    Detalle.FieldByName('TipoImpuesto').AsInteger := tabla.FieldByName('TIPO_IMPUESTO').AsInteger;
    Detalle.FieldByName('factor').AsFloat         := tabla.FieldByName('factor').AsFloat;
    Detalle.FieldByName('pSinImp').AsFloat        := Tabla.FieldByName('pv1').AsInteger/(1+Tabla.FieldByName('factor').AsFloat);
    Detalle.FieldByName('Precio').AsFloat         := Tabla.FieldByName('pv1').AsInteger;
    Detalle.FieldByName('Costo').AsFloat          := 0;
    DetalleTOTIMP.AsFloat := (DetallePRECIO.AsFloat - DetallePSINIMP.AsFloat) * DetalleCANTIDAD.AsFloat;
    Detalle.FieldByName('facturable').AsInteger := tabla.FieldByName('facturable').AsInteger;
    nReg := nReg + 1;
    Detalle.FieldByName('id').AsInteger := nReg;
    Detalle.Post;
    TipoServicio := 2;
    Detalle.Append;
    DetalleCodigo.OnChange := DetalleCodigoChange;

    if nTarjeta <> '' then
    begin
      acClientes.Enabled := false;
      nTarjeta := '';
    end;
  Except
    on e:Exception do
      Log(e.Message);
  End;
  if Detalle.RecordCount > 0 then
    acCobrarExecute(self);

end;

procedure TfrCapRem.acVtaContadoExecute(Sender: TObject);
begin
  inherited;
  mDetalle.First;
  while not mDetalle.Eof do
  Begin
    if (mDetalle.FieldByName('Cambia_precio').AsInteger = 1) and
       (Detalle.Locate('id', mDetalle.FieldByName('id').AsInteger, []) ) then
    Begin
      VtaContado := 1;
      Detalle.Edit;
      Detalle.FieldByName('Precio').AsFloat := Detalle.FieldByName('Precio').AsFloat - mDetalle.FieldByName('pv_esp').AsFloat;
      Detalle.Post;
    End;
    mDetalle.Next;
  End;
  Detalle.Last;
end;

procedure TfrCapRem.AsignaArticulo;
begin
  inherited;
  {******** servicios ************}
  if not(ValidaArticulo(0)) then
    Exit;
  {******** servicios ************}

  if NotaFacturable = -1 then
    NotaFacturable := tabla.FieldByName('facturable').AsInteger;

  if NotaFacturable <> tabla.FieldByName('facturable').AsInteger then
  begin
    detalle.Cancel;
    Herror('No se pueden cobrar articulos " facturables " y " NO facturables "'+#13 +'en la misma venta');
    exit;
  end;

  Tipo_Operacion := tabla.FieldByName('Tipo_Operacion').AsInteger;

  if tabla.FieldByName('tipo_impuesto').AsInteger <= 0 then
  begin
    detalle.Cancel;
    Herror('Articulo no valido para su venta (Impuesto no asignado)');
    exit;
  end;

  ibArticulos.Close;
  ibArticulos.ParamByName('idArt').AsInteger := Tabla.FieldByName('idArticulo').AsInteger;
  ibArticulos.Open;

  iDescuentos.Close;
  iDescuentos.ParamByName('idArt').AsInteger := Tabla.FieldByName('idArticulo').AsInteger;
  iDescuentos.ParamByName('w').AsDate := edFecha.Date;
  iDescuentos.Open;

  Detalle.FieldByName('Descuento').AsFloat      := iDescuentos.FieldByName('Descuento').AsFloat;
  Detalle.FieldByName('iva').AsInteger          := ibArticulos.FieldByName('iva').AsInteger;
  Detalle.FieldByName('allow').AsString         := ibArticulos.FieldByName('allow').AsString;
  Detalle.FieldByName('Cantidad').AsInteger     := pCant;
  Detalle.FieldByName('idalias').AsInteger      := Tabla.FieldByName('idalias').AsInteger;
  Detalle.FieldByName('Servicio').AsInteger     := ibArticulos.FieldByName('Servicio').AsInteger;
  Detalle.FieldByName('TipoImpuesto').AsInteger := tabla.FieldByName('TIPO_IMPUESTO').AsInteger;
  Detalle.FieldByName('factor').AsFloat         := tabla.FieldByName('factor').AsFloat;
  //Detalle.FieldByName('pSinImp').AsFloat        := tabla.fieldByName(Precio).AsFloat / (1+tabla.FieldByName('factor').AsFloat);
  Detalle.FieldByName('facturable').AsInteger   := tabla.FieldByName('facturable').AsInteger;

  if iDescuentos.FieldByName('pv_esp').AsFloat > 0 then
  begin
    Detalle.FieldByName('Precio').AsFloat  := iDescuentos.FieldByName('pv_esp').AsFloat;
    Detalle.FieldByName('pSinImp').AsFloat := Detalle.FieldByName('Precio').AsFloat / (1+tabla.FieldByName('factor').AsFloat);
  end;
  Detalle.Post;

  mDetalle.Append;
  mDetalle.FieldByName('id').AsInteger            := nReg;
  mDetalle.FieldByName('idArticulo').AsInteger    := ibArticulos.FieldByName('idArticulo').AsInteger;
  mDetalle.FieldByName('Codigo').AsString         := ibArticulos.FieldByName('Codigo').AsString;
  mDetalle.FieldByName('Descripcion').AsString    := ibArticulos.FieldByName('Descripcion').AsString;
  mDetalle.FieldByName('Precio').AsFloat          := ibArticulos.FieldByName('pv1').AsFloat;
  mDetalle.FieldByName('Descuento').AsFloat       := iDescuentos.FieldByName('Descuento').AsFloat;
  mDetalle.FieldByName('Cantidad').AsInteger      := pCant;
  mDetalle.FieldByName('idalias').AsInteger       := Tabla.FieldByName('idalias').AsInteger;
  mDetalle.FieldByName('Servicio').AsInteger      := ibArticulos.FieldByName('Servicio').AsInteger;
  mDetalle.FieldByName('TipoImpuesto').AsInteger  := ibArticulos.FieldByName('TIPO_IMPUESTO').AsInteger;
  mDetalle.FieldByName('factor').AsFloat          := ibArticulos.FieldByName('factor').AsFloat;
  mDetalle.FieldByName('Cambia_precio').AsInteger := ibArticulos.FieldByName('cambio_precio').AsInteger;
  mDetalle.FieldByName('pv_esp').AsFloat          := ibArticulos.FieldByName('pv_esp').AsFloat;
  mDetalle.Post;

  ValidaVtaContado;

  pCant := 1;
  tvCap.DataController.Append;
end;

procedure TfrCapRem.edVendPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  edVend.Text := tvVend.Columns[2].DataBinding.Field.Value;
  idVend      := tvVend.Columns[0].DataBinding.Field.Value;
end;

procedure TfrCapRem.cxButton1Click(Sender: TObject);
begin
  inherited;
  edVend.DroppedDown := False;
  GridCap.SetFocus;
end;

procedure TfrCapRem.DeImpuestosFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  accept := DeImpuestos.FieldByName('tipo_impuesto').AsInteger = DetalleTIPOIMPUESTO.AsInteger;
end;

procedure TfrCapRem.Desglosa(vIVA, Valor: Double; var Iva, Neto: Double);
var
  Uno, Punto: Currency;
begin
  Punto := vIVA/100;   //0.16
  Uno   := 1+Punto;    //1.16

  Iva  := Valor/Uno*Punto;   //10/1.16*.16
  Neto := Valor/Uno;         //10/0.16
end;

procedure TfrCapRem.DetalleCalcFields(DataSet: TDataSet);
begin
  //inherited;
  DetalleImporte.AsFloat := (DetallePrecio.AsFloat*DetalleCantidad.AsFloat) - DetalleDescuento.AsFloat;
  DetalleImpuesto.AsFloat := (DetalleImporte.AsFloat - (DetalleImporte.AsFloat/(1+DetalleFactor.AsFloat)));
  DetalleTOTIMP.AsFloat := (DetallePRECIO.AsFloat - DetallePSINIMP.AsFloat) * DetalleCANTIDAD.AsFloat;
  DetallePvNeto.AsFloat := DetallePrecio.AsFloat / (1+DetalleFactor.AsFloat);
  DetalleDescNeto.AsFloat := DetalleDescuento.AsFloat  / (1+DetalleFactor.AsFloat);
end;

procedure TfrCapRem.MasIVA(vIVA, Valor: Double; var Iva, ConIVA: Double);
var
  Uno, Punto: Currency;
begin
  Punto := (vIVA/100) +1;  //1.16

  ConIVA := Valor*Punto;   //Valor mas iva
  Iva  := ConIva-Valor;    //valor con iva - valor sin iva
end;

procedure TfrCapRem.edVendPropertiesPopup(Sender: TObject);
begin
  inherited;
  tvVend.DataController.GotoFirst;
end;

function TfrCapRem.ValidaArt(idArt: integer; Permiso: String): Boolean;
var
  xPos: Integer;
begin
  qValart.Close;
  qValart.ParamByName('idarticulo').AsInteger := idArt;
  qValart.Open;

  Result := Pos(Permiso, qValArt.FieldByName('allow').AsString) > 0;
end;

function TfrCapRem.ValidaArticulo(idServicio: integer): Boolean;
begin
  result := true;
  if TipoServicio <> -1 then
    if TipoServicio <> idServicio then
    begin
      Detalle.Cancel;
      case idServicio of
        0 : ShowMessage('No se permite agregar articulos junto con servicios electronicos');
        1 : ShowMessage('No se permite agregar servicios electronicos junto con articulos');
      end;
      Result := false;
    end;
end;

function TfrCapRem.ValidaDepo: Boolean;
Var
  Tar, Vta, Gtos, Depo, Difer : Double;
begin
  if idRem mod 9 <> 0 Then
  Begin
    Result := False;
    Exit;
  End;

  ibSeek2.Close;
  ibSeek2.SQL.Clear;
  ibSeek2.SQL.Add('Select sum(importe) vta from Remision');
  ibSeek2.SQL.Add('Where idTienda = :idTda and fecha = :wDate');
  ibSeek2.ParamByName('idTda').AsInteger := frDatos.idTienda;
  ibSeek2.ParamByName('wDate').AsDate := Cajas.xFechaLaboral -1;
  ibSeek2.Open;
  Vta := ibSeek2.FieldByName('Vta').AsFloat;

  ibSeek2.Close;
  ibSeek2.SQL.Clear;
  ibSeek2.SQL.Add('Select sum(importe) Tar from Pagos');
  ibSeek2.SQL.Add('Where idTienda = :idTda and fecha = :wDate and pago = :xPago');
  ibSeek2.ParamByName('idTda').AsInteger := frDatos.idTienda;
  ibSeek2.ParamByName('wDate').AsDate := Cajas.xFechaLaboral -1;
  ibSeek2.ParamByName('xPago').AsString := 'TAR';
  ibSeek2.Open;
  Tar := ibSeek2.FieldByName('Tar').AsFloat;

  ibSeek2.Close;
  ibSeek2.SQL.Clear;
  ibSeek2.SQL.Add('Select sum(importe) Gtos from De_Gastos');
  ibSeek2.SQL.Add('Where idTienda = :idTda and metodo = 1 and Fecha = :wDate');
  ibSeek2.ParamByName('idTda').AsInteger := frDatos.idTienda;
  ibSeek2.ParamByName('wDate').AsDate := Cajas.xFechaLaboral -1;
  ibSeek2.Open;
  Gtos := ibSeek2.FieldByName('Gtos').AsFloat;

  ibSeek2.Close;
  ibSeek2.SQL.Clear;
  ibSeek2.SQL.Add('Select sum(importe) Depo from Deposito');
  ibSeek2.SQL.Add('Where idTienda = :idTda and Venta = :wDate and activo = 1');
  ibSeek2.ParamByName('idTda').AsInteger := frDatos.idTienda;
  ibSeek2.ParamByName('wDate').AsDate := Cajas.xFechaLaboral -1;
  ibSeek2.Open;
  Depo := ibSeek2.FieldByName('Depo').AsFloat;

  Difer := (Vta-Gtos-Tar) - Depo;
  Result := Abs(Difer) > 5;
end;

function TfrCapRem.GetRefer: String;
Var
  Txt : String;
  i : Integer;
begin
  xBusca.Close;
  xBusca.SQL.Clear;
  xBusca.SQL.Add('Select max(refer) from remision');
  xBusca.SQL.Add('where idTienda = :idTda and idRemision >= :id');
  xBusca.ParamByName('idTda').AsInteger := idTda;
  xBusca.ParamByName('id').AsInteger    := MaxID;
  xBusca.Open;
  if xBusca.FieldByName('max').AsString = '' then
    i := 1
  Else
    i := xBusca.FieldByName('max').AsInteger + 1;

  GetRefer := Ceros(IntToStr(i), 10);

  {Txt := 'Where idTienda = ' + IntToStr(idTda);
  if xSerie <> '' Then

    Txt := Txt + ' and Serie = ' + '''' + xSerie + '''';
  GetRefer :=
  Ceros(Consecutivo(Maestro,'Refer','Remision',Txt),10);}
end;

function TfrCapRem.GrabaVD: Boolean;
begin
end;

procedure TfrCapRem.edSeriePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  xSerie := edSerie.EditingValue;

  if edSerie.ItemIndex > 0 Then
  Begin
    Herror('Para cambiar la serie se requiere autorizacion');
    if Not AutorizaSer(Maestro, edNota.Text) Then
    Begin
      ShowMessage('Autorizacion no valida');
      edSerie.ItemIndex := 0;
      Exit;
    End;
  End;

  if Maestro.Modified Then
    Maestro.FieldByName('Refer').AsString := GetRefer;
end;

procedure TfrCapRem.tvCapCodigoPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
Var
  v : String;
  i : Integer;
begin
  if Trim(DisplayValue) = '' then
    Abort;

  if Pos('*', DisplayValue) > 0 Then
  Begin
    v := Copy(DisplayValue, 1, Pos('*', DisplayValue)-1);
    if TryStrToInt(v, i) then
      pCant := i
    Else
      pCant := 1;

    v := Copy(DisplayValue, Pos('*', DisplayValue)+1, length(DisplayValue));
    DisplayValue := v;
  End;

  inherited;
  i := tabla.FieldByName('servicio').AsInteger;
  v := IntToStr(i);

  if pos(v, '12') <> 0 then
  begin
    ErrorText := 'Ese codigo no existe';
    Error := True;
  end;
end;

//Funciones CapRem
Function TfrCapRem.Cob_DesgloseIva: Boolean;
var
  vDesc : Double;
  Cant, _idArt: Integer;
  imiva, imciva, de_iva, de_civa : Double;
  de_pvneto, de_cciva : Double;
  iva: Double;

  NetoLealtad : Double;
begin
  try
    Cob_DesgloseIva := False;
    Detalle.DisableControls;
    Detalle.First;

    _idArt   := 0;
    Cant     := 0;
    _CobxCosto := 0;
    vDesc    := 0;
    iva      := 0;
    _CobcIVA := 0;
    _CobImp_Desc := 0;
    de_Iva   := 0;
    de_pvneto:= 0;
    imiva    := 0;
    imciva   := 0;
    iva      := 0;
    de_cIva  := 0;
    de_cciva := 0;
    Desc_Bruto := 0;
    Desc_Neto  := 0;
    _CobTotalImpuestos := 0;

    try
      While not Detalle.Eof do
      Begin
        _idArt       := Detalle.FieldByName('idArticulo').AsInteger;
        Cant         := Detalle.FieldByName('Cantidad').AsInteger;
        _CobxCosto   := _CobxCosto + (Cant * Detalle.FieldByName('Costo').AsFloat);
        vDesc        := (DetallePrecio.AsFloat * DetalleCantidad.AsFloat) - (DetallepvNeto.AsFloat*DetalleCantidad.AsFloat);
        _Cobimp_Desc := _Cobimp_desc + vDesc;
        _CobTotalImpuestos := _CobTotalImpuestos + detalle.FieldByName('Impuesto').AsFloat;
        Desc_Neto := Desc_Neto + Detalle.FieldByName('Descneto').AsFloat;
        Desc_Bruto := Desc_Bruto + Detalle.FieldByName('Descuento').AsFloat;

        if not VAttribArt(_idArt, Cant) then
          Exit;

        {If Detalle.FieldByName('iva').AsInteger = 1 then
        begin
          Desglosa(frDatos.vIva, Detalle.FieldByName('pvNeto').AsFloat, de_Iva, de_pvneto);
          imiva := de_iva * Cant;
          iva   := iva + imiva;

          Masiva(frDatos.cIva, Detalle.FieldByName('Costo').AsFloat, de_cIva, de_cciva);
          imciva   := de_civa * Cant;
          _Cobciva := _Cobciva + imciva;
        end else
        begin
          de_pvNeto := Detalle.FieldByName('Precio').AsCurrency;
          de_cciva  := Detalle.FieldByName('Costo').AsCurrency;
        end;

        if Detalle.FieldByName('servicio').AsInteger = 3 then
          _CobsiTarjeta := True;

        Detalle.Edit;
        Detalle.FieldByName('PSinIVA').AsFloat := de_pvNeto;
        Detalle.FieldByName('PcconIva').AsFloat := de_cciva;
        Detalle.Post;}

        if Detalle.FieldByName('servicio').AsInteger = 3 then
          _CobsiTarjeta := True;


        NetoLealtad := DetallePvNeto.AsFloat - DetalleDescNeto.AsFloat; //DetalleDescuento.AsFloat;

        _CobListaDetalle := _CobListaDetalle + trim(DetalleCODIGO.AsString)+'|1|'+
                        DetalleCANTIDAD.AsString+'|'+formatFloat('0.00',NetoLealtad*DetalleCANTIDAD.AsFloat)+'|PZA|';
        Detalle.Next;
      End;
    except
    on e:Exception do
      Begin
        Log('Desglose iva : '+inttostr(idRem)+' - '+e.Message);
        Detalle.EnableControls;
        Exit;
      End;
    End;
    SetLength(F_CobListaDetalle, Length(F_CobListaDetalle)-1);
    Cob_DesgloseIva := True;
  finally
    Detalle.EnableControls;
  end;
end;

function TfrCapRem.Cob_EnvioDineroCommit(idRem: integer): Boolean;
begin
  Cob_EnvioDineroCommit := false;
  Try
    Try
      EnviosDinero.idRemision := idRem;
      if not EnviosDinero.EnviaCommit then
      begin
        Log('Envios Dinero: CommitEnvio');
        if Assigned(EnviosDinero) then
          FreeAndNil(EnviosDinero);
        raise Exception.Create('Envios Dinero: CommitEnvio');
    end;
    Except
      on e:Exception do
      Begin
        Log(e.Message);
        Exit;
      End;
    End;
  Finally
    if Assigned(EnviosDinero) then
      FreeAndNil(EnviosDinero);
  end;
  Cob_EnvioDineroCommit := true;
end;

function TfrCapRem.Cob_CalDeRemImp(Cant: Double; idDe_Rem: integer): Boolean;
var
  idPago :Integer;
begin
  Cob_CalDeRemImp := False;
  Try
    _Cobimpuesto := 0;
    _Cobimptot := 0;
    idPago := 1;
    DeImpuestos.DisableControls;
    DeImpuestos.Filtered := false;
    DeImpuestos.Filtered := true;
    Try
      DeImpuestos.First;
      while not (DeImpuestos.Eof) do
      begin
        _Cobimpuesto := _CobImpuesto + ((Detalle.FieldByName('pvNeto').AsFloat * Cant)
                                     -  Detalle.FieldByName('DescNeto').AsFloat);

        _Cobimpuesto := _Cobimpuesto * DeImpuestos.FieldByName('valor').AsFloat/100;
        //_Cobimpuesto := _Cobimpuesto * (1-(edDescuento.EditingValue/100));


        _Cobimptot   := _Cobimptot   +  _Cobimpuesto;

        qNewImpuestos.Close;
        qNewImpuestos.ParamByName('idimpuesto').AsInteger := DeImpuestos.FieldByName('idimpuesto').AsInteger;
        qNewImpuestos.ParamByName('idtienda').AsInteger   := idTda;
        qNewImpuestos.ParamByName('idremision').AsInteger := idRem;
        qNewImpuestos.ParamByName('idarticulo').AsInteger := Detalle.FieldByName('idArticulo').AsInteger;
        qNewImpuestos.ParamByName('id').AsInteger         := idDe_Rem;
        qNewImpuestos.ParamByName('DE_ID').AsInteger      := idPago;
        qNewImpuestos.ParamByName('tasa').AsFloat         := DeImpuestos.FieldByName('valor').AsFloat;
        qNewImpuestos.ParamByName('total').AsFloat        := _Cobimpuesto;
        qNewImpuestos.ExecSQL;
        idPago := idPago + 1;
        DeImpuestos.Next;
      end;
    Except
      on e:Exception do
      Begin
        Log('Calculo impuestos : '+inttostr(idDe_Rem)+' - '+e.Message);
        Exit;
      End;
    End;
    Cob_CalDeRemImp  := True;
  Finally
    DeImpuestos.EnableControls;
  End;
end;

function TfrCapRem.Cob_CancelaRemServ(_idTda, _idRem: integer): Boolean;
begin
  Cob_CancelaRemServ := False;
  try
    qCancela.Close;
    qCancela.SQL.Clear;
    qCancela.SQL.Add('Update remision set Activo = 3,');
    qCancela.SQL.Add('Nombre = '+QuotedStr('SERVICIO NO ABONADO'));
    qCancela.SQL.Add('where idTienda = :idTienda');
    qCancela.SQL.Add('and idRemision = :idRemision');
    qCancela.ParamByName('idTienda').AsInteger    := _idTda;
    qCancela.ParamByName('idRemision').AsInteger  := _idRem;
    qCancela.ExecSQL;
    LocalTransaction.Commit;
  Except
    on e : exception do
    begin
      Log('Cancela RemServ : '+inttostr(idRem)+' - '+e.Message);
      Exit;
    end;
  end;
  Cob_CancelaRemServ := True;
end;

function TfrCapRem.Cob_FormasPago(var salida : integer): Boolean;
var
  TotVta  : Currency;
  xxx : Double;
begin
  Cob_FormasPago := False;
  Try
    TotVta := RoundTo(laTotal.EditValue, -2);
    frFormasPago.Importe := TotVta;
    frFormasPago.edEfectivo.EditValue := TotVta;
    frFormasPago.Tarjeta := 0;
    frFormasPago.Lealtad := 0;
    frFormasPago.mDetalle := Detalle;

    idRem   := MaximoGenerador(Maestro,'MAXIMOREMISION');
    caption := inttostr(idrem);
    NewPosTraceNumber := ceros(Copy(inttostr(idrem), length(inttostr(idrem))-5, 6), 6, '0');

    {*********  servicios *******************}
    frFormasPago.idServivio  := TipoServicio;
    frFormasPago.mServicios  := mServicios;
    frFormasPago.xSKU        := xSKU;
    frFormasPago.xReferencia := xReferencia;
    frFormasPago.xPayment    := xPayment;
    frFormasPago.xCompania   := xCompania;
    frFormasPago.xMONTO      := xMonto;
    frFormasPago.xComision   := xComision;
    frFormasPago.xSevTelcel  := xSevTelcel;
    frFormasPago.xTipo_operacion  := Tipo_operacion;
    {****************************************}
    frFormasPago.edImporteLealtad.EditValue := 0;
    frFormasPago.xDisponibleLealtad := strtofloat(xAmountLealtad);
    frFormasPago.xNewPosTraceNumber := NewPosTraceNumber;
    frFormasPago.xPan               := nTarjeta;
    frFormasPago.xListaDetalle      := _CobListaDetalle;
    frFormasPago.idRem              := idRem;
    frFormasPago.aFormasP  := [fpEfectivo, fpTarjeta, fpDolar, fpPuntos, fpLoteria, fpWaldosPass, fpWaldosPay];
    frFormasPago.Multiples := True;
    frFormasPago.ShowModal;

    if frFormasPago.ModalResult = mrCancel Then
    begin
      salida := 0;
      Exit;
    end;

    nTarjeta := frFormasPago.xPan;
    xAmountLealtad := FloatToStr(frFormasPago.xDisponibleLealtad);

//    if frFormaspago.FactorWP <> 0 then
    if frFormasPago.Wpass <> 0 then
    Begin
      //PromoVtas.WaldosPass := frFormaspago.FactorWP;    {Asi es como estaba antes}
      xxx := (frFormasPago.Wpass / totVta) * 100;   // Nuevo calculo para WP
      PromoVtas.WaldosPass := xxx;
      PromoVtas.ValidaPromo;
    End;

    //WaldosPay
    if frFormasPago.edWaldosPay.EditValue > 0 then
    Begin

    End;

  Except
    on e:Exception do
    Begin
      Log('Formas pago : '+inttostr(idRem)+' - '+e.Message);
      salida := 0;
      Exit;
    End;
  End;
  Cob_FormasPago := True;
end;

function TfrCapRem.Cob_Pagos: Boolean;
var
  idPago, idDepo :  Integer;
begin
  Cob_Pagos := False;
  Try
    Try
      qNew.Close;
      qNew.SQL.Clear;

      qNew.Close;
      qNew.SQL.Clear;
      qNew.SQL.Add('Insert into Pagos (id, idTienda, idrefer, Cajero, fecha, importe, cambio, pago, tipo_pago, clase, ');
      qNew.SQL.Add('origen, activo, tarjeta, Tipo_Operacion, WaldosPay, Autoriza)');
      qNew.SQL.Add('Values (:id, :idTienda, :idrefer, :Cajero, :fecha, :importe, :Cambio, :pago, :tipo_pago, :clase, ');
      qNew.SQL.Add('0, 1, :tarjeta, :Tipo_Operacion, :WaldosPay, :Autoriza)');
      idPago := 1;

      if (frFormasPago.Efectivo <> 0) Then
      begin
        MetePago('EFE', frFormasPago.Efectivo, idPago, frFormasPago.Cambio, 1);
        idPago := idPago + 1;
      end;

      if (frFormasPago.edLoteria.Value <> 0) Then
      begin
        MetePago('LOT', frFormasPago.edLoteria.Value, idPago, 0, 49);
        idPago := idPago + 1;
      end;

      if (frFormasPago.edWaldosPay.Value > 0) Then
      begin
        MetePago('WPY', frFormasPago.PagoWaldosPay.Importe, idPago, 0, 614,
                 frFormasPago.PagoWaldosPay.OTP,
                 frFormasPago.PagoWaldosPay.PurchaseID,
                 frFormasPago.PagoWaldosPay.Autoriza);
        idPago := idPago + 1;
      end;

      idDepo := Maximo(qDepositos,'idDeposito','Deposito');

      if frFormasPago.Tarjeta <> 0 Then
      begin
        frFormasPago.mPagosT.First;
        while not frFormasPago.mPagosT.Eof do
        begin
          if copy(frFormasPago.mPagosT.FieldByName('Tipo_operacion').AsString, 1, 2) = 'CR' then
          begin
            MetePago('TAR', frFormasPago.mPagosT.FieldByName('monto').AsFloat, idPago, 0, 2,frFormasPago.mPagosTtarjeta.AsString);
          end Else
          begin
            MetePago('TAR', frFormasPago.mPagosT.FieldByName('monto').AsFloat, idPago, 0, 3,frFormasPago.mPagosTtarjeta.AsString);
          end;

          idPago := idPago + 1;
          qPagosT.Close;
          qPagosT.ParamByName('idDeposito').AsInteger := -1;
          qPagosT.ParamByName('activo').AsInteger     := 2;
          if frFormasPago.mPagosT.FieldByName('tVenta').AsInteger = 1 then
          begin
            qDepositos.Close;
            qDepositos.ParamByName('idDeposito').AsInteger   := idDepo;
            qDepositos.ParamByName('idUser').AsInteger       := -1;
            qDepositos.ParamByName('idTienda').AsInteger     := idTda;
            qDepositos.ParamByName('id').AsInteger           := idDepo;
            qDepositos.ParamByName('idBanco').AsInteger      := idBan_pinpad; // FrDAtos.qBancosPinPad.FieldByName('idBanco').AsInteger;
            qDepositos.ParamByName('Fecha').AsDate           := Maestro.FieldByName('Fecha').AsDateTime;
            qDepositos.ParamByName('Venta').AsDate           := Maestro.FieldByName('Fecha').AsDateTime;
            qDepositos.ParamByName('Importe').AsFloat        := frFormasPago.mPagosT.FieldByName('monto').AsFloat;
            qDepositos.ParamByName('TipoCambio').AsFloat     := 1;
            qDepositos.ParamByName('Tipo').AsString          := 'A';
            qDepositos.ParamByName('Tipo_Pago').AsInteger    := 2;
            qDepositos.ExecSQL;

            qPagosT.ParamByName('idDeposito').AsInteger      := idDepo;
            qPagosT.ParamByName('activo').AsInteger          := 1;
          end;
         qPagosT.ParamByName('idRemision').AsInteger := idRem;
         qPagosT.ParamByName('idPago').AsInteger     := frFormasPago.mPagosT.FieldByName('id').AsInteger;
         qPagosT.ExecSQL;
         idDepo := idDepo + 1;
         frFormasPago.mPagosT.Next;
        end;
      end;

      if frFormasPago.Dolares <> 0 Then
      begin
        MetePago('DLL', frFormasPago.Dolares, idPago, frFormasPago.CambioDolar, 4);
        idPago := idPago + 1;
      end;

      if frFormasPago.Lealtad <> 0 Then
      begin
        MetePago('PTS', (frFormasPago.Lealtad), idPago, 0, 5);
        idPago := idPago + 1;

        qPuntosRedime.Close;
        qPuntosRedime.ParamByName('idtienda').AsInteger    := idTda;
        qPuntosRedime.ParamByName('idremision').AsInteger  := idRem;
        qPuntosRedime.ParamByName('Tarjeta').AsString      := nTarjeta;
        qPuntosRedime.ParamByName('fecha').AsDate          := cajas.xFechaLaboral;
        qPuntosRedime.ParamByName('autorizacion').AsString := frFormasPago.xAutoRedime;
        qPuntosRedime.ParamByName('puntos').AsFloat        := frFormasPago.xPuntosRedime;
        qPuntosRedime.ParamByName('total_puntos').AsFloat  := frFormasPago.xTotalPuntosRedime;
        qPuntosRedime.ParamByName('status').AsInteger      := 1;
        qPuntosRedime.ExecSQL;
      end;
      if frFormasPago.Wpass <> 0 Then
      begin
        MetePago('WAP', frFormasPago.Wpass, idPago, 0, 6);
        idPago := idPago + 1;
      end;
    Except
      on e:Exception do
      Begin
        Log('Grabar pagos :'+inttostr(idPago)+' - '+e.Message);
        Exit;
      End;
    End;
    Cob_Pagos := True;
  Finally
    idPago := -1;
    idDepo := -1;
  End;
end;

function TfrCapRem.Cob_Grabar: Boolean;
var
  Cant, idDe_Rem, idPago :Integer;
  idDepo: integer;
  DescBlue: Double;
begin

  if not Cob_DesgloseIva Then
    raise Exception.Create('[ ERROR ]: Desglose Ivas');

  Cob_Grabar := False;
  idDe_Rem := 0;
  Cant     := 0;
  idDepo   := 0;
  Try
    Try
      Maestro.FieldByName('Refer').AsString := Ceros(IntToStr(MaximoGenerador(maestro,'G_REFER')), 10);
      LastDate := Maestro.FieldByName('Fecha').AsDateTime;

      Maestro.FieldByName('idRemision').AsInteger  := idRem;
      Maestro.FieldByName('idTienda').AsInteger    := idTda;
      Maestro.FieldByName('idCliente').AsInteger   := idCte;
      Maestro.FieldByName('idVendedor').AsInteger  := idVend;
      Maestro.FieldByName('Cajero').AsInteger      := Cajas.xidCaja;
      Maestro.FieldByName('Importe').AsFloat       := laTotal.EditValue;
      Maestro.FieldByName('iva').AsCurrency        := _CobTotalImpuestos;
      Maestro.FieldByName('ivac').AsCurrency       := _Cobciva * (1-(edDescuento.EditingValue/100));
      Maestro.FieldByName('Costo').AsFloat         := _CobxCosto;
      Maestro.FieldByName('Imp_Desc').AsFloat      := laDescuento.EditValue; // + _CobImp_Desc;
      Maestro.FieldByName('Tasa').AsFloat          := frDatos.vIva;
      Maestro.FieldByName('Unidades').AsInteger    := Pzas;
      Maestro.FieldByName('Activo').AsInteger      := 1;
      Maestro.FieldByName('Status').AsString       := ' ';
      Maestro.FieldByName('Serie').AsString        := xSerie;
      Maestro.FieldByName('Folio').AsInteger       := GetFolio;
      Maestro.FieldByName('Hora').AsDateTime       := Time;
      Maestro.FieldByName('Tipo').AsString         := GetTipo(Tno);
      Maestro.FieldByName('idCaja').AsInteger      := Cajas.xidCaja;
      Maestro.FieldByName('idUser').AsInteger      := frDatos.idUser;
      Maestro.FieldByName('PUNTOS_ACUMULA').AsFloat:= PuntosAcumula;
      Maestro.FieldByName('PUNTOS_REDIME').AsFloat := frFormasPago.Lealtad;
      Maestro.FieldByName('facturable').AsInteger  := NotaFacturable;
      Maestro.FieldByName('Tipo_Operacion').AsInteger := Tipo_Operacion;

      Maestro.FieldByName('Descuento1').AsFloat   := RoundTo(Desc_Bruto, rdTotales);
      Maestro.FieldByName('Descuento2').AsFloat   := frFormasPago.Lealtad;
      Maestro.FieldByName('Cte_Mayoreo').AsString := FCteMayor;
      Maestro.Post;

      qKardex.Close;
      qKardex.SQL.Clear;
      qKardex.SQL.Add('Insert into KarArt (idtienda, idarticulo, id, idrefer, fecha, refer, concepto,');
      qKardex.SQL.Add('entradas, salidas, status, activo, tipo)');
      qKardex.SQL.Add('Values (:idtienda, :idarticulo, :id, :idrefer, :fecha, :refer, :concepto,');
      qKardex.SQL.Add(':entradas, :salidas, :status, 1, :tipo)');

      qNew.Close;
      qNew.SQL.Clear;
      qNew.SQL.Add('Insert into de_rem (id, idtienda, idremision, idarticulo, idalias,');
      qNew.SQL.Add('cantidad, precio, costo, pvneto, pciva, descuento, impuesto, IMP_DESC, Tipo_Impuesto,');
      qNew.SQL.Add('Descuento1, Descuento2, Factor, activo)');
      qNew.SQL.Add('Values (:id, :idtienda, :idremision, :idarticulo, :idalias,');
      qNew.SQL.Add(':cantidad, :precio, :costo, :pvneto, :pciva, :descuento, :Impuesto, :IMP_DESC, :Tipo_Impuesto,');
      qNew.SQL.Add(':Descuento1, :Descuento2, :Factor, 1)');

      qNewImpuestos.Close;
      qNewImpuestos.SQL.Clear;
      qNewImpuestos.SQL.Add('insert into derem_impuestos  (idimpuesto,idtienda,idremision,idarticulo,id, de_id, tasa, total)');
      qNewImpuestos.SQL.Add('values (:idimpuesto,:idtienda,:idremision,:idarticulo,:id, :de_id, :tasa, :total)');

      Detalle.DisableControls;
      Detalle.First;
      idDe_Rem := 1;

      DescBlue := 0;
      if frFormasPago.Lealtad > 0 then
        DescBlue :=  frFormasPago.Lealtad / Maestro.FieldByName('importe').AsFloat;

      While not Detalle.Eof do
      Begin
        Cant := Detalle.FieldByName('Cantidad').AsInteger;

        qKardex.Close;
        qKardex.ParamByName('idTienda').AsInteger   := idTda;
        qKardex.ParamByName('idArticulo').AsInteger := Detalle.FieldByName('idArticulo').AsInteger;
        qKardex.ParamByName('id').AsInteger         := idDe_Rem;
        qKardex.ParamByName('idRefer').AsInteger    := idRem;
        qKardex.ParamByName('Fecha').AsDate         := Maestro.FieldByName('Fecha').AsDateTime;
        qKardex.ParamByName('Refer').AsString       := Maestro.fieldByName('Refer').asString;
        qKardex.ParamByName('Concepto').AsString    := Maestro.FieldByName('Nombre').asString;
        qKardex.ParamByName('Entradas').AsInteger   := 0;
        {*********  servicios *******************}
        qKardex.ParamByName('Salidas').AsInteger    := Cant;
        if (TipoServicio = 1) then
          qKardex.ParamByName('Salidas').AsInteger  := 0;
        {****************************************}
        qKardex.ParamByName('Status').AsString      := 'RE';
        qKardex.ParamByName('Tipo').AsString        := GetTipo(Tno);
        qKardex.ExecSQL;

        if not Cob_CalDeRemImp(cant, idDe_Rem) then
          raise Exception.Create('[ ERROR ]: Detalle impuestos');

        qNew.Close;
        qNew.ParamByName('idTienda').AsInteger   := idTda;
        qNew.ParamByName('id').AsInteger         := idDe_Rem;
        qNew.ParamByName('idRemision').AsInteger := idRem;
        qNew.ParamByName('idArticulo').AsInteger := Detalle.FieldByName('idArticulo').AsInteger;
        qNew.ParamByName('idalias').AsInteger    := Detalle.FieldByName('idalias').AsInteger;
        qNew.ParamByName('Cantidad').AsInteger   := Cant;
        qNew.ParamByName('Precio').AsFloat       := Detalle.FieldByName('Precio').AsFloat;
        qNew.ParamByName('Costo').AsFloat        := Detalle.FieldByName('Costo').AsFloat;
        qNew.ParamByName('PvNeto').AsCurrency    := Detalle.FieldByName('PvNeto').AsFloat;
        qNew.ParamByName('Impuesto').AsFloat     := Detalle.FieldByName('Impuesto').AsFloat;
        qNew.ParamByName('Tipo_Impuesto').AsInteger := Detalle.FieldByName('TipoImpuesto').AsInteger;
        qNew.ParamByName('IMP_DESC').AsCurrency  := RoundTo(Detalle.FieldByName('DescNeto').AsFloat, rdDetalle);
        qNew.ParamByName('Factor').AsFloat       := Detalle.FieldByName('Factor').AsFloat;
        qNew.ParamByName('Descuento1').AsFloat   := RoundTo(Detalle.FieldByName('Descuento').AsFloat, rdDetalle);
        qNew.ParamByName('Descuento2').AsFloat   := DescBlue * Detalle.FieldByName('importe').AsFloat;
        qNew.ParamByName('Descuento').AsFloat    := 0;
        qNew.ExecSQL;

        Detalle.Next;
        idDe_Rem:=idDe_Rem+1;
      End;

      {Graba detalle de descuentos}
      with PromoVtas do
      Begin
        CalPromo.Close;
        CalPromo.SQL.Clear;
        CalPromo.SQL.Add('Select id, idArticulo,  idPromocion, sum(cantidad) cantidad,');
        CalPromo.SQL.Add('sum(Desc_Bruto) Desc_Bruto, sum(Desc_Neto) Desc_Neto');
        CalPromo.SQL.Add('from t_descuentos');
        CalPromo.SQL.Add('group by id, idArticulo, idPromocion');
        CalPromo.Open;

        qNew.Close;
        qNew.SQL.Clear;
        qNew.SQL.Add('insert into derem_descuentos (idtienda, idremision, id, idarticulo, idpromocion, cantidad, Desc_Bruto, Desc_Neto, activo)');
        qNew.SQL.Add('values (:idtienda, :idremision, :id, :idarticulo, :idpromocion, :cantidad, :Desc_Bruto, :Desc_neto, 1)');
        while not CalPromo.Eof do Begin
          qNew.ParamByName('idTienda').AsInteger    := idTda;
          qNew.ParamByName('idRemision').AsInteger  := idRem;
          qNew.ParamByName('id').AsInteger          := CalPromo.FieldByName('id').AsInteger;
          qNew.ParamByName('idArticulo').AsInteger  := CalPromo.FieldByName('idArticulo').AsInteger;
          qNew.ParamByName('idPromocion').AsInteger := CalPromo.FieldByName('idPromocion').AsInteger;
          qNew.ParamByName('cantidad').AsFloat   := CalPromo.FieldByName('Cantidad').AsFloat;
          qNew.ParamByName('Desc_Bruto').AsFloat := RoundTo(CalPromo.FieldByName('Desc_bruto').AsFloat, rdDetalle);
          qNew.ParamByName('Desc_Neto').AsFloat  := RoundTo(CalPromo.FieldByName('Desc_Neto').AsFloat, rdDetalle);
          qNew.ExecSQL;
          CalPromo.Next;
        End;
      End;

      if not Cob_Pagos then
        raise Exception.Create('[ ERROR ]: Pagos');

      {if (TipoServicio = 1) then
      begin
        qServicios.Close;
        qservicios.ParamByName('idRemision').AsInteger := idRem;
        qservicios.ParamByName('idPago').AsInteger := mServicios.FieldByName('idPago').AsInteger;
        qServicios.ExecSQL;
      end;  }

      if siReinicia then
       Begin
        qNew.Close;
        qNew.SQL.Clear;
        qNew.SQL.Add('update folios set');
        qNew.SQL.Add('activo = 0');
        qNew.SQL.Add('Where id = :xID');
        qNew.ParamByName('xid').AsInteger := Reinicia;
        qNew.ExecSQL;
      End;

      if not frFormasPago.mServicios.IsEmpty then
      begin
        idPagoSer := Maximo(Frdatos.Articulos,'idPago','pagoservicios');
        qNewImpuestos.Close;
        qNewImpuestos.SQL.Clear;
        qNewImpuestos.SQL.Add('insert into pagoservicios (idTienda, idpago, idservicio, idremision,');
        qNewImpuestos.SQL.Add('monto, telefono, referencia,');
        qNewImpuestos.SQL.Add('clase, fecha, iduser, idcaja, hora, Tipo_operacion, activo)');
        qNewImpuestos.SQL.Add('values (:idTienda, :idpago, :idservicio, :idremision,');
        qNewImpuestos.SQL.Add(':monto, :telefono, :referencia,');
        qNewImpuestos.SQL.Add(':clase, :fecha, :iduser, :idcaja, :hora, :Tipo_operac, :activo)');
        qNewImpuestos.ParamByName('idTienda').AsInteger    := frDatos.idTienda;
        qNewImpuestos.ParamByName('idpago').AsInteger      := idPagoSer;
        qNewImpuestos.ParamByName('idservicio').AsInteger  := mServicios.FieldByName('idservicio').AsInteger;
        qNewImpuestos.ParamByName('idremision').AsInteger  := idRem;
        qNewImpuestos.ParamByName('monto').AsFloat         := mServicios.FieldByName('monto').AsFloat;
        qNewImpuestos.ParamByName('telefono').AsString     := mServicios.FieldByName('celular').AsString;
        qNewImpuestos.ParamByName('referencia').AsString   := mServicios.FieldByName('Referencia').AsString;;
        qNewImpuestos.ParamByName('clase').AsInteger       := mServicios.FieldByName('clase').AsInteger;
        qNewImpuestos.ParamByName('activo').AsInteger      := 0;
        qNewImpuestos.ParamByName('fecha').AsDate          := cajas.xFechaLaboral;
        qNewImpuestos.ParamByName('iduser').AsInteger      := frDatos.idUser;
        qNewImpuestos.ParamByName('idcaja').AsInteger      := cajas.xidCaja;
        qNewImpuestos.ParamByName('hora').AsTime           := Time;
        qNewImpuestos.ParamByName('Tipo_operac').AsInteger := Tipo_operacion;
        qNewImpuestos.ExecSQL;
      end;

      if not(AcumulaPuntos(_CobListaDetalle)) then
        raise Exception.Create('[ ERROR ]: Acumula puntos');


      LocalTransaction.Commit;
      Detalle.Close;
    Except
      on e:Exception do
      Begin
        Log('Grabar datos :'+inttostr(idrem)+' - '+e.Message);
        LocalTransaction.Rollback;
        Detalle.Close;
        Exit;
      End;
    End;
    Cob_Grabar  := True;
  Finally
    Detalle.EnableControls;
  End;
end;

function TfrCapRem.Cob_AbonaServicio: Boolean;
var
  apagos : TfrPagoServicios;
begin
  Cob_AbonaServicio := False;
  Try
    Try
      apagos := TfrPagoServicios.Create(Application);
      apagos.idRem       := idRem;
      apagos.idPagoSer   := idPagoSer;
      apagos.mServicios  := frFormasPago.mServicios;
      apagos.xSKU        := frFormasPago.xSKU;
      apagos.xReferencia := frFormasPago.XReferencia;
      apagos.xPayment    := frFormasPago.xPayment;
      apagos.xCompania   := frFormasPago.xCompania;
      apagos.xMONTO      := frFormasPago.xMONTO;
      apagos.xSevTelcel  := frFormasPago.xSevTelcel;
      apagos.xComision   := frFormasPago.xComision;
      apagos.xTipo_Operacion := frFormasPago.xTipo_Operacion;
      apagos.ShowModal;

      if not(apagos.ModalResult = mrOk) then
      begin
        ErrorLog('[ ERROR ] : Abona Servicio :'+inttostr(idrem));
        Exit;
      end;
    Except
      on e:Exception do
      Begin
        Log('Abona Servicio :'+inttostr(idrem)+' - '+e.Message);
        Exit;
      End;
    End;
    Cob_AbonaServicio := True;
  Finally
    if Assigned(apagos) then
      apagos.Free;
  End;
end;

function TfrCapRem.Cob_ImprimeTicket: Boolean;
var
  Fto: TfrFtoTicket;
begin
  Cob_ImprimeTicket := False;
  Try
    Fto := TfrFtoTicket.Create(Self);
    Fto.idTda := idTda;
    Fto.idRem := idRem;
    Fto.Imprime;
    Fto.Free;
  Except
    on e:Exception do
    Begin
      Log('Error al imprimir ticket :'+inttostr(idrem)+' -'+e.Message);
      Exit;
    End;
  End;
  Cob_ImprimeTicket := True;
end;

function TfrCapRem.Cob_ImprimeCompSeguro: Boolean;
Var
  Fto : TfrFtoSeguros;
begin
  Cob_ImprimeCompSeguro := false;
  Fto := TfrFtoSeguros.Create(Self);
  Fto.idRem := idRem;
  Fto.Imprime;
  Fto.Free;
  Cob_ImprimeCompSeguro := True;
end;

function TfrCapRem.Cob_ImprimeCompWp: Boolean;
Var
  FtoWP : TFtoWpasComprobante;
begin
  Cob_ImprimeCompWp := false;
  FtoWP := TFtoWpasComprobante.Create(Self);

  FtoWP.Imprime;
  FtoWP.Free;
  Cob_ImprimeCompWp := True;
end;

function TfrCapRem.Cob_ImprimeCompServicio: Boolean;
var
  impTA : TImprimeTA;
begin
  Cob_ImprimeCompServicio := False;
  Try
    Try
      impTA := TImprimeTA.Create(nil);
      impTA.idRemision := idRem;
      impTA.ImprimeTiempoAire;
    Except
      on e: Exception do
      Begin
        log('Error al imprimir Comprobante tiempo aire: ' + e.Message);
        Exit;
      End;
    End;
    Cob_ImprimeCompServicio := True;
  Finally
    if Assigned(impTA) then
      impTA.Free;
  End;
end;

function TfrCapRem.Cob_ActivaTarjeta: Boolean;
var
  I: integer;
  ActivaT : TfrActivaTarj;
begin
  Cob_ActivaTarjeta := False;
  Try
    Try
      qNew.Close;
      qNew.SQL.Clear;
      qNew.SQL.Add('select d.idremision, d.idarticulo, d.cantidad, d.precio, d.costo,');
      qNew.SQL.Add('d.impuesto, a.servicio');
      qNew.SQL.Add('from de_rem d');
      qNew.SQL.Add('join articulos a on a.idArticulo = d.idArticulo');
      qNew.SQL.Add('where d.idTienda = :idTda and d.idremision = :idRem');
      qNew.ParamByName('idTda').AsInteger := idTda;
      qNew.ParamByName('idRem').AsInteger := idRem;
      qNew.Open;

      while not qNew.Eof do
      Begin
        if qNew.FieldByName('servicio').AsInteger <> 3 then
        Begin
          qNew.Next;
          Continue;
        End;

        for I := 1 to qNew.FieldByName('cantidad').AsInteger do
        Begin
          ActivaT := TfrActivaTarj.Create(Self);
          ActivaT.idRem := idRem;
          ActivaT.ShowModal;
        End;
        qNew.Next;
      End;
    Except
      on e: Exception do
      Begin
        log('Error al activar tarjeta: ' + e.Message);
        Exit;
      End;
    End;
    Cob_ActivaTarjeta := True;
  Finally
    if Assigned(ActivaT) then
      ActivaT.Free;
  End;
end;
// Fin Funciones CapRem

// Cambios para promociones desde aqui
procedure TfrCapRem.DetalleAfterPost(DataSet: TDataSet);
Var
  yes : Boolean;
begin
  inherited;
  // Busca y asigna promociones
  Detalle.AfterPost := nil;
  PromoVtas.LetPromo(Detalle.FieldByName('idArticulo').AsInteger,
                     Detalle.FieldByName('id').AsInteger,
                     Detalle.FieldByName('precio').AsFloat,
                     Detalle.FieldByName('Factor').AsFloat,
                     Detalle.FieldByName('Cantidad').AsFloat,
                     Detalle.FieldByName('Importe').AsFloat);
  PromoVtas.ValidaPromo;
  //edCliente.Text := FormatDateTime('hh:mm:ss.zzz', PromoVtas.Tiempo);
  Detalle.Last;
  Detalle.EnableControls;
  PonTotales;

  pCant := 1;
  tvCap.DataController.Append;
  Detalle.AfterPost := DetalleAfterPost;

  tvCap.DataController.FocusControl(tvCapCodigo.Index, yes);
end;

procedure TfrCapRem.tvCapCANTIDADPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  Detalle.Post;
end;

procedure TfrCapRem.tvCapDESCUENTOCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if not VarIsNull(AViewInfo.Value) and (AViewInfo.Value <> 0) Then
    ACanvas.Font.Color := clRed;
end;

procedure TfrCapRem.tvCapEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
var
  AColumn: TcxCustomGridTableItem;
begin
  inherited;
  AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('codigo');
  if AColumn.Index = AItem.Index then
    AAllow := VarisNull(tvCap.Controller.FocusedRecord.Values[AColumn.Index]);
end;

procedure TfrCapRem.PonTotales;
Var
  xDescu, xImpo, xPzas : Double;
begin
  if not Detalle.CanModify then
    Exit;

  Detalle.DisableControls;
  Detalle.First;
  xDescu := 0;
  xImpo := 0;
  xPzas := 0;
  while not Detalle.Eof do Begin
    xImpo := xImpo + (Detalle.FieldByName('importe').AsFloat + Detalle.FieldByName('Descuento').AsFloat);
    xPzas := xPzas + Detalle.FieldByName('Cantidad').AsFloat;
    xDescu := xDescu + Detalle.FieldByName('Descuento').AsFloat;
    Detalle.Next;
  End;
  Detalle.EnableControls;

  //xDescu := xDescu + ((xImpo-xDescu) * (edDescuento.Value/100));
  laImporte.Value   := xImpo;  // Importe-xDescu;
  laDescuento.Value := xDescu;
  laTotal.Value     := xImpo - xDescu; // (laImporte.Value + laDescuento.Value);
  laPrendas.Value   := xPzas;

end;


end.
