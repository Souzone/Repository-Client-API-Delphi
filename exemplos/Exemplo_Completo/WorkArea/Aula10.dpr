program Aula10;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marvin.UI.Aula10.Start in 'Marvin.UI.Aula10.Start.pas' {FormAula10},
  Marvin.Entity.Produto.Clss in 'Marvin.Entity.Produto.Clss.pas',
  Marvin.Entity.Produto in 'Marvin.Entity.Produto.pas',
  Marvin.UI.Produto.ListView.Frame in 'Marvin.UI.Produto.ListView.Frame.pas' {FrameListViewProdutos: TFrame},
  Marvin.UI.Produto.ListView in 'Marvin.UI.Produto.ListView.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormAula10, FormAula10);
  Application.Run;
end.
