unit Marvin.UI.ToastMessage.Frame;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  { marvin }
  Marvin.UI.ToastMessage,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Objects,
  FMX.Ani;

type
  TFrameToast = class(TFrame, IToastMessage)
    Layout: TLayout;
    RectToast: TRoundRect;
    TXT_Mensagem: TText;
    FloatAnimationMensagem: TFloatAnimation;
    TXT_Acao: TText;
    FloatAnimationAcao: TFloatAnimation;
    FloatAnimationRect: TFloatAnimation;
  private
  public
    class function New(const AOwner: TComponent; const AMensagem: string; const ATextoAcao: string): IToastMessage;
    function ShowFrame: IToastMessage;
    function HideFrame: IToastMessage;
  end;

implementation

{$R *.fmx}

{ TFrameToast }

class function TFrameToast.New(const AOwner: TComponent; const AMensagem: string; const ATextoAcao: string): IToastMessage;
begin
  { instancia o objeto }
  Result := TFrameToast.Create(AOwner);
  TFrameToast(Result).Parent := TFmxObject(AOwner);
  TFrameToast(Result).BringToFront;
  { posiciona }
  TFrameToast(Result).Align := TAlignLayout.Horizontal;
  TFrameToast(Result).Position.Y := TControl(AOwner).Height - TFrameToast(Result).Height;
  TFrameToast(Result).Layout.Visible := False;
end;

function TFrameToast.ShowFrame: IToastMessage;
begin
  Result := Self;
  { escondo o retângulo }
  RectToast.Align := TAlignLayout.None;
  RectToast.Position.Y := Self.Height + 1;
  { animações }
  FloatAnimationRect.StartValue := RectToast.Position.Y;
  { esconde o layout }
  Layout.Visible := True;
  { inicializa as animações }
  FloatAnimationRect.Inverse := False;
  FloatAnimationRect.Start;
  FloatAnimationAcao.Start;
  FloatAnimationMensagem.Start;
end;

function TFrameToast.HideFrame: IToastMessage;
begin
  TAnimator.AnimateFloatWait(RectToast, 'Position.Y', Layout.Height, 0.5);
end;

end.

