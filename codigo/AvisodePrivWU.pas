unit AvisodePrivWU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, dxGDIPlusClasses, cxImage, StdCtrls, cxButtons;

type
  TfrAvisodePrivWU = class(TForm)
    btCerrar: TcxButton;
    btAceptar: TcxButton;
    AvisodePriv: TMemo;
    imgWU: TcxImage;
    procedure btAceptarClick(Sender: TObject);
    procedure btCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frAvisodePrivWU: TfrAvisodePrivWU;

implementation

{$R *.dfm}

procedure TfrAvisodePrivWU.btAceptarClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrAvisodePrivWU.btCerrarClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrAvisodePrivWU.FormCreate(Sender: TObject);
begin
  AvisodePriv.Lines.LoadFromFile(ExtractFilePath(ParamStr(0))+'AVISO DE PRIVACIDAD WU.txt', TEncoding.UTF8)
end;
end.
