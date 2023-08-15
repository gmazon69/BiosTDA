unit CanRem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Master, cxGraphics, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, DB, IBDatabase, IBCustomDataSet, IBQuery, cxCurrencyEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxLabel, cxImage,
  ImgList, cxContainer, cxEdit, cxProgressBar, dxStatusBar, cxControls,
  Menus, cxLookAndFeels;

type
  TfrCanRem = class(TfrMaster)
    picTaref: TcxImage;
    cxLabel1: TcxLabel;
    edRefer: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edFecha: TcxDateEdit;
    edNombre: TcxTextEdit;
    edImporte: TcxCurrencyEdit;
    qNew: TIBQuery;
    LocalTransaction: TIBTransaction;
    dsFacturas: TDataSource;
    ibSeek: TIBQuery;
    Panel1: TPanel;
    Bevel2: TBevel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    cxLabel28: TcxLabel;
    Procedure Termina(Sender: TObject; Salida : Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btAceptarClick(Sender: TObject);
    procedure edReferExit(Sender: TObject);
    procedure btCerrarClick(Sender: TObject);
  private
    FidTda : Integer;
    FActivo : Integer;
  public
    Property idTda : Integer Read FidTda Write FidTda;
    Procedure CancelaRem(idRem: Integer);
  end;

var
  frCanRem: TfrCanRem;

implementation

uses Datos, Util;

{$R *.dfm}

procedure TfrCanRem.FormCreate(Sender: TObject);
begin
  inherited;
  Clave := _Entra;
  onTermina := Termina;
  idTda := frDatos.idTienda;
  Panel1.Enabled := False;
  edRefer.Enabled := False;
  FActivo := 3;
end;

procedure TfrCanRem.Termina(Sender: TObject; Salida: Boolean);
begin
  inherited;
  Panel1.Enabled := True;
  edRefer.Enabled := True;
  edRefer.SetFocus;
  PicTaref.Visible := Tno;
end;

procedure TfrCanRem.btAceptarClick(Sender: TObject);
begin
  inherited;
  qNew.Close;
  qNew.SQL.Clear;
  qNew.SQL.Add('Select * from Remision');
  qNew.SQL.Add('where activo = 1 and refer = :xFa');
  qNew.SQL.Add('and idTienda = :idTda');
  qNew.ParamByName('xFa').AsString := edRefer.Text;
  qNew.ParamByName('idTda').AsInteger := idTda;
  qNew.Open;

  if qNew.IsEmpty Then Begin
    Herror('Esa remision no existe');
    edRefer.SetFocus;
    Exit;
  End;
  if (qNew.FieldByName('Tipo').AsString = 'B') and not (Tno) Then Begin
    Herror('Esa remision no existe');
    edRefer.SetFocus;
    Exit;
  End;

  edFecha.Date    := qNew.FieldByName('Fecha').AsDateTime;
  edNombre.Text   := qNew.FieldByName('Nombre').AsString;
  edImporte.Value := qNew.FieldByName('Importe').AsFloat;
  if (qNew.FieldByName('Tipo').AsString = 'A') and (Tno) Then
    FActivo := 0
  Else
    FActivo := 3;

  CancelaRem(qNew.FieldByName('idRemision').AsInteger);
  edRefer.Text := '';
  edFecha.Text := '';
  edNombre.Text := '';
  edImporte.Value := 0;
  edRefer.SetFocus;
end;

procedure TfrCanRem.CancelaRem(idRem: Integer);
begin

  If Not AutorizaOfi(qNew, '980950023') Then Begin
    Herror('Clave no valida');
    edrefer.SetFocus;
    Exit;
  End;
  if MessageBox(0,'Esta seguro','gpxSOFT',mb_TaskModal+mb_IconQuestion+mb_YesNo + mb_DefButton2) = idYes Then Begin

    Try

      qNew.Close;
      qNew.SQL.Clear;
      qNew.SQL.Add('update remision set activo = :xActivo');
      qNew.SQL.Add('Where idRemision = :idRem');
      qNew.ParamByName('idRem').AsInteger := idRem;
      qNew.ParamByName('xActivo').AsInteger := FActivo;
      qNew.ExecSQL;

      LocalTransaction.Commit;
    Except
      on e:Exception do
      Begin
        Log('Cancelacion de remisiones: ' + e.Message);
        Herror('Error al cancelar remision');
        LocalTransaction.Rollback;
      End;
    End;

  End;
end;

procedure TfrCanRem.edReferExit(Sender: TObject);
begin
  inherited;
  edRefer.Text := Ceros(edRefer.Text,10);
end;

procedure TfrCanRem.btCerrarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
