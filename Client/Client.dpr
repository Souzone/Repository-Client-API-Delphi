program Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Main in 'src\View\View.Main.pas' {FrmMain},
  View.CadastroFuncionarios in 'src\View\View.CadastroFuncionarios.pas' {FrmCadFun};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmCadFun, FrmCadFun);
  Application.Run;
end.
