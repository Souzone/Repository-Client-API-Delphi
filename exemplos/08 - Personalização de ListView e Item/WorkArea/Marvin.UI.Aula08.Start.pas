unit Marvin.UI.Aula08.Start;

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
  { firemonkey }
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.ListView,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base;

type
  TTipoAparecia = (ListaComItem, ListaComDetalheEBotao, ListaDinamica);

  TFormAula08 = class(TForm)
    ToolBar1: TToolBar;
    Layout1: TLayout;
    BT_ListItem: TSpeedButton;
    StyleBookMain: TStyleBook;
    ListViewDados: TListView;
    BT_ItemComBotao: TSpeedButton;
    BT_ItemDinamico: TSpeedButton;
    procedure BT_ListItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ItemComBotaoClick(Sender: TObject);
    procedure BT_ItemDinamicoClick(Sender: TObject);
    procedure ListViewDadosDblClick(Sender: TObject);
    procedure ListViewDadosItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
  private
    FListaProdutos: TProdutoLista;
    function CarregarDados: TFormAula08;
    function CarregarListView(const ATipoAparecia: TTipoAparecia): TFormAula08;
    procedure ExibirItemComBotao(const AProduto: IProduto; const AItem: TListViewItem);
    procedure ExibirItem(const AProduto: IProduto; const AItem: TListViewItem);
    procedure ExibirItemDinamico(const AProduto: IProduto; const AItem: TListViewItem);
  protected
    function SetItemColor(const AItemText: TListItemText; const AIsChangeColor: Boolean; const AColor: TAlphaColor): TFormAula08;
    function GetItemText(const AItem: TListViewItem; const AName: string): TListItemText;
  public
  end;

var
  FormAula08: TFormAula08;

implementation

{$R *.fmx}

procedure TFormAula08.FormCreate(Sender: TObject);
begin
  FListaProdutos := TProdutoLista.Create;
end;

procedure TFormAula08.FormDestroy(Sender: TObject);
begin
  FListaProdutos.DisposeOf;
end;

procedure TFormAula08.FormShow(Sender: TObject);
begin
  { faz a carga de dados }
  Self.CarregarDados;
end;

function TFormAula08.CarregarDados: TFormAula08;
var
  LIndex: Integer;

  procedure LCarregaProduto(const AProduto: IProduto);
  var
    LCodigo: Integer;
  begin
    LCodigo := LIndex + 1;
    AProduto.Codigo := LCodigo;
    AProduto.CodigoBarras := Format('CB%d', [LCodigo]);
    AProduto.Descricao := Format('Produto %d', [LCodigo]);
  end;

begin
  Result := Self;
  { inicializa a lista }
  FListaProdutos.Clear;
  { carrega os dados }
  for LIndex := 0 to 99 do
  begin
    with FListaProdutos do
    begin
      LCarregaProduto(Items[Add(TProduto.Create)]);
    end;
  end;
end;

procedure TFormAula08.BT_ListItemClick(Sender: TObject);
begin
  { Carrega o list view com a aparência de ListItem }
  ListViewDados.ItemAppearance.ItemAppearance := 'ListItem';
  Self.CarregarListView(TTipoAparecia.ListaComItem);
end;

procedure TFormAula08.BT_ItemComBotaoClick(Sender: TObject);
begin
  { Carrega o list view com a aparência de ListItem }
  ListViewDados.ItemAppearance.ItemAppearance := 'ImageListItemBottomDetailRightButton';
  Self.CarregarListView(TTipoAparecia.ListaComDetalheEBotao);
end;

procedure TFormAula08.BT_ItemDinamicoClick(Sender: TObject);
begin
  { Carrega o list view com a aparência de ListItem }
  ListViewDados.ItemAppearance.ItemAppearance := 'DynamicAppearance';
  Self.CarregarListView(TTipoAparecia.ListaDinamica);
end;

function TFormAula08.CarregarListView(const ATipoAparecia: TTipoAparecia): TFormAula08;
var
  LProduto: TProduto;
  LItem: TListViewItem;
begin
  Result := Self;
  ListViewDados.SearchVisible := True;
  ListViewDados.BeginUpdate;
  try
    { limpa os itens do listview }
    ListViewDados.Items.Clear;
    { carrega o listview }
    for LProduto in FListaProdutos do
    begin
      LItem := ListViewDados.Items.Add;
      case ATipoAparecia of
        { exibe o item padrão }
        ListaComItem: Self.ExibirItem(LProduto, LItem);
        { exibe o item com detalhe e botão }
        ListaComDetalheEBotao: Self.ExibirItemComBotao(LProduto, LItem);
        { exibe o item customizado }
        ListaDinamica: Self.ExibirItemDinamico(LProduto, LItem);
      end;
    end;
  finally
    ListViewDados.EndUpdate;
  end;
end;

procedure TFormAula08.ExibirItem(const AProduto: IProduto; const AItem: TListViewItem);
begin
  { recupera a informação da descrição }
  AItem.IndexTitle := AProduto.Codigo.ToString;
  AItem.Text := AProduto.Descricao;
  AItem.Detail := AProduto.CodigoBarras;
end;

procedure TFormAula08.ExibirItemComBotao(const AProduto: IProduto; const AItem: TListViewItem);
begin
  { recupera a informação da descrição }
  AItem.IndexTitle := AProduto.Codigo.ToString;
  AItem.Text := AProduto.Descricao;
  AItem.Detail := AProduto.CodigoBarras;
  AItem.ButtonText := 'Editar ' + IntToStr(AProduto.Codigo);
end;

procedure TFormAula08.ExibirItemDinamico(const AProduto: IProduto; const AItem: TListViewItem);
var
  LDescricao, LCodigo, LCodigoBarras: TListItemText;

begin
  { recupera a descrição }
  LDescricao := Self.GetItemText(AItem, 'Descricao');
  if Assigned(LDescricao) then
  begin
    { informa o valor da descrição }
    LDescricao.Text := AProduto.Descricao;
    { altera a cor da descrição }
    Self.SetItemColor(LDescricao, True, TAlphaColors.Yellowgreen);
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

function TFormAula08.GetItemText(const AItem: TListViewItem; const AName: string): TListItemText;
begin
  { recupera o objeto de texto através do nome que está contido no TListViewItem }
  Result := AItem.Objects.FindObjectT<TListItemText>(AName);
end;

function TFormAula08.SetItemColor(const AItemText: TListItemText;
  const AIsChangeColor: Boolean; const AColor: TAlphaColor): TFormAula08;
begin
  Result := Self;
  AItemText.Font.Style := [];
  AItemText.TextColor := TAlphaColors.White;
  if AIsChangeColor then
  begin
    AItemText.Font.Style := [TFontStyle.fsBold];
    AItemText.TextColor := AColor;
  end;
end;

procedure TFormAula08.ListViewDadosDblClick(Sender: TObject);
var
  LItem: TListViewItem;
  LDescricao, LCodigoBarras, LCodigo: TListItemText;
  LMensagem: string;
begin
  LMensagem := EmptyStr;

  if Assigned(ListViewDados.Selected) then
  begin
    { recupera o item }
    LItem := (ListViewDados.Selected as TListViewItem);

    { recupera a descrição }
    LDescricao := LItem.Objects.FindObjectT<TListItemText>('Descricao');
    if Assigned(LDescricao) then
    begin
      LMensagem := LMensagem + LDescricao.Text + #13#10;
    end;

    { recupera o código de barras }
    LCodigoBarras := LItem.Objects.FindObjectT<TListItemText>('CodigoBarras');
    if Assigned(LCodigoBarras) then
    begin
      LMensagem := LMensagem + LCodigoBarras.Text + #13#10;
    end;

    { recupera o código }
    LCodigo := LItem.Objects.FindObjectT<TListItemText>('Codigo');
    if Assigned(LCodigo) then
    begin
      LMensagem := LMensagem + LCodigo.Text + #13#10;
    end;

    ShowMessage(LMensagem);
  end;
end;

procedure TFormAula08.ListViewDadosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  { se clicou em algum botão incluído no item }
  if ItemObject is TListItemTextButton then
  begin
    ShowMessage('Clicou no Item ' + IntToStr(ItemIndex));
  end;
end;

end.

