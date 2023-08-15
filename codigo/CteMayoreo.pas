unit CteMayoreo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, ActnList, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, dxmdaset, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxLabel;

type
  TfrCteMayoreo = class(TForm)
    cxLabel1: TcxLabel;
    edCadena: TcxTextEdit;
    Panel1: TPanel;
    btAceptar: TcxButton;
    btCerrar: TcxButton;
    tvData: TcxGridDBTableView;
    lvData: TcxGridLevel;
    GridData: TcxGrid;
    mData: TdxMemData;
    dsData: TDataSource;
    mDataid: TStringField;
    mDatanombre: TStringField;
    tvDataRecId: TcxGridDBColumn;
    tvDataid: TcxGridDBColumn;
    tvDatanombre: TcxGridDBColumn;
    cxButton1: TcxButton;
    ActionList1: TActionList;
    acBuscar: TAction;
    acAceptar: TAction;
    acCerrar: TAction;
    procedure acAceptarExecute(Sender: TObject);
    procedure acBuscarExecute(Sender: TObject);
    procedure acCerrarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tvDataEditKeyPress(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
    procedure GridDataEnter(Sender: TObject);
    procedure GridDataExit(Sender: TObject);
  private
    FidMayoreo: String;

  public
    Procedure Muestra;
    Property idMayoreo: String read FidMayoreo Write FidMayoreo;
  end;

var
  frCteMayoreo: TfrCteMayoreo;
  Function BuscaCte(aURL: String; aKey: String; aCadena: String): String; external 'OperivDLL.dll';

implementation

uses Util, Globales, DatosRemoto;

{$R *.dfm}

procedure TfrCteMayoreo.FormCreate(Sender: TObject);
begin
  idMayoreo := '';
end;

procedure TfrCteMayoreo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Skip(Sender,key,Handle);
end;

procedure TfrCteMayoreo.GridDataEnter(Sender: TObject);
begin
  KeyPreview := False;
  btAceptar.Default := True;
end;

procedure TfrCteMayoreo.GridDataExit(Sender: TObject);
begin
  KeyPreview := True;
  btAceptar.Default := False;
end;

procedure TfrCteMayoreo.Muestra;
begin

  _URLOperiv := '';
  _apiOperiv := '';

  Try
    with frDatosRemoto do
    Begin
      SeekOperiv.Close;
      SeekOperiv.Open;

      while not SeekOperiv.Eof do
      Begin
        if SeekOperiv.FieldByName('nombre').AsString = 'URLOPERIV' then
          _URLOperiv := SeekOperiv.FieldByName('Datos').AsString;
        if SeekOperiv.FieldByName('nombre').AsString = 'APIKEY' then
          _apiOperiv := SeekOperiv.FieldByName('Datos').AsString;
        SeekOperiv.Next;
      End;
      SeekOperiv.Close;
    End;
  Except
    on e:Exception do
    Begin
      Log('CteMayoreo '+e.Message);
      Herror('Error consulta cliente');
    End;
  End;

  if (trim(_URLOperiv) = '') or (trim(_URLOperiv) = '') then
  Begin
    Herror('ERROR: No hay configuracion para cliente de mayoreo');
    exit;
  End;
  ShowModal;
end;

procedure TfrCteMayoreo.tvDataEditKeyPress(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
begin
  if key = char(VK_RETURN) then
    acAceptarExecute(Self);
end;

procedure TfrCteMayoreo.acAceptarExecute(Sender: TObject);
begin
  idMayoreo := mData.FieldByName('id').AsString;
  ModalResult := mrOK;
end;

procedure TfrCteMayoreo.acBuscarExecute(Sender: TObject);
Var
  tt : String;
  lista, nRow : TStringList;
  I : Integer;
begin
  Lista := TStringList.Create;
  nRow  := TStringList.Create;

  Try
    Try
      tt := BuscaCte(pChar(_URLOperiv), pChar(_apiOperiv), pChar(edCadena.Text));
      Lista.Text := tt;

      mData.Close;
      mData.Open;
      mData.DisableControls;
      for I := 0 to Pred(Lista.Count) do
      Begin
        nRow.StrictDelimiter := True;
        nRow.Delimiter := ',';
        nRow.DelimitedText := Lista[I];

        mData.Append;
        mData.FieldByName('id').AsString := nRow[0];
        mData.FieldByName('Nombre').AsString := StringReplace(nRow[1], '"', '', [rfReplaceAll, rfIgnoreCase]);
        mData.Post;
      End;
      mData.First;
      mData.EnableControls;
      GridData.SetFocus;

    Except
      on e:Exception do
      Begin
        Log('CteMayoreo '+e.Message);
        Herror('Error cliente mayoreo');
      End;
    End;
  Finally
    Lista.Free;
  End;
end;

procedure TfrCteMayoreo.acCerrarExecute(Sender: TObject);
begin
  Close;
end;

end.
