program Aula06;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marvin.UI.Aula06.Start in 'Marvin.UI.Aula06.Start.pas' {Form5},
  Marvin.UI.ToastMessage.Frame in 'Marvin.UI.ToastMessage.Frame.pas' {FrameToast: TFrame},
  Marvin.UI.ToastMessage in 'Marvin.UI.ToastMessage.pas',
  Marvin.UI.ToastMessage.Clss in 'Marvin.UI.ToastMessage.Clss.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
