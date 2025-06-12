unit getinfo;

{$mode objfpc}{$H+}

interface

uses
  Forms, ExtCtrls, ComCtrls,
  StdCtrls, BGRAShape;

type

  { TTagEditor }

  TTagEditor = class(TForm)
    BGRAShape1: TBGRAShape;
    BGRAShape3: TBGRAShape;
    BGRAShape4: TBGRAShape;
    BGRAShape5: TBGRAShape;
    BGRAShape6: TBGRAShape;
    BGRAShape7: TBGRAShape;
    Button1: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    procedure BGRAShape13Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private

  public

  end;

var
  TagEditor: TTagEditor;

implementation

{$R *.lfm}

{ TTagEditor }

procedure TTagEditor.PageControl1Change(Sender: TObject);
begin

end;

procedure TTagEditor.BGRAShape13Click(Sender: TObject);
begin

end;

end.

