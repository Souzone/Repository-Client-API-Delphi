{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit View.Main;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.MultiView,
  FMX.StdCtrls,
  System.Rtti,
  FMX.Grid.Style,
  FMX.Grid,
  FMX.ScrollBox,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.Header,
  RestRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D,
  FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  System.JSON,
  View.CadastroFuncionarios;

type
  TFrmMain = class(TForm)
    Layout1: TLayout;
    Layout4: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    MultiView1: TMultiView;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    StyleBook1: TStyleBook;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    EdtConsultar: TEdit;
    Rectangle6: TRectangle;
    FDMemTable1: TFDMemTable;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    BtnConsultar: TSpeedButton;
    BtnIncluir: TSpeedButton;
    BtnExcluir: TSpeedButton;
    Label1: TLabel;
    Rectangle9: TRectangle;
    ListView1: TListView;
    Label4: TLabel;
    Label2: TLabel;
    Rectangle3: TRectangle;
    procedure BtnExcluirClick(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PovoarTabela;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}


procedure TFrmMain.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  AItem.Data['GlyphButton5'] := not  (AItem.Data['GlyphButton5']).AsBoolean ;
end;

procedure TFrmMain.PovoarTabela;
var
  FItem: TListViewItem;
begin
  FDMemTable1.Close;
  Trequest.new.BaseURL('http://localhost:9000')
    .Resource('Funcionarios')
    .BasicAuthentication('user','123')
    .Accept('application/json')
    .Adapters(TDataSetSerializeAdapter.new(FDMemTable1))
    .Get;
  FDMemTable1.open;


  ListView1.Items.Clear; // limpa antes de popular

  // Garante que o DataSet está aberto
  if not FDMemTable1.Active then
    FDMemTable1.Open;
    FDMemTable1.Filtered := False;

  // Percorre todos os registros do DataSet
  FDMemTable1.First;
  while not FDMemTable1.Eof do
  begin
    FItem := ListView1.Items.Add;
    FItem.Text :=FDMemTable1.FieldByName('nome').AsString;
    FItem.Data['Text1'] := FDMemTable1.FieldByName('id').AsString;      // Produto
    FItem.Data['Text2'] := FDMemTable1.FieldByName('nome').AsString;   // Quantidade
    FItem.Data['Text3'] := FDMemTable1.FieldByName('salario').AsString;        // Preço
    FItem.Data['TextButton6'] :='editar';
    ListView1.Items.ItemsInvalidate;
    FDMemTable1.Next;
  end;
end;

procedure TFrmMain.BtnConsultarClick(Sender: TObject);
var
  TextoBusca: string;
  FItem: TListViewItem;
begin
  TextoBusca := Trim(EdtConsultar.Text);

  // Se o campo estiver vazio, limpa a lista e repovoa
  if (TextoBusca = '') or (FDMemTable1.RecordCount =0)then
  begin
    PovoarTabela;
  end
  else
  begin
    FDMemTable1.Filtered := False; // desativa o filtro antes de criar
    FDMemTable1.Filter := 'nome LIKE ''%'+TextoBusca+'%'' ';
    FDMemTable1.Filtered := True;  // ativa o filtro

    ListView1.Items.Clear;
    FDMemTable1.First;

    while not FDMemTable1.Eof do
    begin
      FItem := ListView1.Items.Add;
      FItem.Text :=FDMemTable1.FieldByName('nome').AsString;
      FItem.Data['Text1'] := FDMemTable1.FieldByName('id').AsString;      // Produto
      FItem.Data['Text2'] := FDMemTable1.FieldByName('nome').AsString;   // Quantidade
      FItem.Data['Text3'] := FDMemTable1.FieldByName('salario').AsString;        // Preço
      FItem.Data['TextButton6'] :='editar';
      ListView1.Items.ItemsInvalidate;
      FDMemTable1.Next;
    end;
     ListView1.Items.ItemsInvalidate;
  end;

end;

procedure TFrmMain.BtnExcluirClick(Sender: TObject);
var
  Item :TListViewItem;
var
  LResponse: IResponse;
begin
  if not Assigned(ListView1.Selected) then
   raise Exception.Create('Selecione um Item primeiro!');


    LResponse:=
    Trequest.new.BaseURL('http://localhost:9000')
      .Resource('Funcionarios')
      .ResourceSuffix(TListViewItem(ListView1.Selected).Data['Text1'].ToString)
      .BasicAuthentication('user','123')
      .Accept('application/json')
      .delete;

      PovoarTabela;

end;

procedure TFrmMain.BtnIncluirClick(Sender: TObject);
begin
if not Assigned(FrmCadFun) then
  FrmCadFun := TFrmCadFun.Create(self);
  try
  FrmCadFun.ShowModal;
  finally
  freeandnil(FrmCadFun);
  end;
end;

end.
