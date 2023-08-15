unit AsistManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Master, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxLabel, StdCtrls, cxButtons,
  ExtCtrls, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit, cxDBEdit, ImgList, cxProgressBar, dxStatusBar;

type
  TfrAsistManual = class(TfrMaster)
    edEntrada: TcxDBTimeEdit;
    Panel1: TPanel;
    Bevel2: TBevel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    cxLabel28: TcxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edSalComer: TcxDBTimeEdit;
    edEntComer: TcxDBTimeEdit;
    edSalida: TcxDBTimeEdit;
    procedure FormCreate(Sender: TObject);
    procedure btCerrarClick(Sender: TObject);
    procedure btAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edEntradaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frAsistManual: TfrAsistManual;

implementation

uses Asistencias, Datos;

{$R *.dfm}

procedure TfrAsistManual.btAceptarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;

procedure TfrAsistManual.btCerrarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrAsistManual.edEntradaExit(Sender: TObject);
begin
  inherited;
  btAceptar.SetFocus;
end;

procedure TfrAsistManual.FormCreate(Sender: TObject);
begin
  inherited;
  With frAsistencias do begin
    edEntrada.Enabled :=  mCatalogos.FieldByName('ce').AsInteger <= 0;
    edSalComer.Enabled := mCatalogos.FieldByName('csc').AsInteger <= 0;
    edEntComer.Enabled := mCatalogos.FieldByName('cec').AsInteger <= 0;
    edSalida.Enabled := mCatalogos.FieldByName('cs').AsInteger <= 0;
  end;
end;

procedure TfrAsistManual.FormShow(Sender: TObject);
begin
  inherited;
  if edEntrada.Enabled then begin
    edEntrada.SetFocus;
    Exit;
  end;
  if edSalComer.Enabled then begin
    edSalComer.SetFocus;
    Exit;
  end;
  if edEntComer.Enabled then begin
    edEntComer.SetFocus;
    Exit;
  end;
  if edSalida.Enabled then begin
    edSalida.SetFocus;
    Exit;
  end;
end;

end.
