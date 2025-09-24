unit Marvin.UI.Aula10.Start;

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
  Marvin.UI.Produto.ListView,
  { firemonkey }
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.MultiView,
  FMX.Effects,
  FMX.Ani,
  FMX.TabControl,
  FMX.ListBox,
  FMX.Edit,
  FMX.SearchBox;

type
  TFormAula10 = class(TForm)
    ToolBarMain: TToolBar;
    ButtonMain: TSpeedButton;
    RectToolBar: TRectangle;
    LayoutMain: TLayout;
    MultiViewMenu: TMultiView;
    RectUser: TRectangle;
    StyleBookMain: TStyleBook;
    CircleUser: TCircle;
    TextUserName: TText;
    TextEmail: TText;
    ShadowEffectUserName: TShadowEffect;
    ShadowEffectEmail: TShadowEffect;
    VScrollBoxMenu: TVertScrollBox;
    GridLayoutMenu: TGridLayout;
    RectMenuImage: TRectangle;
    RectMenuListBox: TRectangle;
    RectMenuListView: TRectangle;
    TextMenuImage: TText;
    TextMenuListBox: TText;
    TextMenuListView: TText;
    ColorAnimationMenuImage: TColorAnimation;
    ColorAnimationMenuListBox: TColorAnimation;
    ColorAnimationMenuListView: TColorAnimation;
    LayoutMenuTabs: TLayout;
    LayoutTabs: TLayout;
    ShadowEffectToolBar: TShadowEffect;
    TextTabImage: TText;
    TextTabListBox: TText;
    RectSelected: TRectangle;
    LineSelected: TLine;
    FloatAnimationSelectedPosition: TFloatAnimation;
    LayoutTab: TLayout;
    TabControlPaginas: TTabControl;
    TabItemImage: TTabItem;
    TabItemListBox: TTabItem;
    TabItemListView: TTabItem;
    RectImage: TRectangle;
    LayoutImage: TLayout;
    GridLayoutAcoes: TGridLayout;
    ShadowEffectRectImage: TShadowEffect;
    LayoutCargaImage: TLayout;
    CircleAbrirImage: TCircle;
    CircleFecharImage: TCircle;
    ShadowEffectGridAcoes: TShadowEffect;
    ImageAbrir: TImage;
    ImageFechar: TImage;
    ColorAnimationAbrirImage: TColorAnimation;
    ColorAnimationFecharImage: TColorAnimation;
    RectTextTabImage: TRectangle;
    RectTextTabListBox: TRectangle;
    RectTextTabListView: TRectangle;
    TextTabListView: TText;
    ListBoxDados: TListBox;
    LayoutListBox: TLayout;
    Image: TImage;
    RectMenuTabs: TRectangle;
    SearchBoxListBox: TSearchBox;
    GridLayout1: TGridLayout;
    CircleCarregarListBox: TCircle;
    ImageCarregarListBox: TImage;
    ColorAnimationCarregarListBox: TColorAnimation;
    ShadowEffectCarregarListBox: TShadowEffect;
    LayoutAbrirListView: TLayout;
    procedure TextMenuImageClick(Sender: TObject);
    procedure TextMenuListBoxClick(Sender: TObject);
    procedure TextMenuListViewClick(Sender: TObject);
    procedure TextTabImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RectImageResize(Sender: TObject);
    procedure CircleAbrirImageClick(Sender: TObject);
    procedure CircleFecharImageClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CircleCarregarListBoxClick(Sender: TObject);
  private
    FListaProdutos: TProdutoLista;
    FFrameListView: IProdutoListView;
    function SetAniCalculations(const ACalculations: TScrollCalculations): TFormAula10;
    function GoToTab(const ASender: TObject): TFormAula10;
    function CarregarDados: TFormAula10;
    function CarregarListBox: TFormAula10;
    function CreateFrameListView: TFormAula10;
    function FreeFrameListView: TFormAula10;
  public
  end;

var
  FormAula10: TFormAula10;

implementation

uses
  { marvin }
  Marvin.Entity.Produto,
  { firemonkey }
  FMX.InertialMovement, Marvin.UI.Produto.ListView.Frame;

{$R *.fmx}

procedure TFormAula10.FormCreate(Sender: TObject);
begin
  { cria a lista de produtos }
  FListaProdutos := TProdutoLista.Create;
  Self.CarregarDados;
  { inicializa o anicalculatos do scrollbox do menu }
  Self.SetAniCalculations(VScrollBoxMenu.AniCalculations);
  Self.SetAniCalculations(ListBoxDados.AniCalculations);
  { retângulo imagem }
  RectImage.Align := TAlignLayout.None;
  RectImage.Position.X := LayoutCargaImage.Width;
  RectImage.Position.Y := 0;
  RectImage.Visible := False;
  { inicializa tabs }
  TabControlPaginas.ActiveTab := TabItemListView;
  TabControlPaginas.ActiveTab := TabItemListBox;
  TabControlPaginas.ActiveTab := TabItemImage;
end;

procedure TFormAula10.FormDestroy(Sender: TObject);
begin
  FListaProdutos.DisposeOf;
end;

function TFormAula10.FreeFrameListView: TFormAula10;
var
  LComponent: TComponent;
begin
  Result := Self;

  if Assigned(FFrameListView) then
  begin
    LComponent := FFrameListView as TComponent;
    FFrameListView := nil;
    LComponent.DisposeOf;
  end;
end;

function TFormAula10.SetAniCalculations(const ACalculations: TScrollCalculations): TFormAula10;
var
  LCalculations: TAniCalculations;
begin
  Result := Self;
  { scroll layout }
  LCalculations := TAniCalculations.Create(nil);
  try
    LCalculations.Animation := True;
    LCalculations.BoundsAnimation := True;
    LCalculations.AutoShowing := True;
    LCalculations.DecelerationRate := 0.5;
    LCalculations.Elasticity := 50;
    LCalculations.TouchTracking := [ttVertical];
    { passa as configurações para o scrollbox }
    ACalculations.Assign(LCalculations);
  finally
    LCalculations.DisposeOf;
  end;
end;

procedure TFormAula10.TextMenuImageClick(Sender: TObject);
begin
  ColorAnimationMenuImage.Start;
  TextTabImageClick(TextTabImage);
  MultiViewMenu.HideMaster;
end;

procedure TFormAula10.TextMenuListBoxClick(Sender: TObject);
begin
  ColorAnimationMenuListBox.Start;
  TextTabImageClick(TextTabListBox);
  MultiViewMenu.HideMaster;
end;

procedure TFormAula10.TextMenuListViewClick(Sender: TObject);
begin
  ColorAnimationMenuListView.Start;
  TextTabImageClick(TextTabListView);
  MultiViewMenu.HideMaster;
end;

procedure TFormAula10.TextTabImageClick(Sender: TObject);
var
  LRect: TRectangle;
begin
  LRect := TControl(Sender).Parent as TRectangle;
  TAnimator.AnimateFloat(RectSelected, 'Position.X', LRect.Position.X, 0.5, TAnimationType.InOut, TInterpolationType.Cubic);
  TAnimator.AnimateFloat(RectSelected, 'Width', TControl(Sender).Width, 0.5, TAnimationType.InOut, TInterpolationType.Cubic);
  { ajusta a cor }
  LRect.Fill.Color := $FF0ACFF8;
  TAnimator.AnimateColor(LRect, 'Fill.Color', TAlphaColors.Snow, 0.5);
  { muda para o tab }
  Self.GoToTab(Sender);
end;

function TFormAula10.GoToTab(const ASender: TObject): TFormAula10;
begin
  Result := Self;
  if ASender = TextTabImage then
  begin
    TabControlPaginas.ActiveTab := TabItemImage;
  end
  else if ASender = TextTabListBox then
  begin
    TabControlPaginas.ActiveTab := TabItemListBox;
  end
  else if ASender = TextTabListView then
  begin
    Self.CreateFrameListView;
    TabControlPaginas.ActiveTab := TabItemListView;
  end;
end;

procedure TFormAula10.RectImageResize(Sender: TObject);
begin
  ShadowEffectRectImage.UpdateParentEffects;
end;

function TFormAula10.CarregarDados: TFormAula10;
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

function TFormAula10.CarregarListBox: TFormAula10;
var
  LProduto: TProduto;
  LItem: TListBoxItem;
begin
  Result := Self;
  { popular o listbox }
  ListBoxDados.BeginUpdate;
  try
    ListBoxDados.Items.Clear;
    for LProduto in FListaProdutos do
    begin
      LItem := TListBoxItem.Create(ListBoxDados);
      LItem.StyleLookup := 'ListBoxItemValores';
      LItem.Text := LProduto.Descricao;
      LItem.StylesData['valortop'] := LProduto.CodigoBarras;
      LItem.StylesData['valorbottom'] := LProduto.Codigo.ToString;
      ListBoxDados.AddObject(LItem);
    end;
  finally
    ListBoxDados.EndUpdate;
  end;
end;

procedure TFormAula10.CircleAbrirImageClick(Sender: TObject);
begin
  ColorAnimationAbrirImage.Start;
  if not RectImage.Visible then
  begin
    { ajusta para visível }
    RectImage.Visible := True;
    { inicializa o tamanho }
    RectImage.Size.Width := 0;
    RectImage.Size.Height := 0;
    { inicializa o posicionamento }
    RectImage.Position.Y := 0;
    RectImage.Position.X := LayoutCargaImage.Width;
    { prepara as animações }
    TAnimator.AnimateFloat(RectImage, 'Size.Width', LayoutCargaImage.Width);
    TAnimator.AnimateFloat(RectImage, 'Size.Height', LayoutCargaImage.Height);
    TAnimator.AnimateFloatWait(RectImage, 'Position.X', 0);
    { ajusta o alinhamento }
    RectImage.Align := TAlignLayout.Client;
  end;
end;

procedure TFormAula10.CircleCarregarListBoxClick(Sender: TObject);
begin
  ColorAnimationCarregarListBox.Start;
  Self.CarregarListBox;
end;

procedure TFormAula10.CircleFecharImageClick(Sender: TObject);
begin
  ColorAnimationFecharImage.Start;
  if RectImage.Visible then
  begin
    { ajusta o alinhamento }
    RectImage.Align := TAlignLayout.None;
    { prepara as animações }
    TAnimator.AnimateFloat(RectImage, 'Size.Width', 0);
    TAnimator.AnimateFloat(RectImage, 'Size.Height', 0);
    TAnimator.AnimateFloatWait(RectImage, 'Position.X', LayoutCargaImage.Width);
    RectImage.Visible := False;
  end;
end;

function TFormAula10.CreateFrameListView: TFormAula10;
begin
  Result := Self;
  Self.FreeFrameListView;
  FFrameListView := TFrameListViewProdutos.New(LayoutAbrirListView, FListaProdutos);

end;

end.

