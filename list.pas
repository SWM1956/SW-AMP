unit list;

{$mode Delphi}

interface

uses
   Classes, LCLIntf, LCLType, StdCtrls, ExtCtrls, Forms, SysUtils, Controls,
  Dialogs,
  Types, lazdynamic_bass,
  BGRAShape, XMLPropStorage, ComCtrls;
type

  { TFrm_List }

  TFrm_List = class(TForm)
    BGRAShape11: TBGRAShape;
    BGRAShape14: TBGRAShape;
    LB4: TListBox;
    LB1: TListBox;
    LB2: TListBox;
    LB3: TListBox;

    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;

    XMLPropStorage1: TXMLPropStorage;
    Panel4: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GetFilesInDirs(Dir:string);
    function  GetBitrate(file_name:string):integer;
    procedure  GetStartT(ListIndex:integer);
    procedure  GetEndT(ListIndex:integer);
    procedure LB1DblClick(Sender: TObject);
    procedure LB1DrawItem(Control: TWinControl; Index: Integer; ARect: TRect);
    procedure LB1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
//    procedure LB1MouseMove(Sender: TObject; Y: Integer);
    procedure XMLPropStorage1RestoreProperties(Sender: TObject);
    procedure ListClear(Sender: TObject);
    function GetPictureFileName(path: string): String;
  private


  public
  Pict: string;
  end;

var
  Frm_List: TFrm_List;


implementation
uses sw_player, options1, effects, cover;
{$R *.lfm}

{ TFrm_List }
//var
 //sw_player.Tms, sw_player.Tmn:Int64;
// Форматирует секунды в строку времени для отображения трека

 function qbass_formattime(const Sec: Integer;
   const IsURL: boolean): string;
 (*******************************************
 * RESULT: " 99:99" | "999:99" * | " Radio" *
 *******************************************)
 const
   time = ' 00:00';
   radio = ' Radio';
   null = '      ';
 var
   H, M, S: Integer;
   Return: string;
 begin
   if Sec = -1 then
     Return := null
   else
     if Sec < 0 then
       Return := time
     else
       if IsURL then
         Return := radio
       else
         begin
           H := Sec div 3600;
           S := Sec mod 3600;
           M := S div 60;
           M := M + (H * 60);
           S := (S mod 60);
           if M > 99 then Return := Format('%3d:%2.2d', [M, S])
           else Return := Format('%2.2d:%2.2d', [M, S]);
         end;
   Result := Return;
 end;

// Получает начальную точку трека из списка временных меток
procedure TFrm_List.GetStartT(ListIndex:integer);
var
mm, ss : Word;
stime:string;
hr: integer;
begin
 //   result:=false;
  if (Length(Frm_List.LB3.Items[ListIndex])>0) then begin
             mm:=StrToInt(Copy(LB3.Items[ListIndex],0,2));
       //секунди
      ss:=StrToInt(Copy(LB3.Items[ListIndex],4,2));
  //час треку у секундах
       hr:=mm div 60;
       if mm > 60 then
         stime:=intToStr(hr)+':'+inttostr(mm-60)+':'+inttostr(ss)+'.'+Copy(LB3.Items[ListIndex],7,2)+'0'
       else
       stime:=intToStr(00)+':'+inttostr(mm)+':'+inttostr(ss)+'.'+Copy(LB3.Items[ListIndex],7,2)+'0';
        sw_player.Tms :=((mm*60)+ss);
        tmf:=StrToTime(stime);
 // result:=true;
  end;

end;

// Определяет конечную точку трека из списка временных меток
procedure TFrm_List.GetEndT(ListIndex: integer);
var
mm, ss : Word;
stime:string;
begin
  if (Length(LB3.Items[ListIndex])>0) then begin
      if (Frm_List.LB1.ItemIndex<Frm_List.LB1.Items.Count-1) and (Frm_List.LB2.Items[ListIndex]=Frm_List.LB2.Items[ListIndex+1]) then begin
      //хвилини
      mm:=StrToInt(Copy(LB3.Items[ListIndex+1],0,2));
      // секунди
      ss:=StrToInt(Copy(LB3.Items[ListIndex+1],4,2));
       // sw_player.Tmn:=((mm*60)+ss);
    //    form_player.Caption:=TimeToStr(sw_player.Tmfstart)+'---'+TimeToStr(sw_player.Tmfend);

       //  sw_player.Tmn:= BASS_ChannelSeconds2Bytes(Channel, sw_player.Tmfend)  ;
      end;
  end;

end;



Function TFrm_List.GetPictureFileName(path:string):String;
 var
 fs : TSearchRec;
 i:Integer;
 ext:array [0..1] of String = ('.jpg', '.png');
 begin
   Result:='';
  for i:=0 to 1 do begin
   if FindFirst(path+'*older*'+ext[i],faAnyFile-faDirectory, fs)=0 then
      Result:=path+fs.Name
   else
    if FindFirst(path+'*over*'+ext[i],faAnyFile-faDirectory, fs)=0 then
       Result:=path+fs.Name
   else
    if FindFirst(path+'*ront*'+ext[i],faAnyFile-faDirectory, fs)=0 then
       Result:=path+fs.Name
   else
    if FindFirst(path+'*ack*'+ext[i],faAnyFile-faDirectory, fs)=0 then
          Result:=path+fs.Name
          else

   if FindFirst(path+'/covers/'+'*older*'+ext[i],faAnyFile-faDirectory, fs)=0 then
      Result:=path+'/covers/'+fs.Name
   else
    if FindFirst(path+'/covers/'+'*over*'+ext[i],faAnyFile-faDirectory, fs)=0 then
       Result:=path+'/covers/'+fs.Name
   else
    if FindFirst(path+'/covers/'+'*ront*'+ext[i],faAnyFile-faDirectory, fs)=0 then
       Result:=path+'/covers/'+fs.Name
   else
    if FindFirst(path+'/covers/'+'*ack*'+ext[i],faAnyFile-faDirectory, fs)=0 then
          Result:=path+'/covers/'+fs.Name ;
   if result>'' then
     break;
  end;
   SysUtils.FindClose(fs);
  end;


procedure TFrm_List.LB1DblClick(Sender: TObject);
var
  mm, ss, mils : Word;
    en, i:integer;
  stime, s: string;
  endPos, pPos:Int64;
  ktime:Double;
  kk:Dword;
  isEnd:Bool = false;
  lng:Dword;
  begin
     Form_Player.Label2.Visible:= not isStream;
   //  sleep(100);
{    if isStream then
Frm_List.LB1.ItemHeight:=(Frm_List.LB1.Font.Size+0)
else
Frm_List.LB1.ItemHeight:=(Options_frm.UpDown1.Position-4+Options_frm.UpDown1.Position*2);
}//    options_frm.UpDown1Click(self);
    if isWrite then   begin
//    BASS_Encode_Stop(encoder);

 form_player.BGRAShape14Click(self);
    end;
if mode=paused then
  mode:=play;
form_player.scrollBar1.Enabled:=true;
    for i := 0 to LB1.Items.Count - 1 do
     if LB1.Selected[i] then begin
     Filename := LB2.Items.Strings[i];
   if Options_frm.ComboBox1.ItemIndex = 11 then
     psound:=Round(ATTRIB_FREQ)
  else
  psound:=StrToInt(Options_frm.ComboBox1.Items[Options_frm.ComboBox1.ItemIndex]);
  B_Init_Flags:=B_Init_Flags or BASS_DEVICE_REINIT;
       if not BASS_Init(1, psound, B_Init_Flags, Handle, nil) then
    begin
      MessageBox(0,'Ошибка инициализации аудио',nil,MB_ICONERROR);    end;
       BASS_SetConfig(BASS_CONFIG_CD_FREEOLD, 1);
  // send:=Sender.ToString;
       if form_player.Visible and not(mode=paused) then begin
       if (sender.ToString='TListBox')or (sender.ToString='TBGRAShape') then
       pict:=GetPictureFileName(ExtractFilePath(Filename));
if pict>'' then  begin
  //  Cover_Form.Image1.Picture.LoadFromFile(pict);
 //   sleep(100);
     Cover_Form.show;

    end;
end;
      // ext:=ext.ToUpper;
       if (Length(LB3.Items[i])>0) then begin
        isCue:=True;
        //хвилини
       mm:=StrToInt(Copy(LB3.Items[i],0,2));
       //секунди
      ss:=StrToInt(Copy(LB3.Items[i],4,2));
      mils:=StrToInt(Copy(LB3.Items[i],7,2));
      stime:='00:'+IntToStr(mm)+':'+IntToStr(ss)+'.'+ intToStr(mils) +'0';


  //час треку у секундах
       // sw_player.Tms :=Trunc(((mm*60)+ss)+(mils/1000));
            sw_player.Tms :=(mm*60)+ss;
   //  sw_player.Tms :=BASS_ChannelSeconds2Bytes(Channel, sw_player.TmfStart)  ;

      if (LB1.ItemIndex<LB1.Items.Count-1) and (LB2.Items[i]=LB2.Items[i+1]) then begin
      //хвилини
      mm:=StrToInt(Copy(LB3.Items[i+1],0,2));
      // секунди
      ss:=StrToInt(Copy(LB3.Items[i+1],4,2));
       mils:=StrToInt(Copy(LB3.Items[i],7,2));
      //  sw_player.Tmfend:=StrToTime(stime);
       // sw_player.Tmn:=Trunc(((mm*60)+ss)+(mils/1000));
       sw_player.Tmn:=Trunc(mm*60)+ss;
 //      sw_player.Tmn:= BASS_ChannelSeconds2Bytes(Channel, sw_player.Tmfend)  ;

      isEnd:=false;
      end else begin
 //en:=  BASS_ChannelGetLength(Channel, BASS_POS_BYTE);
 //   en:= sw_player.Tms+1000;
      sw_player.Tmn := sw_player.Tms;
      isEnd:=True;

      end;
//  if (not isend) then begin
 //mode:=stop;
init:=false;
    mode:=Play;
         if not Form_Player.player then exit;
 //   end;

  endPos:= BASS_ChannelGetLength(Channel, BASS_POS_BYTE);
//  endPos:= BASS_ChannelGetLength(channel);
ktime:= Trunc(BASS_ChannelBytes2Seconds(channel,BASS_ChannelGetLength(Channel, BASS_POS_BYTE)));
kk:=Trunc(ktime);


ktime:= endPos / kk;
pPos:=Trunc(ktime * (sw_player.Tms));


         if  sw_player.Tms>Form_Player.scrollBar1.Min then begin
  //        if  sw_player.Tmfstart>Form_Player.scrollBar1.Min then begin
        Form_Player.scrollBar1.Max:=sw_player.Tmn ;//Trunc(ktime * sw_player.Tmn) div 100;
      //   Form_Player.scrollBar1.Max:= BASS_ChannelSeconds2Bytes(Channel, sw_player.Tmfend)  ;
        Form_Player.scrollBar1.Min:=sw_player.Tms ;//pPos div 100;
       //   Form_Player.scrollBar1.Min:= BASS_ChannelSeconds2Bytes(Channel, sw_player.Tmfstart)  ;
       Form_Player.scrollBar1.Position:=Form_Player.scrollBar1.Min;
           lng := Trunc(BASS_ChannelBytes2Seconds(Channel, (Form_Player.scrollBar1.Max * 100)-(Form_Player.Scrollbar1.Min*100)));
         s:= qbass_formattime(lng,false);
         end;

 // Form_Player.scrollBar1.Position:=Form_Player.scrollBar1.Min;


pPos:= BASS_ChannelSeconds2Bytes(Channel, tms);
 CuePos:=pPos;
//Form_Player.Caption:=IntToStr(pPos)+'-'+IntToStr(Form_Player.scrollBar1.Position);
//BASS_ChannelSetPosition( Channel , pPos ,BASS_POS_BYTE);
 BASS_ChannelSetPosition( Channel , pPos ,BASS_POS_BYTE);
if isEnd then begin
sw_player.Tmn:=kk;

end;
         if isCue then Begin
         if  sw_player.Tms>Form_Player.scrollBar1.Min then begin
       Form_Player.scrollBar1.Max:=sw_player.Tmn ;//Trunc(ktime * sw_player.Tmn) div 100;
       Form_Player.scrollBar1.Min:=sw_player.Tms ;//pPos div 100;
  //   Form_Player.Caption:=IntToStr(Form_Player.scrollBar1.Min)+'-'+IntToStr(Form_Player.scrollBar1.Max);
      Form_Player.scrollBar1.Position:=Form_Player.scrollBar1.Min;
          lng := Trunc(BASS_ChannelBytes2Seconds(Channel, (Form_Player.scrollBar1.Max * 100)-(Form_Player.Scrollbar1.Min*100)));
        s:= qbass_formattime(lng,false);

 Form_Player.Label2.Caption:=s;
       end else   begin
         Form_Player.scrollBar1.Min:=sw_player.Tms;

             Form_Player.scrollBar1.Position:=Form_Player.scrollBar1.Min;
         Form_Player.scrollBar1.Max:=sw_player.Tmn;

       end;



       end ;
       end else begin

         isCue:=False;
              if not Form_Player.player then exit;

     Form_Player.scrollBar1.Min:=0;
       PosTime:=Form_Player.ScrollBar1.Position;

       end;

     end;
 lb4.ItemIndex:=lb1.ItemIndex;
 lb3.ItemIndex:=lb1.ItemIndex;
 lb2.ItemIndex:=Lb1.ItemIndex;

Frm_Effects.RunEffects();
Form_Player.Timer1.Enabled:=True;
Frm_List.XMLPropStorage1.Save;
Form_Player.MouseRefreshTimerTimer(Sender);
end;

procedure TFrm_List.LB1DrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect);

begin
with (Control as TListBox).Canvas do
DrawText(Handle, PChar(lb1.Items[index]), Length(lb1.Items[index]),
   ARect, DT_LEFT );

end;

procedure TFrm_List.LB1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  ix:integer;
begin
 ix := LB1.ItemAtPos(Point(X, Y), True);
 if ix>=0 then  begin
lb1.Hint:= LB2.Items[ix];
Application.HideHint; // Дуже важливо: ховаємо старий хінт
Application.ActivateHint(LB1.ClientToScreen(Point(X, Y)));
 end
 else
 Application.HideHint;
end;


procedure TFrm_List.XMLPropStorage1RestoreProperties(Sender: TObject);
var
  i:integer;
  change:boolean;
begin
 change:=false;
 { for i:=LB1.Count-1 downto 0 do begin
if (lb2.Items[i]='') or(not FileExists(lb2.Items[i])) then begin
lb4.Items.Delete(i);
lb3.Items.Delete(i);
lb2.Items.Delete(i);
lb1.Items.Delete(i);
change:=true;
end; }
{if not FileExists(lb2.Items[i]) then begin
  lb3.Items.Delete(i);
  lb2.Items.Delete(i);
  lb1.Items.Delete(i);
  change:=true;
  end;
  end;
  if change then
  XMLPropStorage1.Save;
 if lb1.Items.Count=0 then
   Form_Player.scrollBar1.Position:=0;

       if (Lb1.ItemIndex<0) and (LB1.Count>0) then
    Lb1.ItemIndex:=LB1.Tag;

       if lb1.Count>0 then
         if lb4.Count=0 then
  with LB1 do begin
    i:=Count-1;
    while i >= 0 do begin
      LB4.Items.Add('');
    i:=i-1;
  end;
   end;   }

  {       with LB1 do begin
    i:=Count-1;
    while i >= 0 do begin
      LB4.Items.Add('');
    i:=i-1;
  end;
   end;}



//      LB1.Tag:= lb1.Items.Count-1;
 if lb1.Items.Count=0 then
   Form_Player.scrollBar1.Position:=0;
       if (Lb1.ItemIndex<0) and (LB1.Count>0) and (lb1.Tag<=LB1.Count) then
    Lb1.ItemIndex:=LB1.Tag
    else
    Lb1.ItemIndex:=-1;
   StatusBar1.Panels.Items[0].Text:=XMLPropStorage1.FileName;

end;


// Возвращает битрейт указанного файла
function TFrm_List.GetBitrate(file_name: string): integer;
var
Bitrat:single;
chan:DWORD;
begin
//BASS_ChannelStop(Chan);
//BASS_MusicFree(Chan);
//BASS_StreamFree(Chan);
Chan := BASS_StreamCreateFile(FALSE, PChar(File_Name), 0, 0, 0);
Bitrat:=0;
if chan>0 then
if BASS_ChannelGetAttribute(Chan,  BASS_ATTRIB_BITRATE, Bitrat) then begin
 BASS_ChannelGetInfo(chan, bcinfo);
 //form_player.caption:=inttostr( bcinfo.origres);
BASS_ChannelGetAttribute(Chan,  BASS_ATTRIB_FREQ, ATTRIB_FREQ);

BASS_MusicFree(Chan);
BASS_StreamFree(Chan);
chan:=0;
result:= Trunc(Bitrat);
end
else
result:=0;

end;

Function FilterExt(val:String):bool;
begin
result:=false;
val:=   val.ToUpper;
     val:=ExtractFileExt(val);
if  (val = '.MP3') or (val = '.MPC') or (val = '.AC3') or (val = '.WAV') or (val = '.SPX') or (val = '.OPUS')
    or (val = '.WV') or (val = '.DSD') or (val = '.DSF') or (val = '.ALAC')
    or (val = '.MP4') or (val = '.M4A') or (val = '.M4B')  or (val = '.AIF')  or (val = '.IIF')
    or (val = '.AAC') or (val = '.APE') or (val = '.OGG') or (val = '.FLAC')  then
result := true;
end;

Function FilterExtPict(val:String):bool;
begin
result:=false;
val:=   val.ToUpper;
     val:=ExtractFileExt(val);
if  (val = 'COVER.JPG') or (val = 'COVER.TIFF') or (val = 'COVER.PNG') or
    (val = 'FOLDER.JPG') or (val = 'FOLDER.TIFF') or (val = 'FOLDER.PNG')then
result := true;
end;





{ var
  fullFileName : string;

begin
  // Установка полного имени файла с диском и путем
  fullFileName := 'C:\Program Files\Borland\Delphi7\Projects\Unit1.dcu';

  // Показ составляющих частей этого полного имени
  ShowMessage('Диск       = '+ExtractFileDrive (fullFileName));
  ShowMessage('Каталог    = '+ExtractFileDir   (fullFileName));
  ShowMessage('Путь       = '+ExtractFilePath  (fullFileName));
  ShowMessage('Имя        = '+ExtractFileName  (fullFileName));
  ShowMessage('Расширение = '+ExtractFileExt   (fullFileName));
end; }
var
CuePlayList:string;

procedure TFrm_List.FormDropFiles(Sender: TObject;
  const FileNames: array of string);
var
  LInd,Counter: Integer;
  fpath, s, index, track, title, af, perf, timepos: string;
  f: TextFile;
 btc,i, bitrat, ind:integer;
begin

for i:=0 to 10 do begin
lb1.Cursor:=crHourGlass;
sleep(3);
Application.ProcessMessages;
end;
lb1.Cursor:=crHourGlass;
Application.ProcessMessages;

Bitrate := 0;
       if LB2.Count=0 then
     ind:=0
     else
     if Lb2.Count>0 then
     ind:=Lb2.Count-1;
       lInd:=High(FileNames);
  for Counter := 0 to LInd do
  begin

    if DirectoryExists(FileNames[Counter]) then
    GetFilesInDirs(FileNames[Counter])
    else
    begin
      if SameText(ExtractFileExt(FileNames[Counter]), '.cue') then begin
      track:='';
        isCue := True;
        AssignFile(f, FileNames[Counter]);
        Reset(f);

        while not EOF(f) do
        begin
          Form_player.Repaint;
          ReadLn(f, s);
          SetCodePage ( RawByteString ( s ) ,  1251 ,  false ) ;
          s := Trim(s);
          if s.StartsWith('FILE') then  begin
            af:=ExtractFileName(Copy(s, Pos('"', s) + 1, Pos('" ',s)-Pos('"', s) - 1));
            fpath:=ExtractFilePath(FileNames[Counter]);
            bitrat:=(GetBitrate(ExtractFilePath(FileNames[Counter]) + af));
          end;
         // else if s.StartsWith('TRACK') then
         if s.StartsWith('TRACK') then
            track := Trim(Copy(s, Pos('TRACK', s) + 5, 3)) ;
          //else if s.StartsWith('TITLE') then
          if not (track='') then begin
         if s.StartsWith('TITLE') then
         title := Trim(Copy(s, Pos('"', s) + 1, Length(s) - Pos('"', s) - 1)) ;
          if (s.StartsWith('INDEX 01')) then
          index:=s;
          end;
          if s.StartsWith('PERFORMER') then
            perf := Trim(Copy(s, Pos('"', s) + 1, Length(s) - Pos('"', s) - 1));
             //  else

            if (not(index='') and (not(title='')) and (not(track='')) )  then

          begin

         //   timepos := Copy(s, Pos(':', s) - 2, 8);
                     timepos := Copy(index, Pos(':', index) - 2, 8);

     if bcinfo.origres=0 then
     btc:=16
     else
     btc:= bcinfo.origres;
            LB1.Items.Add(Format('%.3d - %s.%s - %s', [LB1.Count + 1, track, perf, title])+#13#9#9+'('+IntToStr(bitrat)+'kbps '+' '+ IntToStr(trunc(ATTRIB_FREQ))+' '+ IntToStr(btc)+'bit'+')');
       //   lb1.ItemHeight:=30;
    //        lb1.Items.;
     LB2.Items.Add(fpath + af);
            LB3.Items.Add(timepos);
            lb4.Items.Add('');
            title:='';
            track:='';
             index:='';
          end;
        end;
        CloseFile(f);

        if autoStart then begin
         lb1.ItemIndex:=0;
        if ind>0 then
        lb1.ItemIndex:=ind+1;
         Form_Player.ScrollBar1.Position:=0;

Form_Player.ScrollBar1.Min:=0;

        end;

      end
      else
if     Counter <= LInd then
      if (FilterExt(FileNames[Counter]))  then
      begin
      bitrat:=GetBitrate(FileNames[Counter]);
        isCue := False;
        LB3.Items.Add('');
        lb4.Items.Add('');
        LB2.Items.Add(FileNames[Counter]);
  //      BASS_ChannelGetAttribute(Channel,  BASS_ATTRIB_FREQ, ATTRIB_FREQ);
    if bcinfo.origres=0 then
     btc:=16
     else
     btc:= bcinfo.origres;
        LB1.Items.Add(Format('%.3d - %s.', [LB1.Count + 1, ExtractFileName(FileNames[Counter])])+#13#9#9'('+IntToStr(Bitrat)+'kbps'+' '+ intTostr(trunc(ATTRIB_FREQ))+' '+ IntToStr(btc)+'bit)');
        if Counter = 0 then
          init := False;

      end;

    end;

  end;
                   if autoStart then
        begin

          if ind>0 then
           lb1.ItemIndex:=ind+1
           else
           lb1.ItemIndex:=0;

    Form_Player.BGRAShape2Click(self);
         Form_Player.ScrollBar1.Min:=0;

        mode := stop;

        if not Form_player.player then exit;
                 Form_Player.timer1.Enabled:=true;
          mode := play;

             if not Form_Player.player then exit;
        end;
              Frm_Effects.RunEffects() ;
        //           form_player.timer4.Enabled:=true;
  Bitrate := 0;
 lb4.ItemIndex:=lb1.ItemIndex;
  lb3.ItemIndex:=lb1.ItemIndex;
  lb2.ItemIndex:=Lb1.ItemIndex;
 Form_Player.XMLPropStorage1.Save;
  Options_frm.XMLPropStorage1.Save;
  Frm_Effects.XMLPropStorage1.Save;
  XMLPropStorage1.Save;
 lb1.Cursor:=crDefault;
 Application.ProcessMessages;
end;

procedure TFrm_List.FormHide(Sender: TObject);
begin

end;

procedure TFrm_List.ListClear(Sender: TObject);
var
i:integer;
begin
 form_player.BGRAShape2Click(self);
// form_player.player;
  with LB4 do begin
    i:=Count-1;
    while i >= 0 do begin
  lb4.Items.Delete(i);
  LB3.Items.Delete(i);
  LB2.Items.Delete(i);
  LB1.Items.Delete(i);
    i:=i-1;
  end;
   end;
  {
    with LB3 do begin
    i:=Count-1;
    while i >= 0 do begin
  Items.Delete(i);
    i:=i-1;
  end;
   end;
        with LB2 do begin
    i:=Count-1;
    while i >= 0 do begin
  Items.Delete(i);
    i:=i-1;
  end;
   end;
            with LB1 do begin
    i:=Count-1;
    while i >= 0 do begin
  Items.Delete(i);
    i:=i-1;
  end;
   end;  }
 //  LB2.Tag:=Frm_List.LB2.Tag+1;
// lb1.ItemIndex:=-1;
//    lb3.ItemIndex:=lb1.ItemIndex;
//    lb4.ItemIndex:=lb1.ItemIndex;
// lb2.ItemIndex:=Lb1.ItemIndex;
//  form_player.BGRAShape2Click(self);
if isStream then
isStream:=not isStream;
Frm_List.Caption:='';
    XMLPropStorage1.Save;
end;


procedure TFrm_List.FormShow(Sender: TObject);
begin
  if Caption='' then
  Caption:=PlayList;
  if Frm_List.LB1.Count>0 then
  if copy(Frm_List.LB2.Items[0],0,4)='http' then
  isStream:= true
  else
isStream:= false;

if isStream then
Frm_List.LB1.ItemHeight:=(Frm_List.LB1.Font.Size+0)
else
Frm_List.LB1.ItemHeight:=(Options_frm.UpDown1.Position-4+Options_frm.UpDown1.Position*2);
options_frm.UpDown1Click(self);
 // Frm_List.LB1.Font.Size:=Options_Frm.UpDown1.Position;
end;








procedure TFrm_List.FormClose(Sender: TObject);
begin
  lb4.ItemIndex:=lb1.ItemIndex;
   lb3.ItemIndex:=lb1.ItemIndex;
 lb2.ItemIndex:=Lb1.ItemIndex;
  Frm_List.XMLPropStorage1.Save;
//  Frm_List.XMLPropStorage1.Save;
  Form_player.HideListClick(self);
end;

procedure TFrm_List.FormCreate(Sender: TObject);
begin
  frm_List.Top:=form_player.top+form_player.panel5.Height+form_player.panel2.Height;
end;



var
paramrun:bool = true;

procedure TFrm_List.FormActivate(Sender: TObject);
begin
 ShowScrollBar(LB1.Handle, SB_HORZ, True);
 if (ParamCount=1) and paramrun then begin
      form_player.Timer3.Enabled:=false;
      if mode=play then
     mode:=stop;
  Filename:= paramstr(1);
Frm_list.FormDropFiles(Self,paramstr(1));
ListBox1ItemIndex:=Lb1.Count-1;
paramrun:=false;
end ;
// LB1.ItemHeight:=Options_Frm.UpDown1.Position-4+Options_Frm.UpDown1.Position*2;
end;


procedure TFrm_List.GetFilesInDirs(Dir:string);
var DirInfo:TSearchRec;
s,fl:string;
btc:integer;
begin
  CuePlayList:='';
  Form_Player.timer1.Enabled:=false;
Form_Player.ScrollBar1.Min:=0;
    Form_Player.ScrollBar1.Position:=0;
  if FindFirst(Dir+DirectorySeparator+'*', faAnyFile and faDirectory, DirInfo)=0 then
    repeat
      if (DirInfo.Attr and faDirectory) = faDirectory then // it's a dir - go get files in dir
        begin
          if (DirInfo.Name<>'.') and (DirInfo.Name<>'..') then
            GetFilesInDirs(Dir+DirectorySeparator+DirInfo.Name);
        end
      else begin
       s:=copy(DirInfo.Name ,  Length(DirInfo.Name)-3, 4);
      if SameText(s , '.CUE') then begin

      CuePlayList:= copy( DirInfo.Name, 1, Length(DirInfo.Name)-4);
          fl:=Dir+DirectorySeparator+DirInfo.Name;
      FormDropFiles(self, fl);
      end
      else
      if  FilterExt(DirInfo.Name)  then  begin
      s:= copy( DirInfo.Name, 1, Length(DirInfo.Name)-5);
      if (CuePlayList<> s) then begin
     LB2.Items.Add(Dir+DirectorySeparator+DirInfo.Name);
     if bcinfo.origres=0 then
     btc:=16
     else
     btc:= bcinfo.origres;
     LB1.Items.Add(Format('%.3d - %s', [Lb2.Items.Count , DirInfo.Name]) +#13#9#9+'('+ IntToStr(GetBitrate(Dir+DirectorySeparator+DirInfo.Name))+'kbps ' + IntToStr(trunc(ATTRIB_FREQ))+' '+ IntToStr(btc)+'bit)');
      LB3.Items.Add('');
    LB4.Items.Add('');
     end;




      end;

 end;


        until FindNext(DirInfo)<>0;
//
   FindClose(DirInfo);
//LB1.Cursor:=crDefault;
//LB1.Refresh;
end;



{ TFrm_List }


end.

