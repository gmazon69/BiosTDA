unit CodeBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Master, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  ExtCtrls, ActnList, cxListBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, DB, ImgList,
  cxProgressBar, dxStatusBar, IBCustomDataSet, IBQuery, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, System.Actions, cxCustomListBox,
  System.ImageList;

type
  TfrCodeBar = class(TfrMaster)
    dsArticulos: TDataSource;
    cxLabel2: TcxLabel;
    edCodigo: TcxLookupComboBox;
    ListCodigos: TcxListBox;
    ActionReportes: TActionList;
    acPrint: TAction;
    acSalir: TAction;
    Panel1: TPanel;
    Bevel2: TBevel;
    cxLabel28: TcxLabel;
    bImprimir: TcxButton;
    bCerrar: TcxButton;
    ibSeek: TIBQuery;
    procedure edCodigoPropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure acPrintExecute(Sender: TObject);
    procedure acSalirExecute(Sender: TObject);
    procedure RvSystemPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FidArt: Integer;
    aCodigos : TStringList;
    procedure SetidArt(const Value: Integer);
//    procedure PrintReport(Report : TBaseReport);
  public
    Property idArt : Integer Read FidArt Write SetidArt;
  end;

var
  frCodeBar: TfrCodeBar;

implementation

uses Util, Datos;

{$R *.dfm}

{ TfrCodeBar }

procedure TfrCodeBar.edCodigoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if TcxLookupComboBox(Sender).EditValue = Null Then
    idArt := -1
  Else
    idArt := TcxLookupComboBox(Sender).EditValue;
end;

procedure TfrCodeBar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  aCodigos.Free;
end;

procedure TfrCodeBar.FormCreate(Sender: TObject);
begin
  inherited;
  aCodigos := TStringList.Create;

end;

procedure TfrCodeBar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //inherited;
  //
end;

procedure TfrCodeBar.SetidArt(const Value: Integer);
begin
  FidArt := Value;
  edCodigo.Properties.OnEditValueChanged := Nil;
  edCodigo.EditValue := FidArt;
  if idArt > 0 then Begin
    ibSeek.Close;
    ibSeek.SQL.Clear;
    ibSeek.SQL.Add('select a.idarticulo, a.codigo, a.descripcion, a.marca,');
    ibSeek.SQL.Add('p.pv1');
    ibSeek.SQL.Add('from articulos a');
    ibSeek.SQL.Add('join precios p on p.idArticulo = a.idArticulo');
    ibSeek.SQL.Add('where a.idArticulo = :idArt');
    ibSeek.ParamByName('idArt').AsInteger := idArt;
    ibSeek.Open;

    if ListCodigos.Items.IndexOf(ibSeek.FieldByName('Codigo').AsString) = -1 Then  Begin
      ListCodigos.Items.Add(ibSeek.FieldByName('Codigo').AsString);
      aCodigos.Add(ibSeek.FieldByName('idArticulo').AsString)
    End;
    idArt := -1;
    edCodigo.Properties.OnEditValueChanged := edCodigoPropertiesEditValueChanged;
    edCodigo.SetFocus;
  End;
end;

procedure TfrCodeBar.acPrintExecute(Sender: TObject);
begin
  inherited;
  try
//    RvSystem.Execute;
  finally
    Close;
  end;
end;

procedure TfrCodeBar.RvSystemPrint(Sender: TObject);
begin
  inherited;
//  PrintReport(Sender as TBaseReport);
end;

//procedure TfrCodeBar.PrintReport(Report: TBaseReport);
//Var
//  nRow, nCol : Double;
//  i : Integer;
//  s : String;
//begin
//  with Report do begin
//    SetFont('Times New Roman', 24);
//    Bold := True;
//    NewLine;
//    PrintCenter(frDatos.TdaName, 4);
//    //PrintXY(5.0, 0.5, frDatos.TdaName);
//    NewLine;
//
//    {CODIGOS}
//    SetFont('Arial', 8);
//    nRow := 1.0;
//    nCol := 0.5;
//    for I := 0 to aCodigos.Count - 1 do Begin
//      ibSeek.Close;
//      ibSeek.ParamByName('idArt').AsInteger := StrToInt(aCodigos[i]);
//      ibSeek.Open;
//      With TRPBarscode128.Create(Report) do Begin
//        BarHeight := 0.7;
//        BarWidth  := 0.012;
//        WideFactor := BarWidth;
//        PrintReadable := False;
//        //Bottom := LineBottom;
//        Text := Trim(ibSeek.FieldByName('Codigo').AsString);
//        PrintXY(nCol, nRow);
//        Free;
//      End;
//      SetFont('Arial', 12);
//      Bold := True;
//      PrintXY(nCol+0.0, nRow+0.85, ibSeek.FieldByName('codigo').AsString); // + '    $' +Format ('%8.2f', [ibSeek.FieldByName('pv1').AsFloat]));
//      PrintXY(nCol+0.10, nRow+1.20, '$' +Format ('%7.2f', [ibSeek.FieldByName('pv1').AsFloat]));
//      SetFont('Arial', 8);
//      PrintXY(nCol+0.00, nRow+1, copy(ibSeek.FieldByName('Descripcion').AsString, 1, 35));
//      Bold := False;
//      nCol := nCol + 3.8;
//      if nCol > 7 then Begin
//        nRow := nRow + 2.0;
//        nCol := 0.5;
//      End;
//
//      if nRow > 10 then Begin
//        NewPage;
//        SetFont('Times New Roman', 24);
//        Bold := True;
//        NewLine;
//        PrintCenter(frDatos.TdaName, 4);
//        NewLine;
//        nRow := 1.0;
//      End;
//    End;
//
//  end;
//end;

procedure TfrCodeBar.acSalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
