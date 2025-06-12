unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Forms, ExtCtrls;
type

  { TForm1 }

  TForm1 = class(TForm)
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

uses  sw_player, options1, effects, list, cover, add_url ;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
timer2.Enabled:=false;;

Application.CreateForm(TForm_player, Form_player);
Application.CreateForm(TForm_addurl, Form_addurl);
Application.CreateForm(TFrm_List, Frm_List);
Application.CreateForm(TOptions_frm, Options_frm);
Application.CreateForm(TFrm_effects, Frm_effects);
Application.CreateForm(TCover_Form, Cover_Form);
Frm_List.Show;
 Form1.Hide;
 Form_player.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
// createDir( ExtractFilePath(ParamStr(0))+'swampproperties');
end;







end.

