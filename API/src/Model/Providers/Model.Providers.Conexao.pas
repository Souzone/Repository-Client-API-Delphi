unit Model.Providers.Conexao;

interface

uses
  Model.Interfaces,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite;

type
  TModelProvidersConexao = class(TInterfacedObject, IModelProviders)
  private
    FdQuery: TFdquery;
    FdConnection: TFDConnection;
//    FdDriveSqlLite:TFDPhysSQLITEDriverLink;
    procedure ConfigConection;
  public
    constructor create;
    destructor destroy; override;
    Class Function New: IModelProviders;
    function FdConexao: TFdquery;
  end;

implementation

{ TModelProvidersConexao }

procedure TModelProvidersConexao.ConfigConection;
begin
  FDConnection.DriverName    :='SQLite';
  FDConnection.Params.Database := 'D:\Cursos\Academia do Código Delphi Senior\Arquitetura 3 camadas\api\fddemo.sdb';
  FDConnection.Connected := true;
  FdQuery.Connection :=FDConnection;
end;

constructor TModelProvidersConexao.create;
begin
  FDConnection := TFDConnection.Create(nil);
  FdQuery := TFdQuery.Create(nil);
//  FdDriveSqlLite:= TFDPhysSQLITEDriverLink.Create(nil);
  ConfigConection;
end;

destructor TModelProvidersConexao.destroy;
begin
  FDConnection.DisposeOf;
  FdQuery.DisposeOf;
//  FdDriveSqlLite.disposeof;
  inherited;
end;

function TModelProvidersConexao.FdConexao: TFdquery;
begin
  Result:= FdQuery;
end;

class function TModelProvidersConexao.New: IModelProviders;
begin
  result := self.create;
end;

end.
