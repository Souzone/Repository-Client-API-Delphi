unit Marvin.UI.Produto.ListView;

interface

uses
  Marvin.Entity.Produto.Clss,
  Marvin.Entity.Produto;

type
  IProdutoListView = interface
    ['{1A603A44-6CB1-4E44-BAF5-753B88879C9D}']
    function GetListaProdutos: TProdutoLista;
    procedure SetListaProdutos(const Value: TProdutoLista);
    property ListaProdutos: TProdutoLista read GetListaProdutos write SetListaProdutos;
  end;

implementation

end.
