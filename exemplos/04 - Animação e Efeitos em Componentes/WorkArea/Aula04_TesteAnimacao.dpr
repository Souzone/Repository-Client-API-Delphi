program Aula04_TesteAnimacao;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marvin.UI.Aula4.TesteAnimacao in 'Marvin.UI.Aula4.TesteAnimacao.pas' {frmTestInterpolation};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTestInterpolation, frmTestInterpolation);
  Application.Run;
end.
