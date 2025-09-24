unit Marvin.UI.Aula05.Start;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  { marvin }
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.Edit;

type
  TForm4 = class(TForm)
    ToolBar1: TToolBar;
    LayoutMain: TLayout;
    BT_Popup: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure BT_PopupClick(Sender: TObject);
  private
    procedure InternalOnOkClick(const AResult: TModalResult);
  public
  end;

var
  Form4: TForm4;

implementation

uses
  Marvin.UI.PopupMessage.Clss,
  Marvin.UI.PopupMessage;

{$R *.fmx}

procedure TForm4.BT_PopupClick(Sender: TObject);
begin
  TPopupMessage.Show(Self,
    TPopupMessageType(Edit1.Text.ToInteger),
    InternalOnOkClick,
    'Teste de Mensagem',
    'Agora estamos testando' + #13#10 + 'mensagens em Popup.');
end;

procedure TForm4.InternalOnOkClick(const AResult: TModalResult);
begin
  TPopupMessage.Hide;
end;

end.

