unit Marvin.UI.Aula09.Start;

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
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Layouts,
  FMX.ListBox,
  FMX.Ani;

type
  TFormAula09 = class(TForm)
    ListBox: TListBox;
    Edit: TEdit;
    ButtonInclusaoSimples: TButton;
    ButtonAnimacao01: TButton;
    ButtonAnimacao02: TButton;
    Layout: TLayout;
    ButtonAnimacao03: TButton;
    procedure ButtonInclusaoSimplesClick(Sender: TObject);
    procedure ButtonAnimacao01Click(Sender: TObject);
    procedure ButtonAnimacao02Click(Sender: TObject);
    procedure ButtonAnimacao03Click(Sender: TObject);
    procedure ListBoxDblClick(Sender: TObject);
  private
    function AddItem(const AText: string): TListBoxItem;
  public
    { Public declarations }
  end;

var
  FormAula09: TFormAula09;

implementation

{$R *.fmx}

function TFormAula09.AddItem(const AText: string): TListBoxItem;
begin
  Result := TListBoxItem.Create(ListBox);
  ListBox.AddObject(Result);
  Result.StyledSettings := [];
  Result.TextSettings.Font.Family := 'Roboto';
  Result.TextSettings.Font.Size := 16;
  Result.Text := Format('%d) ', [ListBox.Items.Count]) + AText;
end;

procedure TFormAula09.ButtonInclusaoSimplesClick(Sender: TObject);
begin
  { adiciona item }
  Self.AddItem(Edit.Text);
end;

procedure TFormAula09.ButtonAnimacao01Click(Sender: TObject);
var
  LItem: TListBoxItem;
begin
  { adiciona item }
  LItem := Self.AddItem(Edit.Text);
  { aplica animação }
  LItem.Opacity := 0;
  TAnimator.AnimateFloat(LItem, 'Opacity', 1, 0.5);
end;

procedure TFormAula09.ButtonAnimacao02Click(Sender: TObject);
var
  LItem: TListBoxItem;
  LHeight: Single;
begin
  { adiciona item }
  LItem := Self.AddItem(Edit.Text);
  { altura }
  LHeight := LItem.Height;
  LItem.Height := 0;
  { opacidade }
  LItem.Opacity := 0;
  { aplica animação }
  TAnimator.AnimateFloat(LItem, 'Opacity', 1, 0.5);
  TAnimator.AnimateFloat(LItem, 'Height', LHeight, 0.5);
end;

procedure TFormAula09.ButtonAnimacao03Click(Sender: TObject);
var
  LItem: TListBoxItem;
  LHeight: Single;
  LIndex: Integer;
begin
  { cria item }
  LItem := TListBoxItem.Create(Self);
  { altura }
  LHeight := LItem.Height;
  LItem.Height := 0;
  { opacidade }
  LItem.Opacity := 0;

  { recuperando a posição }
  LIndex := 0;
  if Assigned(ListBox.Selected) then
  begin
    LIndex := ListBox.Selected.Index;
  end;

  { adiciona na posição }
  ListBox.InsertObject(LIndex, LItem);
  LItem.StyledSettings := [];
  LItem.TextSettings.Font.Family := 'Roboto';
  LItem.TextSettings.Font.Size := 16;
  LItem.Text := Format('%d) ', [ListBox.Items.Count]) + Edit.Text;

  { aplica animação }
  TAnimator.AnimateFloat(LItem, 'Height', LHeight, 0.5);
  TAnimator.AnimateFloat(LItem, 'Opacity', 1, 0.5);
end;

procedure TFormAula09.ListBoxDblClick(Sender: TObject);
var
  LItem: TListBoxItem;
  LColor: TAlphaColor;
begin
  if Assigned(ListBox.Selected) then
  begin
    LItem := ListBox.Selected;
    LColor := LItem.TextSettings.FontColor;
    LItem.TextSettings.FontColor := TAlphaColors.White;
    TAnimator.AnimateColor(LItem, 'TextSettings.FontColor', LColor, 0.5);
  end;
end;

end.

