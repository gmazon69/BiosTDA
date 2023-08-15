unit AutoCapIncide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PideAuto, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Menus, DB, IBCustomDataSet,
  IBQuery, dxGDIPlusClasses, cxImage, StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxGroupBox, cxRadioGroup;

type
  TfrAutoCapIncide = class(TfrPideAuto)
    procedure btAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frAutoCapIncide: TfrAutoCapIncide;

implementation

uses Datos;

{$R *.dfm}

procedure TfrAutoCapIncide.btAceptarClick(Sender: TObject);
begin
  //inherited;
  ModalResult := mrNone;
  {if edQuien.ItemIndex = -1 then Begin
    MessageBox(0,'Favor de indicar quien esta autorizando el ajuste',
                  'gpxSOFT',mb_TaskModal+mb_IconError+mb_OK);
    edQuien.SetFocus;
    Exit;
  end;   }

  if edUser.Text = '' then Begin
    MessageBox(0,'Usuario no valido',
                  'gpxSOFT',mb_TaskModal+mb_IconError+mb_OK);
    edUser.SetFocus;
    Exit;
  end;

  if edClave.Text = '' then Begin
    MessageBox(0,'Clave no valida',
                  'gpxSOFT',mb_TaskModal+mb_IconError+mb_OK);
    edClave.SetFocus;
    Exit;
  end;

  iSeek.Close;
  iSeek.SQL.Clear;

  if edQuien.ItemIndex = 0 then
    iSeek.SQL.Add('Select * from zonas where username = :user and userpassword = :pass')
  else
  Begin
    iSeek.SQL.Add('Select * from vendedor where idTienda = :idTda and username = :user and clave = :pass');
    iSeek.SQL.Add('and capIncide = 1');
    iSeek.ParamByName('idtda').AsInteger := frDatos.idTienda;
  End;

  iSeek.ParamByName('User').AsString := edUser.Text;
  iSeek.ParamByName('pass').AsString := edClave.Text;
  iSeek.Open;

  if iSeek.IsEmpty then Begin
    MessageBox(0,'No tienes permiso para realizar este proceso', 'gpxSOFT',mb_TaskModal+mb_IconError+mb_OK);
    edUser.SetFocus;
    Exit;
  End;
  ModalResult := mrOK;

  frDatos.idVendedor := iSeek.FieldByName('idvendedor').AsInteger;
  NombreAuto := iSeek.FieldByName('Nombre').AsString;
end;

end.
