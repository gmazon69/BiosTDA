unit CapDepo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Master, cxGraphics, cxLookAndFeelPainters, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxCalendar, IBDatabase, DB,
  IBCustomDataSet, StdCtrls, cxButtons, ExtCtrls, ActnList, cxLabel,
  ImgList, cxContainer, cxEdit, cxProgressBar, dxStatusBar, cxControls;

type
  TfrCapDepo = class(TfrMaster)
    Shape1: TShape;
    cxLabel7: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    ActionCapturas: TActionList;
    acGrabar: TAction;
    acCerrar: TAction;
    Panel1: TPanel;
    Bevel2: TBevel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    cxLabel28: TcxLabel;
    Depositos: TIBDataSet;
    dsDepositos: TDataSource;
    LocalTransaction: TIBTransaction;
    edFecha: TcxDBDateEdit;
    edVenta: TcxDBDateEdit;
    edImporte: TcxDBCurrencyEdit;
    edCta: TcxLookupComboBox;
    cxLabel5: TcxLabel;
    edFolio: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCapDepo: TfrCapDepo;

implementation

uses Datos, Util;

{$R *.dfm}

end.
