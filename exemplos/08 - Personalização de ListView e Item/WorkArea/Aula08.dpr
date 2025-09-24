program Aula08;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marvin.UI.Aula08.Start in 'Marvin.UI.Aula08.Start.pas' {FormAula08},
  Marvin.Entity.Produto.Clss in 'Marvin.Entity.Produto.Clss.pas',
  Marvin.Entity.Produto in 'Marvin.Entity.Produto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormAula08, FormAula08);
  Application.Run;
end.
