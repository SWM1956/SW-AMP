unit ListBoxPlayer1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, ComCtrls, LResources, Controls, StdCtrls;

type
  TListBoxPlayer = class(TListBox)
  private
 FEmbeddedStatusBar: TStatusBar;
  protected

  public

  constructor Create(AOwner: TComponent); override;
  published
  property EmbeddedStatusBar: TStatusBar read FEmbeddedStatusBar;
  end;

procedure Register;

implementation

// Регистрирует компонент TListBoxPlayer в палитре Lazarus
procedure Register;
begin
  {$I listboxplayer1_icon.lrs}
  RegisterComponents('Standard',[TListBoxPlayer]);
end;

// Конструктор компонента с добавлением статус-бара
constructor TListBoxPlayer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // Устанавливаем дефолтовые width и height
  with GetControlClassDefaultSize do
    SetInitialBounds(0, 0, CX, CY);

  // Добавляем встроенный label
  FEmbeddedStatusBar := TStatusBar.Create(Self); // Добавляем встроенный label
  FEmbeddedStatusBar.Parent := self;         // Показываем label на panel
  FEmbeddedStatusBar.SetSubComponent(true);  // Говорим IDE сохранять измененные свойства
  FEmbeddedStatusBar.Name := 'EmbeddedStatusBar';
  FEmbeddedStatusBar.SimpleText := 'Howdy World!';

  // Убеждаемся, что встроенная label не может быть выделена/удалена средствами IDE
//  FStatusBar.ControlStyle := FStatusBar.ControlStyle - [csNoDesignSelectable];
    // Задаем другие свойства, если необходимо
  //...

end;


end.
