unit Cover;

{$mode objfpc}{$H+}

interface

uses
  Forms, SysUtils, Graphics, ExtCtrls, BGRAShape;

type

  { TCover_Form }

  TCover_Form = class(TForm)
    BGRAShape11: TBGRAShape;
    BGRAShape12: TBGRAShape;
    Image1: TImage;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
  PictName:string;
  public

  end;

var
  Cover_Form: TCover_Form;

implementation
 uses sw_player, list;
{$R *.lfm}

{ TCover_Form }



procedure TCover_Form.Timer1Timer(Sender: TObject);
begin

 alphaBlendValue:= alphaBlendValue-1;
  if Frm_List.Pict=PictName then
   alphaBlendValue:= alphaBlendValue-3;
   if  alphaBlendValue<=250 then
   timer1.interval:=10;
 if  alphaBlendValue<=80 then begin
 timer1.Enabled:=false;
 timer1.Interval:=1000;
  frm_List.Top:=top;
  pictName:=Frm_List.Pict;
  frm_list.show;
  form_player.show;
// frm_list.Visible:=true;
// frm_list.Show;
   sleep(100);
//  Cover_Form.close;
   Cover_Form.Visible:=false;
 //pictName:=Frm_List.Pict;

 end;
end;

procedure TCover_Form.FormShow(Sender: TObject);
begin
 // exit;
 if not form_player.Visible then begin
   exit;
 end;
  top:=frm_list.Top;

 left:=form_player.Left;
 timer1.Enabled:=false;
Image1.Picture.LoadFromFile(Frm_List.Pict);
Width:= form_player.Width+1;
 height:=Trunc(444*(Image1.Picture.Height/Image1.Picture.Width));
 alphaBlendValue:=254;
  timer1.Enabled:=true;
//   frm_list.Hide;
end;

procedure TCover_Form.Image1Click(Sender: TObject);
begin
  {
   timer1.Enabled:=not  timer1.Enabled;
   if timer1.Enabled then
    Image1.Cursor:=crDefault
    else
     Image1.Cursor:=crHandPoint;
   //Cover_Form.Refresh;    }
end;



end.

