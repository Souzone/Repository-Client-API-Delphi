unit Marvin.UI.ToastMessage.Clss;

interface

uses
  FMX.Types,
  Marvin.UI.ToastMessage,
  FMX.Controls;

type
  TToastMessage = class
  private
    class var
      FTimerHide: TTimer;
    class var
      FToast: IToastMessage;
  protected
    class procedure InitTimer;
    class procedure OnTimer(Sender: TObject);
  public
    class procedure Show(const AParent: TControl; AMensagem: string; const ATextoAcao: string);
    class procedure Hide;
  end;

implementation

uses
  Marvin.UI.ToastMessage.Frame,
  System.Classes,
  System.SysUtils;

{ TToastMessage }

class procedure TToastMessage.InitTimer;
begin
  if not Assigned(TToastMessage.FTimerHide) then
  begin
    { cria o timer }
    TToastMessage.FTimerHide := TTimer.Create(nil);
  end;
  TToastMessage.FTimerHide.Interval := 5000;
  TToastMessage.FTimerHide.OnTimer := TToastMessage.OnTimer;
  TToastMessage.FTimerHide.Enabled := True;
end;

class procedure TToastMessage.Show(const AParent: TControl; AMensagem: string; const ATextoAcao: string);
begin
  if not Assigned(TToastMessage.FToast) then
  begin
    TToastMessage.FToast := TFrameToast.New(AParent, AMensagem, ATextoAcao);
  end;
  TToastMessage.FToast.ShowFrame;
  TToastMessage.InitTimer;
end;

class procedure TToastMessage.OnTimer(Sender: TObject);
begin
  TToastMessage.FTimerHide.Enabled := False;
  TToastMessage.Hide;
end;

class procedure TToastMessage.Hide;
var
  LComponent: TComponent;
begin
  { finaliza o timer }
  if Assigned(TToastMessage.FTimerHide) then
  begin
    TToastMessage.FTimerHide.Enabled := False;
    TToastMessage.FTimerHide.DisposeOf;
    TToastMessage.FTimerHide := nil;
  end;
  { finaliza a mensagem }
  if Assigned(TToastMessage.FToast) then
  begin
    TToastMessage.FToast.HideFrame;
    LComponent := TComponent(TToastMessage.FToast);
    TToastMessage.FToast := nil;
    LComponent.DisposeOf;
  end;
end;

end.

