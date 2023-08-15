unit Cierre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Master, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ExtCtrls, ImgList, cxProgressBar,
  dxStatusBar, Menus, cxLabel, StdCtrls, cxButtons, cxTextEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomView, cxGridCustomTableView, cxGridCardView, cxGridDBCardView,
  dxmdaset, cxClasses, cxGridLevel, cxGrid, IBCustomDataSet, IBQuery,
  ActnList, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  dxPSCore, dxPSBaseGridLnk, IBDatabase, cxCurrencyEdit, StrUtils, cxMaskEdit, cxDropDownEdit, cxCalc,
  cxGridTableView, Grids, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  System.ImageList, dxPScxGridLnk, dxPScxGridLayoutViewLnk;

type
  TfrCierre = class(TfrMaster)
    Panel1: TPanel;
    Bevel2: TBevel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    Maestro: TIBQuery;
    Detalle: TIBQuery;
    qNew: TIBQuery;
    qNotas: TIBQuery;
    bContenedor: TScrollBox;
    ActionList1: TActionList;
    acPrintFtoCierre: TAction;
    dxPrinter: TdxComponentPrinter;
    PopupMenu1: TPopupMenu;
    Imprimirformatodecierre1: TMenuItem;
    LocalTransaction: TIBTransaction;
    pValida: TPanel;
    Label1: TLabel;
    edVentaGlobal: TcxCalcEdit;
    ibSeek: TIBQuery;
    l1: TcxGridLevel;
    G1: TcxGrid;
    DataSource1: TDataSource;
    t1: TcxGridTableView;
    t1_1: TcxGridColumn;
    t1_2: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure btCerrarClick(Sender: TObject);
    procedure btAceptarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acPrintFtoCierreExecute(Sender: TObject);
    procedure FtoCierreEnter(Sender: TObject);
    procedure FtoCierreExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pValidaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pValidaMouseLeave(Sender: TObject);
  private
    FCierreLabores: Boolean;
    FidVend: Integer;
    FOrigen: Integer;
    procedure SetCellText(ACol, ARow : Integer; AText : String);
    function GetCellText(SelectionRect: TRect; R1C1: Boolean): String;

    procedure CalcCajas;
    procedure CalcCajas2;

    procedure CerrarDia;
  public
    property CierreLabores: Boolean read FCierreLabores write FCierreLabores;
    property idVend: Integer read FidVend write FidVend;
    property Origen: Integer read FOrigen write FOrigen;
  end;

var
  frCierre: TfrCierre;

  gCaja: Array of TGroupBox;
  lEtiquetas: Array of TLabel;
  edTextos: Array of TcxCurrencyEdit;
  TotalGral: Double;

implementation

uses Datos, Util, FtoCierreRav, Globales, Tools, Main;

{$R *.dfm}

procedure TfrCierre.acPrintFtoCierreExecute(Sender: TObject);
begin
  inherited;
  dxPrinter.Preview(True, Nil);
end;

procedure TfrCierre.btAceptarClick(Sender: TObject);
  Var
  Fto : TfrFtoCierreRav;
  Resta: Double;
begin
  inherited;
  Resta := ABS(edVentaglobal.EditValue - TotalGral);
  if Resta > 0.1 then begin
    ShowMessage('La venta global que capturaste es incorrecta ' + FloatToStr(TotalGral));
    edVentaGlobal.SetFocus;
    Exit;
  end;

  if Application.MessageBox('Este proceso es irreversible, y cierra automaticamente las cajas que esten abiertas, incluyendo esta'+
  #13+'¿Esta seguro que desea continuar?', '¡Advertencia!',
  MB_YesNo or MB_ICONWARNING) <> mrYes then
    Exit;
  try
    try
//      dxPrinterLink1.PDFExportOptions.DefaultFileName := 'Cierre' + FormatDateTime('ddmmyyyy', Cajas.xFechaLaboral);
//      dxPrinterLink1.PDFExportOptions.OpenDocumentAfterExport := True;
//      dxPrinterLink1.PDFExportOptions.OpenDocumentAfterExport := True;
//      dxPrinterLink1.ExportToPDF;
    finally
      Fto := TfrFtoCierreRav.Create(Self);
      try
        Fto.FechaDeseada := Cajas.xFechaLaboral;
        Fto.Imprime;
      finally
        Fto.Free;
      end;
    end;
  finally
    CierreLabores := True;
    CerrarDia;
  end;
end;

procedure TfrCierre.btCerrarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrCierre.CalcCajas;
var
  xTop, x: Integer;
  xTotal: Double;
begin
  Screen.Cursor := crHourGlass;

  qNew.SQL.Clear;
  qNew.SQL.Add('select idcaja from cajas');
  qNew.SQL.Add('where idtienda = :idtienda');
  qNew.ParamByName('idtienda').AsInteger := frDatos.idTienda;
  qNew.Open;

  Maestro.Close;
  Maestro.SQL.Clear;
  Maestro.SQL.Add('select distinct(pago) pago from pagos');
  Maestro.SQL.Add('where');
  Maestro.SQL.Add('(idtienda = :idTda)');
  Maestro.SQL.Add('and (fecha = :fecha)');
  Maestro.SQL.Add('and (cajero = :caja)');

  Detalle.Close;
  Detalle.SQL.Clear;
  Detalle.SQL.Add('select sum(importe) importe, pago from pagos');
  Detalle.SQL.Add('where (idrefer > :idrefer)');
  Detalle.SQL.Add('and (idtienda = :idTda)');
  Detalle.SQL.Add('and (fecha = :fecha)');
  Detalle.SQL.Add('and (cajero = :caja)');
  Detalle.SQL.Add('and (pago = :pago)');
  Detalle.SQL.Add('group by pago');

  qNew.Last;
  SetLength (gCaja, qNew.RecordCount +1);
  SetLength (lEtiquetas, qNew.RecordCount * 6);
  SetLength (edTextos, qNew.RecordCount * 6);

  TotalGral := 0;
  X := 0;
  qNew.First;
  while not qNew.Eof do begin
    Maestro.Close;
    Maestro.ParamByName('idtda').AsInteger := frDatos.idTienda;
    Maestro.ParamByName('fecha').AsDate := Cajas.xFechaLaboral;
    Maestro.ParamByName('caja').AsInteger := qNew.FieldByName('idcaja').AsInteger;
    Maestro.Open;

    gCaja[qNew.FieldByName('idcaja').AsInteger] := TGroupBox.Create(Nil);
    gCaja[qNew.FieldByName('idcaja').AsInteger].Parent := bContenedor;
    gCaja[qNew.FieldByName('idcaja').AsInteger].Align := alLeft;
    gCaja[qNew.FieldByName('idcaja').AsInteger].Caption := 'Caja ' + qNew.FieldByName('idcaja').AsString;

    xTop := 16;
    inc(x);
    lEtiquetas[x] := TLabel.Create(Nil);
    lEtiquetas[x].Caption := '#Notas: ';
    lEtiquetas[x].Parent := gCaja[qNew.FieldByName('idcaja').AsInteger];
    lEtiquetas[x].Left := 5;
    lEtiquetas[x].Top := xTop;

    qNotas.Close;
    qNotas.ParamByName('idtienda').AsInteger := frDatos.idTienda;
    qNotas.ParamByName('cajero').AsInteger := qNew.FieldByName('idcaja').AsInteger;
    qNotas.ParamByName('fecha').AsDate := Cajas.xFechaLaboral;
    qNotas.Open;

    edTextos[x] := TcxCurrencyEdit.Create(Nil);
    edTextos[x].EditValue := qNotas.FieldByName('notas').AsInteger;
    edTextos[x].Parent := gCaja[qNew.FieldByName('idcaja').AsInteger];
    edTextos[x].Properties.ReadOnly := True;
    edTextos[x].Style.StyleController := frDatos.Edits;
    edTextos[x].Properties.DisplayFormat := ',0.00';
    edTextos[x].Properties.Alignment.Horz := taRightJustify;
    edTextos[x].Left := 50;
    edTextos[x].Top := xTop;


    Maestro.First;
    xTotal := 0;
    while not Maestro.Eof do begin
      Detalle.Close;
      Detalle.ParamByName('idrefer').AsInteger := -1;
      Detalle.ParamByName('idtda').AsInteger := frDatos.idTienda;
      Detalle.ParamByName('fecha').AsDate := Cajas.xFechaLaboral;
      Detalle.ParamByName('caja').AsInteger := qNew.FieldByName('idcaja').AsInteger;
      Detalle.ParamByName('pago').AsString := Maestro.FieldByName('pago').AsString;
      Detalle.Open;

      inc(x);
      xTop := xTop +20;
      lEtiquetas[x] := TLabel.Create(Nil);
      lEtiquetas[x].Caption := Maestro.FieldByName('pago').AsString + ': ';
      lEtiquetas[x].Parent := gCaja[qNew.FieldByName('idcaja').AsInteger];
      lEtiquetas[x].Left := 5;
      lEtiquetas[x].Top := xTop;

      edTextos[x] := TcxCurrencyEdit.Create(Nil);
      edTextos[x].EditValue := Detalle.FieldByName('importe').AsFloat;
      edTextos[x].Parent := gCaja[qNew.FieldByName('idcaja').AsInteger];
      edTextos[x].Properties.ReadOnly := True;
      edTextos[x].Style.StyleController := frDatos.Edits;
      edTextos[x].Properties.DisplayFormat := ',0.00';
      edTextos[x].Properties.Alignment.Horz := taRightJustify;
      edTextos[x].Left := 50;
      edTextos[x].Top := xTop;

      xTotal := xTotal + Detalle.FieldByName('importe').AsFloat;
      TotalGral := TotalGral + Detalle.FieldByName('importe').AsFloat;

      Maestro.Next;
    end;

    inc(x);
    xTop := xTop +20;
    lEtiquetas[x] := TLabel.Create(Nil);
    lEtiquetas[x].Caption := 'Total: ';
    lEtiquetas[x].Parent := gCaja[qNew.FieldByName('idcaja').AsInteger];
    lEtiquetas[x].Left := 5;
    lEtiquetas[x].Top := xTop;

    edTextos[x] := TcxCurrencyEdit.Create(Nil);
    edTextos[x].EditValue := xTotal;
    edTextos[x].Parent := gCaja[qNew.FieldByName('idcaja').AsInteger];
    edTextos[x].Properties.ReadOnly := True;
    edTextos[x].Style.StyleController := frDatos.Edits;
    edTextos[x].Properties.DisplayFormat := ',0.00';
    edTextos[x].Properties.Alignment.Horz := taRightJustify;
    edTextos[x].Left := 50;
    edTextos[x].Top := xTop;

    qNew.Next
  end;

  Screen.Cursor := crDefault;
end;

procedure TfrCierre.CalcCajas2;
var
  xTop, x, ID, I: Integer;
  xTotal: Double;
  s: String;
begin
  Screen.Cursor := crHourGlass;

  ibSeek.Close;
  ibSeek.ParamByName('idTda').AsInteger := frDatos.idTienda;
  ibSeek.ParamByName('wDate').AsDate := Cajas.xFechaLaboral;
  ibSeek.Open;
  x := 1;
  while not ibSeek.Eof do Begin
    i := ibSeek.FieldByName('caja').AsInteger;
    Inc(x);
    while not ibSeek.Eof and (ibSeek.FieldByName('caja').AsInteger = i) do
      ibSeek.Next;
  End;

  SetLength (gCaja, x+1);
  SetLength (lEtiquetas, x * 6);
  SetLength (edTextos, x * 6);

  TotalGral := 0;
  X := 0;
  ibSeek.First;
  while not ibSeek.Eof do begin
    ID := ibSeek.FieldByName('caja').AsInteger;
    gCaja[ID] := TGroupBox.Create(Nil);
    gCaja[ID].Parent := bContenedor;
    gCaja[ID].Align := alLeft;
    gCaja[ID].Caption := 'Caja ' + ibSeek.FieldByName('caja').AsString;

    xTop := 16;
    inc(x);
    lEtiquetas[x] := TLabel.Create(Nil);
    lEtiquetas[x].Caption := '#Notas: ';
    lEtiquetas[x].Parent := gCaja[ID];
    lEtiquetas[x].Left := 5;
    lEtiquetas[x].Top := xTop;

    qNotas.Close;
    qNotas.ParamByName('idtienda').AsInteger := frDatos.idTienda;
    qNotas.ParamByName('cajero').AsInteger := ibSeek.FieldByName('caja').AsInteger;
    qNotas.ParamByName('fecha').AsDate := Cajas.xFechaLaboral;
    qNotas.Open;

    edTextos[x] := TcxCurrencyEdit.Create(Nil);
    edTextos[x].EditValue := qNotas.FieldByName('notas').AsInteger;
    edTextos[x].Parent := gCaja[ibSeek.FieldByName('caja').AsInteger];
    edTextos[x].Properties.ReadOnly := True;
    edTextos[x].Style.StyleController := frDatos.Edits;
    edTextos[x].Properties.DisplayFormat := ',0';
    edTextos[x].Properties.Alignment.Horz := taRightJustify;
    edTextos[x].Top := xTop;
    edTextos[x].Left := 98;
    edTextos[x].Width := 78;

    xTotal := 0;
    while not ibSeek.Eof and (ibSeek.FieldByName('caja').AsInteger = ID) do begin
      s := ibSeek.FieldByName('pago').AsString;

      if s = 'EFE' then s := 'Efectivo';
      if s = 'TAR' then s := 'Tarjetas';
      if s = 'RET' then s := 'Retiros';
      if s = 'PTS' then s := 'Redencion puntos';
      if s = 'WAP' then s := 'WaldosPass';
      if s = 'WPY' then s := 'WaldosPay';

      inc(x);
      xTop := xTop +20;
      lEtiquetas[x] := TLabel.Create(Nil);
      lEtiquetas[x].Caption := S+': ';
      lEtiquetas[x].Parent := gCaja[ID];
      lEtiquetas[x].Left := 5;
      lEtiquetas[x].Top := xTop;

      edTextos[x] := TcxCurrencyEdit.Create(Nil);
      edTextos[x].EditValue := ibSeek.FieldByName('importe').AsFloat;
      edTextos[x].Parent := gCaja[ID];
      edTextos[x].Properties.ReadOnly := True;
      edTextos[x].Style.StyleController := frDatos.Edits;
      edTextos[x].Properties.DisplayFormat := ',0.00';
      edTextos[x].Properties.Alignment.Horz := taRightJustify;
      edTextos[x].Top := xTop;
      edTextos[x].Left := 98;
      edTextos[x].Width := 78;

      xTotal := xTotal + ibSeek.FieldByName('importe').AsFloat;
      TotalGral := TotalGral + ibSeek.FieldByName('importe').AsFloat;
      ibSeek.Next;
    end;

    inc(x);
    xTop := xTop +20;
    lEtiquetas[x] := TLabel.Create(Nil);
    lEtiquetas[x].Caption := 'Total: ';
    lEtiquetas[x].Parent := gCaja[ID];
    lEtiquetas[x].Left := 5;
    lEtiquetas[x].Top := xTop;

    edTextos[x] := TcxCurrencyEdit.Create(Nil);
    edTextos[x].EditValue := xTotal;
    edTextos[x].Parent := gCaja[ID];
    edTextos[x].Properties.ReadOnly := True;
    edTextos[x].Style.StyleController := frDatos.Edits;
    edTextos[x].Properties.DisplayFormat := ',0.00';
    edTextos[x].Properties.Alignment.Horz := taRightJustify;
    edTextos[x].Top := xTop;
    edTextos[x].Left := 98;
    edTextos[x].Width := 78;
  end;

  Screen.Cursor := crDefault;
end;

procedure TfrCierre.CerrarDia;
var
qClose: tIBQuery;
begin
  qClose := tIBQuery.Create(Application);
  try
    qClose.Database := frDatos.dbK;
    qClose.Transaction := LocalTransaction;
    try
      qClose.Close;
      qClose.SQL.Clear;
      qClose.SQL.Add('update dias set');
      qClose.SQL.Add('    activo = 0,');
      qClose.SQL.Add('    monto = :monto,');
      qClose.SQL.Add('    Origen = :Origen,');
      qClose.SQL.Add('    cerro = :cerro,');
      qClose.SQL.Add('    Hora = :Hora');
      qClose.SQL.Add('where idtienda = :idtienda');
      qClose.SQL.Add('and fecha = :fecha');
      qClose.ParamByName('monto').AsFloat := edVentaGlobal.EditValue;
      qClose.ParamByName('idtienda').AsInteger := frDatos.idTienda;
      qClose.ParamByName('cerro').AsInteger := idVend;
      qClose.ParamByName('hora').AsTime := time;
      qClose.ParamByName('Origen').AsInteger := Origen;
      qClose.ParamByName('fecha').AsDate := Cajas.xFechaLaboral;
      qClose.ExecSQL;

      LocalTransaction.Commit;
    Except
      on e: Exception do
      begin
        Log('Cierre: '+e.Message);
        Herror('Error la hacer cierre');
        LocalTransaction.Rollback;
      end;
    end;
  finally
    qClose.Free;
    cajas.CierreCajas := true;
    frmain.CheckCaja;
    close;
  end;
end;

procedure TfrCierre.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if not CierreLabores then
    Cajas.CajaDisponible(True);
  frCierre := nil;
end;

procedure TfrCierre.FormCreate(Sender: TObject);
var
  Formato: String;
begin
  inherited;
  CierreLabores := False;
  try
    Formato := ExtractFilePath(ParamStr(0))+'\Lib\Fto.xlt';
    if not FileExists(Formato) then begin
      Showmessage('No se encuentra el formato oiginal, favor de contactar con sistemas');
      Close;
      Exit;
    end;

//    FtoCierre.LoadFromFile(Formato);
//    FtoCierre.ActivePage := 0;
//    FtoCierre.ActiveSheet.Caption := 'Formato de cierre de caja';
  finally
//    FtoCierre.ActivePage := 0;
//    FtoCierre.EndUpdate;
  end;

 //CalcCajas;
 CalcCajas2;
end;

procedure TfrCierre.FormResize(Sender: TObject);
begin
  inherited;
  Bevel2.Width := Width;
  btCerrar.Left := (Width - btCerrar.Width) - 22;
  btAceptar.Left := (btCerrar.Left - btAceptar.Width) - 5;
end;

procedure TfrCierre.FtoCierreEnter(Sender: TObject);
begin
  inherited;
  keyPreview := False;
end;

procedure TfrCierre.FtoCierreExit(Sender: TObject);
begin
  inherited;
  keypreview := True;
end;

function TfrCierre.GetCellText(SelectionRect: TRect; R1C1: Boolean): String;
begin
end;

procedure TfrCierre.pValidaMouseLeave(Sender: TObject);
begin
  inherited;
  pValida.Color := clSilver;
end;

procedure TfrCierre.pValidaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pValida.Color := $00727272;
end;

procedure TfrCierre.SetCellText(ACol, ARow: Integer; AText: String);
begin
end;

end.
