program API;

uses
  Vcl.Forms,
  View.Main in 'src\View\View.Main.pas' {FrmMain},
  Model.Providers.Conexao in 'src\Model\Providers\Model.Providers.Conexao.pas',
  Model.Interfaces in 'src\Model\Model.Interfaces.pas',
  Controller in 'src\Controller\Controller.pas',
  Controller.Interfaces in 'src\Controller\Controller.Interfaces.pas',
  Controller.Funcionarios in 'src\Controller\Funcionarios\Controller.Funcionarios.pas',
  Model in 'src\Model\Model.pas',
  Model.Services.Funcionarios in 'src\Model\Services\Model.Services.Funcionarios.pas',
  Model.Threds.LoadingShow in 'src\Model\Threads\Model.Threds.LoadingShow.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
