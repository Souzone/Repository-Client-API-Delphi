unit Marvin.Entity.Produto;

interface

type
  IProduto = interface
    ['{2EBF3257-8E90-41B2-8AD8-68B56A4508B0}']
    { métodos das propriedades }
    procedure SetCodigo(const Value: Integer);
    function GetCodigo: Integer;
    procedure SetDescricao(const Value: string);
    function GetDescricao: string;
    procedure SetCodigoBarras(const Value: string);
    function GetCodigoBarras: string;
    { métodos }
    function Clear: IProduto;
    function Assign(const ASource: IProduto): IProduto;
    { propriedades }
    property CodigoBarras: string read GetCodigoBarras write SetCodigoBarras;
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
  end;

implementation

end.
