unit effects;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,  ComCtrls, ExtCtrls,
 StdCtrls, XMLPropStorage, lazdynamic_bass,
  DynLibs, Dynamic_BassFX, BGRAShape, Types;

type

  { TFrm_Effects }

  TFrm_Effects = class(TForm)
    BGRAShape17: TBGRAShape;
    BGRAShape19: TBGRAShape;
    BGRAShape20: TBGRAShape;
    BGRAShape22: TBGRAShape;
    BGRAShape23: TBGRAShape;
    BGRAShape25: TBGRAShape;
    BGRAShape26: TBGRAShape;
    BGRAShape28: TBGRAShape;
    BGRAShape30: TBGRAShape;
    BGRAShape31: TBGRAShape;
    BGRAShape32: TBGRAShape;
    BGRAShape33: TBGRAShape;
    BGRAShape34: TBGRAShape;
    BGRAShape35: TBGRAShape;
    BGRAShape36: TBGRAShape;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    checkBox15: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Ef2Name1: TPanel;
    Ef3Name2: TPanel;
    Ef5Name1: TPanel;
    Ef5Name2: TPanel;
    Ef6Name1: TPanel;
    Ef8Name1: TPanel;
    Label1: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    label63: TLabel;
   label66: TLabel;
   label74: TLabel;
   label67: TLabel;
   label70: TLabel;
    PageControl1: TPageControl;
    Pane116: TPanel;
    Panel1: TPanel;
    Panel16: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    Timer1: TTimer;
    XMLPropStorage1: TXMLPropStorage;
    XTB10: TTrackBar;
    XTB12: TTrackBar;
    XTB13: TTrackBar;
    XTB14: TTrackBar;
    XTB15: TTrackBar;
    XTB16: TTrackBar;
    XTB18: TTrackBar;
    XTB19: TTrackBar;
    XTB20: TTrackBar;
    XTB21: TTrackBar;
    XTB22: TTrackBar;
    XTB23: TTrackBar;
    XTB24: TTrackBar;
    XTB25: TTrackBar;
    XTB26: TTrackBar;
    XTB27: TTrackBar;
    XTB28: TTrackBar;
    XTB29: TTrackBar;
    XTB31: TTrackBar;
    XTB32: TTrackBar;
    XTB33: TTrackBar;
    XTB34: TTrackBar;
    XTB36: TTrackBar;
    XTB3: TTrackBar;
    XTB30: TTrackBar;
    XTB6: TTrackBar;
    XTB7: TTrackBar;
    XTB8: TTrackBar;
    ComboBox1: TComboBox;
    procedure CheckBox10Change(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox13Change(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox14Change(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Change(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Change(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure TabSheet10Exit(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure TabSheet3Exit(Sender: TObject);
    procedure TabSheet4Exit(Sender: TObject);
    procedure TabSheet5Exit(Sender: TObject);
    procedure TabSheet6Exit(Sender: TObject);
    procedure TabSheet7Exit(Sender: TObject);

    procedure TabSheet7Show(Sender: TObject);
    procedure TabSheet8ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabSheet8Exit(Sender: TObject);
    procedure TabSheet9Exit(Sender: TObject);



    procedure Timer1Timer(Sender: TObject);
    procedure XTB10Change(Sender: TObject);
    procedure XTB10Enter(Sender: TObject);
    procedure XTB12Change(Sender: TObject);
    procedure XTB15Change(Sender: TObject);
    procedure XTB15Enter(Sender: TObject);
    procedure XTB16Change(Sender: TObject);
    procedure XTB18Change(Sender: TObject);
    procedure XTB18Enter(Sender: TObject);
    procedure XTB23Change(Sender: TObject);
    procedure XTB23Enter(Sender: TObject);
    procedure XTB25Change(Sender: TObject);
    procedure XTB25Enter(Sender: TObject);
    procedure XTB26Change(Sender: TObject);
    procedure XTB27Change(Sender: TObject);
    procedure XTB28Change(Sender: TObject);
    procedure XTB29Change(Sender: TObject);

    procedure XTB2MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure XTB30Change(Sender: TObject);
    procedure XTB31Change(Sender: TObject);
    procedure XTB31Enter(Sender: TObject);
    procedure XTB3Change(Sender: TObject);
    procedure XTB3Enter(Sender: TObject);
    procedure XTB8Change(Sender: TObject);

  private
    procedure SetChorusFlanger;
    procedure SetCompressor;
    procedure SetFreReverb;
    procedure SetPeakEqualizer;
    procedure SetPreset(var Presets: array of integer);
    procedure SetStereoExpand;
    procedure UpdateChorusFlanger;
    procedure UpdateCP;
    procedure UpdateFreReverb;
    procedure UpdatePeakEqulizer;
    procedure UpdateStereoExpand;

  public

     procedure SetEcho;
     procedure UpdateEC;
     procedure RunEffects();
  end;

var
  Frm_Effects: TFrm_Effects;
   xtb8Pos, xtb7Pos, xtb6Pos, xtb5Pos, xtb4Pos, xtb3Pos, tb1Pos, tb2Pos :Integer;
   sr:Integer =0;
  ec:Integer =0;
  ho: Integer =0;
  fl: Integer =0;
  cp: Integer =0;
  stE: Integer =0;
  equal: Integer =0;
  equal1: Integer =0;
  ChorusFlanger:Integer =0;
  FreReverb : Integer = 0;
  reverbInChannel:bool =false;
  echoInChannel:bool =false;
  chorusInChannel:bool =false;
  flangerInChannel:bool =false;
  compressorInChannel:bool =false;
  peakEqualizerInChannel:bool   =false;
   peakEqualizer1InChannel:bool   =false;
   ChorusFlangerInChannel : bool =false;
   FreReverbInChannel : bool =false;
  stereoExpandInChannel:bool   =false;
  aFlanger: array [0..5] of Integer = (100, 35, 50, 1, 5, 10);
  aHighChorus: array [0..5] of Integer = (70, 25, 50, 1, 200, 500);
  aMotocycle: array [0..5] of Integer = (90, 45, 50, 1, 100, 250);
  aDevil: array [0..5] of Integer = (90, 35, 50, 1, 50, 2000);
  aManyVoices: array [0..5] of Integer = (90, 35, 50, 1, 400, 2000);
  aBackChipmunk: array [0..5] of Integer = (90, -20, 50, 1, 400, 4000);
  aWater: array [0..5] of Integer = (90, -40, 50, 1, 2, 10);
  aAirPlane: array [0..5] of Integer = (90, 80, 50, 1, 10, 50);
  aUsers: array [0..5] of Integer = (0, 0, 0, 0, 0, 0);
//  peakEqualizer1InChannel

implementation
uses sw_player;
{$R *.lfm}

{ TFrm_Effects }

procedure  TFrm_Effects.SetPreset(var Presets:array of integer);
begin
Xtb25.Position:=Presets[0];
Xtb26.Position:=Presets[1];
Xtb30.Position:=Presets[2];
Xtb27.Position:=Presets[3];
Xtb28.Position:=Presets[4];
Xtb29.Position:=Presets[5];
end;



procedure TFrm_Effects.XTB2MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
    (Sender as TTrackBar).Position:=(Sender as TTrackBar).Position+(WheelDelta div 120);
 Handled := True;
end;

procedure TFrm_Effects.XTB30Change(Sender: TObject);
begin
   if (combobox1.ItemIndex=0) and (aFlanger[2]<>Xtb30.Position) then
  combobox1.ItemIndex:=8;
  if (combobox1.ItemIndex=1) and (aHighChorus[2]<>Xtb30.Position) then
  combobox1.ItemIndex:=8;
  if (combobox1.ItemIndex=2) and (aMotocycle[2]<>Xtb30.Position) then
  combobox1.ItemIndex:=8;
  if (combobox1.ItemIndex=3) and (aDevil[2]<>Xtb30.Position) then
  combobox1.ItemIndex:=8;
  if (combobox1.ItemIndex=4) and (aManyVoices[2]<>Xtb30.Position) then
  combobox1.ItemIndex:=8;
  if (combobox1.ItemIndex=5) and (aBackChipmunk[2]<>Xtb30.Position) then
  combobox1.ItemIndex:=8;
  if (combobox1.ItemIndex=6) and (aWater[2]<>Xtb30.Position) then
  combobox1.ItemIndex:=8;
  if (combobox1.ItemIndex=7) and (aAirPlane[2]<>Xtb30.Position) then
  combobox1.ItemIndex:=8;
  UpdateChorusFlanger;
end;

procedure TFrm_Effects.XTB31Change(Sender: TObject);
begin
  UpdateFreReverb;
end;

procedure TFrm_Effects.XTB31Enter(Sender: TObject);
begin
  Panel10.SetFocus;
end;

procedure TFrm_Effects.XTB3Change(Sender: TObject);
begin
  UpdateEC;
end;

procedure TFrm_Effects.XTB3Enter(Sender: TObject);
begin
  Panel4.SetFocus;
end;



procedure TFrm_Effects.XTB8Change(Sender: TObject);
begin
UpdateEC;
end;


procedure TFrm_Effects.RunEffects;
begin
      if Channel>0 then begin
 ec:=0;
 sr:=0;
 ho:=0;
 fl:=0;
 cp:=0;
 equal:=0;
 equal1:=0;
 stE:=0;
 //Form_player.Caption:=IntToStr(itt);
// setReverb();
 setEcho();
// setChorus();
// setFlanger();
 setCompressor();
 setPeakEqualizer();
 setStereoExpand();
 setChorusFlanger();
 setFreReverb();
      end;
end;



procedure TFrm_Effects.SetEcho;
var
  be:integer;
begin
  if (OnEcho and (Channel>0) and (ec<1)) then begin
   ec:=ec+1;
       BASS_ChannelRemoveFX(Channel,fx[22]);
    fx[22] := BASS_ChannelSetFX(channel, BASS_FX_DX8_ECHO, 1);
   be:= BASS_ErrorGetCode;
  if be=0 then
     echoInChannel:=true
     else
       echoInChannel:=false;
    UpdateEC();
 end;

end;

procedure TFrm_Effects.SetStereoExpand;
var
  be:integer;
begin
  if (OnStereoExpand and (Channel>0) and (stE<1)) then begin
   stE:=Ste+1;
       BASS_ChannelRemoveFX(Channel,fx[30]);
    fx[30] := BASS_ChannelSetFX(channel, BASS_FX_DX8_ECHO, 1);
   be:= BASS_ErrorGetCode;
  if be=0 then
     stereoExpandInChannel:=true
     else
       stereoExpandInChannel:=false;
    UpdateStereoExpand();
 end;

end;


procedure TFrm_Effects.SetCompressor;
var
  be:integer;

Begin
   if (onCompressor and (Channel>0) and (cp<1)) then begin
 //  vers:=BASS_FX_GetVersion();
   cp:=cp+1;
       BASS_ChannelRemoveFX(Channel,fx[26]);
    fx[26] := BASS_ChannelSetFX(channel, BASS_FX_BFX_COMPRESSOR2, 1);
   be:= BASS_ErrorGetCode;
  if be=0 then
     compressorInChannel:=true
     else
       compressorInChannel:=false;
    UpdateCP();
 end;
end;

procedure TFrm_Effects.SetPeakEqualizer;
var
  be:integer;

Begin
   if (OnPeakEqualizer and (Channel>0) and (equal<1)) then begin
 //  vers:=BASS_FX_GetVersion();
   equal:=equal+1;
       BASS_ChannelRemoveFX(Channel,fx[28]);
    fx[28] := BASS_ChannelSetFX(channel, BASS_FX_BFX_BQF  , 1);
   be:= BASS_ErrorGetCode;
  if be=0 then
     peakEqualizerInChannel:=true
     else
       peakEqualizerInChannel:=false;
    UpdatePeakEqulizer();
 end;
      if (OnPeakEqualizer1 and (Channel>0) and (equal1<1)) then begin
   equal1:=equal1+1;
       BASS_ChannelRemoveFX(Channel,fx[29]);
    fx[29] := BASS_ChannelSetFX(channel, BASS_FX_BFX_BQF  , 1);
   be:= BASS_ErrorGetCode;
  if be=0 then
     peakEqualizer1InChannel:=true
     else
       peakEqualizer1InChannel:=false;
  UpdatePeakEqulizer();
 end;

end;




procedure TFrm_Effects.UpdatePeakEqulizer;
var
  v, v1:Double;
begin
 if peakEqualizerInChannel and OnPeakEqualizer then Begin
 BASS_FXGetParameters(fx[28], @pExt);
Pext.lFilter:=  BASS_BFX_BQF_PEAKINGEQ;
v := Xtb18.Position;
pExt.fCenter:=v;
v:=Xtb19.Position/10;
pExt.fGain := v;
pExt.fBandwidth:= Xtb24.Position/1000.0;
label50.Caption:= FloatToStrF(pExt.fBandwidth,ffFixed,1,2);
//pExt.fBandwidth:=1.0;
if checkBox9.Checked and checkBox11.Checked then
pext.lChannel:=-1
else
  if checkBox9.Checked and (Not checkBox11.Checked) then
 pext.lChannel:=1
 else
   if checkBox11.Checked and (Not checkBox9.Checked) then
 pext.lChannel:=2 ;
Label37.Caption:= FloatToStrF(pExt.fCenter,ffFixed,5,0)+'Hz';
Label38.Caption:= FloatToStrF(pExt.fGain,ffFixed,5,1)+'dB';
BASS_FXSetParameters(fx[28], @pExt);
end;
  if (checkBox10.Checked or CheckBox12.Checked ) and peakEqualizer1InChannel then  Begin

 BASS_FXGetParameters(fx[29], @pExt1);
Pext1.lFilter:=  BASS_BFX_BQF_PEAKINGEQ;
v1 := Xtb20.Position;
pExt1.fCenter:=v1;
v1:=Xtb21.Position/10;
pExt1.fGain := v1;
pExt1.fBandwidth:= Xtb22.Position/1000.0;
label47.Caption:= FloatToStrF(pExt1.fBandwidth,ffFixed,1,2);
if checkBox10.Checked and checkBox12.Checked then
pext1.lChannel:=-1
else
  if checkBox10.Checked and (Not checkBox12.Checked) then
 pext1.lChannel:=1
 else
   if checkBox12.Checked and (Not checkBox10.Checked) then
 pext1.lChannel:=2 ;
Label41.Caption:= FloatToStrF(pExt1.fCenter,ffFixed,5,0)+'Hz';
Label44.Caption:= FloatToStrF(pExt1.fGain,ffFixed,5,1)+'dB';
BASS_FXSetParameters(fx[29], @pExt1);
end;

 end;


procedure TFrm_Effects.SetChorusFlanger;
var
  be:integer;

Begin
   if (OnChorusFlanger and (Channel>0) ) then begin
 //  vers:=BASS_FX_GetVersion();
   ChorusFlanger:=ChorusFlanger+1;
       BASS_ChannelRemoveFX(Channel,fx[31]);
        fx[31] := BASS_ChannelSetFX(channel, BASS_FX_BFX_CHORUS, 1);
   // fx[33] := BASS_ChannelSetFX(channel, BASS_FX_BFX_FLANGER  , 0);
   be:= BASS_ErrorGetCode;
  if be=0 then begin
     ChorusFlangerInChannel:=true;
      BASS_FXGetParameters(fx[31], @pChFl);
 //      pChFl.lChannel:=-1;
 //  BASS_FXSetParameters(fx[31], @pChFl);
     end
     else
       ChorusFlangerInChannel:=false;
   UpdateChorusFlanger();
 end;

end;


procedure TFrm_Effects.SetFreReverb;
var
  be:integer;

Begin
   if (OnFreReverb and (Channel>0) ) then begin
 //  vers:=BASS_FX_GetVersion();
   FreReverb:=FreReverb+1;
       BASS_ChannelRemoveFX(Channel,fx[32]);
    fx[32] := BASS_ChannelSetFX(channel, BASS_FX_BFX_FREEVERB , 1);
   be:= BASS_ErrorGetCode;
  if be=0 then begin
     FreReverbInChannel:=true;
      BASS_FXGetParameters(fx[32], @pFreRev);
       pFreRev.lChannel:=-1;
   BASS_FXSetParameters(fx[32], @pFreRev);
     end
     else
       FreReverbInChannel:=false;
   UpdateFreReverb();
 end;

end;


procedure TFrm_Effects.UpdateFreReverb;
var
  v, v1:Double;
begin
   if FreReverbInChannel and OnFreReverb then Begin
    BASS_FXGetParameters(fx[32], @pFreRev);
    v := Xtb31.Position/100;
    pFreRev.fDryMix:=v;
    v := Xtb32.Position/100;
   pFreRev.fWetMix:=v;
   v := Xtb36.Position/100;
   pFreRev.fRoomSize:=v;
   v:=Xtb33.Position/100;
   pFreRev.fDamp:=v;
    v:=Xtb34.Position/100;
   pFreRev.fWidth:=v;
 //  v:=Xtb35.Position/100;
  // pFreRev.:=v;
   // v:=Xtb29.Position;
  //  pFreRev.fRate:=v;
   label63.Caption:= FloatToStrF(pFreRev.fDryMix,ffFixed,1,2);
   label66.Caption:= FloatToStrF(pFreRev.fWetMix,ffFixed,1,2);
   label74.Caption:= FloatToStrF(pFreRev.fRoomSize,ffFixed,1,2);
   label67.Caption:= FloatToStrF(pFreRev.fDamp,ffFixed,4,2);
   label70.Caption:= FloatToStrF(pFreRev.fWidth,ffFixed,4,2);
 //  label60.Caption:= FloatToStrF(pFreRev.fRate,ffFixed,4,1);
   if checkBox14.Checked and checkBox15.Checked then
   pFreRev.lChannel:=-1
   else
     if checkBox14.Checked and (Not checkBox15.Checked) then
    pFreRev.lChannel:=1
    else
      if checkBox15.Checked and (Not checkBox14.Checked) then
    pFreRev.lChannel:=2 ;
   BASS_FXSetParameters(fx[32], @pFreRev);
   end;
end;


procedure TFrm_Effects.UpdateChorusFlanger;
var
  v, v1:Single;

begin

   if ChorusFlangerInChannel and OnChorusFlanger then Begin
    BASS_FXGetParameters(fx[31], @pChFl);
    v := Xtb25.Position/100;
    pChFl.fDryMix:=v;
    v := Xtb26.Position/100;
   pChFl.fWetMix:=v;
   v := Xtb30.Position/100;
   pChFl.fFeedback:=v;
   v:=Xtb27.Position;
   pChFl.fMinSweep:=v;

    v:=Xtb28.Position;
   pChFl.fMaxSweep:=v;

    v:=Xtb29.Position/10;
    pChFl.fRate:=v;
   label51.Caption:= FloatToStrF(pChFl.fDryMix,ffFixed,1,2);
   label54.Caption:= FloatToStrF(pChFl.fWetMix,ffFixed,1,2);
   label62.Caption:= FloatToStrF(pChFl.fFeedback,ffFixed,1,1);
   label55.Caption:= FloatToStrF(pChFl.fMinSweep,ffFixed,4,1);
   label58.Caption:= FloatToStrF(pChFl.fMaxSweep,ffFixed,4,1);
   label60.Caption:= FloatToStrF(pChFl.fRate,ffFixed,4,1);
   pChFl.lChannel:=-1;
   BASS_FXSetParameters(fx[31], @pChFl);
   end;



end;

procedure TFrm_Effects.UpdateCP;
var
  v:Double;
begin
 if compressorInChannel then Begin
BASS_FXGetParameters(fx[26], @pCo);
v := Xtb10.Position;
pCo.fRelease := v;
Label21.Caption:= FloatToStrF(pCo.fRelease,ffFixed,0,0)+' mS';

v := XTB12.Position*0.1;
pCo.fThreshold:= v;
//pf.fWetDryMix:=70;
Label23.Caption:= FloatToStrF(pCo.fThreshold,ffFixed,0,1)+' dB';
pco.fGain:=pco.fThreshold*(1/(pco.fRatio)-0.6);
V:= XTB13.Position*0.1;
pCo.fAttack:=v;
 Label24.Caption:= FloatToStrF(pCo.fAttack,ffFixed,0,1)+' mS';
  pCo.fRelease:=v*5;
 V:= XTB14.Position*0.1;
pCo.fRatio:=v;
 Label25.Caption:= FloatToStrF(pCo.fRatio,ffFixed,0,1)+':1';

BASS_FXSetParameters(fx[26], @pCo);

end;
 end;


procedure TFrm_Effects.UpdateEC;
var
  v:Double;
begin
   if echoInChannel then Begin
BASS_FXGetParameters(fx[22], @pE);
v:=Xtb6.Position*0.1;
pE.fFeedback:=0.0001*v*v*v;
 Label9.Caption:=FloatToStrF(pE.fFeedback,ffFixed,0,1)+' %';

 v:=Xtb7.Position*0.1;
pE.fLeftDelay:=0.01*v*v*v+1;
 Label13.Caption:=FloatToStrF(pE.fLeftDelay,ffFixed,0,2)+' mS';

 v:=Xtb8.Position*0.1;
pE.fRightDelay:=0.01*v*v*v+1;
 Label14.Caption:=FloatToStrF(pE.fRightDelay,ffFixed,0,2)+' mS';
v := XTB3.Position*0.1;
pE.fWetDryMix :=0.0001*v*v*v;
// pE.lPanDelay:=true;

Label8.Caption:=FloatToStrF(pE.fWetDryMix,ffFixed,0,1)+' %';
BASS_FXSetParameters(fx[22], @pE);
   end;
   end;

procedure TFrm_Effects.UpdateStereoExpand;
var
  v:Double;
begin
   if stereoExpandInChannel then Begin
BASS_FXGetParameters(fx[30], @pstE);
pstE.fFeedback:=0;
v:=Xtb23.Position*0.1;
 pstE.fRightDelay:=0.01*v*v*v+1;
 Label45.Caption:=FloatToStrF(pstE.fRightDelay,ffFixed,3,2);
 if pste.fRightDelay >1.1 then
 Label45.Caption:=FloatToStrF(pstE.fRightDelay*2.518891688, ffFixed,3,2);
// if pste.fRightDelay <3 then
 // Label45.Caption:=FloatToStrF(0, ffFixed,3,2);
pstE.fLeftDelay:=1;
pstE.fWetDryMix :=100;
BASS_FXSetParameters(fx[30], @pstE);
   end;
   end;


procedure TFrm_Effects.CheckBox10Click(Sender: TObject);
begin
     Xtb20.Enabled:=CheckBox10.Checked or CheckBox12.Checked;
    Xtb21.Enabled:=CheckBox10.Checked or CheckBox12.Checked;
    Xtb22.Enabled:=CheckBox10.Checked or CheckBox12.Checked;
    UpdatePeakEqulizer;
end;

procedure TFrm_Effects.CheckBox13Change(Sender: TObject);
begin
  OnChorusFlanger:=CheckBox13.Checked;
if OnChorusFlanger then begin
ChorusFlanger:=0;
setChorusFlanger;
end
else begin
       BASS_ChannelRemoveFX(Channel,fx[31]);
       fx[31]:=0;
    chorusFlangerInChannel:=false;
  end;
end;

procedure TFrm_Effects.CheckBox13Click(Sender: TObject);
var
  checked: bool;
begin
  checked:=CheckBox13.Checked;
    Xtb25.Enabled:=Checked;
    Xtb26.Enabled:=Checked;
    Xtb27.Enabled:=Checked;
    Xtb28.Enabled:=Checked;
    Xtb29.Enabled:=Checked;
    Xtb30.Enabled:=Checked;
    ComboBox1.Enabled:=Checked;
end;

procedure TFrm_Effects.CheckBox14Change(Sender: TObject);
begin
    OnFreReverb:=CheckBox14.Checked or CheckBox15.Checked;
if OnFreReverb then begin
FreReverb:=0;
setFreReverb;
end
else begin
       BASS_ChannelRemoveFX(Channel,fx[32]);
       FreReverbInChannel:=false;
  end;
end;

procedure TFrm_Effects.CheckBox14Click(Sender: TObject);
var
  checked: bool;
begin
  checked:=CheckBox14.Checked or CheckBox15.Checked;
      Xtb31.Enabled:=Checked;
      Xtb32.Enabled:=Checked;
      Xtb33.Enabled:=Checked;
      Xtb34.Enabled:=Checked;
      Xtb36.Enabled:=Checked;
      ComboBox1.Enabled:=Checked;
end;

procedure TFrm_Effects.CheckBox10Change(Sender: TObject);
begin
            OnPeakEqualizer1:=CheckBox10.Checked or  CheckBox12.Checked;
      if OnPeakEqualizer1 then begin
     equal1:=0;
      setPeakEqualizer;
      UpdatePeakEqulizer;
      end
      else begin
             BASS_ChannelRemoveFX(Channel,fx[29]);
          peakEqualizer1InChannel:=false;
        end;

end;


procedure TFrm_Effects.CheckBox3Change(Sender: TObject);
begin
{OnEcho:=CheckBox3.Checked;
setEcho;

BASS_ChannelRemoveFX(Channel,fx[22]);
 }

OnEcho:=CheckBox3.Checked;
if OnEcho then begin
ec:=0;
setEcho;
end
else begin
       BASS_ChannelRemoveFX(Channel,fx[22]);
    echoInChannel:=false;
  end;





end;

procedure TFrm_Effects.CheckBox3Click(Sender: TObject);
begin
  Xtb8.Enabled:=CheckBox3.Checked;
  Xtb3.Enabled:=CheckBox3.Checked;
  Xtb6.Enabled:=CheckBox3.Checked;
  Xtb7.Enabled:=CheckBox3.Checked;
end;

procedure TFrm_Effects.CheckBox5Change(Sender: TObject);
begin
      OnCompressor:=CheckBox5.Checked;
      if OnCompressor then begin
     cp:=0;
      setCompressor;
      end
      else begin
             BASS_ChannelRemoveFX(Channel,fx[26]);
          CompressorInChannel:=false;
        end;
end;

procedure TFrm_Effects.CheckBox5Click(Sender: TObject);
begin

  Xtb10.Enabled:=CheckBox5.Checked;
  Xtb12.Enabled:=CheckBox5.Checked;
 Xtb13.Enabled:=CheckBox5.Checked;
 Xtb14.Enabled:=CheckBox5.Checked;
end;

procedure TFrm_Effects.CheckBox6Change(Sender: TObject);
begin

end;

procedure TFrm_Effects.CheckBox6Click(Sender: TObject);
begin
    if not CheckBox6.Checked then begin
     XTB15.Position:=0;
       label32.Caption:=FloatToStrF(0,ffFixed,0,0)+'%';
       FXTempo:=0;
     BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
     xtb15.Enabled:=false;
  end
    else begin
              xtb15.Enabled:=true;
     //         XTB15.Position:=0;

    end;
end;

procedure TFrm_Effects.CheckBox7Change(Sender: TObject);
begin

end;

procedure TFrm_Effects.CheckBox7Click(Sender: TObject);
begin
      if not CheckBox7.Checked then begin
     XTB16.Position:=0;
       label33.Caption:=FloatToStrF(0,ffFixed,0,0);
       FXPitch:=0;
     BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO_PITCH, FXPitch);
     xtb16.Enabled:=false;
  end
    else begin
              xtb16.Enabled:=true;
end;
 end;

procedure TFrm_Effects.CheckBox8Change(Sender: TObject);
begin
  OnStereoExpand:=CheckBox8.Checked;
if OnStereoExpand then begin
stE:=0;
setStereoExpand;
end
else begin
       BASS_ChannelRemoveFX(Channel,fx[30]);
    StereoExpandInChannel:=false;
  end;

end;

procedure TFrm_Effects.CheckBox8Click(Sender: TObject);
begin
   Xtb23.Enabled:=CheckBox8.Checked;
end;

procedure TFrm_Effects.CheckBox9Change(Sender: TObject);
begin
          OnPeakEqualizer:=CheckBox9.Checked or  CheckBox11.Checked ;
      if OnPeakEqualizer then begin
     equal:=0;
      setPeakEqualizer;
    UpdatePeakEqulizer;
      end
      else begin
             BASS_ChannelRemoveFX(Channel,fx[28]);
          peakEqualizerInChannel:=false;
        end;


end;

procedure TFrm_Effects.CheckBox9Click(Sender: TObject);
begin
   Xtb18.Enabled:=CheckBox9.Checked or CheckBox11.Checked;
    Xtb19.Enabled:=CheckBox9.Checked or CheckBox11.Checked;
     Xtb24.Enabled:=CheckBox9.Checked or CheckBox11.Checked;
    UpdatePeakEqulizer;
end;


procedure TFrm_Effects.ComboBox1Change(Sender: TObject);
begin
    if ComboBox1.ItemIndex=0 then
  setPreset(aFlanger);
  if ComboBox1.ItemIndex=1 then
  setPreset(aHighChorus);
  if ComboBox1.ItemIndex=2 then
  setPreset(aMotocycle);
  if ComboBox1.ItemIndex=3 then
  setPreset(aDevil);
    if ComboBox1.ItemIndex=4 then
  setPreset(aManyVoices);
  if ComboBox1.ItemIndex=5 then
  setPreset(aBackChipmunk);
  if ComboBox1.ItemIndex=6 then
  setPreset(aWater);
  if ComboBox1.ItemIndex=7 then
  setPreset(aAirPlane);
  SetChorusFlanger;

  end;

procedure TFrm_Effects.FormActivate(Sender: TObject);
begin

end;

procedure TFrm_Effects.FormShow(Sender: TObject);
var
  ind: integer;
begin
  //form_player.LangClick(self);
ind:= combobox1.ItemIndex;
  frm_Effects.ComboBox1.Items[0]:= FlChor0;
frm_Effects.ComboBox1.Items[1]:= FlChor1;
frm_Effects.ComboBox1.Items[2]:= FlChor2;
frm_Effects.ComboBox1.Items[3]:= FlChor3;
frm_Effects.ComboBox1.Items[4]:= FlChor4;
frm_Effects.ComboBox1.Items[5]:= FlChor5;
frm_Effects.ComboBox1.Items[6]:= FlChor6;
frm_Effects.ComboBox1.Items[7]:= FlChor7;
// combobox1.Text:=ComboBox1.Items[ind];
end;

procedure TFrm_Effects.PageControl1Change(Sender: TObject);
begin

end;

procedure TFrm_Effects.TabSheet10Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;

procedure TFrm_Effects.TabSheet1Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;

procedure TFrm_Effects.TabSheet2Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;

procedure TFrm_Effects.TabSheet3Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;

procedure TFrm_Effects.TabSheet4Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;

procedure TFrm_Effects.TabSheet5Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;

procedure TFrm_Effects.TabSheet6Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;

procedure TFrm_Effects.TabSheet7Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;




procedure TFrm_Effects.TabSheet7Show(Sender: TObject);
begin
    UpdatePeakEqulizer;
end;

procedure TFrm_Effects.TabSheet8ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TFrm_Effects.TabSheet8Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;

procedure TFrm_Effects.TabSheet9Exit(Sender: TObject);
begin
  
ActiveControl := nil;

end;









procedure TFrm_Effects.Timer1Timer(Sender: TObject);
begin
// Label6.Caption:=FloatToStrF(pR.fReverbMix,ffFixed,3,3)+' dB';;  pR.fReverbMix.ToString;
// Label4.Caption:=FloatToStrF(pR.fReverbTime,ffFixed,3,3)+' mS';;  pR.fReverbTime.ToString;
end;


procedure TFrm_Effects.XTB10Change(Sender: TObject);
begin
    UpdateCP;
end;

procedure TFrm_Effects.XTB10Enter(Sender: TObject);
begin
  Panel6.SetFocus;
end;


procedure TFrm_Effects.XTB12Change(Sender: TObject);
begin
      UpdateCP;
end;

procedure TFrm_Effects.XTB16Change(Sender: TObject);
begin
     if checkBox7.Checked then begin
   FXPitch:=XTB16.Position;
     label33.Caption:=FloatToStrF(FXPitch,ffFixed,0,0);
     BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO_PITCH, FXPitch);

     end;
end;



procedure TFrm_Effects.XTB18Change(Sender: TObject);
begin
  UpdatePeakEqulizer;
end;

procedure TFrm_Effects.XTB18Enter(Sender: TObject);
begin
 Panel8.SetFocus;
end;





procedure TFrm_Effects.XTB23Change(Sender: TObject);
begin
  UpdateStereoExpand;
end;

procedure TFrm_Effects.XTB23Enter(Sender: TObject);
begin
  Panel16.SetFocus;
end;



procedure TFrm_Effects.XTB25Change(Sender: TObject);
begin
  if (combobox1.ItemIndex=0) and (aFlanger[0]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=1) and (aHighChorus[0]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=2) and (aMotocycle[0]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=3) and (aDevil[0]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=4) and (aManyVoices[0]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=5) and (aBackChipmunk[0]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=6) and (aWater[0]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=7) and (aAirPlane[0]<>Xtb25.Position) then
combobox1.ItemIndex:=8;
  UpdateChorusFlanger;
end;

procedure TFrm_Effects.XTB25Enter(Sender: TObject);
begin
  Panel9.SetFocus;
end;

procedure TFrm_Effects.XTB26Change(Sender: TObject);
begin
 if (combobox1.ItemIndex=0) and (aFlanger[1]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=1) and (aHighChorus[1]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=2) and (aMotocycle[1]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=3) and (aDevil[1]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=4) and (aManyVoices[1]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=5) and (aBackChipmunk[1]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=6) and (aWater[1]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=7) and (aAirPlane[1]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
  UpdateChorusFlanger;
end;

procedure TFrm_Effects.XTB27Change(Sender: TObject);
begin
   if (combobox1.ItemIndex=0) and (aFlanger[3]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=1) and (aHighChorus[3]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=2) and (aMotocycle[3]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=3) and (aDevil[3]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=4) and (aManyVoices[3]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=5) and (aBackChipmunk[3]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=6) and (aWater[3]<>(sender as TTrackBar).Position)then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=7) and (aAirPlane[3]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
  UpdateChorusFlanger;
end;

procedure TFrm_Effects.XTB28Change(Sender: TObject);
begin
if (combobox1.ItemIndex=0) and (aFlanger[4]<> (sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=1) and (aHighChorus[4]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=2) and (aMotocycle[4]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=3) and (aDevil[4]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=4) and (aManyVoices[4]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=5) and (aBackChipmunk[4]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=6) and (aWater[4]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=7) and (aAirPlane[4]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
  UpdateChorusFlanger;
end;

procedure TFrm_Effects.XTB29Change(Sender: TObject);
begin
if (combobox1.ItemIndex=0) and (aFlanger[5]<> (sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=1) and (aHighChorus[5]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=2) and (aMotocycle[5]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=3) and (aDevil[5]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=4) and (aManyVoices[5]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=5) and (aBackChipmunk[5]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=6) and (aWater[5]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;
if (combobox1.ItemIndex=7) and (aAirPlane[5]<>(sender as TTrackBar).Position) then
combobox1.ItemIndex:=8;

  UpdateChorusFlanger;
end;




procedure TFrm_Effects.XTB15Change(Sender: TObject);
begin
   if checkBox6.Checked then begin
   FXTempo:=XTB15.Position;
     label32.Caption:=FloatToStrF(FXTempo,ffFixed,0,0)+'%';
     BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);

     end;
end;

procedure TFrm_Effects.XTB15Enter(Sender: TObject);
begin
  Panel7.SetFocus;
end;



end.
