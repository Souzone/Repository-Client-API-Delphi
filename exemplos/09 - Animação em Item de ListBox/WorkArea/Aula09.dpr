program Aula09;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marvin.UI.Aula09.Start in 'Marvin.UI.Aula09.Start.pas' {FormAula09};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormAula09, FormAula09);
  Application.Run;
end.
