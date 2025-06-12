unit TrackBar1;

{$mode objfpc}{$H+}

interface

uses
  Classes, ComCtrls;

type
  TTrackBar1 = class(TTrackBar)
  private

  protected

  public

  published

  end;

procedure Register;

implementation

// Регистрирует компонент TrackBar1 в палитре Lazarus
procedure Register;
begin
  RegisterComponents('Common Controls',[TTrackBar1]);
end;

end.
