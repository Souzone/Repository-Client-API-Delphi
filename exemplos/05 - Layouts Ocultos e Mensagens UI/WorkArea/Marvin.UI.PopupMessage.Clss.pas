unit Marvin.UI.PopupMessage.Clss;

interface

uses
  System.Classes,
  Marvin.UI.PopupMessage;

type
  TPopupMessage = class
  private
    class var FPopup: IPopupMessage;
  public
    class procedure Show(const AOwner: TComponent; const ATipo: TPopupMessageType;
      const AEvent: TEventPopupMessageOnOk;
      const ATitulo: string; const AMensagem: string);
    class procedure Hide;
  end;

implementation

uses
  Marvin.UI.PopupMessage.Frame;


{ TPopupMessage }

class procedure TPopupMessage.Hide;
var
  LComponent: TComponent;
begin
  if Assigned(FPopup) then
  begin
    LComponent := TComponent(FPopup);
    FPopup := nil;
    LComponent.DisposeOf;
  end;
end;

class procedure TPopupMessage.Show(const AOwner: TComponent; const ATipo: TPopupMessageType; const AEvent: TEventPopupMessageOnOk; const ATitulo: string; const AMensagem: string);
begin
  if Assigned(FPopup) then
  begin
    TPopupMessage.Hide;
  end;
  { cria }
  FPopup := TFramePopupMesssage.New(AOwner, ATipo, AEvent, ATitulo, AMensagem);
end;

end.
