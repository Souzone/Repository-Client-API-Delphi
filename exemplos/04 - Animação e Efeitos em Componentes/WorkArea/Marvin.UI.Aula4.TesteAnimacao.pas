unit Marvin.UI.Aula4.TesteAnimacao;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Ani,
  FMX.Objects,
  FMX.Effects;

type
  TfrmTestInterpolation = class(TForm)
    RadiantRing1: TCircle;
    RadiantRing2: TCircle;
    RadiantRing3: TCircle;
    RadiantRing4: TCircle;
    RadiantRing5: TCircle;
    RadiantRing6: TCircle;
    RadiantRing7: TCircle;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    FloatAnimation4: TFloatAnimation;
    FloatAnimation5: TFloatAnimation;
    FloatAnimation6: TFloatAnimation;
    FloatAnimation7: TFloatAnimation;
    chkAnimate: TCheckBox;
    Text1: TText;
    Text2: TText;
    Text3: TText;
    Text4: TText;
    Text5: TText;
    Text6: TText;
    Text7: TText;
    optIn: TRadioButton;
    optInOut: TRadioButton;
    optOut: TRadioButton;
    chkAutoReverse: TCheckBox;
    chkLoop: TCheckBox;
    lblAnimationType: TLabel;
    trkDuration: TTrackBar;
    lblDuration: TLabel;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    ShadowEffect7: TShadowEffect;
    RectangleToolBar: TRectangle;
    FloatAnimation8: TFloatAnimation;
    procedure chkAnimateChange(Sender: TObject);
    procedure AnimationTypeChange(Sender: TObject);
    procedure chkAutoReverseChange(Sender: TObject);
    procedure chkLoopChange(Sender: TObject);
    procedure trkDurationChange(Sender: TObject);
    procedure FloatAnimation1Process(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestInterpolation: TfrmTestInterpolation;

implementation

{$R *.fmx}

procedure TfrmTestInterpolation.AnimationTypeChange(Sender: TObject);
var
  AnimationType: TAnimationType;
begin
  AnimationType := TAnimationType(TRadioButton(Sender).Tag);
  FloatAnimation1.AnimationType := AnimationType;
  FloatAnimation2.AnimationType := AnimationType;
  FloatAnimation3.AnimationType := AnimationType;
  FloatAnimation4.AnimationType := AnimationType;
  FloatAnimation5.AnimationType := AnimationType;
  FloatAnimation6.AnimationType := AnimationType;
  FloatAnimation7.AnimationType := AnimationType;
end;

procedure TfrmTestInterpolation.chkAnimateChange(Sender: TObject);
begin
  FloatAnimation1.Enabled := chkAnimate.IsChecked;
  FloatAnimation2.Enabled := chkAnimate.IsChecked;
  FloatAnimation3.Enabled := chkAnimate.IsChecked;
  FloatAnimation4.Enabled := chkAnimate.IsChecked;
  FloatAnimation5.Enabled := chkAnimate.IsChecked;
  FloatAnimation6.Enabled := chkAnimate.IsChecked;
  FloatAnimation7.Enabled := chkAnimate.IsChecked;

  if not chkAnimate.IsChecked then
  begin
    RadiantRing1.Position.Y := 100;
    RadiantRing2.Position.Y := 100;
    RadiantRing3.Position.Y := 100;
    RadiantRing4.Position.Y := 100;
    RadiantRing5.Position.Y := 100;
    RadiantRing6.Position.Y := 100;
    RadiantRing7.Position.Y := 100;
  end;
end;

procedure TfrmTestInterpolation.chkAutoReverseChange(Sender: TObject);
begin
  FloatAnimation1.AutoReverse := chkAutoReverse.IsChecked;
  FloatAnimation2.AutoReverse := chkAutoReverse.IsChecked;
  FloatAnimation3.AutoReverse := chkAutoReverse.IsChecked;
  FloatAnimation4.AutoReverse := chkAutoReverse.IsChecked;
  FloatAnimation5.AutoReverse := chkAutoReverse.IsChecked;
  FloatAnimation6.AutoReverse := chkAutoReverse.IsChecked;
  FloatAnimation7.AutoReverse := chkAutoReverse.IsChecked;
end;

procedure TfrmTestInterpolation.chkLoopChange(Sender: TObject);
begin
  FloatAnimation1.Loop := chkLoop.IsChecked;
  FloatAnimation2.Loop := chkLoop.IsChecked;
  FloatAnimation3.Loop := chkLoop.IsChecked;
  FloatAnimation4.Loop := chkLoop.IsChecked;
  FloatAnimation5.Loop := chkLoop.IsChecked;
  FloatAnimation6.Loop := chkLoop.IsChecked;
  FloatAnimation7.Loop := chkLoop.IsChecked;
end;

procedure TfrmTestInterpolation.FloatAnimation1Process(Sender: TObject);
begin
  ShadowEffect1.UpdateParentEffects;
  ShadowEffect2.UpdateParentEffects;
  ShadowEffect3.UpdateParentEffects;
  ShadowEffect4.UpdateParentEffects;
  ShadowEffect5.UpdateParentEffects;
  ShadowEffect6.UpdateParentEffects;
  ShadowEffect7.UpdateParentEffects;
end;

procedure TfrmTestInterpolation.trkDurationChange(Sender: TObject);
var
  Duration: Single;
begin
  Duration := trkDuration.Value * 0.1;
  lblDuration.Text := 'Duração: ' + FormatFloat('0.00', Duration);
  FloatAnimation1.Duration := Duration;
  FloatAnimation2.Duration := Duration;
  FloatAnimation3.Duration := Duration;
  FloatAnimation4.Duration := Duration;
  FloatAnimation5.Duration := Duration;
  FloatAnimation6.Duration := Duration;
  FloatAnimation7.Duration := Duration;
end;

end.

