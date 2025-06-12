unit FTrackBar;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, LResources, ComCtrls;

type

  { TFTrackBar }

  TFTrackBar = class(TTrackBar)
  private
    FPosition: Double;
   procedure SetPosition(AValue: Double);

  protected

  public
  constructor Create(aowner: TComponent); override;
  published
  property  Position:Double read FPosition write SetPosition;
  end;

procedure Register;

implementation

// Конструктор компонента трекбара
constructor TFTrackBar.Create(aowner:Tcomponent);
begin
inherited create(Aowner);
end;
// Регистрация компонента в среде разработки

procedure Register;
begin
  {$I ftrackbar_icon.lrs}
  RegisterComponents('MyComponents',[TFTrackBar]);
end;

{ TFTrackBar }

// Устанавливает значение свойства Position
procedure TFTrackBar.SetPosition(AValue: Double);
begin
  if FPosition=AValue then Exit;
  FPosition:=AValue;
end;

end.
