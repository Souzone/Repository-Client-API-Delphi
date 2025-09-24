unit Marvin.UI.Aula07.Start;

interface

uses
  System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.ListBox, FMX.Controls.Presentation, FMX.Edit, FMX.SearchBox;

type
  TFormAula07 = class(TForm)
    ListBoxDados: TListBox;
    StyleBookMain: TStyleBook;
    ToolBar1: TToolBar;
    LayoutMain: TLayout;
    BT_Main: TSpeedButton;
    ListItem1: TListBoxItem;
    SearchBox1: TSearchBox;
    ListItem2: TListBoxItem;
    ListItem3: TListBoxItem;
    procedure BT_MainClick(Sender: TObject);
  private
    function AddItem: TFormAula07;
  public
  end;

var
  FormAula07: TFormAula07;

implementation

uses
  System.SysUtils;

{$R *.fmx}

{ TFormAula07 }

procedure TFormAula07.BT_MainClick(Sender: TObject);
begin
  Self.AddItem;
end;

function TFormAula07.AddItem: TFormAula07;
var
  LItem: TListBoxItem;
begin
  Result := Self;

  LItem := TListBoxItem.Create(ListBoxDados);
  LItem.StyleLookup := 'ListItemValores';
  LItem.Text := 'Descrição ' + FormatDateTime('yyyymmdd hhnnss', Now);
  LItem.StylesData['valortop'] := '100,00';
  LItem.StylesData['valorbottom'] := '1.000,00';
  ListBoxDados.AddObject(LItem);
end;

end.
