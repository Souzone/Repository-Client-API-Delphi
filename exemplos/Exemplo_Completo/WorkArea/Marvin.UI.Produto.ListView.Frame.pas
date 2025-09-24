unit Marvin.UI.Produto.ListView.Frame;

interface

uses
  { embarcadero }
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  { marvin }
  Marvin.Entity.Produto.Clss,
  Marvin.Entity.Produto,
  Marvin.UI.Produto.ListView,
  { firemonkey }
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Effects,
  FMX.Ani,
  FMX.Objects,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TFrameListViewProdutos = class(TFrame, IProdutoListView)
    LayoutMainListView: TLayout;
    GridLayout1: TGridLayout;
    CircleCarregarListView: TCircle;
    ImageCarregarListView: TImage;
    ColorAnimationCarregarListView: TColorAnimation;
    ShadowEffectCarregarListView: TShadowEffect;
    ListViewProdutos: TListView;
    ShadowEffectListViewProdutos: TShadowEffect;
    procedure CircleCarregarListViewClick(Sender: TObject);
  private
    FListaProdutos: TProdutoLista;
    function GetListaProdutos: TProdutoLista;
    procedure SetListaProdutos(const Value: TProdutoLista);
    function CarregarListView: TFrameListViewProdutos;
    function ExibirItem(const AProduto: IProduto; const AItem: TListViewItem): TFrameListViewProdutos;
    function SetItemColor(const AItemText: TListItemText; const AIsChangeColor: Boolean; const AColor: TAlphaColor): TFrameListViewProdutos;
    function GetItemText(const AItem: TListViewItem; const AName: string): TListItemText;
  public
    class function New(const AOwner: TComponent; const AListaProdutos: TProdutoLista): IProdutoListView;
    property ListaProdutos: TProdutoLista read GetListaProdutos write SetListaProdutos;
  end;

implementation

uses
  FMX.InertialMovement;

{$R *.fmx}

{ TFrameListViewProdutos }

class function TFrameListViewProdutos.New(const AOwner: TComponent;
  const AListaProdutos: TProdutoLista): IProdutoListView;
begin
  Result := TFrameListViewProdutos.Create(AOwner);
  { ajusta o controle }
  TControl(Result).Parent := TFmxObject(AOwner);
  TControl(Result).Align := TAlignLayout.Client;
  { passa a lista de produtos }
  Result.ListaProdutos := AListaProdutos;
end;

function TFrameListViewProdutos.SetItemColor(const AItemText: TListItemText;
  const AIsChangeColor: Boolean;
  const AColor: TAlphaColor): TFrameListViewProdutos;
begin
  Result := Self;
  AItemText.Font.Style := [];
  AItemText.TextColor := TAlphaColors.Darkgray;
  if AIsChangeColor then
  begin
    AItemText.Font.Style := [TFontStyle.fsBold];
    AItemText.TextColor := AColor;
  end;
end;

procedure TFrameListViewProdutos.SetListaProdutos(const Value: TProdutoLista);
begin
  FListaProdutos := Value;
end;

function TFrameListViewProdutos.CarregarListView: TFrameListViewProdutos;
var
  LProduto: TProduto;
  LItem: TListViewItem;
begin
  Result := Self;

  ListViewProdutos.SearchVisible := True;
  ListViewProdutos.BeginUpdate;
  try
    { limpa os itens do listview }
    ListViewProdutos.Items.Clear;
    { carrega o listview }
    for LProduto in FListaProdutos do
    begin
      LItem := ListViewProdutos.Items.Add;
      Self.ExibirItem(LProduto, LItem);
    end;
  finally
    ListViewProdutos.EndUpdate;
  end;
end;

procedure TFrameListViewProdutos.CircleCarregarListViewClick(Sender: TObject);
begin
  ColorAnimationCarregarListView.Start;
  Self.CarregarListView;
end;

function TFrameListViewProdutos.ExibirItem(const AProduto: IProduto;
  const AItem: TListViewItem): TFrameListViewProdutos;
var
  LDescricao, LCodigo, LCodigoBarras: TListItemText;

begin
  Result := Self;

  { recupera a descrição }
  LDescricao := Self.GetItemText(AItem, 'Descricao');
  if Assigned(LDescricao) then
  begin
    { informa o valor da descrição }
    LDescricao.Text := AProduto.Descricao;
    { altera a cor da descrição }
    Self.SetItemColor(LDescricao, True, $FF0ACFF8);
  end;

  { recupera o código de barras }
  LCodigoBarras := Self.GetItemText(AItem, 'CodigoBarras');
  if Assigned(LCodigoBarras) then
  begin
    { informa o valor do Código de Barras }
    LCodigoBarras.Text := AProduto.CodigoBarras;
    { altera a cor do Código de Barras }
    Self.SetItemColor(LCodigoBarras, False, TAlphaColors.Black);
  end;

  { recupera o código }
  LCodigo := Self.GetItemText(AItem, 'Codigo');
  if Assigned(LCodigo) then
  begin
    { informa o valor do Código }
    LCodigo.Text := AProduto.Codigo.ToString;
    { altera a cor do Código }
    Self.SetItemColor(LCodigo, (AProduto.Codigo = 1), TAlphaColors.Blue);
  end;
end;

function TFrameListViewProdutos.GetItemText(const AItem: TListViewItem;
  const AName: string): TListItemText;
begin
  { recupera o objeto de texto através do nome que está contido no TListViewItem }
  Result := AItem.Objects.FindObjectT<TListItemText>(AName);
end;

function TFrameListViewProdutos.GetListaProdutos: TProdutoLista;
begin
  Result := FListaProdutos;
end;

end.

