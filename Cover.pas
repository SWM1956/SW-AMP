unit Cover;

{$mode objfpc}{$H+}

interface

uses
  Forms, SysUtils, Classes, Graphics, ExtCtrls, BGRAShape;

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
    PictName: string;
    function  TryLoadCoverFromTags(const FileName: string): Boolean;
    procedure ExtractAPIC(data: PByte; size: Cardinal);
    procedure ExtractVorbisCover(chan: LongWord);
    procedure ShowCoverStream(stream: TStream);
  public
    FCoverLoaded: Boolean;

  end;

var
  Cover_Form: TCover_Form;

implementation

uses
  sw_player, list, base64, lazdynamic_bass;

const
  BASS_TAG_FLAC_PICTURE = $12000; // з bassflac.h (Un4seen), відсутня в lazdynamic_bass

{$R *.lfm}

{ --- Допоміжні функції (як у fileinfo_frm.pas) --- }

function ReadBE32(P: PByte): Cardinal;
begin
  Result := (Cardinal(P[0]) shl 24) or (Cardinal(P[1]) shl 16)
          or (Cardinal(P[2]) shl 8)  or  Cardinal(P[3]);
end;

function SyncsafeToInt(P: PByte): Cardinal;
begin
  Result := (Cardinal(P[0]) shl 21) or (Cardinal(P[1]) shl 14)
          or (Cardinal(P[2]) shl 7)  or  Cardinal(P[3]);
end;

{ TCover_Form }

{ --- Показує обкладинку зі стріму --- }
procedure TCover_Form.ShowCoverStream(stream: TStream);
begin
  if FCoverLoaded then Exit;
  try
    Image1.Picture.LoadFromStream(stream);
    FCoverLoaded := True;
  except
    // невідомий формат — ігноруємо
  end;
end;

{ --- Витягує обкладинку з фрейму APIC (ID3v2) --- }
{ Структура APIC: encoding(1) + mime\0 + pictype(1) + desc\0 + imgdata }
procedure TCover_Form.ExtractAPIC(data: PByte; size: Cardinal);
var
  P:        PByte;
  MimeEnd:  PByte;
  ImgStart: PByte;
  ImgSize:  Cardinal;
  Stream:   TMemoryStream;
begin
  if FCoverLoaded then Exit;
  if size < 4 then Exit;

  P := data;
  Inc(P); // пропускаємо encoding

  // Знаходимо кінець MIME-рядка (null-terminated)
  MimeEnd := P;
  while (MimeEnd < data + size) and (MimeEnd^ <> 0) do Inc(MimeEnd);
  Inc(MimeEnd); // пропускаємо null

  Inc(MimeEnd); // пропускаємо pictype (1 байт)

  // Пропускаємо description (null-terminated)
  ImgStart := MimeEnd;
  while (ImgStart < data + size) and (ImgStart^ <> 0) do Inc(ImgStart);
  Inc(ImgStart); // пропускаємо null

  ImgSize := (data + size) - ImgStart;
  if ImgSize < 4 then Exit;

  Stream := TMemoryStream.Create;
  try
    Stream.WriteBuffer(ImgStart^, ImgSize);
    Stream.Position := 0;
    ShowCoverStream(Stream);
  finally
    Stream.Free;
  end;
end;

{ --- Обкладинка з Vorbis Comment (OGG/FLAC METADATA_BLOCK_PICTURE base64) --- }
procedure TCover_Form.ExtractVorbisCover(chan: LongWord);
var
  P:      PChar;
  TagStr: string;
  Key, B64: string;
  EqPos:  Integer;
  Decoded: string;
  Stream: TMemoryStream;
  P2:     PByte;
  MimeLen, DescLen, ImgLen: Cardinal;
begin
  if FCoverLoaded then Exit;

  P := BASS_ChannelGetTags(chan, BASS_TAG_OGG);
  if P = nil then Exit;

  while P^ <> #0 do
  begin
    TagStr := string(P);
    Inc(P, Length(TagStr) + 1);

    EqPos := Pos('=', TagStr);
    if EqPos = 0 then Continue;

    Key := UpperCase(Copy(TagStr, 1, EqPos - 1));
    if Key <> 'METADATA_BLOCK_PICTURE' then Continue;

    B64     := Copy(TagStr, EqPos + 1, MaxInt);
    Decoded := DecodeStringBase64(B64);
    if Length(Decoded) < 32 then Continue;

    // Структура: type(4) + mimelen(4) + mime + desclen(4) + desc +
    //            width(4) + height(4) + depth(4) + colors(4) + datalen(4) + data
    P2 := PByte(@Decoded[1]);
    Inc(P2, 4); // пропускаємо type
    MimeLen := ReadBE32(P2); Inc(P2, 4);
    Inc(P2, MimeLen);
    DescLen := ReadBE32(P2); Inc(P2, 4);
    Inc(P2, DescLen);
    Inc(P2, 16); // width + height + depth + colors
    ImgLen := ReadBE32(P2); Inc(P2, 4);
    if ImgLen = 0 then Continue;

    Stream := TMemoryStream.Create;
    try
      Stream.WriteBuffer(P2^, ImgLen);
      Stream.Position := 0;
      ShowCoverStream(Stream);
    finally
      Stream.Free;
    end;
    Break;
  end;
end;

{ --- Головна функція читання обкладинки з тегів --- }
function TCover_Form.TryLoadCoverFromTags(const FileName: string): Boolean;
var
  chan:      LongWord;
  P:         PByte;
  P2:        PByte;
  TotalSize: Cardinal;
  ID3Ver:    Byte;
  pHdr:      PByte;
  FrameID:   array[0..4] of Char;
  FrameSize: Cardinal;
  FrameData: PByte;
  MimeLen:   Cardinal;
  DescLen:   Cardinal;
  ImgLen:    Cardinal;
  Stream:    TMemoryStream;
begin
  Result := False;
  FCoverLoaded := False;

  if (FileName = '') or not FileExists(FileName) then Exit;

  chan := BASS_StreamCreateFile(False, PChar(FileName), QWORD(0), QWORD(0), BASS_STREAM_DECODE);
  // ДІАГНОСТИКА
  with TStringList.Create do
  try
    Add('chan=' + IntToStr(chan));
    Add('file=' + FileName);
    P := PByte(BASS_ChannelGetTags(chan, BASS_TAG_ID3V2));
    Add('ID3V2_tag=' + IntToStr(PtrUInt(P)));
    if P <> nil then
      Add('ID3_sig=' + Chr(P[0]) + Chr(P[1]) + Chr(P[2]));
    SaveToFile('/tmp/cover_debug.txt');
  finally
    Free;
  end;
  if chan = 0 then Exit;

  try
    // --- 1. ID3v2 (MP3, AAC тощо) ---
    P := PByte(BASS_ChannelGetTags(chan, BASS_TAG_ID3V2));
    if (P <> nil) and (P[0] = Ord('I')) and (P[1] = Ord('D')) and (P[2] = Ord('3')) then
    begin
      ID3Ver    := P[3];
      TotalSize := SyncsafeToInt(P + 6) + 10;
      pHdr      := P + 10;

      while pHdr < P + TotalSize - 10 do
      begin
        Move(pHdr^, FrameID[0], 4);
        FrameID[4] := #0;

        if FrameID[0] = #0 then Break;

        if ID3Ver >= 4 then
          FrameSize := SyncsafeToInt(pHdr + 4)
        else
          FrameSize := ReadBE32(pHdr + 4);

        FrameData := pHdr + 10;

        if FrameSize = 0 then begin Inc(pHdr, 10); Continue; end;

        if string(FrameID) = 'APIC' then
        begin
          ExtractAPIC(FrameData, FrameSize);
          if FCoverLoaded then Break;
        end;

        Inc(pHdr, 10 + FrameSize);
      end;
    end;

    // --- 2. FLAC вбудована картинка ---
    if not FCoverLoaded then
    begin
      P := PByte(BASS_ChannelGetTags(chan, BASS_TAG_FLAC_PICTURE));
      if P <> nil then
      begin
        P2 := P;
        Inc(P2, 4); // type
        MimeLen := ReadBE32(P2); Inc(P2, 4);
        Inc(P2, MimeLen);
        DescLen := ReadBE32(P2); Inc(P2, 4);
        Inc(P2, DescLen);
        Inc(P2, 16); // width + height + depth + colors
        ImgLen := ReadBE32(P2); Inc(P2, 4);
        if ImgLen > 0 then
        begin
          Stream := TMemoryStream.Create;
          try
            Stream.WriteBuffer(P2^, ImgLen);
            Stream.Position := 0;
            ShowCoverStream(Stream);
          finally
            Stream.Free;
          end;
        end;
      end;
    end;

    // --- 3. OGG/Opus METADATA_BLOCK_PICTURE ---
    if not FCoverLoaded then
      ExtractVorbisCover(chan);

  finally
    BASS_StreamFree(chan);
  end;

  Result := FCoverLoaded;
end;

// ---------------------------------------------------------------------------
// Timer — анімація зникнення
// ---------------------------------------------------------------------------
procedure TCover_Form.Timer1Timer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue - 1;
  if (Frm_List.Pict = PictName) and not (PictName = '' ) then
     AlphaBlendValue := AlphaBlendValue - 2;
  if AlphaBlendValue <= 250 then
    Timer1.Interval := 10;
  if AlphaBlendValue <= 80 then
  begin
    Timer1.Enabled  := False;
    Timer1.Interval := 1000;
    Frm_List.Top    := Top;
    PictName        := Frm_List.Pict;
    Frm_List.Show;
    Form_player.Show;
    Application.ProcessMessages;
    Cover_Form.Visible := False;
  end;
end;

// ---------------------------------------------------------------------------
// FormShow:
//   1. Обкладинка з тегів (BASS)
//   2. Файл зображення у теці (Frm_List.Pict)
//   3. Нічого не знайдено — форму не показувати
// ---------------------------------------------------------------------------
procedure TCover_Form.FormShow(Sender: TObject);
var
  AudioFile:   string;
  CoverLoaded: Boolean;
begin
  if not Form_player.Visible then Exit;

  Top  := Frm_List.Top;
  Left := Form_player.Left;

  Timer1.Enabled := False;
  CoverLoaded    := False;

  // Поточний аудіофайл — шлях у LB2
  AudioFile := '';
  if (Frm_List.LB1.ItemIndex >= 0) and
     (Frm_List.LB1.ItemIndex < Frm_List.LB2.Items.Count) then
    AudioFile := Frm_List.LB2.Items[Frm_List.LB1.ItemIndex];

  // Спроба 1: обкладинка з тегів
  if AudioFile <> '' then
    CoverLoaded := TryLoadCoverFromTags(AudioFile);

  // Спроба 2: файл зображення у теці
  if not CoverLoaded then
  begin
    if (Frm_List.Pict <> '') and FileExists(Frm_List.Pict) then
    begin
      try
        Image1.Picture.LoadFromFile(Frm_List.Pict);
        CoverLoaded := True;
      except
        CoverLoaded := False;
      end;
    end;
  end;

  // Нічого не знайдено — ховаємо форму
  if not CoverLoaded then
    begin
      Frm_List.Show;
      Cover_Form.Visible := False;
      Exit;
    end;

  Width           := Form_player.Width + 1;
  Height          := Trunc(444 * (Image1.Picture.Height / Image1.Picture.Width));
  AlphaBlendValue := 254;
  Timer1.Enabled  := True;
end;

procedure TCover_Form.Image1Click(Sender: TObject);
begin
  // Зарезервовано
end;

end.
