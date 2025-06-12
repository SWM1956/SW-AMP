unit options1;

{$MODE Delphi}

interface

uses
  Classes, Forms, Controls, Graphics, ExtCtrls, ComCtrls,
  StdCtrls, XMLPropStorage,
  BGRAShape;
type

  { TOptions_Frm }

  TOptions_Frm = class(TForm)
    BGRAShape14: TBGRAShape;
    BGRAShape15: TBGRAShape;
    BGRAShape17: TBGRAShape;
    BGRAShape18: TBGRAShape;
    BGRAShape19: TBGRAShape;
    BGRAShape20: TBGRAShape;
    BGRAShape21: TBGRAShape;
    BGRAShape23: TBGRAShape;
    BGRAShape24: TBGRAShape;
    BGRAShape25: TBGRAShape;
    BGRAShape26: TBGRAShape;
    BGRAShape27: TBGRAShape;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CBox7: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
  //  ComboBox7: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    Timer1: TTimer;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    UpDown1: TUpDown;
    XMLPropStorage1: TXMLPropStorage;
    procedure BGRAShape15MouseDown(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CBox7Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox5Select(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormChangeBounds(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDragDrop(Sender: TObject);
    procedure FormDragOver(Sender: TObject);
    procedure FormMouseDown(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar2MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure TrackBar3Change(Sender: TObject);
    procedure UpDown1Click(Sender: TObject);
    procedure XMLPropStorage1RestoreProperties(Sender: TObject);

  private

  public

  end;

var
  Options_Frm: TOptions_Frm;
kdown: Boolean;
implementation
 uses sw_player, Spectrum_vis, list;
{$R *.lfm}

{ TOptions_Frm }

procedure TOptions_Frm.CheckBox1Change(Sender: TObject);
begin
  lnVolume:= CheckBox1.Checked;
  with Form_player.TrackBar1 do begin
  Position:=Position-1;
   Position:=Position+1;
  end;
end;

procedure TOptions_Frm.BGRAShape15MouseDown(Sender: TObject);
begin
 kdown:=true;
end;

procedure TOptions_Frm.CheckBox2Change(Sender: TObject);
begin
  tonComp:=CheckBox2.Checked;
  Form_player.SetTonComp();
  Form_player.UpdateTonComp;
end;

procedure TOptions_Frm.CheckBox3Change(Sender: TObject);
begin

end;

procedure TOptions_Frm.CheckBox3Click(Sender: TObject);
begin
off_analizer:=CheckBox3.Checked;
if not off_analizer then  begin
 off_analizer:=not off_analizer;
  Form_Player.MenuOnStopStart(self);
end;
end;

procedure TOptions_Frm.CheckBox4Change(Sender: TObject);
begin
  Eq_Hide:= CheckBox4.Checked;
   Form_Player.MenuItem1Click1(Self);
end;

procedure TOptions_Frm.CheckBox5Change(Sender: TObject);
begin
Off_equalizer:=checkBox5.Checked;
Form_player.MenuItem2Click1(Self);
Form_player.Timer3.Enabled:=true;
end;

procedure TOptions_Frm.CheckBox6Change(Sender: TObject);
begin
sw_player.AutoStart:=CheckBox6.Checked;
end;

procedure TOptions_Frm.CBox7Change(Sender: TObject);
begin
  HidePlayList:= CBox7.Checked;
end;

procedure TOptions_Frm.ComboBox1Change(Sender: TObject);
begin
  // Form_Player.caption:=ComboBox1.ItemIndex.ToString;
   ComboBox1.Tag:=ComboBox1.ItemIndex;
  Form_player.ComboBox1Change(Self);
end;

procedure TOptions_Frm.ComboBox3Change(Sender: TObject);
begin
     ComboBox3.Tag:=ComboBox3.ItemIndex;
    Form_player.ComboBox3Change(Self);
end;

procedure TOptions_Frm.ComboBox4Change(Sender: TObject);
begin
  ATTRIB_SRC:=ComboBox5.ItemIndex;
  ComboBox4.Tag:=ComboBox4.ItemIndex;
           Form_player.ComboBox4CloseUp(Self);

end;

procedure TOptions_Frm.ComboBox5Change(Sender: TObject);
begin
  Form_player.SetInterpolation( ComboBox5.ItemIndex);
  ComboBox5.Tag:=ComboBox5.ItemIndex;
  //   BASS_SetConfig(psound, ComboBox5.ItemIndex);
end;


procedure TOptions_Frm.ComboBox5Select(Sender: TObject);
begin
  Combobox5.Text:=ComboBox5.Items[ComboBox5.ItemIndex];
end;

procedure TOptions_Frm.FormActivate(Sender: TObject);
begin
   // Form1.Button1.Enabled:=False;
      lnVolume:=CheckBox1.Checked;
      TonComp :=CheckBox2.Checked;
      ATTRIB_SRC:=ComboBox5.ItemIndex;
//      setDefaultLang('be_BY', 'languages');

 //     ComboBox1.OnChange(self);
end;

procedure TOptions_Frm.FormChangeBounds(Sender: TObject);
begin

end;

procedure TOptions_Frm.FormCreate(Sender: TObject);
begin
 //ComboBox1.OnChange(Self);
     //  Options_Frm.
       CheckBox5.Checked:=not CheckBox5.Checked;
             EQ_hide:= CheckBox4.Checked;
             off_equalizer:=CheckBox5.Checked;
              HidePlayList:= CBox7.Checked;

end;

procedure TOptions_Frm.FormDragDrop(Sender: TObject);
begin

end;

procedure TOptions_Frm.FormDragOver(Sender: TObject);
begin

end;

procedure TOptions_Frm.FormMouseDown(Sender: TObject);
begin
kdown:=true;

end;


procedure TOptions_Frm.Timer1Timer(Sender: TObject);
begin
  Options_frm.CheckBox4.Checked:=sw_player.eq_hide;
end;



procedure TOptions_Frm.TrackBar2Change(Sender: TObject);
begin
   Spectrum.ColWidth:=12-TrackBar2.Position;
     sw_player.changeBand:=true;
end;

procedure TOptions_Frm.TrackBar2MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
(Sender as TTrackBar).Position:=(Sender as TTrackBar).Position+(WheelDelta div 120);
 Handled := True;
end;

procedure TOptions_Frm.TrackBar3Change(Sender: TObject);
begin
  Spectrum.PenColor := Spectrum.Bright(clActiveCaption, TrackBar3.Position);
end;



procedure TOptions_Frm.UpDown1Click(Sender: TObject);
begin
if form_player.Tag=3 then begin
Frm_List.LB1.Font.Size:=10;
 form_player.Tag:=4;
 Frm_List.XMLPropStorage1.Save;
 UpDown1.Position:=10;
end;

label4.Font:=Frm_List.LB1.Font;
Frm_List.LB1.Font.Size:=UpDown1.Position;
//Frm_List.LB1.ItemHeight:=(Frm_List.LB1.Font.Size+4)*2;
if isStream then
Frm_List.LB1.ItemHeight:=(Frm_List.LB1.Font.Size+4)
else
Frm_List.LB1.ItemHeight:=(UpDown1.Position-4+UpDown1.Position*2);
Frm_List.XMLPropStorage1.Save;
end;

procedure TOptions_Frm.XMLPropStorage1RestoreProperties(Sender: TObject);
begin
   if ComboBox1.Items.Count<12 then begin
    ComboBox1.Items.Add('Auto');
    XMLPropStorage1.Save;
  end;
end;




end.
