//
// Created by the DataSnap proxy generator.
// 

unit ArchivosDataSnap;

interface

uses DBXCommon, DBXJSON, Classes, SysUtils, DB, SqlExpr, DBXDBReaders;

type
  TfrServerMethodsClient = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
  end;

  TimgClient = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FGuardarArchivoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GuardarArchivo(img: OleVariant; name: string; Clase: Integer): Boolean;
  end;

implementation


constructor TfrServerMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('La conexión no puede ser nulo. Asegúrese de que la conexión se ha abierto.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;


constructor TfrServerMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('La conexión no puede ser nulo. Asegúrese de que la conexión se ha abierto.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TfrServerMethodsClient.Destroy;
begin
  inherited;
end;

function TimgClient.GuardarArchivo(img: OleVariant; name: string; Clase: Integer): Boolean;
begin
  if FGuardarArchivoCommand = nil then
  begin
    FGuardarArchivoCommand := FDBXConnection.CreateCommand;
    FGuardarArchivoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGuardarArchivoCommand.Text := 'Timg.GuardarArchivo';
    FGuardarArchivoCommand.Prepare;
  end;
  FGuardarArchivoCommand.Parameters[0].Value.AsVariant := img;
  FGuardarArchivoCommand.Parameters[1].Value.SetWideString(name);
  FGuardarArchivoCommand.Parameters[2].Value.SetInt32(Clase);
  FGuardarArchivoCommand.ExecuteUpdate;
  Result := FGuardarArchivoCommand.Parameters[3].Value.GetBoolean;
end;


constructor TimgClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('La conexión no puede ser nulo. Asegúrese de que la conexión se ha abierto.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;


constructor TimgClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('La conexión no puede ser nulo. Asegúrese de que la conexión se ha abierto.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TimgClient.Destroy;
begin
  FreeAndNil(FGuardarArchivoCommand);
  inherited;
end;

end.
