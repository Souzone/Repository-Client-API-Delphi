unit Model.Threds.LoadingShow;

interface

uses
  System.Classes,
  Vcl.Dialogs,
  Vcl.Forms, Winapi.Windows;

type
  TModelThreadsLoading = class(TThread)
    private

    protected
    procedure Execute;override;
  end;

implementation

{ TModelThreadsLoading }

procedure TModelThreadsLoading.Execute;
begin
    Sleep(1000);
    // a��es seguras

    TThread.Queue(nil,
    procedure
    begin
      Application.MainForm.Hide;
    end);
end;

end.
