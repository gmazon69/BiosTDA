unit Autoriza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxLabel,
  DB, IBCustomDataSet, IBQuery;

type
  TfrAutoriza = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edFolio: TcxTextEdit;
    edCodigo: TcxTextEdit;
    Panel1: TPanel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    qSeek: TIBQuery;
    procedure btAceptarClick(Sender: TObject);
  private
    FidTda: Integer;
    FFactor: Integer;
    Procedure GeneraFolio;
  public
    Procedure Muestra;
    Property idTda: Integer Read FidTda Write FidTda;
    Property Factor: Integer Read FFactor Write FFactor;
  end;

var
  frAutoriza: TfrAutoriza;

implementation

uses Util, Datos;

{$R *.dfm}

{ TForm1 }

procedure TfrAutoriza.GeneraFolio;
Var
  Folio : Integer;
  S : String;
Begin
  Folio :=  1 + Random(1000000);
  S := ceros( IntToStr(Folio), 6, '0');
  edFolio.Text := S;
end;

procedure TfrAutoriza.Muestra;
begin
  GeneraFolio;
  ShowModal;
end;

procedure TfrAutoriza.btAceptarClick(Sender: TObject);
Var
  D2, D3: Integer;
begin
  ModalResult := mrNone;
  qSeek.Close;
  qSeek.Open;
  D2 := qSeek.FieldByName('Dia2').AsInteger;
  D3 := qSeek.FieldByName('Dia3').AsInteger;
//  cxLabel3.Caption := _Auto2(edFolio.Text, D2, D3, Factor);
  if _Auto2(edFolio.Text, D2, D3, Factor) <> Trim(edCodigo.Text) Then
  Begin
    ShowMessage('ERROR: Codigo no valido');
    ModalResult := mrNone;
    edCodigo.Text := '';
    edCodigo.SetFocus;
    Exit;
  End;
  ModalResult := mrOK;
end;

end.
