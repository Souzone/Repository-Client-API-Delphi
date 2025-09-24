unit Controller.Interfaces;

interface

uses
  Model.Interfaces;

type
  IControllerFuncionarios = interface;

  IControllerInterfaces = interface
    ['{ABDD98DD-9C93-44D7-91BF-90074CCFEE06}']
    Function Funcionarios: IControllerFuncionarios;
    procedure ShowApplication;
  end;

  IControllerFuncionarios = interface
    ['{10775DFA-E027-4A37-960C-8A43D6108E55}']
    Function Providers: IModelProviders;
  end;

implementation

end.
