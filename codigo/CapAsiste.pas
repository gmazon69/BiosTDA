unit CapAsiste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Master, cxGraphics, ExtCtrls, ImgList, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxDropDownEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, IBCustomDataSet, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, IBDatabase, cxLabel, StdCtrls,
  cxButtons, ActnList, IBQuery, Menus;

type
  TfrCapAsiste = class(TfrMaster)
    ActionsMov: TActionList;
    acGrabar: TAction;
    acCerrar: TAction;
    acDetalle: TAction;
    ImageListOpc: TImageList;
    Panel1: TPanel;
    Bevel2: TBevel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    cxLabel28: TcxLabel;
    Panel2: TPanel;
    dsAsiste: TDataSource;
    Asiste: TIBDataSet;
    LocalTransaction: TIBTransaction;
    GridAsiste: TcxGrid;
    tvAsiste: TcxGridDBTableView;
    lvAsiste: TcxGridLevel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edFecha: TcxDateEdit;
    dsTiendas: TDataSource;
    edTienda: TcxLookupComboBox;
    edNombreTienda: TcxLookupComboBox;
    tvAsisteCTRL: TcxGridDBColumn;
    tvAsisteIDVENDEDOR: TcxGridDBColumn;
    tvAsisteIDTIENDA: TcxGridDBColumn;
    tvAsisteVEND: TcxGridDBColumn;
    tvAsisteNOMBRE: TcxGridDBColumn;
    AsisteCTRL: TIBStringField;
    AsisteIDVENDEDOR: TLargeintField;
    AsisteIDTIENDA: TLargeintField;
    AsisteVEND: TIBStringField;
    AsisteNOMBRE: TIBStringField;
    qNew: TIBQuery;
    ibSeek: TIBQuery;
    Procedure Termina(Sender: TObject; Salida : Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edTiendaPropertiesEditValueChanged(Sender: TObject);
    procedure GridAsisteEnter(Sender: TObject);
    procedure GridAsisteExit(Sender: TObject);
    procedure acGrabarExecute(Sender: TObject);
    procedure acCerrarExecute(Sender: TObject);
  private
    FidTda: Integer;
    procedure SetidTda(const Value: Integer);
    Procedure inicializa;
  public
    Property idTda: Integer Read FidTda Write SetidTda;
  end;

var
  frCapAsiste: TfrCapAsiste;

implementation

uses Datos, Util;

{$R *.dfm}

{ TfrCapAsiste }

procedure TfrCapAsiste.FormCreate(Sender: TObject);
begin
  inherited;
  Clave := _Entra;
  onTermina := Termina;
end;

procedure TfrCapAsiste.Termina(Sender: TObject; Salida: Boolean);
begin
  inherited;
  Inicializa;
end;

procedure TfrCapAsiste.inicializa;
begin
  Asiste.Close;
  idTda := -1;
  edFecha.Date := Date;
  edFecha.SetFocus;
end;

procedure TfrCapAsiste.SetidTda(const Value: Integer);
begin
  FidTda := Value;
  Asiste.CancelUpdates;
  Asiste.Close;

  edTienda.Properties.OnEditValueChanged := Nil;
  edTienda.EditValue := FidTda;
  edNombreTienda.EditValue := FidTda;
  edTienda.Properties.OnEditValueChanged := edTiendaPropertiesEditValueChanged;
  if FidTda > 0 Then Begin

    ibSeek.Close;
    ibSeek.ParamByName('idTda').AsInteger := FidTda;
    ibSeek.ParamByName('wDate').AsDate := edFecha.Date;
    ibSeek.Open;
    if not ibSeek.IsEmpty Then Begin
      Herror('Ya existen registros en esa fecha');
      idTda := -1;
      edFecha.SetFocus;
      Exit;
    End;

    Asiste.ParamByName('idTda').AsInteger := FidTda;
    Asiste.Open;
  End;
end;

procedure TfrCapAsiste.edTiendaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if TcxLookupComboBox(Sender).EditValue = Null Then
    idTda := -1
  Else
    idTda := TcxLookupComboBox(Sender).EditValue;
end;

procedure TfrCapAsiste.GridAsisteEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := False;
end;

procedure TfrCapAsiste.GridAsisteExit(Sender: TObject);
begin
  inherited;
  KeyPreview := True;
end;

procedure TfrCapAsiste.acGrabarExecute(Sender: TObject);
Var
  siNulo : Boolean;
begin
  inherited;
  if idTda <= 0 Then Begin
    Herror('ERROR: Tienda no valida');
    edTienda.SetFocus;
    Exit;
  End;

  ibSeek.Close;
  ibSeek.ParamByName('idTda').AsInteger := FidTda;
  ibSeek.ParamByName('wDate').AsDate := edFecha.Date;
  ibSeek.Open;
  if not ibSeek.IsEmpty Then Begin
    Herror('Ya existen registros en esa fecha');
    idTda := -1;
    edFecha.SetFocus;
    Exit;
  End;

  Asiste.First;
  siNulo := False;
  While not Asiste.Eof do Begin
    if Asiste.FieldByName('Ctrl').AsString = '' Then
       siNulo := True;
    Asiste.Next;
  End;

  if siNulo Then Begin
    Herror('ERROR: No se puede registrar asistencia con'+ #10+
    'datos en blanco. Favor de rectificar');
    Exit;
  End;
  Try

    qNew.Close;
    qNew.SQL.Clear;
    qNew.SQL.Add('Insert into Asiste (idtienda, idvendedor, fecha, status, idUser, activo, tipo)');
    qNew.SQL.Add('Values (:idtienda, :idvendedor, :fecha, :status, :idUser, 1, :Tipo)');
    Asiste.EnableControls;

    Asiste.First;
    While not Asiste.Eof do Begin
      if Trim(Asiste.FieldByName('Ctrl').AsString) = '' Then Begin
        Herror('ERROR: No se puede grabar con asistencias'+#10+'en blanco');
        Exit;
      End;
      Asiste.Next;
    End;

    Asiste.First;
    While not Asiste.Eof do Begin
      qNew.Close;
      qNew.ParamByName('idTienda').AsInteger    := idTda;
      qNew.ParamByName('idVendedor').AsInteger  := Asiste.FieldByName('idVendedor').AsInteger;
      qNew.ParamByName('Fecha').AsDate          := edFecha.Date;
      qNew.ParamByName('Status').AsString       := Subs(Asiste.FieldByName('Ctrl').AsString,1,1);
      qNew.ParamByName('idUser').AsInteger      := frDatos.idUser;
      qNew.ParamByName('Tipo').AsString         := GetTipo(Tno);
      qNew.ExecSQL;
      Asiste.Next;
    End;
    LocalTransaction.Commit;
    Inicializa;
  Except
    on e:Exception do Begin
      Herror('Asistencias: ' + e.Message);
      LocalTransaction.Rollback;
    End;
  End;
end;

procedure TfrCapAsiste.acCerrarExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
