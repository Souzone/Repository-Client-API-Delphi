program Aula04_Assistente;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marvin.IU.Aula04.Assistente in 'Marvin.IU.Aula04.Assistente.pas' {frmWizard};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmWizard, frmWizard);
  Application.Run;
end.
