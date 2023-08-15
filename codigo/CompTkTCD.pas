unit CompTkTCD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxLabel, cxCurrencyEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TForm1 = class(TForm)
    bGrabar: TcxButton;
    bCerrar: TcxButton;
    cxDateEdit1: TcxDateEdit;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cxCurrencyEdit3: TcxCurrencyEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    procedure bGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses FtoBBVA, FtoBBVACancel;

{$R *.dfm}

procedure TForm1.bGrabarClick(Sender: TObject);
Var
  Fto: TFtoBBVA;
  FtoC: TFtoBBVACancel;
begin
  Fto:= TFtoBBVA.Create(Self);
  Fto.idPago := idPago;
  Fto.DB := qPagos;
  Fto.Imprime;
  Fto.Free;

  FtoC:= TFtoBBVACancel.Create(Self);
  FtoC.idPago := idPago;
  FtoC.DB := qPagos;
  FtoC.Imprime;
  FtoC.Free;
end;

end.
