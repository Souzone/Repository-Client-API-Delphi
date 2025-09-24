program Aula05;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marvin.UI.Aula05.Start in 'Marvin.UI.Aula05.Start.pas' {Form4},
  Marvin.UI.PopupMessage.Frame in 'Marvin.UI.PopupMessage.Frame.pas' {FramePopupMesssage: TFrame},
  Marvin.UI.PopupMessage in 'Marvin.UI.PopupMessage.pas',
  Marvin.UI.PopupMessage.Clss in 'Marvin.UI.PopupMessage.Clss.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
