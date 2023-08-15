unit Ctes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomCapturas, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, DB, DBClient,
  ActnList, IBCustomDataSet, IBDatabase, cxLabel, StdCtrls, cxButtons, ExtCtrls,
  cxMaskEdit, cxButtonEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfrCtes = class(TfrCustomCapturas)
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel7: TcxLabel;
    Ctes: TClientDataSet;
    edNombre: TcxTextEdit;
    edDireccion: TcxTextEdit;
    edExterior: TcxTextEdit;
    edInterior: TcxTextEdit;
    edMunicipio: TcxTextEdit;
    edCiudad: TcxTextEdit;
    edEstado: TcxTextEdit;
    edCP: TcxTextEdit;
    edPais: TcxTextEdit;
    edTelefono: TcxTextEdit;
    edMail: TcxTextEdit;
    cxLabel1: TcxLabel;
    edColonia: TcxTextEdit;
    edRFC: TcxButtonEdit;
    acBusca: TAction;
    BuscaCte: TClientDataSet;
    BuscaCteIDCLIENTE: TLargeintField;
    BuscaCteIDTIENDA: TLargeintField;
    BuscaCteRFC: TWideStringField;
    BuscaCteCTE: TIntegerField;
    BuscaCteCVE_CLI: TWideStringField;
    BuscaCteTDA: TWideStringField;
    BuscaCteNOMBRE: TWideStringField;
    BuscaCteSUCURSAL: TWideStringField;
    BuscaCteCONTACTO: TWideStringField;
    BuscaCteDIRECCION: TWideStringField;
    BuscaCteNUMERO_INT: TWideStringField;
    BuscaCteNUMERO_EXT: TWideStringField;
    BuscaCteCOLONIA: TWideStringField;
    BuscaCteMUNICIPIO: TWideStringField;
    BuscaCteCIUDAD: TWideStringField;
    BuscaCteESTADO: TWideStringField;
    BuscaCteCP: TWideStringField;
    BuscaCtePAIS: TWideStringField;
    BuscaCteMAIL: TWideStringField;
    BuscaCtePLAZO: TSmallintField;
    BuscaCteDESCUENTO: TBCDField;
    BuscaCteTELEFONO: TWideStringField;
    BuscaCteACTIVO: TSmallintField;
    CtesIDCLIENTE: TLargeintField;
    CtesIDTIENDA: TLargeintField;
    CtesRFC: TWideStringField;
    CtesCTE: TIntegerField;
    CtesCVE_CLI: TWideStringField;
    CtesTDA: TWideStringField;
    CtesNOMBRE: TWideStringField;
    CtesSUCURSAL: TWideStringField;
    CtesCONTACTO: TWideStringField;
    CtesDIRECCION: TWideStringField;
    CtesNUMERO_INT: TWideStringField;
    CtesNUMERO_EXT: TWideStringField;
    CtesCOLONIA: TWideStringField;
    CtesMUNICIPIO: TWideStringField;
    CtesCIUDAD: TWideStringField;
    CtesESTADO: TWideStringField;
    CtesCP: TWideStringField;
    CtesPAIS: TWideStringField;
    CtesMAIL: TWideStringField;
    CtesPLAZO: TSmallintField;
    CtesDESCUENTO: TBCDField;
    CtesTELEFONO: TWideStringField;
    CtesACTIVO: TSmallintField;
    cxLabel10: TcxLabel;
    edRegimen: TcxLookupComboBox;
    cxLabel13: TcxLabel;
    edUsoCFDI: TcxLookupComboBox;
    dsUsoCFDI: TDataSource;
    dsRegimen: TDataSource;
    CtesREGIMEN: TWideStringField;
    CtesUSOCFDI: TWideStringField;
    BuscaCteREGIMEN: TWideStringField;
    BuscaCteUSOCFDI: TWideStringField;
    procedure acGrabarExecute(Sender: TObject);
    procedure acCerrarExecute(Sender: TObject);
    procedure acBuscaExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FidCte: Integer;
  public
    Procedure Altas;
    Procedure Muestra;
    Property idCte : Integer Read FidCte Write FidCte;
  end;

var
  frCtes: TfrCtes;

implementation

uses DatosRemoto, Util, Datos, Emite33;

{$R *.dfm}

{ TfrCtes }

procedure TfrCtes.Altas;
begin
end;

procedure TfrCtes.FormCreate(Sender: TObject);
begin
  inherited;
  idCte := -1;
end;

procedure TfrCtes.Muestra;
begin
  ShowModal;
end;

procedure TfrCtes.acGrabarExecute(Sender: TObject);
begin
  inherited;
  if (Trim(edRFC.Text) = '') or (Length(edRFC.Text) < 12) then
  Begin
    Herror('ERROR: RFC no valido');
    edRFC.SetFocus;
    Exit;
  End;

  if (Trim(edCP.Text) = '') or (Length(edRFC.Text) < 5) then
  Begin
    Herror('ERROR: Codigo Postal no valido');
    edRFC.SetFocus;
    Exit;
  End;

  if edRegimen.EditValue = null then
  Begin
    Herror('ERROR: Regimen Fiscal no valido');
    edRFC.SetFocus;
    Exit;
  End;

  with frDatosRemoto do Begin
    Try
     Conecta;
       Try
        Ctes.Close;
        Ctes.Params.ParamByName('idCte').AsInteger := idCte;
        Ctes.Open;
        if idCte <= 0 then
          Ctes.Insert
        Else
          Ctes.Edit;

        Ctes.FieldByName('idCliente').Value  := idCte;
        Ctes.FieldByName('RFC').Value        := edRFC.Text;
        Ctes.FieldByName('Nombre').Value     := edNombre.Text;
        Ctes.FieldByName('Direccion').Value  := edDireccion.Text;
        Ctes.FieldByName('Numero_Ext').Value := edExterior.Text;
        Ctes.FieldByName('Numero_Int').Value := edInterior.Text;
        Ctes.FieldByName('Colonia').Value    := edColonia.Text;
        Ctes.FieldByName('Municipio').Value  := edMunicipio.Text;
        Ctes.FieldByName('Ciudad').Value     := edCiudad.Text;
        Ctes.FieldByName('Estado').Value     := edEstado.Text;
        Ctes.FieldByName('CP').Value         := edCP.Text;
        Ctes.FieldByName('Pais').Value       := edPais.Text;
        Ctes.FieldByName('Telefono').Value   := edTelefono.Text;
        Ctes.FieldByName('mail').Value       := edMail.Text;
        Ctes.FieldByName('Regimen').Value    := edRegimen.EditValue;
        Ctes.FieldByName('usoCFDI').Value    := edUsoCFDI.EditValue;
        Ctes.FieldByName('Activo').Value     := 1;
        Ctes.Post;
        Ctes.ApplyUpdates(0);
      Except
        on e:Exception do
        Begin
          Log('Clientes: ' + e.Message);
          Herror('Clientes');
        End;
      End;
    Finally
      Desconecta;
    End;
    if idCte <= 0 then Begin
      acBuscaExecute(Self);
    End;
  End;

end;

procedure TfrCtes.acBuscaExecute(Sender: TObject);
begin
  inherited;
  With frDatosRemoto do Begin
    Try
      Conecta;
      idCte := -1;
      BuscaCte.Close;
      BuscaCte.Params.ParamByName('aRFC').AsString := edRFC.Text;
      BuscaCte.Open;
      idCte := BuscaCte.FieldByName('idCliente').AsInteger;
      if not BuscaCte.IsEmpty  then Begin
        edNombre.Text     := BuscaCte.FieldByName('Nombre').AsString;
        edDireccion.Text  := BuscaCte.FieldByName('Direccion').AsString;
        edExterior.Text   := BuscaCte.FieldByName('Numero_Ext').AsString;
        edInterior.Text   := BuscaCte.FieldByName('Numero_Int').AsString;
        edColonia.Text    := BuscaCte.FieldByName('Colonia').AsString;
        edMunicipio.Text  := BuscaCte.FieldByName('Municipio').AsString;
        edCiudad.Text     := BuscaCte.FieldByName('Ciudad').AsString;
        edEstado.Text     := BuscaCte.FieldByName('Estado').AsString;
        edCP.Text         := BuscaCte.FieldByName('CP').AsString;
        edPais.Text       := BuscaCte.FieldByName('Pais').AsString;
        edTelefono.Text   := BuscaCte.FieldByName('Telefono').AsString;
        edMail.Text       := BuscaCte.FieldByName('Mail').AsString;
        edRegimen.EditValue := BuscaCte.FieldByName('Regimen').AsString;
        edUsoCFDI.EditValue := BuscaCte.FieldByName('UsoCFDI').AsString;
      End;
    Finally
      Desconecta;
    End;
  End;
end;

procedure TfrCtes.acCerrarExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

end.                  
