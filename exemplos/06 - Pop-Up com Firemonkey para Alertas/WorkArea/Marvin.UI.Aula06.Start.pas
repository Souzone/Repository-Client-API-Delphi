unit Marvin.UI.Aula06.Start;

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
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TForm5 = class(TForm)
    ToolBar: TToolBar;
    BT_Teste: TSpeedButton;
    LayoutMain: TLayout;
    procedure BT_TesteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses
  Marvin.UI.ToastMessage,
  Marvin.UI.ToastMessage.Clss;

{$R *.fmx}

procedure TForm5.BT_TesteClick(Sender: TObject);
begin
  TToastMessage.Show(LayoutMain, 'Teste de mensagem Toast', 'OK');
end;

end.

