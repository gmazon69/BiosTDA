unit BuscaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomCapturas, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, cxCurrencyEdit, cxTextEdit, StdCtrls,
  cxGroupBox, ActnList, DB, IBCustomDataSet, IBDatabase, cxLabel, cxButtons,
  ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  dxmdaset, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrBuscaCliente = class(TfrCustomCapturas)
    cxGroupBox2: TcxGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edApellidoPaterno: TcxTextEdit;
    edTelefono: TcxCurrencyEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    mClientes: TdxMemData;
    mClientestarjeta: TStringField;
    mClientesstatus: TStringField;
    mClientesNombre: TStringField;
    dsClientes: TDataSource;
    cxButton1: TcxButton;
    acBuscar: TAction;
    procedure acGrabarExecute(Sender: TObject);
    procedure acBuscarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frBuscaCliente: TfrBuscaCliente;

implementation

uses DatosRemoto, Service1;

{$R *.dfm}

procedure TfrBuscaCliente.acBuscarExecute(Sender: TObject);
var
 Manda : BlFindCardRequest;
 Responde : OperationResponse;
begin
  inherited;
  Manda := BlFindCardRequest.Create;
  Manda.LastName := edApellidoPaterno.Text;
  Manda.Phone := inttostr(edTelefono.EditValue);
  Responde := OperationResponse.Create;
  Responde := (frDatosRemoto.httpriorLealtad as IService1).BlFindCard(Manda);

  ShowMessage(inttostr(Length(Responde.ResponseSource)));
end;

procedure TfrBuscaCliente.acGrabarExecute(Sender: TObject);
begin
  inherited;
  //
end;

end.
