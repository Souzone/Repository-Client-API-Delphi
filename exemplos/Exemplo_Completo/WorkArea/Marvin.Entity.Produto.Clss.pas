unit Marvin.Entity.Produto.Clss;

interface

uses
  System.Generics.Collections,
  System.Generics.Defaults,
  { marvin }
  Marvin.Entity.Produto;

type
  { classe de produto }
  TProduto = class(TInterfacedObject, IProduto)
  private
    FCodigo: Integer;
    FDescricao: string;
    FCodigoBarras: string;
    procedure SetCodigo(const Value: Integer);
    function GetCodigo: Integer;
    procedure SetDescricao(const Value: string);
    function GetDescricao: string;
    procedure SetCodigoBarras(const Value: string);
    function GetCodigoBarras: string;
  protected
  public
    { métodos }
    function Clear: IProduto;
    function Assign(const ASource: IProduto): IProduto;
    { propriedades }
    property CodigoBarras: string read GetCodigoBarras write SetCodigoBarras;
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
  end;

  { coleção }
  TProdutoLista = class sealed(TObjectList<TProduto>)
  private
    type
      TProdutoComparer = class(TComparer<TProduto>)
      public
        function Compare(const ALeft, ARight: TProduto): Integer; override;
      end;
  public
    constructor Create; reintroduce; virtual;
  end;

implementation

uses
  System.SysUtils;

{ TProduto }

function TProduto.Assign(const ASource: IProduto): IProduto;
begin
  Result := Self;
  Self.CodigoBarras := ASource.CodigoBarras;
  Self.Codigo := ASource.Codigo;
  Self.Descricao := ASource.Descricao;
end;

function TProduto.Clear: IProduto;
begin
  Result := Self;
  Self.CodigoBarras := EmptyStr;
  Self.Codigo := 0;
  Self.Descricao := EmptyStr;
end;

function TProduto.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TProduto.GetCodigoBarras: string;
begin
  Result := FCodigoBarras;
end;

function TProduto.GetDescricao: string;
begin
  Result := FDescricao;
end;

procedure TProduto.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProduto.SetCodigoBarras(const Value: string);
begin
  FCodigoBarras := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TProdutoLista }

constructor TProdutoLista.Create;
begin
  inherited Create(TProdutoComparer.Create);
end;

{ TProdutoLista.TProdutoComparer }

function TProdutoLista.TProdutoComparer.Compare(const ALeft,
  ARight: TProduto): Integer;
begin
  Result := -1;
  if ((ALeft.Codigo = ARight.Codigo) and SameText(ALeft.CodigoBarras, ARight.CodigoBarras)) then
  begin
    Result := 0;
  end;
end;

end.
