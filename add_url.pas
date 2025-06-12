unit add_url;

{$mode Delphi}

interface

uses
  SysUtils, Forms, StdCtrls, BGRAShape;

type

  { TForm_addurl }

  TForm_addurl = class(TForm)
    BGRAShape15: TBGRAShape;
    BGRAShape21: TBGRAShape;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormChangeBounds(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form_addurl: TForm_addurl;

implementation
 uses sw_player, list;
{$R *.lfm}

{ TForm_addurl }
// Обработчик кнопки "OK" - добавляет введённые данные в список

procedure TForm_addurl.Button1Click(Sender: TObject);
begin
// if edtrack then
 if edtrack and (edit1.Text>'') and (edit2.Text>'') then begin
   frm_list.LB1.Items[frm_list.LB1.ItemIndex]:=Form_AddUrl.Edit2.Text;
    frm_list.LB2.Items[frm_list.LB1.ItemIndex]:=Form_AddUrl.Edit1.Text;
 end
 else
 if (edit1.Text>'') and (edit2.Text>'') then begin
 frm_list.LB2.Items.Add(edit1.Text);
 frm_list.LB1.Items.Add( intToStr(Frm_List.Lb1.Items.Count+1)+' - '+ edit2.Text);
 frm_list.lb4.Items.Add('1.0');
 frm_list.lb3.Items.Add('');
 end;
// form_player.FormStyle:=fsSystemStayOnTop;
if (edit1.Text>'') and (edit2.Text>'') then
Form_addurl.Close;
end;

// Закрывает форму без добавления URL
procedure TForm_addurl.Button2Click(Sender: TObject);
begin
 // form_player.FormStyle:=fsStayOnTop;
 Form_addurl.Close;
end;

// Обработчик изменения размеров формы (не используется)
procedure TForm_addurl.FormChangeBounds(Sender: TObject);
begin

end;

// Обрабатывает нажатия клавиш Enter и Escape
procedure TForm_addurl.FormKeyPress(Sender: TObject; var Key: char);
begin
if Key=#13 then
Button1Click(self);
if Key=#$1B then
Form_addurl.Close;
end;

// Подготавливает форму к показу (позиция и видимость)
procedure TForm_addurl.FormShow(Sender: TObject);
begin
 //form_addurl.top:=form_player.top + 400;
 //  form_addurl.left:= form_player.Left+9;
 //  form_addurl.Visible:=true;
end;

end.

