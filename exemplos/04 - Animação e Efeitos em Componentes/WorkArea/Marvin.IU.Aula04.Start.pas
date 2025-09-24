unit Marvin.IU.Aula04.Start;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Effects, FMX.Objects;

type
  TForm3 = class(TForm)
    RoundRect1: TRoundRect;
    TXT_Info: TText;
    ShadowEffect1: TShadowEffect;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    procedure TXT_InfoClick(Sender: TObject);
    procedure FloatAnimation3Process(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FloatAnimation2Finish(Sender: TObject);
    procedure FloatAnimation3Finish(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.FloatAnimation1Finish(Sender: TObject);
begin
  FloatAnimation1.Inverse := not FloatAnimation1.Inverse;
end;

procedure TForm3.FloatAnimation2Finish(Sender: TObject);
begin
  FloatAnimation2.Inverse := not FloatAnimation2.Inverse;
end;

procedure TForm3.FloatAnimation3Finish(Sender: TObject);
begin
  FloatAnimation3.Inverse := not FloatAnimation3.Inverse;
  if not FloatAnimation3.Inverse then
  begin
    RoundRect1.Corners := [TCorner.TopLeft, TCorner.TopRight, TCorner.BottomLeft, TCorner.BottomRight];
    RoundRect1.Stroke.Kind := TBrushKind.Solid;
  end;
end;

procedure TForm3.FloatAnimation3Process(Sender: TObject);
begin
  ShadowEffect1.UpdateParentEffects;
end;

procedure TForm3.TXT_InfoClick(Sender: TObject);
begin
  FloatAnimation1.Start;
  FloatAnimation2.Start;
  FloatAnimation3.Start;
  RoundRect1.Corners := [];
  RoundRect1.Stroke.Kind := TBrushKind.None;
end;

end.
