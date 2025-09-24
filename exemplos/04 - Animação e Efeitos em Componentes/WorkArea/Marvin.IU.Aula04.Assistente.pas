unit Marvin.IU.Aula04.Assistente;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Generics.Collections,
  System.Actions,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Ani,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Layouts,
  FMX.ActnList, FMX.Effects;

type
  TfrmWizard = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    btnNext: TButton;
    Layout1: TLayout;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    Button1: TButton;
    Text4: TText;
    Botao01: TRoundRect;
    Botao02: TRoundRect;
    Botao03: TRoundRect;
    ToolBar1: TToolBar;
    StyleBook1: TStyleBook;
    ShadowEffect1: TShadowEffect;
    GlowEffect1: TGlowEffect;
    GlowEffect2: TGlowEffect;
    GlowEffect3: TGlowEffect;
    BitmapListAnimation1: TBitmapListAnimation;
    Rectangle1: TRectangle;
    procedure btnNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Botao01Click(Sender: TObject);
  private
    FCapsules: TList<TRoundRect>;
  public
  end;

var
  frmWizard: TfrmWizard;

implementation

{$R *.fmx}

procedure TfrmWizard.FormCreate(Sender: TObject);
begin
  FCapsules := TList<TRoundRect>.Create;
  FCapsules.Add(Botao01);
  FCapsules.Add(Botao02);
  FCapsules.Add(Botao03);

  TabControl1.TabIndex := 0;
end;

procedure TfrmWizard.FormDestroy(Sender: TObject);
begin
  FCapsules.Free;
end;

procedure TfrmWizard.Botao01Click(Sender: TObject);
begin
  Rectangle1.Visible := not Rectangle1.Visible;
end;

procedure TfrmWizard.btnNextClick(Sender: TObject);
var
  I: Integer;
  Y, StartY, Gap: Single;
begin
  StartY := 20;
  Gap := 30;

  for I := 0 to FCapsules.Count - 1 do
  begin
    FCapsules[I].Position.Y := Height;
    FCapsules[I].Position.X := 200;
//    FCapsules[I].Opacity := 0;

    Y := StartY + (FCapsules[I].Height + Gap) * I;

    TAnimator.AnimateFloatDelay(FCapsules[I], 'Position.Y', Y, 0.7, 0.4, TAnimationType.out, TInterpolationType.Quartic);
//    TAnimator.AnimateFloatDelay(FCapsules[I], 'Opacity', 1, 0.7, 0.4, TAnimationType.In, TInterpolationType.Quartic);
  end;

  NextTabAction1.Execute;
end;

end.

