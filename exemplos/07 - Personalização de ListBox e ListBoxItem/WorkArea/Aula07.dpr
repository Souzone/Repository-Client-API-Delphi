program Aula07;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marvin.UI.Aula07.Start in 'Marvin.UI.Aula07.Start.pas' {FormAula07};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormAula07, FormAula07);
  Application.Run;
end.
