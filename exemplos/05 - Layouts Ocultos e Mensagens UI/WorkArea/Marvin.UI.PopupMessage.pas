unit Marvin.UI.PopupMessage;

interface

uses
  System.UITypes;

type
  { tipo de mensagem }
  TPopupMessageType = (Information, Warning, Error);

  { evento }
  TEventPopupMessageOnOk = procedure (const AResult: TModalResult) of object;

  IPopupMessage = interface
    ['{83B3C47A-90C3-4DC2-9A18-D5F9EDA9BAC0}']
    function GetTitulo: string;
    procedure SetTitulo(const Value: string);
    function GetMensagem: string;
    procedure SetMensagem(const Value: string);
    function GetTipo: TPopupMessageType;
    procedure SetTipo(const Value: TPopupMessageType);
    function GetOnOkClick: TEventPopupMessageOnOk;
    procedure SetOnOkClick(const Value: TEventPopupMessageOnOk);
    property Titulo: string read GetTitulo write SetTitulo;
    property Mensagem: string read GetMensagem write SetMensagem;
    property Tipo: TPopupMessageType read GetTipo write SetTipo;
    property OnOkClick: TEventPopupMessageOnOk read GetOnOkClick write SetOnOkClick;
  end;

implementation

end.
