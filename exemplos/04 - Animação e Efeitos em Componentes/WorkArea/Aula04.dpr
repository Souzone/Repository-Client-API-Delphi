program Aula04;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marvin.IU.Aula04.Start in 'Marvin.IU.Aula04.Start.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
