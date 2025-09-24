unit Model;

interface

uses
  Model.Interfaces,
  Model.Providers.Conexao;

type
  TModel = class(TInterfacedObject,IModelInterfaces)
    private
      FdProviders: IModelProviders;
    public
    Constructor Create;
    Destructor Destroy;Override;
    Class Function New:IModelInterfaces;
    Function Providers: IModelProviders;
  end;
implementation

{ TModel }

constructor TModel.Create;
begin

end;

destructor TModel.Destroy;
begin

  inherited;
end;

class function TModel.New: IModelInterfaces;
begin
  Result:= Self.Create;
end;

function TModel.Providers: IModelProviders;
begin
  if not assigned(FdProviders) then
    FdProviders:= TModelProvidersConexao.New;

  Result:= FdProviders;
end;

end.
