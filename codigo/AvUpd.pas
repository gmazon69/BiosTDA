unit AvUpd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxGDIPlusClasses, cxImage, StdCtrls, ExtCtrls;

type
  TfrAvUpdates = class(TForm)
    Logo: TImage;
    Label1: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frAvUpdates: TfrAvUpdates;

implementation

uses Datos;

{$R *.dfm}

procedure TfrAvUpdates.FormCreate(Sender: TObject);
begin
 try
     Logo.Picture.LoadFromFile(frDatos.Logo);
   except
         //
   end;
end;

end.
