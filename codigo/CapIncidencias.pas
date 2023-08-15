unit CapIncidencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Master, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ExtCtrls, ImgList, cxProgressBar,
  dxStatusBar, DB, IBCustomDataSet, IBQuery, IBDatabase, cxTextEdit, cxDBEdit,
  StdCtrls, Mask, DBCtrls, cxMaskEdit, cxDropDownEdit, Menus, cxLabel, cxButtons,
  StrUtils, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrCapIncidencias = class(TfrMaster)
    qNew: TIBQuery;
    qVend: TIBQuery;
    LocalTransaction: TIBTransaction;
    dsVend: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edObser: TcxDBTextEdit;
    edIncidencia: TcxComboBox;
    Label4: TLabel;
    Panel1: TPanel;
    Bevel2: TBevel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    cxLabel28: TcxLabel;
    edVend: TcxLookupComboBox;
    edNombreVend: TcxLookupComboBox;
    qVendIDVENDEDOR: TLargeintField;
    qVendIDTIENDA: TLargeintField;
    qVendALTA: TDateField;
    qVendVEND: TIBStringField;
    qVendNOMBRE: TIBStringField;
    qVendDIRECCION: TIBStringField;
    qVendCOLONIA: TIBStringField;
    qVendESTADO: TIBStringField;
    qVendCIUDAD: TIBStringField;
    qVendCP: TIBStringField;
    qVendTELEFONO: TIBStringField;
    qVendCAJERO: TIBStringField;
    qVendSUELDO: TIBBCDField;
    qVendBONO: TIBBCDField;
    qVendUSERNAME: TIBStringField;
    qVendCLAVE: TIBStringField;
    qVendCOMISION: TIBBCDField;
    qVendOBSER: TIBStringField;
    qVendACTIVO: TSmallintField;
    qVendTIPO: TIBStringField;
    qVendINFONAVIT: TIBBCDField;
    qVendNSS: TIBStringField;
    qVendCURP: TIBStringField;
    qVendCAPINCIDE: TLargeintField;
    qVendVendedor: TIBStringField;
    procedure btAceptarClick(Sender: TObject);
    procedure btCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edVendPropertiesEditValueChanged(Sender: TObject);
    procedure qVendCalcFields(DataSet: TDataSet);
  private
    FidVend: Integer;
    FidReporta: Integer;
    procedure SetidVend(const Value: Integer);
  public
    property idVend: Integer read FidVend write SetidVend;
    Property idReporta: Integer read FidReporta write FidReporta;
    procedure Muestra;
  end;

var
  frCapIncidencias: TfrCapIncidencias;

implementation

uses Datos, Asistencias, Util;

{$R *.dfm}

procedure TfrCapIncidencias.btAceptarClick(Sender: TObject);
begin
  inherited;
  if edIncidencia.ItemIndex < 0 then begin
    Showmessage('Incidencia no válida');
    edIncidencia.SetFocus;
    Exit;
  end;

  with frAsistencias do begin
    mCatalogos.Locate('idVendedor', idVend, []);

    if ((mCatalogosce.AsInteger = 1 ) // Ya checó Asistencia ... Y
        and (edIncidencia.ItemIndex <> 1)) then begin // Trata de poner otro Status disntinto a Falta
      Herror('Este vendedor ya checó en este día, solo se puede cambiar la incidencia a Falta.');
      edIncidencia.ItemIndex := 1;
      Exit;
    end;

    mCatalogos.Edit;
    mCatalogos.FieldByName('Incidencia').AsString := LeftStr(edIncidencia.EditValue, 1);
    mCatalogos.FieldByName('idReporta').AsInteger := idReporta;
    mCatalogos.Post;
  end;

  idVend := idVend;
  //Close;
end;

procedure TfrCapIncidencias.btCerrarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrCapIncidencias.edVendPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
   if TcxLookupComboBox(Sender).EditValue = Null Then
    idVend := -1
  Else
    idVend := TcxLookupComboBox(Sender).EditValue;
end;

procedure TfrCapIncidencias.FormShow(Sender: TObject);
begin
  inherited;
  edVend.Setfocus;
  if edIncidencia.Enabled then
    edIncidencia.SetFocus;
end;

procedure TfrCapIncidencias.Muestra;
begin
  {qVend.Close;
  qVend.ParamByName('idTda').AsInteger := frDatos.idTienda;
  qVend.Open;  }

  ShowModal;
end;

procedure TfrCapIncidencias.qVendCalcFields(DataSet: TDataSet);
begin
  inherited;
  qVendVendedor.AsString := qVendVend.AsString;
end;

procedure TfrCapIncidencias.SetidVend(const Value: Integer);
begin
  FidVend := Value;

  edVend.Properties.OnEditValueChanged := Nil;
  edVend.EditValue := FidVend;
  edNombreVend.EditValue := FidVend;
  edVend.Properties.OnEditValueChanged := edVendPropertiesEditValueChanged;

  frAsistencias.mCatalogos.Locate('idVendedor', FidVend, []);
  case frAsistencias.mCatalogosce.AsInteger of
    1: edIncidencia.ItemIndex := 1;
    2: edIncidencia.ItemIndex := 0;
    3: edIncidencia.ItemIndex := 1;
    4: edIncidencia.ItemIndex := 2;
    5: edIncidencia.ItemIndex := 3;
  else edIncidencia.ItemIndex := -1;
  end;
  edIncidencia.Enabled := frAsistencias.mCatalogoscs.AsInteger = 0;
  btAceptar.Enabled := frAsistencias.mCatalogoscs.AsInteger = 0;

end;

end.
