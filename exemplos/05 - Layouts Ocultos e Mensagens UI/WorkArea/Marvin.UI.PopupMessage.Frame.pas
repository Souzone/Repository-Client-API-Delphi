unit Marvin.UI.PopupMessage.Frame;

interface

uses
  System.SysUtils,
  System.Types,
  System.Classes,
  System.Variants,
  { marvin }
  Marvin.UI.PopupMessage,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Effects, FMX.Filter.Effects;

type
  TFramePopupMesssage = class(TFrame, IPopupMessage)
    RectShadow: TRectangle;
    RectMessage: TRectangle;
    TXT_Titulo: TText;
    TXT_Mensagem: TText;
    RectBotoes: TRectangle;
    RectBotaoOk: TRectangle;
    TXT_BotaoOk: TText;
    RectTitulo: TRectangle;
    procedure TXT_BotaoOkClick(Sender: TObject);
  private
    FTipo: TPopupMessageType;
    FOnOkClick: TEventPopupMessageOnOk;
    function GetTitulo: string;
    procedure SetTitulo(const Value: string);
    function GetMensagem: string;
    procedure SetMensagem(const Value: string);
    function GetTipo: TPopupMessageType;
    procedure SetTipo(const Value: TPopupMessageType);
    function GetOnOkClick: TEventPopupMessageOnOk;
    procedure SetOnOkClick(const Value: TEventPopupMessageOnOk);
  public
    class function New(const AOwner: TComponent; const ATipo: TPopupMessageType; const AEvent: TEventPopupMessageOnOk; const ATitulo: string; const AMensagem: string): IPopupMessage;
    { propriedades }
    property Titulo: string read GetTitulo write SetTitulo;
    property Mensagem: string read GetMensagem write SetMensagem;
    property Tipo: TPopupMessageType read GetTipo write SetTipo;
    property OnOkClick: TEventPopupMessageOnOk read GetOnOkClick write SetOnOkClick;
  end;

implementation

uses
  System.UITypes;

{$R *.fmx}

{ TFramePopupMesssage }

class function TFramePopupMesssage.New(const AOwner: TComponent; const ATipo: TPopupMessageType; const AEvent: TEventPopupMessageOnOk; const ATitulo: string; const AMensagem: string): IPopupMessage;
begin
  { cria }
  Result := TFramePopupMesssage.Create(AOwner);
  { configura }
  TFramePopupMesssage(Result).Tipo := ATipo;
  TFramePopupMesssage(Result).OnOkClick := AEvent;
  TFramePopupMesssage(Result).Parent := TFmxObject(AOwner);
  TFramePopupMesssage(Result).Align := TAlignLayout.Contents;
  TFramePopupMesssage(Result).BringToFront;
  { passa as informações }
  Result.Titulo := ATitulo;
  Result.Mensagem := AMensagem;
end;

function TFramePopupMesssage.GetMensagem: string;
begin
  Result := TXT_Mensagem.Text;
end;

function TFramePopupMesssage.GetOnOkClick: TEventPopupMessageOnOk;
begin
  Result := FOnOkClick;
end;

function TFramePopupMesssage.GetTipo: TPopupMessageType;
begin
  Result := FTipo;
end;

function TFramePopupMesssage.GetTitulo: string;
begin
  Result := TXT_Titulo.Text;
end;

procedure TFramePopupMesssage.SetMensagem(const Value: string);
begin
  TXT_Mensagem.Text := Value;
end;

procedure TFramePopupMesssage.SetOnOkClick(const Value: TEventPopupMessageOnOk);
begin
  FOnOkClick := Value;
end;

procedure TFramePopupMesssage.SetTipo(const Value: TPopupMessageType);

  procedure LSetColor(const AColor: TAlphaColor);
  begin
    RectMessage.Stroke.Color := AColor;
    RectTitulo.Fill.Color := AColor;
  end;

begin
  FTipo := Value;
  case FTipo of
    Information: LSetColor(TAlphaColors.Royalblue);
    Warning: LSetColor(TAlphaColors.Goldenrod);
    Error: LSetColor(TAlphaColors.Red);
  end;
end;

procedure TFramePopupMesssage.SetTitulo(const Value: string);
begin
  TXT_Titulo.Text := Value;
end;

procedure TFramePopupMesssage.TXT_BotaoOkClick(Sender: TObject);
begin
  if Assigned(FOnOkClick) then
  begin
    FOnOkClick(mrOk);
  end;
end;

end.

