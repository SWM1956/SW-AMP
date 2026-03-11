unit fileinfo_frm;

{ Форма перегляду інформації про аудіофайл.
  Теги читаються через BASS (вже є в проекті, без зайвих залежностей).
  Підтримка форматів:
    MP3  — ID3v1, ID3v2 (теги + обкладинка APIC)
    FLAC/OGG — Vorbis Comment (+ обкладинка METADATA_BLOCK_PICTURE)
    AAC/M4A  — MP4 atoms
    WavPack/MPC/APE — APEv2
    WMA  — Windows Media tags }

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type

  { TFileInfoForm }

  TFileInfoForm = class(TForm)
  private
    // Компоненти створюються програмно в BuildUI
    PageControl1:  TPageControl;
    TabTags:       TTabSheet;
    TabTech:       TTabSheet;
    TabFile:       TTabSheet;
    TabCover:      TTabSheet;
    EdTitle:       TEdit;
    EdArtist:      TEdit;
    EdAlbum:       TEdit;
    EdYear:        TEdit;
    EdGenre:       TEdit;
    EdTrack:       TEdit;
    EdComment:     TEdit;
    LblBitrateVal:    TLabel;
    LblSampleRateVal: TLabel;
    LblChannelsVal:   TLabel;
    LblDurationVal:   TLabel;
    LblFormatVal:     TLabel;
    LblFileNameVal:   TLabel;
    LblFileSizeVal:   TLabel;
    LblModifiedVal:   TLabel;
    ImgCover:      TImage;
    LblNoCover:    TLabel;
    BtnClose:      TButton;
    // Лейбли-підписи для оновлення при зміні мови
    LblCapTitle:    TLabel;
    LblCapArtist:   TLabel;
    LblCapAlbum:    TLabel;
    LblCapYear:     TLabel;
    LblCapGenre:    TLabel;
    LblCapTrack:    TLabel;
    LblCapComment:  TLabel;
    LblCapFormat:   TLabel;
    LblCapBitrate:  TLabel;
    LblCapSRate:    TLabel;
    LblCapChannels: TLabel;
    LblCapDuration: TLabel;
    LblCapFileName: TLabel;
    LblCapFileSize: TLabel;
    LblCapModified: TLabel;
    procedure BuildUI;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    // Читання тегів
    procedure ReadID3v1(chan: DWORD);
    procedure ReadID3v2(chan: DWORD);
    procedure ReadVorbisComment(chan: DWORD);
    procedure ReadAPEv2(chan: DWORD);
    procedure ReadMP4(chan: DWORD);
    procedure ReadWMA(chan: DWORD);
    // Обкладинка
    procedure ExtractAPIC(data: PByte; size: Cardinal);
    procedure ExtractVorbisCover(chan: DWORD);
    procedure ShowCover(stream: TStream);
    procedure ClearFields;
  public
    constructor Create(AOwner: TComponent); override;
    procedure LoadInfo(const FileName: string);
    procedure UpdateLanguage;
  end;

var
  FileInfoForm: TFileInfoForm;

implementation

uses
  lazdynamic_bass, LCLIntf, Math, base64, swamp_strings, LConvEncoding;
const
  // BASS_ChannelGetTags constants
  BASS_TAG_ID3    = 0;
  BASS_TAG_ID3V2  = 1;
  BASS_TAG_OGG    = 2;
  BASS_TAG_APE    = 5;
  BASS_TAG_MP4    = 7;
  BASS_TAG_WMA    = 8;

  // BASS_ChannelGetInfo ctype
  BASS_CTYPE_STREAM_MP3  = $10005;
  BASS_CTYPE_STREAM_OGG  = $10002;
  BASS_CTYPE_STREAM_FLAC = $10900;
  BASS_CTYPE_STREAM_WAV  = $50001;
  BASS_CTYPE_STREAM_AIFF = $50002;
  BASS_CTYPE_STREAM_MP4  = $10B01;
  BASS_CTYPE_STREAM_WMA  = $10300;
  BASS_CTYPE_STREAM_APE  = $10700;
  BASS_CTYPE_STREAM_MPC  = $10A00;
  BASS_CTYPE_STREAM_WV   = $10500;
  BASS_CTYPE_STREAM_AC3  = $11000;

// ---- Допоміжні функції ----

function FormatDuration(Secs: Integer): string;
var H, M, S: Integer;
begin
  H := Secs div 3600;
  M := (Secs mod 3600) div 60;
  S := Secs mod 60;
  if H > 0 then Result := Format('%d:%2.2d:%2.2d', [H, M, S])
  else           Result := Format('%2.2d:%2.2d', [M, S]);
end;

function FormatFileSize(Bytes: Int64): string;
begin
  if      Bytes >= 1024*1024*1024 then Result := Format('%.2f GB', [Bytes / (1024*1024*1024)])
  else if Bytes >= 1024*1024      then Result := Format('%.2f MB', [Bytes / (1024*1024)])
  else if Bytes >= 1024           then Result := Format('%.1f KB', [Bytes / 1024])
  else                                 Result := Format('%d B', [Bytes]);
end;

// Читає null-terminated рядок з довільного вказівника
function PCharToStr(P: PChar): string;
begin
  if P = nil then Result := ''
  else Result := string(P);
end;

// Зчитує наступний рядок з масиву рядків розділених #0
// Повертає True і просуває вказівник якщо рядок непорожній
function NextTag(var P: PChar): string;
begin
  Result := '';
  if (P = nil) or (P^ = #0) then Exit;
  Result := string(P);
  Inc(P, Length(Result) + 1);
end;

// Читає 32-bit big-endian з буфера
function ReadBE32(P: PByte): Cardinal;
begin
  Result := (Cardinal(P[0]) shl 24) or (Cardinal(P[1]) shl 16)
          or (Cardinal(P[2]) shl 8)  or  Cardinal(P[3]);
end;

// Читає 32-bit little-endian
function ReadLE32(P: PByte): Cardinal;
begin
  Result := Cardinal(P[0]) or (Cardinal(P[1]) shl 8)
          or (Cardinal(P[2]) shl 16) or (Cardinal(P[3]) shl 24);
end;

// Декодує ID3v2 syncsafe integer (7 біт на байт)
function SyncsafeToInt(P: PByte): Cardinal;
begin
  Result := (Cardinal(P[0]) shl 21) or (Cardinal(P[1]) shl 14)
          or (Cardinal(P[2]) shl 7)  or  Cardinal(P[3]);
end;

// Розшифровує рядок ID3v2 з урахуванням кодування
// encoding: 0=Latin1, 1=UTF-16, 2=UTF-16BE, 3=UTF-8
function DecodeID3String(encoding: Byte; P: PByte; Len: Integer): string;
var
  WS: WideString;
  i:  Integer;
begin
  Result := '';
  if Len <= 0 then Exit;
  case encoding of
    0, 3: // Latin-1 або UTF-8
      begin
        SetLength(Result, Len);
        Move(P^, Result[1], Len);
        // Прибираємо null-термінатор якщо є
        i := Pos(#0, Result);
        if i > 0 then SetLength(Result, i - 1);
      end;
    1, 2: // UTF-16 LE або BE з BOM
      begin
        // Пропускаємо BOM якщо є (FF FE або FE FF)
        if (Len >= 2) and ((P[0] = $FF) and (P[1] = $FE)) then
        begin Inc(P, 2); Dec(Len, 2); end
        else if (Len >= 2) and ((P[0] = $FE) and (P[1] = $FF)) then
        begin Inc(P, 2); Dec(Len, 2); end;
        SetLength(WS, Len div 2);
        Move(P^, WS[1], Len div 2 * 2);
        Result := UTF8Encode(WS);
        i := Pos(#0, Result);
        if i > 0 then SetLength(Result, i - 1);
      end;
  end;
end;

{ TFileInfoForm }

constructor TFileInfoForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BuildUI;
  KeyPreview := True;
  OnKeyPress := @FormKeyPress;
end;

procedure TFileInfoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure TFileInfoForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFileInfoForm.ClearFields;
begin
  EdTitle.Text   := '';
  EdArtist.Text  := '';
  EdAlbum.Text   := '';
  EdYear.Text    := '';
  EdGenre.Text   := '';
  EdTrack.Text   := '';
  EdComment.Text := '';
  LblBitrateVal.Caption    := '';
  LblSampleRateVal.Caption := '';
  LblChannelsVal.Caption   := '';
  LblDurationVal.Caption   := '';
  LblFormatVal.Caption     := '';
  LblFileNameVal.Caption   := '';
  LblFileSizeVal.Caption   := '';
  LblModifiedVal.Caption   := '';
  ImgCover.Picture.Assign(nil);
  ImgCover.Visible   := False;
  LblNoCover.Visible := True;
end;

// Встановлює поле лише якщо воно ще порожнє (пріоритет: ID3v2 > OGG > ID3v1)
procedure SetIfEmpty(Ed: TEdit; const Value: string);
begin
  if (Ed.Text = '') and (Value <> '') then
    Ed.Text := Value;
end;

{ --- Читання ID3v1 --- }
procedure TFileInfoForm.ReadID3v1(chan: DWORD);
var
  P:    PChar;
  // ID3v1 має фіксовану структуру: 30+30+30+4+30+1 = 125 байт після "TAG"
  Title, Artist, Album, Year, Comment, Genre: string;
  GenreIdx: Byte;
  // Стандартний список жанрів ID3v1
  Genres: array[0..191] of string = (
    'Blues','Classic Rock','Country','Dance','Disco','Funk','Grunge',
    'Hip-Hop','Jazz','Metal','New Age','Oldies','Other','Pop','R&B',
    'Rap','Reggae','Rock','Techno','Industrial','Alternative','Ska',
    'Death Metal','Pranks','Soundtrack','Euro-Techno','Ambient',
    'Trip-Hop','Vocal','Jazz+Funk','Fusion','Trance','Classical',
    'Instrumental','Acid','House','Game','Sound Clip','Gospel','Noise',
    'AlternRock','Bass','Soul','Punk','Space','Meditative',
    'Instrumental Pop','Instrumental Rock','Ethnic','Gothic','Darkwave',
    'Techno-Industrial','Electronic','Pop-Folk','Eurodance','Dream',
    'Southern Rock','Comedy','Cult','Gangsta','Top 40','Christian Rap',
    'Pop/Funk','Jungle','Native American','Cabaret','New Wave',
    'Psychedelic','Rave','Showtunes','Trailer','Lo-Fi','Tribal',
    'Acid Punk','Acid Jazz','Polka','Retro','Musical','Rock & Roll',
    'Hard Rock','Folk','Folk-Rock','National Folk','Swing','Fast Fusion',
    'Bebob','Latin','Revival','Celtic','Bluegrass','Avantgarde',
    'Gothic Rock','Progressive Rock','Psychedelic Rock','Symphonic Rock',
    'Slow Rock','Big Band','Chorus','Easy Listening','Acoustic','Humour',
    'Speech','Chanson','Opera','Chamber Music','Sonata','Symphony',
    'Booty Bass','Primus','Porn Groove','Satire','Slow Jam','Club',
    'Tango','Samba','Folklore','Ballad','Power Ballad','Rhythmic Soul',
    'Freestyle','Duet','Punk Rock','Drum Solo','A Cappella','Euro-House',
    'Dance Hall','Goa','Drum & Bass','Club-House','Hardcore','Terror',
    'Indie','BritPop','Negerpunk','Polsk Punk','Beat',
    'Christian Gangsta Rap','Heavy Metal','Black Metal','Crossover',
    'Contemporary Christian','Christian Rock','Merengue','Salsa',
    'Thrash Metal','Anime','JPop','Synthpop','Abstract','Art Rock',
    'Baroque','Bhangra','Big Beat','Breakbeat','Chillout','Downtempo',
    'Dub','EBM','Eclectic','Electro','Electroclash','Emo','Experimental',
    'Garage','Global','IDM','Illbient','Industro-Goth','Jam Band',
    'Krautrock','Leftfield','Lounge','Math Rock','New Romantic',
    'Nu-Breakz','Post-Punk','Post-Rock','Psytrance','Shoegaze',
    'Space Rock','Trop Rock','World Music','Neoclassical','Audiobook',
    'Audio Theatre','Neue Deutsche Welle','Podcast','Indie Rock',
    'G-Funk','Dubstep','Garage Rock','Psybient');
begin
  P := BASS_ChannelGetTags(chan, BASS_TAG_ID3);
  if P = nil then Exit;
  // BASS повертає ID3v1 блок разом з заголовком 'TAG' (3 байти) — пропускаємо
  if (P[0] = 'T') and (P[1] = 'A') and (P[2] = 'G') then Inc(P, 3);

  // ID3v1 блок: [title:30][artist:30][album:30][year:4][comment:30][genre:1]
  SetLength(Title,   30); Move(P^,        Title[1],   30); Inc(P, 30);
  SetLength(Artist,  30); Move(P^,        Artist[1],  30); Inc(P, 30);
  SetLength(Album,   30); Move(P^,        Album[1],   30); Inc(P, 30);
  SetLength(Year,     4); Move(P^,        Year[1],     4); Inc(P,  4);
  SetLength(Comment, 30); Move(P^,        Comment[1], 30); Inc(P, 30);
  GenreIdx := Byte(P^);

  // Прибираємо null-символи
  Title   := CP1251ToUTF8(Trim(Copy(Title,   1, Pos(#0, Title   + #0) - 1)));
  Artist  := CP1251ToUTF8(Trim(Copy(Artist,  1, Pos(#0, Artist  + #0) - 1)));
  Album   := CP1251ToUTF8(Trim(Copy(Album,   1, Pos(#0, Album   + #0) - 1)));
  Year    := Trim(Copy(Year,    1, Pos(#0, Year    + #0) - 1));
  Comment := CP1251ToUTF8(Trim(Copy(Comment, 1, Pos(#0, Comment + #0) - 1)));

  if GenreIdx < Length(Genres) then Genre := Genres[GenreIdx]
  else Genre := '';

  SetIfEmpty(EdTitle,   Title);
  SetIfEmpty(EdArtist,  Artist);
  SetIfEmpty(EdAlbum,   Album);
  SetIfEmpty(EdYear,    Year);
  SetIfEmpty(EdComment, Comment);
  SetIfEmpty(EdGenre,   Genre);
end;

{ --- Читання ID3v2 з парсингом фреймів --- }
procedure TFileInfoForm.ReadID3v2(chan: DWORD);
var
  RawData:   PByte;
  P:         PByte;
  TotalSize: Cardinal;
  // Фрейм
  FrameID:   array[0..4] of Char;
  FrameSize: Cardinal;
  FrameFlags: Word;
  FrameData: PByte;
  Encoding:  Byte;
  Value:     string;
  ID3Ver:    Byte;
  // COMM фрейм
  DescStart: PByte;
  DescEnd:   PByte;
  TextLen:   Integer;
begin
  RawData := PByte(BASS_ChannelGetTags(chan, BASS_TAG_ID3V2));
  if RawData = nil then Exit;

  // Заголовок ID3v2: "ID3" + версія(2) + прапори(1) + розмір(4 syncsafe)
  if (RawData[0] <> Ord('I')) or (RawData[1] <> Ord('D')) or
     (RawData[2] <> Ord('3')) then Exit;

  ID3Ver    := RawData[3];  // 3 = ID3v2.3, 4 = ID3v2.4
  TotalSize := SyncsafeToInt(RawData + 6) + 10;  // +10 за заголовок

  P := RawData + 10;  // Переходимо до першого фрейму

  while P < RawData + TotalSize - 10 do
  begin
    // ID фрейму: 4 символи (ID3v2.3/2.4)
    Move(P^, FrameID[0], 4);
    FrameID[4] := #0;

    // Кінець фреймів — нульові байти (padding)
    if FrameID[0] = #0 then Break;

    // Розмір фрейму
    if ID3Ver >= 4 then
    begin
      FrameSize := SyncsafeToInt(P + 4);
      // Деякі encoder'и (напр. старі FFmpeg) пишуть ID3v2.4 header,
      // але використовують звичайний BE32 для розмірів фреймів.
      // Якщо syncsafe-розмір виходить за межі тегу — пробуємо BE32.
      if (FrameSize > TotalSize) or (P + 10 + FrameSize > RawData + TotalSize) then
        FrameSize := ReadBE32(P + 4);
    end
    else
      FrameSize := ReadBE32(P + 4);

    FrameFlags := (Word(P[8]) shl 8) or P[9];
    FrameData  := P + 10;

    if FrameSize = 0 then begin Inc(P, 10); Continue; end;
    // Захист від виходу за межі: якщо фрейм більший за теги — зупиняємось
    if P + 10 + FrameSize > RawData + TotalSize then Break;

    // Текстові фрейми починаються з 'T'
    if FrameID[0] = 'T' then
    begin
      Encoding := FrameData[0];
      Value    := DecodeID3String(Encoding, FrameData + 1, FrameSize - 1);
      Value    := Trim(Value);

      if      string(FrameID) = 'TIT2' then SetIfEmpty(EdTitle,   Value)
      else if string(FrameID) = 'TPE1' then SetIfEmpty(EdArtist,  Value)
      else if string(FrameID) = 'TALB' then SetIfEmpty(EdAlbum,   Value)
      else if string(FrameID) = 'TDRC' then SetIfEmpty(EdYear,    Copy(Value, 1, 4))
      else if string(FrameID) = 'TYER' then SetIfEmpty(EdYear,    Copy(Value, 1, 4))
      else if string(FrameID) = 'TCON' then
      begin
        // Жанр може бути як числом в дужках: "(17)" або текстом
        if (Length(Value) > 2) and (Value[1] = '(') then
          Value := Copy(Value, 2, Pos(')', Value) - 2);
        SetIfEmpty(EdGenre, Value);
      end
      else if string(FrameID) = 'TRCK' then SetIfEmpty(EdTrack,   Value);
    end
    // Коментар COMM: encoding(1) + lang(3) + short_desc + #0 + text
    // Деякі encoder'и (напр. YouTube/mutagen) пишуть COMM без short_desc і #0:
    //   [enc:1][lang:3][text без термінатора перед ним]
    // Тому шукаємо #0 між FrameData+4 і кінцем фрейму.
    // Якщо #0 є — все після нього є text; якщо нема — FrameData+4 вже є text.
    else if string(FrameID) = 'COMM' then
    begin
      if FrameSize > 4 then
      begin
        Encoding  := FrameData[0];
         // Пропускаємо: encoding(1) + lang(3) = 4 байти
        DescEnd := FrameData + 4;
        // Шукаємо кінець short description з урахуванням кодування
        // UTF-16 (encoding 1,2): нульовий термінатор — два байти   
        // Latin1/UTF-8 (encoding 0,3): нульовий термінатор — один байт  
        if Encoding in [1, 2] then
        begin
          // UTF-16: шукаємо подвійний нуль #0#0
          while (DescEnd + 1 < FrameData + FrameSize) and
                not ((DescEnd^ = 0) and ((DescEnd+1)^ = 0)) do
            Inc(DescEnd, 2);
          // Пропускаємо #0#0 тільки якщо знайшли (не досягли кінця)
          if (DescEnd + 1 < FrameData + FrameSize) then
            Inc(DescEnd, 2);
        end
        else
        begin
          // Latin1/UTF-8: шукаємо #0
          // Зберігаємо стартову позицію — якщо #0 не знайдено,
          // повертаємось сюди (encoder не записав short_desc)
          DescStart := DescEnd;
          while (DescEnd < FrameData + FrameSize) and (DescEnd^ <> 0) do
            Inc(DescEnd);
          if DescEnd < FrameData + FrameSize then
            Inc(DescEnd)  // знайшли #0 — пропускаємо
          else
            DescEnd := DescStart; // #0 не знайдено — текст з FrameData+4
        end;
        TextLen := (FrameData + FrameSize) - DescEnd;
        // Обрізаємо trailing null-байти (деякі encoder'и додають padding в кінці)
        // Для UTF-16 нуль-термінатор — 2 байти, для Latin1/UTF-8 — 1 байт
        if Encoding in [1, 2] then
        begin
          while (TextLen >= 2) and (DescEnd[TextLen-2] = 0) and (DescEnd[TextLen-1] = 0) do
            Dec(TextLen, 2);
        end
        else
        begin
          while (TextLen > 0) and (DescEnd[TextLen-1] = 0) do
            Dec(TextLen);
        end;
        if TextLen > 0 then
          SetIfEmpty(EdComment, DecodeID3String(Encoding, DescEnd, TextLen));
      end;
    end
    // Обкладинка APIC
    else if string(FrameID) = 'APIC' then
    begin
      ExtractAPIC(FrameData, FrameSize);
    end;

    Inc(P, 10 + FrameSize);
  end;
end;

{ --- Витягує обкладинку з фрейму APIC --- }
{ Структура APIC: encoding(1) + mime\0 + pictype(1) + desc\0 + imgdata }
procedure TFileInfoForm.ExtractAPIC(data: PByte; size: Cardinal);
var
  P:       PByte;
  MimeEnd: PByte;
  PicType: Byte;
  Stream:  TMemoryStream;
  ImgStart: PByte;
  ImgSize:  Cardinal;
begin
  if ImgCover.Visible then Exit;  // вже є обкладинка
  if size < 4 then Exit;

  P := data;
  Inc(P);  // пропускаємо encoding

  // Знаходимо кінець MIME-типу (null-terminated)
  MimeEnd := P;
  while (MimeEnd < data + size) and (MimeEnd^ <> 0) do Inc(MimeEnd);
  Inc(MimeEnd);  // пропускаємо #0

  PicType := MimeEnd^;
  Inc(MimeEnd);  // пропускаємо тип картинки (0=other, 3=front cover)

  // Пропускаємо опис (null-terminated)
  ImgStart := MimeEnd;
  while (ImgStart < data + size) and (ImgStart^ <> 0) do Inc(ImgStart);
  Inc(ImgStart);  // пропускаємо #0

  ImgSize := (data + size) - ImgStart;
  if ImgSize < 4 then Exit;

  Stream := TMemoryStream.Create;
  try
    Stream.WriteBuffer(ImgStart^, ImgSize);
    Stream.Position := 0;
    ShowCover(Stream);
  finally
    Stream.Free;
  end;
end;

{ --- Vorbis Comment (FLAC, OGG) --- }
{ Формат: масив рядків "FIELD=value" розділених #0, закінчується подвійним #0 }
procedure TFileInfoForm.ReadVorbisComment(chan: DWORD);
var
  P:     PChar;
  TagStr: string;
  Key, Value: string;
  EqPos: Integer;
begin
  P := BASS_ChannelGetTags(chan, BASS_TAG_OGG);
  if P = nil then Exit;

  while P^ <> #0 do
  begin
    TagStr := string(P);
    Inc(P, Length(TagStr) + 1);

    EqPos := Pos('=', TagStr);
    if EqPos = 0 then Continue;

    Key   := UpperCase(Copy(TagStr, 1, EqPos - 1));
    Value := Copy(TagStr, EqPos + 1, MaxInt);

    if      Key = 'TITLE'       then SetIfEmpty(EdTitle,   Value)
    else if Key = 'ARTIST'      then SetIfEmpty(EdArtist,  Value)
    else if Key = 'ALBUM'       then SetIfEmpty(EdAlbum,   Value)
    else if Key = 'DATE'        then SetIfEmpty(EdYear,    Copy(Value, 1, 4))
    else if Key = 'GENRE'       then SetIfEmpty(EdGenre,   Value)
    else if Key = 'TRACKNUMBER' then SetIfEmpty(EdTrack,   Value)
    else if Key = 'COMMENT'     then SetIfEmpty(EdComment, Value);
  end;

  // Обкладинка з Vorbis Comment
  ExtractVorbisCover(chan);
end;

{ --- Обкладинка з Vorbis Comment (METADATA_BLOCK_PICTURE base64) --- }
procedure TFileInfoForm.ExtractVorbisCover(chan: DWORD);
var
  P:        PChar;
  TagStr: string;
  Key, B64: string;
  EqPos:    Integer;
  Decoded:  string;
  Stream:   TMemoryStream;
  P2:       PByte;
  MimeLen, DescLen, ImgLen: Cardinal;
begin
  if ImgCover.Visible then Exit;

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

    // Структура блоку: type(4) + mimelen(4) + mime + desclen(4) + desc +
    //                  width(4) + height(4) + depth(4) + colors(4) + datalen(4) + data
    P2      := PByte(@Decoded[1]);
    // Пропускаємо type (4)
    Inc(P2, 4);
    MimeLen := ReadBE32(P2); Inc(P2, 4);
    Inc(P2, MimeLen);          // пропускаємо mime
    DescLen := ReadBE32(P2); Inc(P2, 4);
    Inc(P2, DescLen);          // пропускаємо опис
    Inc(P2, 16);               // width + height + depth + colors
    ImgLen  := ReadBE32(P2); Inc(P2, 4);

    if ImgLen = 0 then Continue;

    Stream := TMemoryStream.Create;
    try
      Stream.WriteBuffer(P2^, ImgLen);
      Stream.Position := 0;
      ShowCover(Stream);
    finally
      Stream.Free;
    end;
    Break;
  end;
end;

{ --- APEv2 (WavPack, MPC, APE) --- }
{ Формат: масив "Field=value\0\0" }
procedure TFileInfoForm.ReadAPEv2(chan: DWORD);
var
  P:     PChar;
  TagStr: string;
  Key, Value: string;
  EqPos: Integer;
begin
  P := BASS_ChannelGetTags(chan, BASS_TAG_APE);
  if P = nil then Exit;

  while P^ <> #0 do
  begin
    TagStr := string(P);
    Inc(P, Length(TagStr) + 1);

    EqPos := Pos('=', TagStr);
    if EqPos = 0 then Continue;

    Key   := UpperCase(Copy(TagStr, 1, EqPos - 1));
    Value := Copy(TagStr, EqPos + 1, MaxInt);

    if      Key = 'TITLE'  then SetIfEmpty(EdTitle,   Value)
    else if Key = 'ARTIST' then SetIfEmpty(EdArtist,  Value)
    else if Key = 'ALBUM'  then SetIfEmpty(EdAlbum,   Value)
    else if Key = 'YEAR'   then SetIfEmpty(EdYear,    Value)
    else if Key = 'GENRE'  then SetIfEmpty(EdGenre,   Value)
    else if Key = 'TRACK'  then SetIfEmpty(EdTrack,   Value)
    else if Key = 'COMMENT'then SetIfEmpty(EdComment, Value);
  end;
end;

{ --- MP4/AAC теги --- }
procedure TFileInfoForm.ReadMP4(chan: DWORD);
var
  P:     PChar;
  TagStr: string;
  Key, Value: string;
  EqPos: Integer;
begin
  P := BASS_ChannelGetTags(chan, BASS_TAG_MP4);
  if P = nil then Exit;

  while P^ <> #0 do
  begin
    TagStr := string(P);
    Inc(P, Length(TagStr) + 1);

    EqPos := Pos('=', TagStr);
    if EqPos = 0 then Continue;

    Key   := Copy(TagStr, 1, EqPos - 1);
    Value := Copy(TagStr, EqPos + 1, MaxInt);

    // MP4 використовує iTunes atom назви
    if      (Key = '©nam') or (Key = 'title')  then SetIfEmpty(EdTitle,   Value)
    else if (Key = '©ART') or (Key = 'artist') then SetIfEmpty(EdArtist,  Value)
    else if (Key = '©alb') or (Key = 'album')  then SetIfEmpty(EdAlbum,   Value)
    else if (Key = '©day') or (Key = 'year')   then SetIfEmpty(EdYear,    Copy(Value, 1, 4))
    else if (Key = '©gen') or (Key = 'genre')  then SetIfEmpty(EdGenre,   Value)
    else if  Key = 'trkn'                       then SetIfEmpty(EdTrack,   Value)
    else if (Key = '©cmt') or (Key = 'comment')then SetIfEmpty(EdComment, Value);
  end;
end;

{ --- WMA теги --- }
procedure TFileInfoForm.ReadWMA(chan: DWORD);
var
  P:     PChar;
  TagStr: string;
  Key, Value: string;
  EqPos: Integer;
begin
  P := BASS_ChannelGetTags(chan, BASS_TAG_WMA);
  if P = nil then Exit;

  while P^ <> #0 do
  begin
    TagStr := string(P);
    Inc(P, Length(TagStr) + 1);

    EqPos := Pos('=', TagStr);
    if EqPos = 0 then Continue;

    Key   := Copy(TagStr, 1, EqPos - 1);
    Value := Copy(TagStr, EqPos + 1, MaxInt);

    if      Key = 'Title'          then SetIfEmpty(EdTitle,   Value)
    else if Key = 'Author'         then SetIfEmpty(EdArtist,  Value)
    else if Key = 'WM/AlbumTitle'  then SetIfEmpty(EdAlbum,   Value)
    else if Key = 'WM/Year'        then SetIfEmpty(EdYear,    Value)
    else if Key = 'WM/Genre'       then SetIfEmpty(EdGenre,   Value)
    else if Key = 'WM/TrackNumber' then SetIfEmpty(EdTrack,   Value)
    else if Key = 'Description'    then SetIfEmpty(EdComment, Value);
  end;
end;

{ --- Показує обкладинку зі стріму --- }
procedure TFileInfoForm.ShowCover(stream: TStream);
begin
  if ImgCover.Visible then Exit;
  try
    ImgCover.Picture.LoadFromStream(stream);
    ImgCover.Visible   := True;
    LblNoCover.Visible := False;
  except
    // Невідомий формат — ігноруємо
  end;
end;

{ --- Назва формату за ctype --- }
function ChannelTypeName(ctype: DWORD): string;
begin
  case ctype of
    BASS_CTYPE_STREAM_MP3:  Result := 'MP3';
    BASS_CTYPE_STREAM_OGG:  Result := 'OGG Vorbis';
    BASS_CTYPE_STREAM_FLAC: Result := 'FLAC';
    BASS_CTYPE_STREAM_WAV:  Result := 'WAV';
    BASS_CTYPE_STREAM_AIFF: Result := 'AIFF';
    BASS_CTYPE_STREAM_MP4:  Result := 'MP4/AAC';
    BASS_CTYPE_STREAM_WMA:  Result := 'WMA';
    BASS_CTYPE_STREAM_APE:  Result := 'Monkey''s Audio';
    BASS_CTYPE_STREAM_MPC:  Result := 'Musepack';
    BASS_CTYPE_STREAM_WV:   Result := 'WavPack';
    BASS_CTYPE_STREAM_AC3:  Result := 'AC3';
    else
    begin
      // Невідомий тип — показуємо hex для діагностики
      // Після визначення додайте константу вище
      if (ctype and $10000) <> 0 then
        Result := 'Audio stream (0x' + IntToHex(ctype, 5) + ')'
      else
        Result := '0x' + IntToHex(ctype, 6);
    end;
  end;
end;

{ --- Головна процедура завантаження інформації --- }
procedure TFileInfoForm.LoadInfo(const FileName: string);
var
  chan:     DWORD;
  info:     BASS_CHANNELINFO;
  Duration: Double;
  SR:       TSearchRec;
  FileSz:   Int64;
  Bitrate:  Single;
begin
  ClearFields;

  // Відкриваємо файл тільки для читання тегів (DECODE = без відтворення)
  chan := BASS_StreamCreateFile(False, PChar(FileName), 0, 0, BASS_STREAM_DECODE);
  if chan = 0 then
  begin
    EdTitle.Text := rsCannotOpen;
    Exit;
  end;

  try
    // ---- Технічні параметри ----
    BASS_ChannelGetInfo(chan, info);
    LblFormatVal.Caption     := ChannelTypeName(info.ctype);
    LblSampleRateVal.Caption := IntToStr(info.freq) + ' Hz';
    case info.chans of
      1: LblChannelsVal.Caption := rsChMono;
      2: LblChannelsVal.Caption := rsChStereo;
      else LblChannelsVal.Caption := IntToStr(info.chans);
    end;

    Duration := BASS_ChannelBytes2Seconds(chan,
                  BASS_ChannelGetLength(chan, BASS_POS_BYTE));
    if Duration > 0 then
      LblDurationVal.Caption := FormatDuration(Round(Duration));

    // Бітрейт: розмір файлу / тривалість
    if (Duration > 0) and FileExists(FileName) then
    begin
      if FindFirst(FileName, faAnyFile, SR) = 0 then
      begin
        FileSz  := SR.Size;
        Bitrate := (FileSz * 8) / Duration / 1000;
        LblBitrateVal.Caption := Format('~%d kbps', [Round(Bitrate)]);
        SysUtils.FindClose(SR);
      end;
    end;

    // ---- Теги — порядок: ID3v2 > Vorbis > APEv2 > MP4 > WMA > ID3v1 ----
    // ID3v2 (MP3 та інші)
    ReadID3v2(chan);
    // Vorbis Comment (FLAC, OGG)
    ReadVorbisComment(chan);
    // APEv2 (WavPack, MPC, Monkey's Audio)
    ReadAPEv2(chan);
    // MP4/AAC
    ReadMP4(chan);
    // WMA
    ReadWMA(chan);
    // ID3v1 — найнижчий пріоритет (застарілий)
    ReadID3v1(chan);

  finally
    BASS_StreamFree(chan);
  end;

  // ---- Властивості файлу ----
  LblFileNameVal.Caption := ExtractFileName(FileName);
  if FindFirst(FileName, faAnyFile, SR) = 0 then
  begin
    LblFileSizeVal.Caption := FormatFileSize(SR.Size);
    LblModifiedVal.Caption := DateTimeToStr(FileDateToDateTime(SR.Time));
    SysUtils.FindClose(SR);
  end;
end;

{ --- Побудова UI програмно --- }
procedure TFileInfoForm.BuildUI;
const
  PAD       = 8;
  LW        = 160;  // ширина лейблів-підписів
  EH        = 24;   // висота TEdit
  COL2      = LW + PAD * 2;
  COL2_TECH = 200;  // ширша колонка для вкладки Аудіо

  function Row(Parent: TWinControl; const Lbl: string;
    var Ed: TEdit; Y: Integer): TLabel;
  begin
    Result := TLabel.Create(Self);
    Result.Parent  := Parent;
    Result.Caption := Lbl;
    Result.Left    := PAD;
    Result.Top     := Y + 5;
    Result.Width   := LW;
    Result.Font.Style := [fsBold];

    Ed := TEdit.Create(Self);
    Ed.Parent   := Parent;
    Ed.Left     := COL2;
    Ed.Top      := Y;
    Ed.Height   := EH;
    Ed.Width    := Parent.ClientWidth - COL2 - PAD;
    Ed.ReadOnly := True;
    Ed.Anchors  := [akLeft, akTop, akRight];
  end;

  function InfoRow(Parent: TWinControl; const Lbl: string;
    var Val: TLabel; Y: Integer; ColOffset: Integer = COL2): TLabel;
  begin
    Result := TLabel.Create(Self);
    Result.Parent  := Parent;
    Result.Caption := Lbl;
    Result.Left    := PAD;
    Result.Top     := Y + 3;
    Result.Width   := ColOffset - PAD * 2;
    Result.Font.Style := [fsBold];

    Val := TLabel.Create(Self);
    Val.Parent  := Parent;
    Val.Left    := ColOffset;
    Val.Top     := Y + 3;
    Val.Width   := Parent.ClientWidth - ColOffset - PAD;
    Val.Anchors := [akLeft, akTop, akRight];
  end;

var Y: Integer;
begin
  Caption     := rsFileInfoCaption;
  Width       := 450;
  Height      := 305;
  Position    := poOwnerFormCenter;
  BorderStyle := bsDialog;

  PageControl1 := TPageControl.Create(Self);
  PageControl1.Parent  := Self;
  PageControl1.Left    := 0;
  PageControl1.Top     := 0;
  PageControl1.Width   := ClientWidth;
  PageControl1.Height  := ClientHeight - 40;
  PageControl1.Anchors := [akLeft, akTop, akRight, akBottom];

  TabTags  := TTabSheet.Create(PageControl1); TabTags.PageControl  := PageControl1; TabTags.Caption  := rsTabTags;
  TabTech  := TTabSheet.Create(PageControl1); TabTech.PageControl  := PageControl1; TabTech.Caption  := rsTabAudio;
  TabFile  := TTabSheet.Create(PageControl1); TabFile.PageControl  := PageControl1; TabFile.Caption  := rsTabFile;
  TabCover := TTabSheet.Create(PageControl1); TabCover.PageControl := PageControl1; TabCover.Caption := rsTabCover;

  // --- Теги ---
  Y := PAD;
  LblCapTitle   := Row(TabTags, rsTitle,   EdTitle,   Y); Inc(Y, EH + PAD);
  LblCapArtist  := Row(TabTags, rsArtist,  EdArtist,  Y); Inc(Y, EH + PAD);
  LblCapAlbum   := Row(TabTags, rsAlbum,   EdAlbum,   Y); Inc(Y, EH + PAD);
  LblCapYear    := Row(TabTags, rsYear,    EdYear,    Y); Inc(Y, EH + PAD);
  LblCapGenre   := Row(TabTags, rsGenre,   EdGenre,   Y); Inc(Y, EH + PAD);
  LblCapTrack   := Row(TabTags, rsTrackNo, EdTrack,   Y); Inc(Y, EH + PAD);
  LblCapComment := Row(TabTags, rsComment, EdComment, Y);

  // --- Аудіо ---
  Y := PAD;
  LblCapFormat   := InfoRow(TabTech, rsFormat,     LblFormatVal,    Y, COL2_TECH); Inc(Y, EH + PAD);
  LblCapBitrate  := InfoRow(TabTech, rsBitrate,    LblBitrateVal,   Y, COL2_TECH); Inc(Y, EH + PAD);
  LblCapSRate    := InfoRow(TabTech, rsSampleRate, LblSampleRateVal,Y, COL2_TECH); Inc(Y, EH + PAD);
  LblCapChannels := InfoRow(TabTech, rsChannels,   LblChannelsVal,  Y, COL2_TECH); Inc(Y, EH + PAD);
  LblCapDuration := InfoRow(TabTech, rsDuration,   LblDurationVal,  Y, COL2_TECH);
  // --- Файл ---
  Y := PAD;
  LblCapFileName := InfoRow(TabFile, rsFileName, LblFileNameVal, Y);
  LblFileNameVal.AutoSize := True;
  LblFileNameVal.WordWrap := True;
  LblFileNameVal.Height   := 40;
  Inc(Y, 48);
  LblCapFileSize := InfoRow(TabFile, rsFileSize,  LblFileSizeVal, Y); Inc(Y, EH + PAD);
  LblCapModified := InfoRow(TabFile, rsModified, LblModifiedVal, Y);

  // --- Обкладинка ---
  ImgCover := TImage.Create(Self);
  ImgCover.Parent       := TabCover;
  ImgCover.Align        := alClient;
  ImgCover.Stretch      := True;
  ImgCover.Proportional := True;
  ImgCover.Center       := True;
  ImgCover.Visible      := False;

  LblNoCover := TLabel.Create(Self);
  LblNoCover.Parent    := TabCover;
  LblNoCover.Caption   := rsNoCover;
  LblNoCover.Align     := alClient;
  LblNoCover.Alignment := taCenter;
  LblNoCover.Layout    := tlCenter;
  LblNoCover.Visible   := True;

  // --- Кнопка ---
  BtnClose := TButton.Create(Self);
  BtnClose.Parent   := Self;
  BtnClose.Caption  := rsClose;
  BtnClose.Width    := 90;
  BtnClose.Height   := 28;
  BtnClose.Left     := ClientWidth - 98;
  BtnClose.Top      := ClientHeight - 36;
  BtnClose.Anchors  := [akRight, akBottom];
  BtnClose.OnClick  := @Self.BtnCloseClick;
end;

procedure TFileInfoForm.UpdateLanguage;
begin
  Caption              := rsFileInfoCaption;
  TabTags.Caption      := rsTabTags;
  TabTech.Caption      := rsTabAudio;
  TabFile.Caption      := rsTabFile;
  TabCover.Caption     := rsTabCover;
  BtnClose.Caption     := rsClose;
  LblNoCover.Caption   := rsNoCover;
  LblCapTitle.Caption   := rsTitle;
  LblCapArtist.Caption  := rsArtist;
  LblCapAlbum.Caption   := rsAlbum;
  LblCapYear.Caption    := rsYear;
  LblCapGenre.Caption   := rsGenre;
  LblCapTrack.Caption   := rsTrackNo;
  LblCapComment.Caption := rsComment;
  LblCapFormat.Caption   := rsFormat;
  LblCapBitrate.Caption  := rsBitrate;
  LblCapSRate.Caption    := rsSampleRate;
  LblCapChannels.Caption := rsChannels;
  LblCapDuration.Caption := rsDuration;
  LblCapFileName.Caption := rsFileName;
  LblCapFileSize.Caption := rsFileSize;
  LblCapModified.Caption := rsModified;
end;

end.
