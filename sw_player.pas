unit sw_player;

{$mode Delphi}
interface

uses
  Classes, LCLIntf, LCLType, LMessages, SysUtils,  Forms, Variants,  Graphics, Controls,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, Menus, ActnList,
  LCLTranslator, DefaultTranslator, Math,
   Spectrum_vis,  Types, CommonTypes, lazdynamic_bass, Dynamic_BassFX, Dynamic_Bassenc,
    XMLPropStorage, IniPropStorage,  BGRAShape, FileInfo,  xlib, CDControl,
    dbus_keys;

  //It is safe to place code here as no form is initialized before unit
  //initialization is made

//end.
//end.
type



  TPlayerMode = (Stop, Play, Paused);

 // { TForm_player }

  { TForm_player }

  TForm_player = class(TForm)
      ApplicationProperties1: TApplicationProperties;
      BGRAShape1: TBGRAShape;
      BGRAShape10: TBGRAShape;
    BGRAShape11: TBGRAShape;
    BGRAShape12: TBGRAShape;
    BGRAShape13: TBGRAShape;
    BGRAShape14: TBGRAShape;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    LeftOver: TBGRAShape;
    BGRAShape16: TBGRAShape;
    CloseSwampMenu: TMenuItem;
    CloseApp: TMenuItem;
    MenuItem1: TMenuItem;
    DeletePlayList: TMenuItem;
    ClosePlayList: TMenuItem;
    AddUrl: TMenuItem;
    Editor: TMenuItem;
    PlayLists: TMenuItem;
    OpenPlayList: TMenuItem;
    CopyToCustomEq: TMenuItem;
    SavePlayList: TMenuItem;
    Neg25: TMenuItem;
    Neg50: TMenuItem;
    Neg75: TMenuItem;
    s300: TMenuItem;
    S275: TMenuItem;
    S250: TMenuItem;
    S225: TMenuItem;
    S200: TMenuItem;
    S175: TMenuItem;
    S150: TMenuItem;
    S125: TMenuItem;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    SNormal: TMenuItem;
    TrackSpeed: TMenuItem;
    SoftBass: TMenuItem;
    RightOver: TBGRAShape;
    BGRAShape2: TBGRAShape;
    BGRAShape3: TBGRAShape;
    BGRAShape4: TBGRAShape;
    BGRAShape5: TBGRAShape;
    BGRAShape6: TBGRAShape;
    BGRAShape7: TBGRAShape;
    BGRAShape8: TBGRAShape;
    BGRAShape9: TBGRAShape;
    BitBtn1: TBitBtn;
    ImageList1: TImageList;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LblEQ6: TLabel;
    LblEQ7: TLabel;
    LblEQ12: TLabel;
    LblEQ11: TLabel;
    LblEQ10: TLabel;
    LblEQ9: TLabel;
    LblEQ8: TLabel;
    LblEQ13: TLabel;
    LblEQ18: TLabel;
    LblEQ17: TLabel;
    Label2: TLabel;
    LblEQ16: TLabel;
    LblEQ15: TLabel;
    LblEQ14: TLabel;
    LblEQ1: TLabel;
    LblEq2: TLabel;
    LblEq3: TLabel;
    LblEQ4: TLabel;
    LblEq5: TLabel;
    SaveDialog1:TsaveDialog;
    LevelRight: TProgressBar;
    HideEqualizer: TMenuItem;
    Dance: TMenuItem;
    FullBass: TMenuItem;
    FullBassAndTreble: TMenuItem;
    FullTreble: TMenuItem;
    Headphones: TMenuItem;
    HeavyMetal: TMenuItem;
    HipHop: TMenuItem;
    Industrial: TMenuItem;
    Jazz: TMenuItem;
    LargeHall: TMenuItem;
    Lang2: TMenuItem;
    Lang3: TMenuItem;
    Lang1: TMenuItem;
    Lang5: TMenuItem;
    Lang4: TMenuItem;
    Lang6: TMenuItem;
    Lang7: TMenuItem;
    Lang8: TMenuItem;
    Lang9: TMenuItem;
    Lang10: TMenuItem;
    Lang11: TMenuItem;
    Lang12: TMenuItem;
    Lang13: TMenuItem;
    Lang14: TMenuItem;
    LevelLeft: TProgressBar;
    PlayMenu: TMenuItem;
    PauseMenu: TMenuItem;
    StopMenu: TMenuItem;
    PreviousMenu: TMenuItem;
    NextMenu: TMenuItem;
    OpenFiles: TMenuItem;
    ShowPlayerMenu: TMenuItem;
    OffEqualizer: TMenuItem;
    Live: TMenuItem;
    Acoustic: TMenuItem;
    Electronic: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    Language: TMenuItem;
    Party: TMenuItem;
    Pop: TMenuItem;
    PopupMenuTray: TPopupMenu;
    Rap: TMenuItem;
    Reggae: TMenuItem;
    Rock: TMenuItem;
    Ska: TMenuItem;
    Soft: TMenuItem;
    SoftRock: TMenuItem;
    Techno: TMenuItem;
    MenuItem3: TMenuItem;
    SysTrayIcon: TTrayIcon;
    TimerLeftOverDrive: TTimer;
    TimerRighOverDrive: TTimer;
    TrackBar1: TTrackBar;
    Custom: TMenuItem;
    Vocal: TMenuItem;
    ClearList: TMenuItem;
    MenuItem5: TMenuItem;
    HideList: TMenuItem;
    HideEq: TMenuItem;
    Alternative: TMenuItem;
    Ballad: TMenuItem;
    Classic: TMenuItem;
    Club: TMenuItem;
    Presets: TMenuItem;
    Flat: TMenuItem;
    PB1: TProgressBar;
    PB10: TProgressBar;
    PB11: TProgressBar;
    PB12: TProgressBar;
    PB13: TProgressBar;
    PB14: TProgressBar;
    PB15: TProgressBar;
    PB16: TProgressBar;
    PB17: TProgressBar;
    PB18: TProgressBar;
    PB2: TProgressBar;
    PB3: TProgressBar;
    PB4: TProgressBar;
    PB5: TProgressBar;
    PB6: TProgressBar;
    PB7: TProgressBar;
    PB8: TProgressBar;
    PB9: TProgressBar;
    ShowList: TMenuItem;
    MenuStopStart: TMenuItem;
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    PopupMenu1: TPopupMenu;
    PopupAnaliz: TPopupMenu;
    ListBoxMenu: TPopupMenu;
    ScrollBar1: TScrollBar;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    MouseRefreshTimer: TTimer;
    TimerRender: TTimer;
    TrackBar12: TTrackBar;
    TrackBar21: TTrackBar;
    OpenDialog1: TOpenDialog;
    StringList1:TstringList;
    Timer1: TTimer;
    XMLPropStorage1: TXMLPropStorage;
    procedure AcousticClick(Sender: TObject);
    procedure AddUrlClick(Sender: TObject);
    procedure AlternativeClick(Sender: TObject);
    procedure BalladClick(Sender: TObject);
    procedure BGRAShape10MouseLeave(Sender: TObject);

    procedure BGRAShape12Click(Sender: TObject);
    procedure BGRAShape12MouseLeave(Sender: TObject);
    procedure BGRAShape12MouseMove(Sender: TObject);
    procedure BGRAShape14Click(Sender: TObject);
    procedure BGRAShape15Click(Sender: TObject);
    procedure BGRAShape1Click(Sender: TObject);
    procedure BGRAShape1MouseLeave(Sender: TObject);
    procedure BGRAShape1MouseMove(Sender: TObject; X, Y: Integer);


    procedure BGRAShape2Click(Sender: TObject);
    procedure BGRAShape2DblClick(Sender: TObject);
    procedure BGRAShape10MouseMove(Sender: TObject);

    procedure BGRAShape2MouseLeave(Sender: TObject);
    procedure BGRAShape2MouseMove(Sender: TObject);

    procedure BGRAShape3Click(Sender: TObject);
    procedure BGRAShape3MouseLeave(Sender: TObject);
    procedure BGRAShape3MouseMove(Sender: TObject; X,
      Y: Integer);
    procedure BGRAShape4MouseLeave(Sender: TObject);
    procedure BGRAShape4MouseMove(Sender: TObject);
    procedure BGRAShape5Click(Sender: TObject);
    procedure BGRAShape5MouseLeave(Sender: TObject);
    procedure BGRAShape5MouseMove(Sender: TObject);
    procedure BGRAShape6MouseLeave(Sender: TObject);
    procedure BGRAShape6MouseMove(Sender: TObject);
    procedure BGRAShape7Click(Sender: TObject);
    procedure BGRAShape7MouseLeave(Sender: TObject);
    procedure BGRAShape7MouseMove(Sender: TObject);
    procedure BGRAShape8MouseLeave(Sender: TObject);
    procedure BGRAShape8MouseMove(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
 //   procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ClassicClick(Sender: TObject);
    procedure ClosePlayerMenuClick(Sender: TObject);
    procedure ClosePlayListClick(Sender: TObject);
    procedure ClubClick(Sender: TObject);

    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);

    procedure ComboBox4CloseUp(Sender: TObject);
    procedure CustomClick(Sender: TObject);
    procedure DanceClick(Sender: TObject);
    procedure DeletePlayListClick(Sender: TObject);
    procedure EditorClick(Sender: TObject);
    procedure ElectronicClick(Sender: TObject);
    procedure FlatClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormChangeBounds(Sender: TObject);
    procedure FormClose(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  //  procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
 //   procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
 //  procedure FormDropFiles(Sender: TObject; const FileNames: array of string);
    procedure FormHide(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormPaint(Sender: TObject);
    procedure FormShortCut(var Msg: TLMKey; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FullBassAndTrebleClick(Sender: TObject);
    procedure FullBassClick(Sender: TObject);
    procedure FullTrebleClick(Sender: TObject);
    procedure HeadphonesClick(Sender: TObject);
    procedure HeavyMetalClick(Sender: TObject);
    procedure HideListClick(Sender: TObject);
    procedure HipHopClick(Sender: TObject);
    procedure IndustrialClick(Sender: TObject);
    procedure JazzClick(Sender: TObject);
    procedure Lang1Click(Sender: TObject);
    procedure Lang7Click(Sender: TObject);
    procedure LangClick(Sender: TObject);
    procedure LanguageClick(Sender: TObject);
    procedure LargeHallClick(Sender: TObject);
    procedure LB1KeyDown(Sender: TObject);
 //   procedure LB1DblClick(Sender: TObject);
    procedure LB1MouseDown(Sender: TObject);
     procedure LB2DrawItem();
    procedure ListBoxMenuPopup(Sender: TObject);
    procedure LiveClick(Sender: TObject);
    procedure HideEqualizerClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem1Click1(Sender: TObject);
    procedure LoadCustomEqClick(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure Neg25Click(Sender: TObject);
    procedure Neg50Click(Sender: TObject);
    procedure Neg75Click(Sender: TObject);
    procedure OpenPlayListClick(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure CopyToCustomEqClick(Sender: TObject);
    procedure SavePlayListDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure SavePlayListClick(Sender: TObject);
    procedure SNormalClick(Sender: TObject);
    procedure OffEqualizerClick(Sender: TObject);
    procedure MenuItem2Click1(Sender: TObject);
    procedure ClearListClick(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuOnStopStart(Sender: TObject);
    procedure MouseRefreshTimerTimer(Sender: TObject);
    procedure NextMenuClick(Sender: TObject);
    procedure OpenFilesClick(Sender: TObject);
    procedure OpenFormClick(Sender: TObject);
    procedure PaintBox1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Panel1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Panel2MouseLeave(Sender: TObject);
    procedure Panel2MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Panel5MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure PartyClick(Sender: TObject);
    procedure PauseMenuClick(Sender: TObject);
    procedure PB1MouseLeave(Sender: TObject);
    procedure PBMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure PlayMenuClick(Sender: TObject);
    procedure PopClick(Sender: TObject);

    procedure PreviousMenuClick(Sender: TObject);
    procedure RapClick(Sender: TObject);
    procedure ReggaeClick(Sender: TObject);
    procedure RockClick(Sender: TObject);
    procedure S125Click(Sender: TObject);
    procedure S150Click(Sender: TObject);
    procedure S175Click(Sender: TObject);
    procedure S200Click(Sender: TObject);
    procedure S225Click(Sender: TObject);
    procedure S250Click(Sender: TObject);
    procedure S275Click(Sender: TObject);
    procedure s300Click(Sender: TObject);
    procedure ShowPlayerMenuClick(Sender: TObject);
    procedure SkaClick(Sender: TObject);
    procedure SoftBassClick(Sender: TObject);
    procedure SoftClick(Sender: TObject);
    procedure SoftRockClick(Sender: TObject);
    procedure StopMenuClick(Sender: TObject);
    procedure SysTrayIconClick(Sender: TOBject);
    procedure SysTrayIconMouseDown(Sender: TObject);
    procedure SysTrayIconMouseUp(Sender: TObject);
    procedure SysTrayIconPaint(Sender: TObject);
    procedure TechnoClick(Sender: TObject);
    procedure TimerLeftOverDriveStartTimer(Sender: TObject);
    procedure TimerLeftOverDriveTimer(Sender: TObject);
    procedure TimerLevelTimer(Sender: TObject);
    procedure TimerRighOverDriveStartTimer(Sender: TObject);
    procedure TimerRighOverDriveTimer(Sender: TObject);
    procedure TrackBar12Change(Sender: TObject);
    procedure Panel2Paint(Sender: TObject);
    procedure PB1Enter(Sender: TObject);
    procedure PBMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure HideEqClick(Sender: TObject);
    function  Player():bool;
    procedure FormCreate(Sender: TObject);
    procedure PopupAnalizPopup(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure TrackBar12MouseLeave(Sender: TObject);
    procedure TrackBar12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackBar12MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure TrackBar1Change(Sender: TObject);
    procedure SetPreset(Sender: TObject; var Presets: array of float);
    procedure TimerRenderTimer(Sender: TObject);
    procedure LoadLibsInDirs(Dir:string);
    procedure TrackBar1Enter(Sender: TObject);
    procedure TrackBar1MouseLeave(Sender: TObject);
    procedure TrackBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TrackSpeedClick(Sender: TObject);
    procedure UpdateEQ(val:array of float);
  //  procedure GetFilesInDirs(Dir:string);
    procedure TrackBar1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure VocalClick(Sender: TObject);
    procedure XMLPropStorage1RestoreProperties(Sender: TObject);
    procedure GetVerInfo(Sender: TObject);
    procedure LabelEqRefresh;
    procedure EQActivate;
    procedure EQDeActivate;
 //   function  GetBitrate(file_name:string):integer;
    private
    { Private declarations }
       FFileVersion: string;
       procedure draw;
       procedure putfile(val: string);
     //  function GetMaxLevel1(file_name: string; fstart: integer; fend: integer
     //    ): single;
  public
    { Public declarations }
    procedure SetTonComp;
    procedure UpdateTonComp;
    procedure SetInterpolation(val:integer);
    property FileVersion: string read FFileVersion;
    function GetMaxLevel(file_name:string):single;
  end;

resourcestring
  openplaylistCaption = 'Open Playlist';
  ofeq = 'Off Equalizer';
  oneq = 'On Equalizer';
  hideq = 'Hide Equalizer';
  sheq = 'Show Equalizer';
  logvol = 'Logarithmic volume control';
  tonvol = 'Loudly compensated volume control';
  offanalizer = 'Turn OFF Analizer';
  bandanalizer = 'Count Bands Analizer';
  autoplay = 'Auto Play';
  player = 'Player';
  equalizer = 'Equalazer';
  spanalizer = 'Spectrum Analizer';
  interpolat0 = 'Interpolation: Linear';
  interpolat1 = 'Interpolation: Sync 8 point';
  interpolat2 = 'Interpolation: Sync 16 point';
  interpolat3 = 'Interpolation: Sync 32 point ';
  interpolat4 = 'Interpolation: Sync 64 point';
  FlChor0 = 'Flanger';
  FlChor1 = 'Exaggerated chorus leads to multiple pitch shifted voices';
  FlChor2 = 'Motocycle';
  FlChor3 = 'Devil';
  FlChor4 = 'Who say that there are not many voices?';
  FlChor5 = 'Back chipmunk';
  FlChor6 = 'Water';
  FlChor7 = 'This is the airplane';
  actualbitrate ='Actual Track Bitrate';
  clearYesNo = 'Are you sure you want to clear the playlist?';
  stereo = 'Stereo';
  mono = 'Mono';
  bright = 'Bright';
  volume = 'Volume';
  balance = 'Balanсe';
  frequency = 'Frequency modulation';
  flanger = 'Flanger';
  chorus = 'Chorus';
  reverberation = 'Reverberation';
  echo = 'Echo';
  delayleft = 'Delay for left channel';
  delayright = 'Delay for right channel';
  wet = 'Delayed/Direct';
  feedback = 'Feedback';
  depth = 'Depth';
  reverbtime = 'Reverberation Time';
  reverbmix = 'Reverberation Mix';
  efects = 'Effects';
  line = 'Line';
  bargraph = 'Bar Graph';
  params = 'Params';
  playlist ='PlayList';
  effenable = 'Effect Enable';
  stopanalizer = 'Stop Analizer';
  startanalizer = 'Start Analizer';
  rsDB = ' dB';
  languages = 'Languages';
  afile = 'The file ';
  nosuch = ' does not exist';
  afileerror = 'File upload error';
  confirm = 'Confirm';
  aCancel = 'Cancel';
  aDelete = 'Are you sure you want to delete this ';
  bFile = 'file?';
  eBASS_ERROR_INIT = 'BASS_Init has not been successfully called.';
  eBASS_ERROR_NOTAVAIL = 'The BASS_STREAM_AUTOFREE flag cannot be combined with the BASS_STREAM_DECODE flag.';
  eBASS_ERROR_NONET = 'No internet connection could be opened. Can be caused by a bad proxy setting.';
  eBASS_ERROR_ILLPARAM = 'url is not a valid URL.';
  eBASS_ERROR_PROTOCOL = 'The protocol in url is not supported.';
  eBASS_ERROR_SSL      = 'SSL/HTTPS support is not available. See BASS_CONFIG_LIBSSL.';
  eBASS_ERROR_TIMEOUT  = 'The server did not respond to the request within the timeout period, as set with the BASS_CONFIG_NET_TIMEOUT config option.';
  eBASS_ERROR_DENIED   = 'A valid username/password is required.';
  eBASS_ERROR_FILEOPEN = 'The file could not be opened.';
  eBASS_ERROR_FILEFORM = 'The file'+'s format is not recognised/supported.';
  eBASS_ERROR_UNSTREAMABLE = 'The file cannot be streamed. This could be because an MP4 file'+'s mdat atom comes before its "moov" atom.';
  eBASS_ERROR_NOTAUDIO = 'The file does not contain audio, or it also contains video and videos are disabled.';
  eBASS_ERROR_CODEC    = 'The file uses a codec that is not available/supported. This can apply to WAV and AIFF files.';
  eBASS_ERROR_FORMAT   = 'The sample format is not supported.';
  eBASS_ERROR_SPEAKER  = 'The specified SPEAKER flags are invalid.';
  eBASS_ERROR_MEM      = 'There is insufficient memory.';
  eBASS_ERROR_NO3D     = 'Could not initialize 3D support.';
  eBASS_ERROR_UNKNOWN  = 'Some other mystery problem!';
var

  Form_player: TForm_player;
  vVol,i        :integer; //index of the currently playing track in the playlist
  dw, FileIndex:integer;
  filename : string;//filename
  FChannel : DWORD;
  Channel  : DWORD;//
  Mode     : TPlayerMode;//PlayMode
  rs       : tResourceStream;
  p        : BASS_DX8_PARAMEQ;
  pR       : BASS_DX8_REVERB;
  pcH      : BASS_DX8_CHORUS;
  pE       : BASS_DX8_ECHO;
  pF       : BASS_DX8_FLANGER;
  pFXvol   : BASS_FX_VOLUME_PARAM;
  bcinfo   : BASS_CHANNELINFO;
  pCo      : BASS_BFX_COMPRESSOR2;
  pExt     : BASS_BFX_BQF;
  pExt1    : BASS_BFX_BQF;
  pstE     : BASS_DX8_ECHO;
  pFreRev  : BASS_BFX_FREEVERB;
  id3      : TAG_ID3;
 // pChFl    : BASS_BFX_PHASER;
  pChFl    : BASS_BFX_CHORUS;
 { pD       : BASS_FX_DX8_DISTORTION;
  pE       : BASS_FX_DX8_ECHO;
  pF       : BASS_FX_DX8_FLANGER;
  pG       : BASS_FX_DX8_GARGLE;
  pI3      : BASS_FX_DX8_I3DL2REVERB; }

  fx       : array[0..34] of HMUSIC;
  init     : bool = false;
  first    : bool = false;
  FormInit : bool = false;
  AutoStart: bool = False;
  pSound   : integer = 44100;
  B_Flags  : Dword;
  B_Init_Flags : DWord = BASS_DEVICE_STEREO;
  B_Info   :  BASS_INFO;
  Options_Hide:Bool = True;
  Eq_Hide  : Bool = false;
  List_Hide: Bool = true;
  Off_Equalizer: Bool = False;
  Off_Analizer: Bool = false;
  is_BackGround: Bool =False;
  B_BitsFormat: Dword =0;
  kPos : Double=1.0;
  LB3:TlistBox;
  isCue:Bool=false;
  cueStart, cueEnd:Dword;
  PosTime:QWORD;
  OnReverb: Bool = false;
  OnChorus: Bool = false;
  lnVolume: Bool = false;
  OnEcho: Bool = false;
  OnFlanger : Bool = False;
  OnCompressor : Bool = False;
  OnPeakEqualizer   :Bool  =False;
  OnPeakEqualizer1   :Bool  =False;
  OnChorusFlanger :Bool     =false;
  OnFreReverb :bool         =false;
  OnStereoExpand   :Bool  =False;
  tonComp   : Bool = False;
  ATTRIB_SRC: Dword= 4;
  bitRate :Single;
  Chann:DWord;
  ATTRIB_FREQ:Single = 44100;
  ListBox1ItemIndex:integer;
  isFirst :Bool = True;
  ShownOnce: bool = false;
  closePlayer: bool = false;
  atrfq: single = 0;
   level : DWORD;
    chleft : DWORD;
    chright: DWORD;
    MaxLevel,chvolume:single;
    CuePos: INT64;
    CueEndPos: INT64;
  //Presets: array [1..27] of
   aElectronic: array [0..19] of Single = (3.8, 3.8, 3.1, 3.1, 0.6, -0.6, 0.0, -1.3, 1.9, 0.0, 2.5, 1.6, 0.6, 1.3, 1.9, 2.5, 4.4, 6.3, 6.9, 6.9) ;
  aAcoustic: array [0..19] of Single = (0.0, 1.4, 3.3, 5.2, 3.9, 2.4, -2.5, -5.5, -3.0, -0.5, -3.6, -5.5, 0.8, 5.1, 5.6, 3.3, -1.7, -2.4, -4.2, 0) ;
   aAlternate: array [0..19] of Single = (6.4, 7.0 , 6.6, 5.13, 4.2, 2.94, 2.1, 1.0, -0.2, -1.26, -2.1, -1.3, -0.2, 1.26, 2.1, 3.36, 4.2, 5.13, 6.6, 0) ;
   aBallad: array [0..19] of Single = (-6.74, 3.8, -3.4, -0.2, 1.2, 3.0, 3.8, 4.5, 3.8, 3.0, 2.2, 1.8, -1.8, -3.4, -3.4, -3.4, -4.4, 1.2, -4.9, 0);
   aClassic: array [0..19] of Single = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,-2.86,-5.83, -5.83, -6, -8.1, -8.1);
   aClub: array [0..19] of Single = (-1, -1, -1, -1, -0.9, 0.8, 1.1, 1.4, 2.2, 3.2, 3.5, 2.6, 1.4, 1.1, 0.5, -0.1, -1, -1 ,-1 ,-1);
  aDance: array [0..19] of Single = (0, 9.4, 8.2, 6.4, 3.7, 2.0, 1.6, 1.6, 0.4, -0.5, -1.1, -1.3, -2.6, -2.6, -2.6, -2.9, -2.6, 1.6, 1.6, 0);
   aFullBass: array [0..19] of Single = (6.4, 5.3, 5.2, 5.2, 5.2, 3.7, 2.2, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
     aFullBassAndTreble: array [0..19] of Single = (6.41, 4.3, 4.3, 4.2, 3.6, 0.9, -3, -7.5, -9.4, -11.3, -11.3, -9.4, -5.0, 0.6, 4.8, 5.4, 5.4, 6.21, 6.21, 6.21);
     aFullTreble: array [0..19] of Single = (-2, -2, -2, -2, -2, -2, -2, -2,  -2, -2, -2.0, -2.0, 3.1, 5.5, 7.3, 7.9, 7.9, 8.11, 8.11, 8.11);

     aHeadphones: array [0..19] of Single = (5.0, 5.0, 5.0, 5.0, 5.0, 4.9, 3.0, -0.1, -2.2, -4.0, -3.4, -2.9, -2.1, -1.4, -1.3, -0.3, 2.2, 3.8, 7.3, 0);
//   aHeadphones: array [0..19] of Single = (3.7, 3.7, 3.7, 3.7, 3.7, 3.6, 1.7, -1.4, -3.5, -5.3, -4.7, -4.2, -3.4, -2.7, -2.6, -1.6, 0.9, 2.5, 6, 6);

     aHeavyMetal: array [0..19] of Single = (-2.07, 0.15, 2.37, 3.95, 3, 0, -3.9, -4.85, -5.1, -4.8, -4.8, -2.4, -0.9, 0.6, 2.7, 5.7, 6.6, 6.73, 2.48, 2.48);
     aHipHop: array [0..19] of Single = (5, 4.5, 4, 2.47, 1.5, 2.1, 2.5, 0.1, -1.5, -1.5, -1.5, 0.12, 1.2, -0.12, -1, 0.8, 2, 2.3, 2.5, 2.5);
     aIndustrial: array [0..19] of Single = (-2.07, -2.9, -2.9, 0.4, 2.4, 1.5, 0.9, 0.0, -0.6, -0.6, -0.6, -0.6, -0.6, 1.1, 2.1, 4.5, 6.0, 3.6, 1.9, 0);
     aJazz: array [0..19] of Single = (3.03, 4.65, 6.27, 5.15, 3.6, 1.8, -3.9, -4.85, -5.1, -2.1, 1.2, 4.5, 9, 3, -1.8, -4.5, -2.4, -0.47, 2.48, 2.48);
     aLargehall: array [0..19] of Single = (6.7, 6.7, 6.7, 6.7, 6.7, 6.6, 4.9, 3.6, 3.6, 2.7, 0, -0.6, -1.6, -2.9, -3.2, -3.2, -3.2, -3.2, 0, 0);
     aLive: array [0..19] of Single = (-4.2, -4.5, -4.4, -2.9, 1.9, 3.1, 3.7, 3.4, 3.4, 3.7, 2.8, 2.2, 1.6, 1.0, 1.0, 0.7, 0.7, 0.4, 0.1, 1.5);
     aParty: array [0..19] of Single = (5.4, 5.4, 5.4, 5.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.4, 5.42, 5.42);
     aPop: array [0..19] of Single = (-1.58, -3.49, -3.1, -1.9, -2.4, -1.3, -1.1, 1.3, 1.3, 3.8, 4.4, 4.4, 1.9, -0.0, -1.9, -2.5, -3.8, -4.1, -3.1, -3.1);
     aRap: array [0..19] of Single = (0, 2.1, 4.2, 5.34, 2.7, 0, -3.9, -4.5, -3.3, 0.3, 1.5, -1.8, -5.4, -0.6, 2.7, 4.5, 5.1, 2.4, 0, 0);
     aReggae: array [0..19] of Single = (0, 0, 0, 0, 0, 0, -0.3, -1, -2.6, -2.7, 0, 0.9, 2.2, 4, 4.4, 4.4, 2.9, 0.6, 0, 0);
     aRock: array [0..19] of Single = (4.0, 4.0, 2.0, -0.6, -3.9, -5.0, -6.9, -6.9, -5.6, -4.4, -1.9, 0.6, 1.9, 3.1, 3.8, 4.4, 4.4, 2.5, 1.3, 1.0);
     aSka: array [0..19] of Single = (-1.3, -1.5, -1.7, -2.1, -2.6, -3.2, -3, -2.6, -1.4, 0.2, 2.5, 2.7, 3.1, 3.5, 4.2, 5.2, 5.6, 5.8, 5.9, 5.9);
  // aSoft: array [0..19] of Single = (0, -2.1, -2.9, -4.4, -4.7, -7.1, -8.3, -7.4, -6.7, -4.7, -3.2, -0.8, 0.7, 1.6, 2.2, 2.8, 2.8, 3.1, 2.8, 0);
     aSoft: array [0..19] of Single = (0,  1.4,  0.6, -0.9, -1.2, -3.6, -4.8, -3.9, -3.2, -1.2,  0.3,  2.7, 4.2, 5.1, 5.7, 6.3, 6.3, 6.6, 6.3, 0);


     aSoftRock: array [0..19] of Single = (1.8, 5.1, 5.2, 5.2, 5.2, 4.0, 2.8, 1.6, 0.4, -1.4, -1.9, -1.4, -0.8, -0.8, 1.0, 3.1, 5.5, 8.5, 8.5, 0 );
  //   aSoftRock: array [0..19] of Single = (1.8, 1.95, 2.1,  2.1,  2.05, 0.9, -0.3, -1.5,  -2.7,  -4.5, -5.0, -4.5, -3.9, -3.9, -2.1, 0, 2.4, 5.4, 5.4, 8.1);
     aTechno: array [0..19] of Single = (5.1, 4.95, 4.8, 4.5, 4.1, 3.5, 1.5, -0.5, -2.4, -3.5, -3.2, -2.6, -1.6, -0.3, 1.6, 4.2, 5.2, 5.8, 5.5, 5.5);
     aVocal: array [0..19] of Single = (-4.8, -4.65, -4.5, -3.9, -2.1, -0.3, 1.2, 1.8, 3.6, 6.6, 9, 6.9, 4.5, 2.4, 0.3, -0.9, -2.1, -2.7, -3, -3);
     aSoftBass: array [0..19] of Single = (0, 6.5, 5.8, 2.4, -2.6, -5.0, -4.4, -0.2, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 1.7, 2.4, 6.1, 6.7, 7.7, 0);
    aEqualizer: array [0..19] of Single = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    aCustom: array [0..19] of Single = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
     tLang: array [0..19] of String = ('bs', 'en', 'es', 'ca', 'de', 'el', 'be', 'ar', 'uk', 'it', 'pl', 'fr', 'ka','kk', '', '', '','', '', '');
   mystring:string;
    fxVol: Single;
    globVol: Single;

    samplesDecoder: array [0..10] of Int64 = (8000, 22500, 24000, 32000, 44100, 48000, 88200, 96000, 176400, 192000, 384000);
    optCBIndex: array[1..4] of integer;
    center: array [1..18] of single = (43, 63, 86, 125, 175, 250, 350, 500, 700, 1000, 1500, 2000, 2800, 4000, 5600, 8000, 10944, 15300);
    tms: Int64;
    Tmn: Int64;
    tmf: Double;
    changeBand:boolean=false;
    isCopy:Bool=false;
    VerInfo: string;
    FXTempo: Single=0;
    FXPitch: Single=0;
    mypath:string;
    FPlayList:String;
    HidePlayList:boolean;
    FFTData: TFFTData;
    isWrite:boolean= false;
    isStream:bool;
    encoder: HENCODE;
    edtrack:bool;
    DBusKeys: TDBusKeyHandler;
implementation
uses  unit1, options1, effects, list,cover, add_url;


{ TForm_player}

{$R *.lfm}
//initialization
// SetDefaultLang('uk', 'Languages');
//end.




function BrightC(Color: TColor; BrightPercent: Byte): TColor;

      var

        r, g, b: Byte;

      begin

        Color := ColorToRGB(Color);

        r := GetRValue(Color);

        g := GetGValue(Color);

        b := GetBValue(Color);



        {muldiv(255-r, BrightPercent,100); - color value in percent,
        by which the original color should be increased (integer)}



      r := (r-40)+ muldiv(255 - r, BrightPercent, 100);

        g := (g-40)+ muldiv(240 - g, BrightPercent, 100);

        b :=  (b-40)+muldiv(255 - b, BrightPercent, 100);

        result := RGB(r, g, b);

      end;

procedure TForm_player.GetVerInfo(Sender: TObject);
var inf : TVersionInfo; // uses FileInfo
begin
  inf := TVersionInfo.Create;
  inf.Load(HINSTANCE);
  VerInfo := 'SW-AMP ' + IntToStr(inf.FixedInfo.FileVersion[0]) + '.' +
                       IntToStr(inf.FixedInfo.FileVersion[1]) + '.' +
                       IntToStr(inf.FixedInfo.FileVersion[2]) + '.' +
                       IntToStr(inf.FixedInfo.FileVersion[3]);

  inf.Free;
end;

procedure TForm_player.SetTonComp;
begin
  if TonComp then begin
       BASS_ChannelRemoveFX(Channel,fx[24]);
    fx[24] := BASS_ChannelSetFX(channel, BASS_FX_DX8_PARAMEQ, 0);
               p.fGain := 0;
            p.fBandwidth := 18;
            p.fCenter := 1000;
        BASS_FXSetParameters(fx[24], @p);
    updateTonComp;

  end
 else
   BASS_ChannelRemoveFX(Channel,fx[24]);
 end;

 procedure TForm_player.EQDeActivate;
var
i:integer;
begin
  if Channel>0 then begin
  for i:=18 downto 0 do
     if BASS_ChannelRemoveFX(Channel,fx[i]) then
     fx[i]:=0;
end;
  end;


procedure TForm_player.EQActivate;
 var
      i:integer;
  //    tLbl:Tlabel;
//tPB:TProgressbar;
 begin
 if Channel>0 then begin
   UpdateEQ(aEqualizer);
 for i:=1 to 18 do begin
    if BASS_ChannelRemoveFX(Channel,fx[i]) then
    fx[i]:=0;
      if (fx[i]=0 ) then
        fx[i] := BASS_ChannelSetFX(channel, BASS_FX_DX8_PARAMEQ, 0);
        if (fx[i]<>0 )  then begin
   //    tPB:=(FindComponent('PB'+IntToStr(i)) as TProgressBar);
                           p.fGain := aEqualizer[i];
  //        tLbl:=(FindComponent('LblEQ'+IntToStr(i)) as TLabel);

//   tLbl.Caption:=FloatToStrF(p.fGain ,ffFixed, 0, 1);
          //  val[i] := tPB.Position/1000;
           //   maxval:= Max(maxval, tpb.Position);



          p.fBandwidth := 6;
          p.fCenter := center[i];
          BASS_FXSetParameters(fx[i], @p);
            end;
            end;
    if not (BASS_FXGetParameters(fx[0], @p)) then begin
       BASS_ChannelRemoveFX(Channel,fx[0]);
  fx[0] := BASS_ChannelSetFX(Channel, BASS_FX_VOLUME, 0);
    end;
 //    UpdateEQ(aEqualizer);
    end;


 {for i:=1 to 18 do
  if (BASS_FXGetParameters(fx[i], @p)) then begin
   tPB:=(FindComponent('PB'+IntToStr(i)) as TProgressBar);
  tLbl:=(FindComponent('LblEQ'+IntToStr(i)) as TLabel);
  val[i] := tPB.Position/1000;
  maxval:= Max(maxval, tpb.Position);
  aEqualizer[i]:= val[i];
  p.fgain := val[i];
    if off_equalizer then
 p.fgain := 0;
     tLbl.Caption:=FloatToStrF(p.fGain ,ffFixed, 0, 1);
  BASS_FXSetParameters(fx[i], @p);
  end; }



 end;

procedure TForm_player.UpdateTonComp;
 var
t,v,vol:double;
 begin
 v:= TrackBar1.Position;
 t:= TrackBar1.Position;
 if lnVolume then   begin
 v:= 0.000001*v*v*v;
 t:=((0.0001*t*t*t)-100)/7;
 end
 else begin
 v:=v*0.01;
  t:=(Trackbar1.Position-100) div 7;
 end;
 globVol:=v;
 if off_equalizer then begin
 EQDeActivate;
    if not (BASS_FXGetParameters(fx[0], @p)) then begin
       BASS_ChannelRemoveFX(Channel,fx[0]);
  fx[0] := BASS_ChannelSetFX(Channel, BASS_FX_VOLUME, 0);
    end;
    if MaxLevel>1 then
                  Vol:=  v*(1-(maxlevel-1))
                  else
                      Vol:=v*(1+(1-maxlevel));
end
 else  begin
if (BASS_FXGetParameters(fx[0], @pFXvol)) then begin

    pFXvol.fTarget:= 1-(chvolume) ;

   if MaxLevel>1 then
                Vol:= v*(1-(maxlevel-1)+chvolume)
                else
                    Vol:=v*(1+(1-maxlevel)+chvolume);


 BASS_FXSetParameters(fx[0], @pFXvol);
  end;

      end;

 //  caption:=floatToStr(Vol);
  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_VOL, vol);
 if tonComp then begin
 BASS_FXGetParameters(fx[24], @p);
 p.fgain :=t;
 BASS_FXSetParameters(fx[24], @p);
 end;
 Label3.Caption:=FloatToStrF((v)*100,ffFixed,0,1);;

 end;

procedure TForm_player.SetInterpolation(val: integer);
begin
ATTRIB_SRC:=Options_frm.ComboBox5.ItemIndex;
      ComboBox3Change(self);
end;

procedure TForm_player.TrackBar1Change(Sender: TObject);
begin
updateTonComp;
end;



procedure TForm_player.TrackBar12Change(Sender: TObject);
begin
BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_PAN, (TrackBar12.Position).ToDouble*0.1);
end;

function qbass_getpos(const Channel: DWORD): DWORD;
var
  pPos: Cardinal;
  AllTime: Cardinal;
begin
  Result := 0;
  pPos := BASS_ChannelGetPosition(Channel, BASS_POS_BYTE);
  if pPos > 0 then
  begin
    {Use the already obtained position value instead of calling
     BASS_ChannelGetPosition again}
    Alltime := Trunc(BASS_ChannelBytes2Seconds(Channel, pPos));
    Result := Alltime;
  end;
end;



function qbass_gettime(const Channel: DWORD): DWORD;
var
  pPos: Cardinal;
  AllTime: Cardinal;
begin
  Result := 0;
  pPos := BASS_ChannelGetLength(Channel, BASS_POS_BYTE);
  if (pPos > 0) then
    begin
      Alltime := Trunc(BASS_ChannelBytes2Seconds(Channel, pPos));
      Result := Alltime;
    end;
end;

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



procedure TForm_player.UpdateEQ(val:array of float);
var
//tLbl:Tlabel;
tPB:TProgressbar;
i:integer;
var
 ratio:single;
minv, maxval:single;
begin
if channel=0 then exit;
 maxval:=0.0;
 minv:=0.0;
for i:=1 to 18 do
  if (BASS_FXGetParameters(fx[i], @p)) then begin
   tPB:=(FindComponent('PB'+IntToStr(i)) as TProgressBar);
 // tLbl:=(FindComponent('LblEQ'+IntToStr(i)) as TLabel);
  val[i] := tPB.Position/1000;
  maxval:= Max(maxval, val[i]);
  minv:= Min(minv, val[i]);
  aEqualizer[i]:= val[i];
  p.fgain := val[i];
    if off_equalizer then
 p.fgain := 0;
    // tLbl.Caption:=FloatToStrF(p.fGain ,ffFixed, 0, 1);
  BASS_FXSetParameters(fx[i], @p);
  end;
if not off_equalizer then  begin
    ratio :=1+(maxval);
    ratio := power(10.0, ratio / 20.0);
  if (maxval > minv)  then
   chvolume:= (1-(1/ratio))/1.2
   else
   chvolume:=0;
 UpdateTonComp;
   end;




end;


 procedure GetAFilename;
var
i:integer;
begin
if not (Frm_list.lb1.Count>0) then exit;
for i:=0 to Frm_list.lb1.Count-1 do
 if Frm_list.lb1.Selected[i] then
 filename:=Frm_list.LB2.items[i];
init:=true;
end;

 procedure delay(const ms: longword);
begin
sleep(ms);
end;




var
  tfl, fmax:Single;


function TForm_player.GetMaxLevel(file_name:string):single;
var
  chanm: DWORD;
 // channel: HSTREAM;  // audio channel identifier
  buffer: array[0..8192] of Single;  // buffer for reading data from the audio channel
  bytesRead: DWORD;  // number of bytes read from the audio channel
  bdiv4, pos, lng:DWORD;
 // ss:string;
  i:integer;

begin
pos:=0;
 cuePos:=0;
 CueEndPos:=0;
chanm:=0;
fmax:=0;
//exit;
  // open the audio file and get the audio channel identifier

  chanm := BASS_StreamCreateFile(False, Pchar(file_name), 0, 0, BASS_STREAM_DECODE);
Frm_list.Caption:=Frm_List.Lb2.Items[Frm_List.Lb1.ItemIndex];
  if chanm <> 0 then begin
     // set the initial position in the file
    pos := 0;
    // set the buffer size for reading data from the audio channel
// BASS_ChannelSetAttribute(chanm, BASS_ATTRIB_BUFFER, SizeOf(buffer));
 if (Length(frm_list.LB3.Items[frm_list.LB1.ItemIndex])>0) then
 isCue:=True;
                     if iscue then begin
              //       caption:=intToStr(frm_list.Lb1.ItemIndex)+caption;
                   frm_list.GetStartT(frm_list.Lb1.ItemIndex);
                     cuePos:= BASS_ChannelSeconds2Bytes(Chanm, tms);
                     frm_list.GetEndT(frm_list.Lb1.ItemIndex);
                 //  cueEndPos:= BASS_ChannelSeconds2Bytes(Chanm, tmn);
                 cueEndPos:= BASS_ChannelSeconds2Bytes(Chanm, tmn);
                   if CueEndPos=0 then
                   cueEndPos:= BASS_ChannelGetLength(chanm, BASS_POS_BYTE);
                   end
                   else   begin
                   lng := qbass_gettime(chanm);
                    cueEndPos:= BASS_ChannelSeconds2Bytes(Chanm, Round(lng));
                    cuePos:=0;
                   end;
                   BASS_StreamFree(Chanm);
                   chanm:=0;
 //  if isscue then
 //if (Length(frm_list.LB4.Items[frm_list.Lb1.ItemIndex])=0) then
 // ss:=frm_list.LB4.Items[frm_list.Lb1.ItemIndex];
  if frm_list.LB4.Items[frm_list.Lb1.ItemIndex]='' then begin

      pos:=cuepos;
       chanm := BASS_StreamCreateFile(false, Pchar(file_name), 0, 0, BASS_STREAM_DECODE or BASS_SAMPLE_FLOAT);
      BASS_ChannelSetAttribute(chanm, BASS_ATTRIB_BUFFER, SizeOf(buffer));

   BASS_ChannelSetPosition(chanm, pos, BASS_POS_BYTE);
    // loop for reading and processing data from the audio channel
   while ( (BASS_ChannelIsActive(chanm) = BASS_ACTIVE_PLAYING) or (BASS_ChannelIsActive(chanm) = BASS_ACTIVE_PAUSED)) and ((fmax<1.0) and (Cuepos<CueEndPos-10 ) )
do begin
     // read a block of data from the audio channel
      bytesRead := BASS_ChannelGetData(chanm, @buffer, SizeOf(buffer));
      if (bytesRead>SizeOf(buffer)) then  begin
      BASS_StreamFree(Chanm);
      Chanm:=0;
      ShowMessage(file_name+' Destroyed');
      result:=1.0;
     BGRAShape2Click(self);
     exit;
      end;
      if bytesRead > 0 then begin
      i:=0;
    // adding code to process the maximum sample level
     bdiv4:=(bytesRead div 4);

     while (i<bdiv4) do begin
      tfl:= abs(buffer[i]);
         fmax:=Max(tfl, fmax);
         i+=1;
        end;
      end;
      // move to the next position in the file
      pos := pos + bytesRead;
      BASS_ChannelSetPosition(chanm, pos, BASS_POS_BYTE);
     cuePos:=cuePos+bytesRead;
     if  (bytesRead =0) or (fmax>=1.0) then  begin
     cuepos:=CueEndPos;
     end;
    end;
   result := fmax;
   Frm_List.LB4.Items[Frm_List.Lb1.ItemIndex]:=FloatToStr(fmax);
BASS_StreamFree(Chanm);
chanm:=0;
fillchar(buffer,sizeof(buffer),0);
 end
   else  begin
     //   fmax:=1;
  result:=StrToFloat(Frm_List.LB4.Items[Frm_List.LB1.ItemIndex]);
   end;
end;
end;



{

function TForm_player.GetMaxLevel1(file_name:string; fstart:integer; fend:integer):single;
var
  chanm: DWORD;
 // channel: HSTREAM;  // audio channel identifier
  buffer: array[0..8192] of Single;  // buffer for reading data from the audio channel
  bytesRead: DWORD;  // number of bytes read from the audio channel
  bdiv4, pos, lng:DWORD;
 // ss:string;
  i:integer;

begin
pos:=0;
 cuePos:=0;
 CueEndPos:=0;
chanm:=0;
fmax:=0;
  // open the audio file and get the audio channel identifier

 { chanm := BASS_StreamCreateFile(False, Pchar(file_name), 0, 0, BASS_STREAM_DECODE);
//Frm_list.Caption:=Frm_List.Lb2.Items[Frm_List.Lb1.ItemIndex];
  if chanm <> 0 then begin
     // set the initial position in the file
    pos := 0;
    // set the buffer size for reading data from the audio channel
 BASS_ChannelSetAttribute(chanm, BASS_ATTRIB_BUFFER, SizeOf(buffer));
 if (Length(frm_list.LB3.Items[frm_list.LB1.ItemIndex])>0) then
 isCue:=True;
                     if iscue then begin
                   frm_list.GetStartT(frm_list.Lb1.ItemIndex);
                     cuePos:= BASS_ChannelSeconds2Bytes(Chanm, tms);
                     frm_list.GetEndT(frm_list.Lb1.ItemIndex);
                   cueEndPos:= BASS_ChannelSeconds2Bytes(Chanm, tmn);
                   if CueEndPos=0 then
                   cueEndPos:= BASS_ChannelGetLength(chanm, BASS_POS_BYTE);
                   end
                   else   begin
                   lng := qbass_gettime(chanm);
                    cueEndPos:= BASS_ChannelSeconds2Bytes(Chanm, Round(lng));
                    cuePos:=0;
                   end;
      pos:=fstart;
       chanm := BASS_StreamCreateFile(false, Pchar(file_name), 0, 0, BASS_STREAM_DECODE or BASS_SAMPLE_FLOAT or BASS_ASYNCFILE or BASS_SAMPLE_MONO);
      BASS_ChannelSetAttribute(chanm, BASS_ATTRIB_BUFFER, SizeOf(buffer));
   BASS_ChannelSetPosition(chanm, pos, BASS_POS_BYTE);
    // loop for reading and processing data from the audio channel
   while ( (BASS_ChannelIsActive(chanm) = BASS_ACTIVE_PLAYING) or (BASS_ChannelIsActive(chanm) = BASS_ACTIVE_PAUSED)) and ((fmax<1.0) and (Cuepos<fend ) )
do begin
     // read a block of data from the audio channel
      bytesRead := BASS_ChannelGetData(chanm, @buffer, SizeOf(buffer));
      if bytesRead > 0 then begin
      i:=0;
    // adding code to process the maximum sample level
     bdiv4:=(bytesRead div 4);
     while (i<bdiv4) do begin
      tfl:= abs(buffer[i]);
         fmax:=Max(tfl, fmax);
         i+=1;
        end;
      end;
      // move to the next position in the file
      pos := pos + bytesRead;
      BASS_ChannelSetPosition(chanm, pos, BASS_POS_BYTE);
     cuePos:=cuePos+bytesRead;
     if  (bytesRead =0) or (fmax>=1.0) then  begin
     cuepos:=CueEndPos;
     end;
    end;
   result := fmax;
BASS_StreamFree(Chanm);
chanm:=0;
fillchar(buffer,sizeof(buffer),0);
 end;

//end;
          }

// stop and free the playback channel
procedure freechannel;
begin
 if channel>0 then begin
 Form_player.EQDeactivate;
BASS_MusicFree(Channel);
BASS_StreamFree(Channel);
channel:=0;
end;
end;


procedure getInitFlags;
begin
 if options_frm.ComboBox3.ItemIndex=0 then begin       //8BITS
B_Init_Flags:= B_Init_Flags or (1 shl 0);
B_Init_Flags:=  B_Init_Flags and not( 1 shl 8 );
// B_Init_Flags:= B_Init_Flags
end
else
  if options_frm.ComboBox3.ItemIndex = 2 then begin    //32BITS float
  B_Init_Flags:= B_Init_Flags or (1 shl 8);
  B_Init_Flags:=  B_Init_Flags and not( 1 shl 0 );
  B_Init_Flags:= B_Init_Flags or BASS_SAMPLE_FLOAT;
  end
   else

  if options_frm.ComboBox3.ItemIndex=1 then begin        //16BITS
  B_Init_Flags:=  B_Init_Flags and not( 1 shl 8 );
  B_Init_Flags:=  B_Init_Flags and not( 1 shl 0 );
  end;
end;

function TForm_player.Player: bool;
var
lbi, err:integer;
s:string;
TagP: pAnsiChar;
url: AnsiString;
ssl:pAnsiChar;
begin
getAFilename;
isStream := false;
s:=copy(Filename, 0, 4);
if filename>'' then begin
isStream:= false;
if copy(Filename,0, 4)='http' then
isStream:= true;
if isStream then
Frm_List.LB1.ItemHeight:=(Frm_List.LB1.Font.Size+4)
else
Frm_List.LB1.ItemHeight:=(Options_frm.UpDown1.Position-4+Options_frm.UpDown1.Position*2);
end;
if SameText(Pchar(FileName), '.cue') or (mode=paused) or (FileName = '') then exit
  else  begin
//check if not paused
//if (mode<>paused) then

//then check whether the file from PlayList exists
//if the file does not exist, exit

// if (FileName = '') then   exit;
//if not FileExists(FileName) then
Delay(200);
result:=true;
if not isStream then
if not FileExists(FileName) then Begin
timer1.Enabled:=false;
mode:=stop;
scrollBar1.Max:=scrollBar1.Min;
ShowMessage(afile +FileName+nosuch);
result:=false;
exit;
end;

 freechannel;

 Label2.Visible:=false;

    if  (channel=0) then
 if (not isStream) then begin
     MaxLevel:=getMaxLevel(FileName);

//try to load the file and get the channel handle
getInitFlags;
ScrollBar1.Visible:=true;
Label2.Visible:=true;
FChannel := BASS_StreamCreateFile(FALSE, PChar(FileName), 0, 0, B_Init_Flags or BASS_STREAM_DECODE);
Channel := BASS_FX_TempoCreate(Fchannel,  BASS_FX_FREESOURCE);
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO_PITCH, FXPitch);
   frm_list.pict:=frm_list.GetPictureFileName(ExtractFilePath(Filename));
if frm_list.pict>'' then  begin
frm_list.Hide;
     Cover_Form.show;
    end;

    end
    else begin
    lbi:=Frm_List.LB1.ItemIndex;
    ScrollBar1.Visible:=false;
 //   Label2.Visible:=false;
 maxlevel:=1.015;

 url:=FileName;
  err:=0;
 BASS_SetConfig(BASS_CONFIG_NET_TIMEOUT, 15000);
 FChannel := BASS_StreamCreateURL(PChar(url), 0, BASS_STREAM_BLOCK or BASS_SAMPLE_FLOAT or BASS_STREAM_DECODE , nil, 0);
 //FChannel := BASS_StreamCreateURL(PChar(url),  0, BASS_STREAM_BLOCK, nil, nil ); // 0, BASS_STREAM_STATUS or BASS_STREAM_BLOCK, nil, nil
 // err:=BASS_ErrorGetCode();
 //if Fchannel=0 then exit;
 err:=BASS_ErrorGetCode();
if (err>0)  then begin
Frm_list.Lb1.ItemIndex:=lbi;
timer1.Enabled:=false;
mode:=stop;
result:=false;
scrollBar1.Min:=0;
scrollBar1.Max:=scrollBar1.Min;
 scrollBar1.Position:=0;
if err=BASS_ERROR_INIT then begin
  ShowMessage(eBASS_ERROR_INIT);exit;
  end;
if err=BASS_ERROR_NOTAVAIL then begin
  ShowMessage(eBASS_ERROR_NOTAVAIL);exit;
  end;
if err=BASS_ERROR_NONET then  begin
  ShowMessage(eBASS_ERROR_NONET);exit; end;
if (err=BASS_ERROR_ILLPARAM) then begin
  ShowMessage(eBASS_ERROR_ILLPARAM);exit; end;
if err = BASS_ERROR_PROTOCOL then begin
  ShowMessage(eBASS_ERROR_PROTOCOL);exit;end;
if err=BASS_ERROR_TIMEOUT then  begin
  ShowMessage(eBASS_ERROR_TIMEOUT);exit; end;
if err=BASS_ERROR_FILEOPEN then begin
  ShowMessage(eBASS_ERROR_FILEOPEN);exit;end;
  if err=BASS_ERROR_FILEFORM then  begin
  ShowMessage(eBASS_ERROR_FILEFORM);exit; end;
  if err=BASS_ERROR_UNSTREAMABLE then begin
  ShowMessage(eBASS_ERROR_UNSTREAMABLE);exit; end;
  if err=BASS_ERROR_NOTAUDIO then begin
  ShowMessage(eBASS_ERROR_NOTAUDIO);exit;end;
  if err=BASS_ERROR_CODEC then begin
  ShowMessage(eBASS_ERROR_CODEC);exit;end;
  if err=BASS_ERROR_FORMAT then begin
  ShowMessage(eBASS_ERROR_FORMAT);exit;end;
  if err=BASS_ERROR_SPEAKER then begin
  ShowMessage(eBASS_ERROR_SPEAKER);exit;end;
  if err=BASS_ERROR_MEM then begin
  ShowMessage(eBASS_ERROR_MEM);exit;end;
    if err=BASS_ERROR_NO3D then  begin
  ShowMessage(eBASS_ERROR_NO3D);exit;end;
    if err=BASS_ERROR_UNKNOWN then begin
  ShowMessage(eBASS_ERROR_UNKNOWN);exit;end;
  //  player;
    exit;
end;
if err=0 then begin
 Channel := BASS_FX_TempoCreate(Fchannel,  BASS_FX_FREESOURCE);
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO or BASS_SAMPLE_FLOAT, FXTempo);
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO_PITCH, FXPitch);
//      MaxLevel:=1.0;
    end;

    end;




   if (channel>0) and( not BASS_ChannelPlay(Channel, false) )then
  begin ShowMessage('File playback error');
  exit;
  end;
     BASS_ChannelPause(Channel);

//   Delay(20);
   if (not off_equalizer) then
   EQActivate;
   init:=True;
   UpdateEQ(aEqualizer);

      BASS_ChannelPlay(Channel, false);
   // Start recording to file
//  encoder := BASS_Encode_Start(FChannel, PChar('./recorded_stream.wav'), BASS_ENCODE_PCM or BASS_ENCODE_AUTOFREE, nil, nil)
//  else
 //   begin
//    ShowMessage('Failed to open stream!');
//    Exit;
//  end;


//   Timer3.Enabled:=True;
//Timer3Timer(self);
ListBox1ItemIndex:= Frm_list.lb1.ItemIndex;
ATTRIB_SRC:=Options_frm.ComboBox5.ItemIndex;
BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_SRC,  ATTRIB_SRC);
BASS_ChannelGetAttribute(fChannel,  BASS_ATTRIB_BITRATE, Bitrate);
BASS_ChannelGetAttribute(Channel,  BASS_ATTRIB_FREQ, ATTRIB_FREQ);
BASS_ChannelGetInfo(Channel, bcinfo);
   if bcinfo.origres=0 then
   label7.Caption:=intTostr(16)+'bit'
    else
    label7.Caption:=intTostr(bcinfo.origres)+'bit';
  //if the channel handle = 0 (for some reason the file cannot be loaded),
//display an error message and exit
if Channel=0 then
delay(100);
if Channel=0 then
  begin ShowMessage(afileerror+BASS_ErrorGetCode().ToString);end;

//assign the form caption to the name of the playing file
//using BASS_ChannelPlay(Channel, False) we try to play the file,
//if this is impossible, display an error message

//if not label4.Visible then  begin

//end;
label4.Caption:=Trunc(Bitrate).ToString+'k';
Label5.Caption:=(Trunc(ATTRIB_FREQ)/1000).ToString+'k';
 //Set PlayMode to play
   TrackBar12Change(Form_player);
   mode:=play;
 label4.Visible:= mode=play; ;
label5.Visible:=label4.Visible;
label7.Visible:=label4.Visible;
label6.Visible:=label4.Visible;
 Timer1.Enabled:=True;
 TrackBar1Change(Form_player);
 if not forminit then begin
 formInit:=True;
 end;
 // Timer3.Enabled:=True;
   end;
end;


procedure TForm_player.Button3Click(Sender: TObject);
begin
  Pb1.Position:=Trunc(13.72654*1000);
  PBMouseMove(self, [ssExtra1] , 10 , 50);
end;



procedure TForm_player.ComboBox1Change(Sender: TObject);
  begin
  ComboBox3Change(self);
 end;


procedure TForm_player.ComboBox3Change(Sender: TObject);
var
 FFTFata : TFFTData;
  pl, st, ps:bool;
  fr:DWORD;
 // speed:Single;
  begin
 st:=false;
   ps:=false;
     pl:=false;
     if (mode = play) then pl:=true
     else
     if (mode = stop) then st:=true
     else
     if (mode = paused) then ps:=true;
    //   mode      :=  paused;
         //Bass_Stop(); //stop playback
           PosTime:=ScrollBar1.Position;
         //    BASS_StreamFree(channel); // free the audio channel
           //    Bass_Free;
                 //channel:=0;
	// Audio initialization - default 44100Hz, stereo, 16 bits
      //  pSound:= Options_frm.ComboBox1.Items[Options_frm.ComboBox1.ItemIndex].ToInt64;
  if Options_frm.ComboBox1.ItemIndex=11 then
      psound:=44100
      else
      pSound :=  samplesDecoder[Options_frm.ComboBox1.ItemIndex];
        getinitflags;
        B_Init_Flags:=B_Init_Flags or B_BitsFormat or BASS_DEVICE_REINIT or BASS_DEVICE_FREQ  ;
     if options_frm.combobox1.ItemIndex=11 then
     fr:= Round(ATTRIB_FREQ)
     else
     fr:=  psound;

    //  if not BASS_Init( 1 , Round(ATTRIB_FREQ), B_Init_Flags , Handle, nil) then

      if not BASS_Init( 1 , fr, B_Init_Flags , Handle, nil) then
    begin
        MessageBox(0,'Audio initialization error',nil,MB_ICONERROR);
		  Halt;
    end;
      BASS_SetConfig(BASS_CONFIG_CD_FREEOLD, 1);
    //BASS_SetConfig(psound, Options_frm.ComboBox5.ItemIndex);
 { if  BASS_ChannelGetAttribute(Channel,BASS_ATTRIB_FREQ, speed)then
    if psound=Trunc(speed) then
    BASS_ChannelSetAttribute(Channel ,  BASS_ATTRIB_FREQ, psound)
    else
     BASS_Init( 1 , psound, B_Init_Flags , Handle, nil);}
    BASS_ChannelSetAttribute(Channel ,  BASS_ATTRIB_SRC, ATTRIB_SRC);


                      BASS_ChannelGetData(Channel, @FFTFata, BASS_DATA_FFT1024);
                   //   mode:=play;
                      init:=false;
                    //  player;

          //   BASS_ChannelSetPosition( Channel , BASS_ChannelSeconds2Bytes(Channel,PosTime), BASS_POS_BYTE);

             if (not pl) then begin
  if st then begin
  BASS_ChannelStop(Channel);
 mode := stop;
 end;
 if ps then begin
  BASS_ChannelStop(Channel);
 mode := paused;
 end;
end;

 end;

procedure TForm_player.ComboBox4CloseUp(Sender: TObject);
begin
if (Options_frm.ComboBox4.ItemIndex=0) then
B_Init_Flags:=B_Init_Flags and 65533;
if (Options_frm.ComboBox4.ItemIndex=1) then
B_Init_Flags:= B_Init_Flags or BASS_SAMPLE_MONO  ;
Options_frm.ComboBox1Change(Self);
end;

procedure TForm_player.CustomClick(Sender: TObject);
begin
  SetPreset(self, aCustom);
end;




procedure TForm_player.SetPreset(Sender: TObject; var Presets:array of float);
var
 i, maxval:Integer;
 tPB:TProgressBar;
 ratio: single;
begin
//Timer1Timer(self);
maxval:=0;
   for i:=1 to 18 do begin
    tpb:= (FindComponent('Pb'+IntToStr(i)) as TProgressBar);
  tpb.Position:=Trunc(Presets[i]*1000);
  maxval:=Max(maxval,tpb.Position);
//  maxval:=tpb.Position;
  tpb.OnMouseMove(tpb, [ssExtra1] , 10 , 50);
  end;
 ratio :=maxval/1000;
 ratio := power(10.0, ratio / 20.0);
{if (BASS_FXGetParameters(fx[0], @pFXvol)) then begin
pFXvol.fTarget:=(1/ratio)+0.05;
pFXvol.fTime:=0;
BASS_FXSetParameters(fx[0], @pFXvol);
end;   }
 Timer3Timer(Self);
   end;

procedure TForm_player.DanceClick(Sender: TObject);
begin
SetPreset(self, aDance );
end;

procedure TForm_player.DeletePlayListClick(Sender: TObject);
begin

// if Frm_List.OpenDialog1.Execute then
//DeleteFile(frm_List.OpenDialog1.FileName);

if MessageDlg(aDelete +'('+frm_List.OpenDialog1.FileName+') '+bFile, mtConfirmation, [mbYes,mbNo], 0) = mrYes
       then DeleteFile( frm_List.OpenDialog1.FileName);
end;


procedure TForm_player.EditorClick(Sender: TObject);
var
 ind:integer;
begin
  Form_addurl.Show;
  edtrack:=true;
  ind:=Frm_List.LB1.ItemIndex;
  if copy(Frm_List.LB2.Items[ind],0, 4)='http' then
 form_addurl.Label1.Caption:='URL'
 else
  form_addurl.Label1.Caption:=aFile;
form_addurl.Edit1.text:=Frm_List.LB2.Items[ind];
form_addurl.Edit2.text:=Frm_List.LB1.Items[ind];

//Form_addurl.Left:=Form_player.Left;
form_addurl.top:=form_player.top + 400;
  form_addurl.left:= form_player.Left+8;
//  form_addurl.Visible:=true;
end;

procedure TForm_player.ElectronicClick(Sender: TObject);
begin

SetPreset(self, aElectronic );

end;

procedure TForm_player.FlatClick(Sender: TObject);
var
i:integer;
begin
  for i:=1 to 18 do begin
  (FindComponent('Pb'+IntToStr(i)) as TProgressBar).Position:=0;
  (FindComponent('Pb'+IntToStr(i)) as TProgressBar).OnMouseMove(FindComponent('Pb'+IntToStr(i)), [ssExtra1] , 10 , 50);
  end;
end;

procedure TForm_player.FormActivate(Sender: TObject);
begin

lnVolume:=Options_frm.CheckBox1.Checked;
TonComp :=Options_frm.CheckBox2.Checked;

end;

var
effectTop:Bool = false;

procedure TForm_player.FormChangeBounds(Sender: TObject);
var
t, h :integer;
R:Trect;

begin

if form_addurl.Visible then begin
form_addurl.top:=form_player.top + 400;
  form_addurl.left:= form_player.Left+9;
form_player.FormStyle:=fsNormal;
form_addurl.FormStyle:=fsStayOnTop;

//  form_addurl.Visible:=true;
  end;

{if form_addurl.Visible then begin
  form_addurl.left:= frm_list.Left;
  form_addurl.top:=frm_list.top + 80;
  frm_list.FormStyle:=fsNormal;
  form_addurl.Visible:=true;
  end; }


 if ( not Frm_effects.Visible) then begin
    if (left + width +options_frm.Width)<screen.Width then
    options_frm.left:=Left+Width+1
    else begin
    options_frm.left:=left-options_frm.Width-1;
   //  caption:=inttostr(options_frm.left);
    end;
end
    else begin

    if effecttop then
   Frm_effects.top:=top
   else
   Frm_effects.top:=top+options_frm.Height+1;
        if (left + width + Frm_effects.Width)<screen.Width then
    Frm_effects.left:=Left+Width+1
    else
    Frm_effects.left:=left-Frm_effects.Width-1;
   if  options_frm.Visible then
   if (left + width +options_frm.Width)<screen.Width then
    options_frm.left:=Left+Width+1
    else
    options_frm.left:=left-options_frm.Width-1;

    end;
  if not effecttop then
options_frm.top:=top
  else
  options_frm.top:=top+Frm_effects.Height+1;
    if frm_List.visible or Cover_Form.Visible then begin
     frm_List.Left:=left;
     t:=Height;
     R.Top:=top;
      t:=GetWindowRect(Handle,R);
      h:=R.Bottom-R.Top;
     frm_List.Top:=top+h+1;
     Cover_Form.Top:= frm_List.Top;
     Cover_Form.left:=left;
    end;
  end;


procedure TForm_player.FormClose(Sender: TObject);
  var
i:integer;
Fil: File of Single;
begin
 AssignFile(fil, './swampproperties/customEq.dat');
 Rewrite(fil);
 for i:=0 to 19 do
 Write(fil, aCustom[i]);
 CloseFile(fil);

  Options_frm.XMLPropStorage1.Save;
 Frm_Effects.XMLPropStorage1.Save;
 Frm_List.XMLPropStorage1.Save;
 Frm_List.XMLPropStorage1.FileName:='./swampproperties/listprop.xml';
 Frm_List.XMLPropStorage1.Save;
  XMLPropStorage1.Save;
    if Frm_list.lb1.ItemIndex>-1 then begin
         Frm_list.lb1.ItemIndex:= ListBox1ItemIndex;
         Frm_list.lb1.Tag:=ListBox1ItemIndex;
          Frm_List.XMLPropStorage1.Save;
         end;
// Free objects before closing
   frm_list.Close;
Timer1.Enabled:=False;
mode:=stop;
Bass_Stop(); //stop playback
  BASS_StreamFree(channel); // free the audio channel
  Bass_Free; //free resources used by Bass
  frm_effects.Close;
   frm_effects.free;
  options_frm.Close;

 // Spectrum.BackBmp.Free;
//  Spectrum.VisBuff.Free;
// Spectrum.free;

  form1.Close;
  if Assigned(DBusKeys) then
    FreeAndNil(DBusKeys);
end;

procedure TForm_player.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
// Options_frm.Close;
   if options_frm.Visible then
    options_frm.Visible:=False;
 Frm_Effects.Close;
CanClose:=closePlayer;
if HidePlayList then
frm_list.Close;
if NOT closePlayer then begin
 SysTrayIcon.Visible:=True;
 // Frm_List.lb3.ItemIndex:=Frm_List.lb1.ItemIndex;
// Frm_List.lb2.ItemIndex:=Frm_List.Lb1.ItemIndex;

 Options_frm.XMLPropStorage1.Save;
 Frm_Effects.XMLPropStorage1.Save;
 Frm_List.XMLPropStorage1.Save;
 Frm_List.XMLPropStorage1.FileName:='./swampproperties/listprop.xml';
 Frm_List.XMLPropStorage1.Save;
  XMLPropStorage1.Save;
 hide;
end;

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

var
loadFromDialog:integer = -1;
{isDirDrop:bool;


CuePlayList:string;    }
//isFromDir:Bool = false;
{
procedure TForm_player.FormDropFiles(Sender: TObject;
  const FileNames: array of string);
var
  LInd,Counter: Integer;
  fpath, s, v, track, title, af, perf, timepos: string;
  f: TextFile;
 i, bitrat, mem, ind:integer;
begin

for i:=0 to 10 do begin
Frm_list.lb1.Cursor:=crHourGlass;
delay(3);
Application.ProcessMessages;
end;
Frm_list.lb1.Cursor:=crHourGlass;
Application.ProcessMessages;
//timer1.Enabled:=false;
//scrollbar1.Min:=0;
Bitrate := 0;
       if LB2.Count=0 then
     ind:=0
     else
     if Lb2.Count>0 then
     ind:=Lb2.Count-1;
       lInd:=High(FileNames);
  for Counter := 0 to LInd do
  begin
   //  if (FilterExt(FileNames[Counter]) or ( SameText(ExtractFileExt(FileNames[Counter]), '.cue')) )  then
    if DirectoryExists(FileNames[Counter]) then
    frm_list.GetFilesInDirs(FileNames[Counter])
    else
    begin
      if SameText(ExtractFileExt(FileNames[Counter]), '.cue') then begin
   //   CuePlayList:= copy( FileNames[Counter], 1, Length(FileNames[Counter])-4);;
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
          end
          else if s.StartsWith('TRACK') then
            track := Trim(Copy(s, Pos('TRACK', s) + 5, 3))
          else if s.StartsWith('TITLE') then
            title := Trim(Copy(s, Pos('"', s) + 1, Length(s) - Pos('"', s) - 1))
          else if s.StartsWith('PERFORMER') then
            perf := Trim(Copy(s, Pos('"', s) + 1, Length(s) - Pos('"', s) - 1))
        //  else if (s.StartsWith('INDEX 01')) and (ExtractFileExt(FileNames[Counter])<>'.cue' )   then
               else if (s.StartsWith('INDEX 01'))  then
          begin
            timepos := Copy(s, Pos(':', s) - 2, 8);

            Frm_list.lb1.Items.Add(Format('%d - %s. %s - %s', [Frm_list.lb1.Count + 1, track, perf, title])+' - ('+IntToStr(bitrat)+'kbps)');
          //  LB2.Items.Add(ExtractFilePath(FileNames[Counter]) + af);
          LB2.Items.Add(fpath + af);
            filename := fpath + af;
            LB3.Items.Add(timepos);
          end;
        end;
        CloseFile(f);

        if autoStart then begin
         Frm_list.lb1.ItemIndex:=0;
        if ind>0 then
        Frm_list.lb1.ItemIndex:=ind+1;
         scrollBar1.Position:=0;
//          mode := play;

scrollbar1.Min:=0;
//          player;
        end;
 //               if Counter = High(FileNames)-1 then
 //       exit;
      end
      else
if     Counter <= LInd then
   //   if (FilterExt(FileNames[Counter]) and (CuePlayList <> copy( FileNames[Counter], 1, Length(FileNames[Counter])-4) )  )  then
       if (FilterExt(FileNames[Counter]))  then
      begin
      bitrat:=GetBitrate(FileNames[Counter]);
        isCue := False;
        LB3.Items.Add('');
        LB2.Items.Add(FileNames[Counter]);
        Frm_list.lb1.Items.Add(Format('%d - %s', [Frm_list.lb1.Count + 1, ExtractFileName(FileNames[Counter])])+' - ('+IntToStr(Bitrat)+'kbps)');
        if Counter = 0 then
          init := False;

      end;

    end;

  end;
                   if autoStart then
        begin
          if (loadFromDialog=0) then begin
          if ind>0 then
        mem:=ind+1;
//        else
//        mem:=0;
          loadFromDialog:=1+loadFromDialog;
          Frm_list.lb1.ItemIndex:=mem;
          end; {else
          if (loadFromDialog >0) then
           Frm_list.lb1.ItemIndex:=LastPosDialog
        //  else }

procedure TForm_player.FormHide(Sender: TObject);
begin
  off_analizer:=true;

end;


procedure TForm_player.FormKeyPress(Sender: TObject; var Key: char);
begin
     if not(Key <> ' ') then begin
    BGRAShape3Click(Sender);
   end;
end;

procedure TForm_player.FormPaint(Sender: TObject);
var
fr:DWORD;
begin
  //Caption:=VerInfo;
   //  BitBtn2.Caption:='';

   BitBtn2.Height:=24;
   BitBtn2.Width:=BitBtn1.Width;
  if isFirst then begin
  isFirst:=False;
  if options_frm.ComboBox3.ItemIndex=0 then begin
    B_Init_Flags:= B_Init_Flags or (1 shl 0);
    B_Init_Flags:=  B_Init_Flags and not( 1 shl 8 );
    end;
       if options_frm.ComboBox3.ItemIndex = 2 then begin
       B_Init_Flags:= B_Init_Flags or (1 shl 8);
       B_Init_Flags:=  B_Init_Flags and not( 1 shl 0 );
       B_Init_Flags:= B_Init_Flags or BASS_SAMPLE_FLOAT;

       end;
       if options_frm.ComboBox3.ItemIndex=1 then begin
       B_Init_Flags:=  B_Init_Flags and not( 1 shl 8 );
       B_Init_Flags:=  B_Init_Flags and not( 1 shl 0 );
       end;
   //  pSound:= Options_frm.ComboBox1.Items[ Options_frm.ComboBox1.ItemIndex].ToInt64;
       if  Form_player.Tag=2 then
       begin
    //   psound:=44100;
       Form_player.Tag:=3;
       Options_Frm.UpDown1Click(self);
       Options_frm.ComboBox1.ItemIndex:=11;
     //  options_frm.UpDown1.OnClick(self);
 //      options_frm.UpDown1.up;
       end
       else
       if  Options_frm.ComboBox1.ItemIndex=11 then
      psound:=Round(ATTRIB_FREQ)
   else
   psound:=samplesDecoder[Options_frm.ComboBox1.ItemIndex];



   B_Init_Flags:=B_Init_Flags or B_BitsFormat or BASS_DEVICE_REINIT or BASS_DEVICE_FREQ;
   if not BASS_Init(1, psound, B_Init_Flags, Handle, nil) then
   begin
     MessageBox(0,'Audio initialization error',nil,MB_ICONERROR);
       	  Halt;
   end;
   BASS_SetConfig(BASS_CONFIG_CD_FREEOLD, 1);
   BASS_SetConfig(BASS_CONFIG_SRC,Options_frm.ComboBox5.ItemIndex);
  end;

//    paintBox1.Repaint;
 //   draw;
  {
  With Options_frm.ComboBox3 do
Begin
//if ItemIndex=0 then B_BitsFormat:= BASS_SAMPLE_8BITS;
//if ItemIndex=1 then B_BitsFormat:= 0;
//if ItemIndex=2 then B_BitsFormat:= BASS_SAMPLE_FLOAT;
end;


B_Init_Flags:=B_Init_Flags or B_BitsFormat;

       if (Options_frm.ComboBox4.ItemIndex=0) then
     B_Init_Flags:= B_Init_Flags or BASS_DEVICE_STEREO;
     if (Options_frm.ComboBox4.ItemIndex=1) then
     B_Init_Flags:= B_Init_Flags or 2;
	// Audio initialization - default 44100Hz, stereo, 16 bits
        pSound    := Options_frm.ComboBox1.Items[ Options_frm.ComboBox1.ItemIndex].ToInt64;
    if not BASS_Init(1, psound, B_Init_Flags, Handle, nil) then
    begin
      MessageBox(0,'Audio initialization error',nil,MB_ICONERROR);
		  Halt;
    end;
    BASS_SetConfig(BASS_CONFIG_SRC,Options_frm.ComboBox5.ItemIndex);
{BGRAShape1.FillGradient.StartColor:=TrackBar1.Color;

//Spectrum    := TSpectrum.Create(PaintBox1.Width, PaintBox1.Height);
TimerRender.Enabled:=True;     }
{if (ParamCount>0) then begin

                           if FilterExt(ParamStr(1))  then begin
                                              Frm_list.lb1.Items.Add(ExtractFileName(ParamStr(1)));
                                              LB2.Items.Add(ParamStr(1));
                                                           end;
 i:=0;

init:=false;
mode:=play;
Filename := LB2.Items.Strings[i];
Timer5.Enabled:=true;
end;

  end;
        }

//  drawnet;

end;








procedure TForm_player.LoadLibsInDirs(Dir:string);
var DirInfo:TSearchRec;
begin
  if FindFirst(Dir+DirectorySeparator+'libbass?*.so', faAnyFile and faDirectory, DirInfo)=0 then
    repeat
      if (DirInfo.Attr and faDirectory) = faDirectory then // it's a dir - go get files in dir
        begin
          if (DirInfo.Name<>'.') and (DirInfo.Name<>'..') then
            Frm_list.GetFilesInDirs(Dir+DirectorySeparator+DirInfo.Name);
        end
      else begin
           if (BASS_PluginLoad(PChar(Dir+DirectorySeparator+DirInfo.Name), 0)=0) then
          showMessage('Error load '+DirectorySeparator+DirInfo.Name);
        end ;
        until FindNext(DirInfo)<>0;
  FindClose(DirInfo);
end;

procedure TForm_player.TrackBar1Enter(Sender: TObject);
begin
      Panel2.SetFocus;
end;


procedure TForm_player.TrackBar1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  TrackBar1.Position:=TrackBar1.Position+(WheelDelta div 120);
 Handled := True;

end;



procedure TForm_player.VocalClick(Sender: TObject);
begin
SetPreset(self, aVocal );
end;

procedure TForm_player.XMLPropStorage1RestoreProperties(Sender: TObject);
var
s:string;
i,j:integer;
 //dw:longint;
 //path,fname:string;
finded:Bool;
begin

  finded:=false;
if Form_player.Tag=0 then
  begin
  Panel1.Visible:=not Eq_Hide;

height:=panel2.Height;

  Form_player.Tag:=1;
  first:=true;
    s:=Copy(GetEnvironmentVariable('LANGUAGE'), 1, 2);
    //caption:=s;
    for i:=0 to 9 do
 if s=tLang[i] then begin
  for j:=0 to ComponentCount-1 do
   if (Components[j] is TMenuItem) then
   if ((Components[j] as TmenuItem).Name='Lang'+intToStr(i+1)) then  begin
   (Components[j] as TMenuItem).OnClick((Components[j] as TMenuItem));;   ////
 //  (Components[j] as TMenuItem).Checked:=true;
// Language.Tag:=i;
   finded:=true;
  // Form_player.Refresh;
   end;

 end;
   if (not finded) then
  Lang2.OnClick(Lang2);
//SetDefaultLang('en' , 'languages');

//end
end

else
SetDefaultLang(tLang[Language.Tag], 'languages');


end;












procedure TForm_player.FormShortCut(var Msg: TLMKey; var Handled: Boolean);
begin
  //Disable/Enable equalizer
    if Msg.CharCode = Ord('Q') then
  if (GetKeyState(VK_CONTROL) < 0) then
  begin
  Handled := True;
  OffEqualizerClick(Self);

end;

     if Msg.CharCode = Ord(VK_MEDIA_PLAY_PAUSE ) then
//  if (GetKeyState(VK_PLAY) < 0) then
  begin
  Handled := True;
  BGRAShape1Click(self);

end;

  //Hide/Show equalizer
  if Msg.CharCode = Ord('Q') then
  if (GetKeyState(VK_SHIFT) < 0) then
  begin
  Handled := True;
//  BitBtn1Click(Self);
  HideEqualizerClick(Self);

end;
  //Disable/Enable analyzer
  if Msg.CharCode = Ord('A') then
  if (GetKeyState(VK_CONTROL) < 0) then
  begin
  Handled := True;
  MenuOnStopStart(Self);

end;
  //Line/Histogram analyzer
    if Msg.CharCode = Ord('L') then
  if (GetKeyState(VK_CONTROL) < 0) then
  begin
  Handled := True;

end;

    //Hide/Show list
    if Msg.CharCode = Ord('L') then
  if (GetKeyState(VK_SHIFT) < 0) then
  begin
  Handled := True;
  HideListClick(Self);

end;


end;

var
opt:string;
procedure TForm_player.FormShow(Sender: TObject);

begin

UpdateToncomp;
  LabelEqRefresh;
 Caption:=VerInfo;
  PaintBox1.Refresh;
end;

procedure TForm_player.FullBassAndTrebleClick(Sender: TObject);
begin
SetPreset(self, aFullBassAndTreble );
end;

procedure TForm_player.FullBassClick(Sender: TObject);
begin
SetPreset(self, aFullBass );
end;

procedure TForm_player.FullTrebleClick(Sender: TObject);
begin
SetPreset(self, aFullTreble );
end;

procedure TForm_player.HeadphonesClick(Sender: TObject);
begin
SetPreset(self, aHeadPhones );
end;

procedure TForm_player.HeavyMetalClick(Sender: TObject);
begin
SetPreset(self, aHeavyMetal);
end;


procedure TForm_player.HideListClick(Sender: TObject);
begin
Frm_List.Visible:=List_Hide;
 List_Hide:=not List_Hide;
ShowList.Visible:=List_Hide;

if list_Hide then begin
    if EQ_Hide then begin
 Height:=panel5.Height+panel2.Height+5;

  end else begin
 Height:=panel1.Height+ panel5.Height+panel2.Height+5;
//   Frm_List.Visible:=List_Hide;
  end;
  end else begin
     if EQ_Hide then begin
form_player.Height:=panel5.Height+panel2.Height+5;

     end else begin
    form_player.Height:=panel1.Height+panel5.Height+panel2.Height+5;

 end;
  end;
 bgraShape11.Height:=form_player.Height-1;
FormChangeBounds(self);
//Frm_List.Visible:=List_Hide;
end;

procedure TForm_player.HipHopClick(Sender: TObject);
begin
SetPreset(self, aHipHop );
end;

procedure TForm_player.IndustrialClick(Sender: TObject);
begin
SetPreset(self, aIndustrial );
end;

procedure TForm_player.JazzClick(Sender: TObject);
begin
SetPreset(self, aJazz );
end;

procedure TForm_player.Lang1Click(Sender: TObject);
begin
LangClick(Sender);
end;

procedure TForm_player.Lang7Click(Sender: TObject);
begin

end;


procedure TForm_player.LanguageClick(Sender: TObject);
begin
  Form_player.Repaint;
  optCBIndex[1]:= Options_Frm.ComboBox1.ItemIndex;
    optCBIndex[2]:= Options_Frm.ComboBox3.ItemIndex;
      optCBIndex[3]:= Options_Frm.ComboBox4.ItemIndex;
        optCBIndex[4]:= Options_Frm.ComboBox5.ItemIndex;


end;



procedure TForm_player.LargeHallClick(Sender: TObject);
begin
SetPreset(self, aLargeHall );
end;



procedure TForm_player.LB1KeyDown(Sender: TObject);
begin

end;




procedure TForm_player.LB1MouseDown(Sender: TObject);
begin
     if Frm_list.lb1.ItemIndex>=0 then begin
        MenuItem5.Visible:=true;
     ClearList.Visible:=true;
     end
     else begin
     ClearList.Visible:=false;
     MenuItem5.Visible:=false;;
     end;
end;



procedure TForm_player.LB2DrawItem;
begin
  LB3.TopIndex:=LB3.Count;
end;


procedure TForm_player.ListBoxMenuPopup(Sender: TObject);
begin
//SetDefaultLang(tLang[Language.Tag], 'languages');
//Form_player.Repaint;
//  OpenPlayList.Caption:=openplaylistCaption;
  if List_Hide then begin
ShowList.ImageIndex:=1;
end
else begin
  ShowList.ImageIndex:=4;
  if Frm_list.lb1.Items.Count>0
      then  begin
      ClearList.Visible:=true;
      menuItem5.Visible:=true;
      end;

end;


end;

procedure TForm_player.LiveClick(Sender: TObject);
begin
SetPreset(self, aLive );
end;

procedure TForm_player.LangClick(Sender: TObject);
var
tag:integer;
begin
if (Sender is TMenuItem) then Begin
//tag:=Form_Player.Tag;
tag:=(Sender as TMenuItem).tag;
(Sender as TMenuItem).Checked:=true;
  setDefaultLang(tLang[tag], 'languages');
  Language.Tag:=tag;
 if Form_player.tag > 1 then begin
  Options_frm.ComboBox4.Items[0]:=stereo;
  Options_frm.ComboBox4.Items[1]:=mono;
  Options_frm.ComboBox4.Text:=Options_frm.ComboBox4.Items[optCBIndex[3]];
    Options_frm.ComboBox4.ItemIndex:= optCBIndex[3]; ;
   Options_frm.ComboBox3.ItemIndex:=  optCBIndex[2];
      Options_frm.ComboBox1.ItemIndex:=optCBIndex[1] ;

             Options_frm.ComboBox5.Items[0]:= interpolat0;
            Options_frm.ComboBox5.Items[1]:= interpolat1;
            Options_frm.ComboBox5.Items[2]:= interpolat2;
            Options_frm.ComboBox5.Items[3]:= interpolat3;
            Options_frm.ComboBox5.Items[4]:= interpolat4;
  Options_frm.ComboBox5.Text:=Options_frm.ComboBox5.Items[optCBIndex[4]];
  Options_frm.ComboBox5.ItemIndex:= optCBIndex[4];
  frm_Effects.ComboBox1.Items[0]:= FlChor0;
  frm_Effects.ComboBox1.Items[1]:= FlChor1;
  frm_Effects.ComboBox1.Items[2]:= FlChor2;
  frm_Effects.ComboBox1.Items[3]:= FlChor3;
  frm_Effects.ComboBox1.Items[4]:= FlChor4;
  frm_Effects.ComboBox1.Items[5]:= FlChor5;
  frm_Effects.ComboBox1.Items[6]:= FlChor6;
  frm_Effects.ComboBox1.Items[7]:= FlChor7;
  Options_frm.Panel12.Caption:=params;
  Options_frm.Panel10.Caption:=playlist;
  end;


       Form_player.tag:=2;
       Caption:=VerInfo;
       label4.Caption:=Trunc(Bitrate).ToString+'k';
Label5.Caption:=(Trunc(ATTRIB_FREQ)/1000).ToString+'k';
//for i:=1 to 18 do
//(FindComponent('LblEQ' +IntToStr(i)) as TLabel).Caption:=;
LabelEqRefresh;
UpdateTonComp;
  end;
{frm_Effects.ComboBox1.Items[0]:= FlChor0;
frm_Effects.ComboBox1.Items[1]:= FlChor1;
frm_Effects.ComboBox1.Items[2]:= FlChor2;
frm_Effects.ComboBox1.Items[3]:= FlChor3;
frm_Effects.ComboBox1.Items[4]:= FlChor4;
frm_Effects.ComboBox1.Items[5]:= FlChor5;
frm_Effects.ComboBox1.Items[6]:= FlChor6;
frm_Effects.ComboBox1.Items[7]:= FlChor7;}
end;

procedure TForm_player.HideEqualizerClick(Sender: TObject);
begin
Eq_Hide:= not Eq_Hide;
Options_frm.CheckBox4.Checked:=Eq_Hide ;
if Eq_Hide then
HideEqualizer.Tag:=1
else
HideEqualizer.Tag:=0;
 MenuItem1Click1(self);
end;

procedure TForm_player.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm_player.MenuItem1Click1(Sender: TObject);
begin

 HideEq.Visible:=Eq_Hide;
if List_Hide then begin    //If the list is hidden, show it
if EQ_hide then begin     //If the equalizer is hidden

     Form_Player.Height:=Panel2.Height+Panel5.Height+4;
      HideEqualizer.Caption:='Show Equalizer';
       Panel1.Visible:=False;
end
else begin            //If the equalizer is visible
Form_Player.Height:=panel5.Height+panel2.Height+Panel5.Height+4;
//Panel1.Top := Panel5.Height+panel2.Height;
panel1.Visible:=True;

HideEqualizer.Caption:=hideq;
  end;
end else begin              //Hide list
if EQ_hide then begin       //If the equalizer is hidden
Form_Player.Height:=Panel2.Height+Panel5.Height+4;
 // Panel4.Top:=Panel1.Top-1;
HideEqualizer.Caption:='Show Equalizer';
//BgraShape11.Height:= Form_Player.Height-1;
 Panel1.Visible:=False;
end else begin              //If the equalizer is visible
Form_Player.Height:=panel5.Height+panel2.Height+Panel1.Height+5;
//Panel1.Top := Panel4.Top;
panel1.Visible:=True;
//Panel4.Top:= Panel1.Top+Panel1.Height-1;
// BgraShape11.Height:= Form_Player.Height-1;
HideEqualizer.Caption:=hideq;
  end;
//panel4.Visible:=True;;
end;
end;

procedure TForm_player.LoadCustomEqClick(Sender: TObject);
begin
  SetPreset(self, aCustom);
end;

procedure TForm_player.MenuItem7Click(Sender: TObject);
begin

end;

procedure TForm_player.Neg25Click(Sender: TObject);
begin
  FXTempo:=-75.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.Neg50Click(Sender: TObject);
begin
  FXTempo:=-50.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.Neg75Click(Sender: TObject);
begin
  FXTempo:=-25.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.OpenPlayListClick(Sender: TObject);
begin
if Frm_List.OpenDialog1.Execute then begin
//BGRAShape2Click(self);
StopMenuClick(self);
application.ProcessMessages;
//Frm_List.XMLPropStorage1.FileName:='./swampproperties/listprop.xml';
ClearList.Visible:=False;
filename:='';
Frm_List.ListClear(self);

//clearlistClick(self);

ClosePlayListClick(self);
  Frm_List.XMLPropStorage1.FileName:= Frm_List.OpenDialog1.Filename;
 // Frm_List.XMLPropStorage1.
  Frm_List.XMLPropStorage1.Restore;
 Frm_List.XMLPropStorage1.FileName:='./swampproperties/listprop.xml';
  Frm_List.XMLPropStorage1.Save;
  Frm_List.XMLPropStorage1.Restore;
form_player.FormChangeBounds(self);
isStream:= false;
if copy(Frm_List.lb2.items[0],0, 4)='http' then
isStream:= true;
if isStream then
Frm_List.LB1.ItemHeight:=(Frm_List.LB1.Font.Size+4)
else
Frm_List.LB1.ItemHeight:=(Options_frm.UpDown1.Position-4+Options_frm.UpDown1.Position*2);

if autostart then
form_player.FormChangeBounds(self);
player;

end;
end;

procedure TForm_player.draw;
Var
koef, i, offset : integer;
begin
// panel5.Caption:='SW-AMP';
with Form_Player.paintBox1.Canvas  do Begin
 Form_Player.paintBox1.Canvas.lock;
try
 offset:=1;
        Pen.Color:=clBtnShadow;
 //Pen.Color:=clRed;
      Pen.Style:=psSolid;
     //   Pen.Mode:= pmXor;
        Pen.Width:=2;

        //Top line
        moveTo(offset,1);
        lineTo(Form_Player.paintBox1.width,1);

         //Bottom line
         moveTo(offset,Form_Player.paintBox1.Height-1);
         lineTo(Form_Player.paintBox1.width-2,Form_Player.paintBox1.Height-1);

      Pen.Width:=2;
        //Left line
         moveTo(offset,2);
         lineTo(offset,Form_Player.paintBox1.Height-1);

         //Right line
         moveTo(Form_Player.paintBox1.width-1,2);
         lineTo(Form_Player.paintBox1.width-1,Height-1);

         Pen.Width:=1;
  Pen.Style:=psDot;

    koef:=  (Form_Player.paintBox1.width div 10);
       for i:=1 to koef do begin
           moveTo((offset+(i*koef)+2),2);
           lineTo((offset+(i*koef+2)),Form_Player.paintBox1.Height-1);
        end;
        Pen.Width:=1;
        koef :=(Form_Player.paintBox1.Height div 4);
            for i:=1 to koef do begin
             moveTo(offset ,koef*i);
          lineTo((offset+Form_Player.paintBox1.width-2), koef*i);
            End;
finally
  Form_Player.paintBox1.Canvas.Unlock;
end;

end;

end;

var
isBack:Bool=false;
procedure TForm_player.PaintBox1Paint(Sender: TObject);
var
koef, i, offset : integer;
R:Trect;

begin

//if mode=play then begin
// if mode=play then begin
if (not is_BackGround)  then begin
Spectrum.UseBkg:=true;
is_Background:=true;
  end;

 if spectrum.ifend and isBack then begin
  paintBox1.Canvas.Lock;
  try
 if spectrum.ifend then
 paintBox1.Canvas.CopyRect(Rect(0, 0, Spectrum.BackBmp.Width, Spectrum.BackBmp.Height), Spectrum.VisBuff.Canvas, Rect(0, 0, Spectrum.BackBmp.Width, Spectrum.BackBmp.Height));
 // draw;
  finally
      paintBox1.Canvas.UnLock;
    end;
 end;


    //  panel5.Caption:='';
//end ;


 if (not isback) and (mode=play) then begin
// panel5.Caption:='';
 draw;
 Spectrum.BackBmp.Canvas.CopyRect(Rect(0, 0, Spectrum.BackBmp.Width, Spectrum.BackBmp.Height), PaintBox1.Canvas, Rect(0, 0, Spectrum.BackBmp.Width, Spectrum.BackBmp.Height));
 //paintBox1.Canvas.CopyRect(Rect(0, 0, Spectrum.BackBmp.Width, Spectrum.BackBmp.Height), Spectrum.BackBmp.Canvas, Rect(0, 0, Spectrum.BackBmp.Width, Spectrum.BackBmp.Height));
isBack:=True;
 end;

   draw;
 //end;
end;






procedure TForm_player.CopyToCustomEqClick(Sender: TObject);
var
i:integer;
begin
for i:=1 to 18 do begin
 aCustom[i]:=((FindComponent('PB'+IntToStr(i)) as TProgressBar).Position/1000);
 if i=1 then
 aCustom[i-1]:=aCustom[i];
  if i=18 then
 aCustom[i+1]:=aCustom[i];
end;

end;



procedure TForm_player.SavePlayListDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
begin

end;

procedure TForm_player.SavePlayListClick(Sender: TObject);
var
lp:string;
ix:Integer;
begin
 if Frm_List.SaveDialog1.Execute then begin
  Frm_List.XMLPropStorage1.Save;
 lp:=  Frm_List.XMLPropStorage1.FileName;
 Frm_List.XMLPropStorage1.FileName:= Frm_List.SaveDialog1.Filename;
 Frm_List.XMLPropStorage1.Save;

// ix:=Frm_List.Lb1.ItemIndex;

//  Frm_List.Lb1.ItemIndex:=ix;
//  Frm_List.Lb1.ItemIndex:=ix;
// Frm_List.XMLPropStorage1.Save;
// clearListClick(self);

// Frm_List.Lb1.ItemIndex:=ix;
 //Frm_List.StatusBar1.Panels.Items[0].Text:=XMLPropStorage1.FileName;
 end;
  Frm_List.XMLPropStorage1.FileName:=lp;
 // Frm_List.XMLPropStorage1.Restore;
end;

procedure TForm_player.SNormalClick(Sender: TObject);
begin
  FXTempo:=0.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.OffEqualizerClick(Sender: TObject);
begin
 //       Options_frm.CheckBox5.Checked:=  not Options_frm.CheckBox5.Checked;
  //       MenuItem2Click1(Self);

       Off_Equalizer:= not  Off_Equalizer;
Options_frm.CheckBox5.Checked:= Off_Equalizer ;
 MenuItem2Click1(Self);
 //eqActivate;
 //if not off_equalizer then begin
 //EQDeActivate;
 updateEq(aEqualizer);

// end;
Timer3Timer(Self);
end;

  procedure TForm_player.HideEqClick(Sender: TObject);
begin
Eq_Hide:= not Eq_Hide;
 HideEq.Visible:=Eq_Hide;
//
//TimerHider.Enabled:=True;
if List_Hide then begin    //If the list is hidden, show it
 if EQ_hide then begin     //If the equalizer is hidden

  Form_Player.Height:=Panel2.Height+Panel5.Height+9;
  //Panel4.Top:=Panel5.Height+panel2.Height;
HideEqualizer.Caption:='Show Equalizer';
BgraShape11.Height:= Form_Player.Height-1;
 Panel1.Visible:=False;
end else begin            //If the equalizer is visible
Form_Player.Height:=panel5.Height+panel2.Height+Panel5.Height+9;
Panel1.Top := Panel5.Height+panel2.Height;
panel1.Visible:=True;
//Panel4.Top:= Panel5.Height+panel2.Height+Panel1.Height;
 BgraShape11.Height:= Form_Player.Height;
HideEqualizer.Caption:='Hide Equalizer';
  end;
end else begin              //Hide list
if EQ_hide then begin       //If the equalizer is hidden
Form_Player.Height:=Panel2.Height+Panel5.Height+11;
  //Panel4.Top:=Panel1.Top-1;
HideEqualizer.Caption:='Show Equalizer';
BgraShape11.Height:= Form_Player.Height-1;
 Panel1.Visible:=False;
end else begin              //If the equalizer is visible
Form_Player.Height:=panel5.Height+panel2.Height+Panel1.Height+7;
//Panel1.Top := Panel4.Top;
panel1.Visible:=True;
//Panel4.Top:= Panel1.Top+Panel1.Height-1;
 BgraShape11.Height:= Form_Player.Height-1;
HideEqualizer.Caption:='Hide Equalizer';
  end;
//panel4.Visible:=True;;
end;
end;



procedure TForm_player.MenuItem2Click1(Sender: TObject);
var
  i:integer;
begin
  If Off_Equalizer then begin
  if channel>0 then
     begin
     if mode=play then
    BASS_ChannelPause(Channel);
    for i:=1 to 18  do
    if BASS_ChannelRemoveFX(Channel,fx[i]) then
     fx[i]:=0;
    //showMessage('Not delete equalizer - error:'+ inttostr(BASS_ErrorGetCode()));
 //   UpdateTonComp;

     EQActivate;

 //BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_VOL, 1);
    if mode=play then
    BASS_ChannelPlay(Channel, false);
   PB1.Enabled:=false;
     PB2.Enabled:=false;
       PB3.Enabled:=false;
         PB4.Enabled:=false;
           PB5.Enabled:=false;
             PB6.Enabled:=false;
               PB7.Enabled:=false;
                 PB8.Enabled:=false;
                   PB9.Enabled:=false;
                   PB10.Enabled:=false;
                 PB11.Enabled:=false;
               PB12.Enabled:=false;
             PB13.Enabled:=false;
           PB14.Enabled:=false;
         PB15.Enabled:=false;
       PB16.Enabled:=false;
     PB17.Enabled:=false;
   PB18.Enabled:=false;
     end;
     for i:=1 to 18 do begin
  (FindComponent('LblEQ' +IntToStr(i)) as TLabel).Enabled:=False;
  end;
  end else begin
 if mode=play then
       BASS_ChannelPause(Channel);
  EQActivate;
         if channel>0 then  begin

        UpdateEQ(aEqualizer);

         end;
  if mode=play then
          BASS_ChannelPlay(Channel, false);

    PB1.Enabled:=true;
     PB2.Enabled:=true;
       PB3.Enabled:=true;
         PB4.Enabled:=true;
           PB5.Enabled:=true;
             PB6.Enabled:=true;
               PB7.Enabled:=true;
                 PB8.Enabled:=true;
                   PB9.Enabled:=true;
                   PB10.Enabled:=true;
                 PB11.Enabled:=true;
               PB12.Enabled:=true;
             PB13.Enabled:=true;
           PB14.Enabled:=true;
         PB15.Enabled:=true;
       PB16.Enabled:=true;
     PB17.Enabled:=true;
   PB18.Enabled:=true;
//    BgraShape16.FillGradient.EndColor:=clBlack;
//    BgraShape16.UseFillGradient:=true;

for i:=1 to 18 do begin
 (FindComponent('LblEQ' +IntToStr(i)) as TLabel).Enabled:=true;
 end;

  end;

  end;



procedure TForm_player.ClearListClick(Sender: TObject);
var
  Reply, BoxStyle: Integer;
begin
//Frm_List.ListClear(self);
BoxStyle := MB_ICONQUESTION + MB_YESNO;
Reply := Application.MessageBox(PChar(clearYesNo) , Pchar(Confirm), BoxStyle);

 if (Reply = IDYES) then   begin
ClearList.Visible:=False;
//BGRAShape2Click(self);
//sleep(1000);
filename:='';
Frm_List.ListClear(self);
 end;

end;

procedure TForm_player.MenuItem5Click(Sender: TObject);
var
  lastindex, p,i:integer;
  s1, s:string;
 // mdpl: boolean;
begin

with frm_list.LB1 do begin
  i:=Count-1;
  while i >= 0 do begin
 //     for i:=0 to Count-1 do begin
 if selected[i] then begin
 lastindex:=i;
 if i=ListBox1ItemIndex then
 BGRAShape2Click(self);
 Frm_list.LB4.Items.Delete(i);
 Frm_list.LB3.Items.Delete(i);
 Frm_list.LB2.Items.Delete(i);
Items.Delete(i);
end;
i:=i-1;
if Frm_list.lb1.Count=0 then
ClearList.Visible:=false;;

 end;
 //Frm_list.LB1.ItemIndex:=lastindex;
 if isStream then
 isStream:=not isStream;
  for i:=0 to Frm_list.Lb1.Count-1 do begin
  p:=Pos( '-', Frm_list.Lb1.Items[i]);
  s:=Frm_list.Lb1.Items[i];
  s1:=IntToStr(i+1)+ ' - ';
 Delete(s, 1,p+1);
 Frm_list.Lb1.Items[i]:=s1+s;

  end;
end;
Frm_List.lb1.ItemIndex:=lastIndex-1;
Frm_List.lb2.ItemIndex:=Frm_List.lb1.ItemIndex;
Frm_List.lb3.ItemIndex:=Frm_List.lb1.ItemIndex;
Frm_List.lb4.ItemIndex:=Frm_List.lb1.ItemIndex;
Frm_List.lb1.Refresh;
{if lastIndex<Frm_list.lb1.Count then
Frm_List.lb1.ItemIndex:=lastIndex
else
Frm_List.lb1.ItemIndex:=Frm_list.lb1.Count-1;  }
frm_list.XMLPropStorage1.Save;
XMLPropStorage1.Save;
Options_frm.XMLPropStorage1.Save;
Frm_Effects.XMLPropStorage1.Save;
end;


procedure TForm_player.MenuOnStopStart(Sender: TObject);
begin
//  off_analizer:= not off_analizerOptions_frm.CheckBox3.Checked:= Not (Options_frm.CheckBox3.Checked);

    off_analizer:= not off_analizer;
  Options_frm.CheckBox3.Checked:=off_analizer;
  if off_analizer then  begin
    MenuStopStart.Caption:=startanalizer;
  //  timerRender.Enabled:=false;
  //  DrawNet;
 //   delay(40);
 // DrawNet;
 //
  end
  else begin
   //timerRender.Enabled:=true;
  isCopy:=false;
    MenuStopStart.Caption:=stopanalizer;
  //  TimerRender.Enabled:=true;
  end;
end;

procedure TForm_player.MouseRefreshTimerTimer(Sender: TObject);
begin
     BgraShape2.Refresh;
 BgraShape1.FillGradient.StartColor:=clHighLight;
 if mode=play then BgraShape1.FillGradient.StartColor:=BrightC(BgraShape1.FillGradient.StartColor,80);
  BgraShape2.FillGradient.StartColor:=clHighLight;
   if mode=stop then BgraShape2.FillGradient.StartColor:=BrightC(BgraShape2.FillGradient.StartColor,80);
   BgraShape3.FillGradient.StartColor:=clHighLight;
    BgraShape4.FillGradient.StartColor:=clHighLight;
    if mode=paused then begin
    BgraShape3.FillGradient.StartColor:=BrightC(BgraShape3.FillGradient.StartColor,80);
      BgraShape4.FillGradient.StartColor:=BrightC(BgraShape4.FillGradient.StartColor,80);
    end;

     BgraShape5.FillGradient.StartColor:=clHighLight;
      BgraShape6.FillGradient.StartColor:=clHighLight;
       BgraShape7.FillGradient.StartColor:=clHighLight;
        BgraShape8.FillGradient.StartColor:=clHighLight;
        BgraShape10.FillGradient.StartColor:=clHighLight;
        BgraShape12.FillGradient.StartColor:=clHighLight;
        BgraShape1.Refresh;

        BgraShape3.Refresh;
        BgraShape4.Refresh;
        BgraShape5.Refresh;
        BgraShape6.Refresh;
        BgraShape7.Refresh;
        BgraShape8.Refresh;
        BgraShape10.Refresh;
        BgraShape12.Refresh;
   MouseRefreshTimer.Enabled:=False;
end;

procedure TForm_player.NextMenuClick(Sender: TObject);
begin
  BGRAShape5Click(Sender);
end;

procedure TForm_player.OpenFilesClick(Sender: TObject);
begin
  BGRAShape12Click(Sender);
end;





procedure TForm_player.Panel2MouseLeave(Sender: TObject);
begin

end;


procedure TForm_player.Panel2MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TForm_player.Panel5MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Options_frm.TrackBar2.Position:=Options_frm.TrackBar2.Position+(WheelDelta div 120);
 Handled := True;
end;

procedure TForm_player.PartyClick(Sender: TObject);
begin
SetPreset(self, aParty );
end;

procedure TForm_player.PauseMenuClick(Sender: TObject);
begin
  BGRAShape3Click(Sender);
end;

procedure TForm_player.PB1MouseLeave(Sender: TObject);
begin

end;

procedure TForm_player.LabelEqRefresh;
var
i:integer;
begin
 for i:=1 to 18 do begin
 (FindComponent('LblEQ'+IntToStr(i)) as TLabel).Caption:=
 FloatToStrF(((FindComponent('PB'+IntToStr(i)) as TProgressBar).Position/1000), ffFixed, 0, 1);
end;
end;

procedure TForm_player.PBMouseWheel(Sender: TObject; Shift: TShiftState;
 WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
    (Sender as TProgressBar).Position:=(Sender as TProgressBar).Position+WheelDelta;
 //   caption:=IntToStr((Sender as TProgressBar).Position);
 Handled := True;

     if not Off_Equalizer then begin
BASS_FXGetParameters(fx[(Sender as TProgressBar).tag], @p);
p.fgain := (Sender as TProgressBar).Position/1000;
BASS_FXSetParameters(fx[(Sender as TProgressBar).tag], @p);
end;
  (FindComponent('LblEQ'+IntToStr((Sender as TProgressBar).tag)) as TLabel).Caption:=FloatToStrF(((Sender as TProgressBar).Position/1000),ffFixed,0,1);;


end;



 {procedure TForm_player.PBMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
    (Sender as TProgressBar).Position:=(Sender as TProgressBar).Position+WheelDelta;
 //   caption:=IntToStr((Sender as TProgressBar).Position);
 Handled := True;

     if not Off_Equalizer then begin
BASS_FXGetParameters(fx[(Sender as TProgressBar).tag], @p);
p.fgain := (Sender as TProgressBar).Position/1000;
BASS_FXSetParameters(fx[(Sender as TProgressBar).tag], @p);
end;
  (FindComponent('LblEQ'+IntToStr((Sender as TProgressBar).tag)) as TLabel).Caption:=FloatToStrF(((Sender as TProgressBar).Position/1000),ffFixed,0,1);;


end;  }


procedure TForm_player.PlayMenuClick(Sender: TObject);
begin
  BGRAShape1Click(Sender);
end;



procedure TForm_player.PopClick(Sender: TObject);
begin
 SetPreset(self, aPop );
end;


procedure TForm_player.PreviousMenuClick(Sender: TObject);
begin
  BGRAShape7Click(Sender);
end;




procedure TForm_player.RapClick(Sender: TObject);
begin
SetPreset(self, aRap );
end;

procedure TForm_player.ReggaeClick(Sender: TObject);
begin
SetPreset(self, aReggae );
end;

procedure TForm_player.RockClick(Sender: TObject);
begin
SetPreset(self, aRock );
end;

procedure TForm_player.S125Click(Sender: TObject);
begin
  FXTempo:=25.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.S150Click(Sender: TObject);
begin
  FXTempo:=50.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.S175Click(Sender: TObject);
begin
  FXTempo:=75.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.S200Click(Sender: TObject);
begin
  FXTempo:=100.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.S225Click(Sender: TObject);
begin
  FXTempo:=125.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.S250Click(Sender: TObject);
begin
  FXTempo:=150.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.S275Click(Sender: TObject);
begin
  FXTempo:=175.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.s300Click(Sender: TObject);
begin
  FXTempo:=200.0;
  BASS_ChannelSetAttribute(channel, BASS_ATTRIB_TEMPO, FXTempo);
end;

procedure TForm_player.ShowPlayerMenuClick(Sender: TObject);
begin
 isCopy:=false;
 SysTrayIcon.Visible:=false;
// ShowInTaskBar:=stNever;
 show;
 Frm_List.Visible:=True;
 List_hide:=False;
  off_analizer:= Options_Frm.CheckBox3.Checked;
end;

procedure TForm_player.SkaClick(Sender: TObject);
begin
SetPreset(self, aSka );
end;

procedure TForm_player.SoftBassClick(Sender: TObject);
begin
SetPreset(self, aSoftBass );
end;

procedure TForm_player.SoftClick(Sender: TObject);
begin
SetPreset(self, aSoft );
end;

procedure TForm_player.SoftRockClick(Sender: TObject);
begin
SetPreset(self, aSoftRock );
end;

procedure TForm_player.StopMenuClick(Sender: TObject);
begin
  BGRAShape2Click(Sender);
  MouseRefreshTimerTimer(self);
end;

procedure TForm_player.SysTrayIconClick(Sender: TOBject);
begin

 // if Button = mbLeft then ShowPlayerMenuClick(sender);
end;

procedure TForm_player.SysTrayIconMouseDown(Sender: TObject);
begin
ShowPlayerMenuClick(sender);
end;

procedure TForm_player.SysTrayIconMouseUp(Sender: TObject);
begin
  caption:=caption;
end;

procedure TForm_player.SysTrayIconPaint(Sender: TObject);
begin

end;


procedure TForm_player.TechnoClick(Sender: TObject);
begin
SetPreset(self, aTechno );
end;







procedure TForm_player.TimerLeftOverDriveStartTimer(Sender: TObject);
begin
 Leftover.Visible:=true;
end;


procedure TForm_player.TimerLeftOverDriveTimer(Sender: TObject);
begin
TimerLeftOverDrive.Enabled:=false;;
Leftover.Visible:=False;
end;

procedure TForm_player.TimerLevelTimer(Sender: TObject);
begin
     if channel>0 then  begin
     // if (not Off_Analizer) and (not isCopy) then  begin
     level := BASS_ChannelGetLevel(channel);


     // end;
     end;
end;

procedure TForm_player.TimerRighOverDriveStartTimer(Sender: TObject);
begin
Rightover.Visible:=true;
end;

procedure TForm_player.TimerRighOverDriveTimer(Sender: TObject);
begin
TimerRighOverDrive.Enabled:=false;
Rightover.Visible:=false;
end;

procedure TForm_player.Panel2Paint(Sender: TObject);
var
 offset, offy : integer;
begin
//if p2p=0 then
with panel2.Canvas do

  Begin
 offset:=211;
 offy:=30;
   // Pen.Color:=clRed;
    //     Pen.Color:=clActiveCaption;
                            Pen.Color:=clActiveCaption;
              Brush.Color:=Pen.Color;
      //      pen.Mode:=pmXor;
              Pen.Style:=psSolid;

      Pen.Width:=1;
    Rectangle(offset,offy-3,offset+6,offy);
    offset:=offset+10;
    Rectangle(offset,offy-4,offset+6,offy);
        offset:=offset+11;
    Rectangle(offset,offy-5,offset+6,offy);
        offset:=offset+11;
    Rectangle(offset,offy-6,offset+6,offy);
        offset:=offset+11;
    Rectangle(offset,offy-7,offset+6,offy);
        offset:=offset+11;
    Rectangle(offset,offy-8,offset+6,offy);
        offset:=offset+11;
    Rectangle(offset,offy-9,offset+6,offy);
        offset:=offset+11;
    Rectangle(offset,offy-10,offset+6,offy);
             offset:=offset+11;
    Rectangle(offset,offy-11,offset+6,offy);
             offset:=offset+11;
    Rectangle(offset,offy-12,offset+6,offy);
    offset:=384;
    Rectangle(offset,offy-3,offset+6,offy);
    offset:=offset+11;
    Rectangle(offset,offy-5,offset+6,offy);
        offset:=offset+11;
    Rectangle(offset,offy-8,offset+6,offy);
        offset:=offset+11;
    Rectangle(offset,offy-12,offset+6,offy);
    offset:=384-6;
    Rectangle(offset,offy-3,offset-6,offy);
    offset:=offset-11;
    Rectangle(offset,offy-5,offset-6,offy);
        offset:=offset-11;
    Rectangle(offset,offy-8,offset-6,offy);
        offset:=offset-11;
    Rectangle(offset,offy-12,offset-6,offy);
  end;


  end;




procedure TForm_player.PB1Enter(Sender: TObject);
begin
    Pb1.Position:=Trunc(3.72654*1000);
end;

procedure TForm_player.ClassicClick(Sender: TObject);
begin
SetPreset(self, aClassic );

end;

procedure TForm_player.ClosePlayerMenuClick(Sender: TObject);
begin
off_analizer:=true;
closePlayer:=true;
 frm_list.LB3.ItemIndex:=-1;
  frm_list.LB2.ItemIndex:=-1;
  if frm_list.LB1.Count-1<frm_list.LB1.ItemIndex then begin
  frm_list.LB1.ItemIndex:=-1;

 frm_list.LB1.Tag:=frm_list.LB1.ItemIndex;

  end;
   frm_list.LB1.Tag:=0;

  close;
end;

procedure TForm_player.ClosePlayListClick(Sender: TObject);
begin
Frm_List.XMLPropStorage1.FileName:='./swampproperties/listprop.xml';
 ClearList.Visible:=False;
 filename:='';
 Frm_List.ListClear(self);
//clearListClick(self);
 Frm_List.XMLPropStorage1.Restore;
end;

procedure TForm_player.ClubClick(Sender: TObject);
begin
SetPreset(self, aClub );
end;







procedure TForm_player.BGRAShape1Click(Sender: TObject);
begin
  //Check if playback is already in progress, then exit
{if mode=play then begin
BASS_ChannelPlay(Channel, true);
exit ;

end;  }
//Start the playback procedure
//Frm_list.lb1.ItemIndex
//player;

if mode=paused then
BGRAShape3Click(self)
else
if Frm_list.lb1.Items.Count>0 then begin
//scrollbar1.Enabled:=true;
if Frm_list.lb1.ItemIndex<0 then
Frm_list.lb1.ItemIndex:=0;
Frm_list.LB1DblClick(BGRAShape3);
end;
end;

procedure TForm_player.BGRAShape15Click(Sender: TObject);
begin

end;

procedure TForm_player.AlternativeClick(Sender: TObject);
begin
SetPreset(self, aAlternate );

end;

procedure TForm_player.AcousticClick(Sender: TObject);
begin
SetPreset(self, aAcoustic );
end;

// Открывает диалог добавления URL в плейлист
procedure TForm_player.AddUrlClick(Sender: TObject);
begin
edtrack:=false;
Form_addurl.Show;
form_addurl.Edit1.text:='';
form_addurl.Edit2.text:='';

//Form_addurl.Left:=Form_player.Left;
form_addurl.top:=form_player.top + 400;
  form_addurl.left:= form_player.Left+8;
//  form_addurl.Visible:=true;

end;

procedure TForm_player.BalladClick(Sender: TObject);

begin

SetPreset(self, aBallad );

end;




procedure TForm_player.BGRAShape10MouseLeave(Sender: TObject);
begin
MouseRefreshTimerTimer(Sender);
end;

procedure TForm_player.BGRAShape10MouseMove(Sender: TObject);
begin
BGRAShape12.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape12.Refresh;
BGRAShape10.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape10.Refresh;
mouseRefreshTimer.OnTimer(self);
//MouseRefreshTimer.Enabled:=True;
end;

var
arrayfiles: array of string;

procedure TForm_player.BGRAShape12Click(Sender: TObject);
var  j, c : integer;
s:string;
begin

// loadFromDialog:=0;
OpenDialog1.Title  := 'Open Files';
//if Frm_list.lb1.Count<>0 then i:=Frm_list.lb1.ItemIndex else i:=0;
//Open file dialog
if not OpenDialog1.Execute then exit;
//Frm_list.lb1.Cursor:=crHourGlass;
//Application.ProcessMessages;
//delay(50);
c:=OpenDialog1.Files.Count;
//LastPosDialog:=Frm_List.Lb2.Count;
SetLength(arrayFiles, c);
begin
  for j:=0 to c-1 do
    begin
      form_player.Cursor:=crHourGlass;
      s:=OpenDialog1.Files.Strings[j];
      arrayFiles[j]:=s;
   Application.ProcessMessages;
    end;
  end;
//loadFromDialog:=-1;

form_player.Refresh;
timerRenderTimer(self);
Frm_list.FormDropFiles(Self,arrayFiles);
loadFromDialog:=-1;
end;


procedure TForm_player.BGRAShape12MouseLeave(Sender: TObject);
begin
MouseRefreshTimerTimer(Sender);
end;

procedure TForm_player.BGRAShape12MouseMove(Sender: TObject);
begin
//     BGRAShape12.FillGradient.StartColorOpacity:=clGradientInActiveCaption;
 //   BGRAShape12.Repaint;

    BGRAShape12.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape12.Refresh;
BGRAShape10.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape10.Refresh;
//mouseRefreshTimer.OnTimer(self);
//MouseRefreshTimer.Enabled:=True;
BgraShape12.ShowHint:=True;
end;

var
Str :  TStringList ;
dir:string;

 procedure TForm_player.putfile(val:string);
 var
 err:integer;
 begin
  form_player.Caption:=val;
 encoder := BASS_Encode_Start(FChannel, PChar('lame -b 128 - '+'/home/slawa/Документи/Lazarus_Projects/SWamp/lib/x86_64-linux/output.mp3' ),BASS_ENCODE_AUTOFREE , nil, nil);
 err:=BASS_ErrorGetCode();
 if err>0 then
   form_player.Caption:=intToStr(err);

 end;

Var
textfile:string;

procedure TForm_player.BGRAShape14Click(Sender: TObject);
var
 ss,s,sr:string;
br:integer;

F : Text;
begin
if not isStream then exit;
 isWrite:=Not IsWrite;
 if isWrite then
BgraShape14.FillColor:=clRed
else  begin
BgraShape14.FillColor:=clMaroon;
  if encoder>0 then
   BASS_Encode_Stop(encoder);
  encoder:=0;
end;
if encoder>0 then
 BASS_Encode_Stop(encoder);
encoder:=0;
s:='';
 if isStream then  begin
  s:=BASS_ChannelGetTags(FChannel,BASS_TAG_META  );
 ss:='';
 ss:= (Copy(s ,  14,  (Length(s) - Pos('"', s) - 15)));
// ss:=frm_list.LB1.Items[ListBox1ItemIndex]+'.mp3';

  if ( s>'') then begin
   frm_list.caption:='';
   frm_list.caption:=frm_list.LB1.Items[ListBox1ItemIndex]+' - ' + Trim(Copy(s ,  14,  (Length(s) - Pos('"', s) - 15)));
  end;
  if isWrite then  begin
 br:=Trunc(Bitrate);
 sr:=FloatToStr(Trunc(ATTRIB_FREQ)/1000);

  SaveDialog1.Filename:=frm_list.LB1.Items[ListBox1ItemIndex]+'.mp3';
if  SaveDialog1.Execute then begin
ss:= SaveDialog1.Filename;
dir:=ExtractFilePath(ss);
//ss:=SaveDialog1.File_Name;
//form_player.Caption:=ss;
//ss:=dir+'output.mp3';
// encoder := BASS_Encode_Start(FChannel, PChar('lame --preset standard - /output.mp3'), BASS_ENCODE_AUTOFREE, nil, nil);
//form_player.Width:=800;
//form_player.Caption:=ss;
//putfile(ss);

encoder := BASS_Encode_Start(FChannel, Pchar('lame -b '+intToStr(br)+' - '+'"'+ss+'"'),BASS_ENCODE_AUTOFREE, nil, nil);
//if encoder=0 then
//ShowMessage(ss);
//AssignFile(f, dir+frm_list.LB1.Items[ListBox1ItemIndex]+'.txt');

textfile:= (Copy(SaveDialog1.Filename ,  0,  (Length(SaveDialog1.Filename) - 4)))+'.txt';
AssignFile(f,  textfile );
 Str  :=  TStringList . Create ;
 try
Str.Add(Label1.Caption+' - ' + frm_list.caption);
 // Str.Add(ss);
 str.SaveToFile(textfile);
 // str.SaveToFile(dir+frm_list.LB1.Items[ListBox1ItemIndex]+'.txt');
 finally
 end;

end
else begin
isWrite:=Not IsWrite;
BgraShape14.FillColor:=clMaroon;
BASS_Encode_Stop(encoder);
encoder:=0;
str.Destroy;
end;
//  if Encoder=0 then
//   encoder := BASS_Encode_Start(FChannel, PChar('lame --preset standard - output.mp3'), BASS_ENCODE_FP_24BIT or BASS_ENCODE_AUTOFREE, nil, nil);
//   if encoder=0 then
//   ShowMessage(dir);
   // lame --preset standard - output.mp3
 //  encoder := BASS_Encode_Start(FChannel, PChar('./'+frm_list.caption+'.mp3'), BASS_ENCODE_FP_24BIT or BASS_ENCODE_AUTOFREE, nil, nil);
  end;
  end;
  end;







procedure TForm_player.BGRAShape1MouseLeave(Sender: TObject);
//var
//activeColor:TColor;
begin
//MouseRefreshTimer.Enabled:=True;
BGRAShape1.FillGradient.StartColor:=clHighLight;
if mode=play then
BGRAShape1.FillGradient.StartColor:=BrightC(BGRAShape1.FillGradient.StartColor,80);
BGRAShape1.Refresh;
//mouseRefreshTimer.OnTimer(self);
end;

procedure TForm_player.BGRAShape1MouseMove(Sender: TObject; X, Y: Integer);
begin
BGRAShape1.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape1.Refresh;
BgraShape1.ShowHint:=True;
//mouseRefreshTimer.OnTimer(self);
end;

procedure TForm_player.BGRAShape2Click(Sender: TObject);
var
err, i:integer;
 st: boolean;
begin
//BASS_ChannelFree(FChannel);

//if not BASS_STOP() then

//err:=BASS_ErrorGetCode();

if cover_form.Visible then begin
cover_form.hide;
Frm_List.show;
end;

if isWrite then
BGRAShape14Click(self);
 mode:=stop;

 BASS_ChannelStop(Channel);
 BASS_StreamFree(FChannel);

 if encoder>0 then
 BASS_Encode_Stop(encoder);
encoder:=0;
 for i:=0 to 1023 do
 FFTDATA[i]:=0;

  ScrollBar1.Position:=0;
  LevelLeft.Visible:=false;
   LevelRight.Visible:=false;
 {  if BASS_CD_Release(0) then begin
//caption:='Close';

scrollbar1.Max:=scrollbar1.Min;

//BASS_CD_Release(1);
st:= BASS_CD_Door(0 , BASS_CD_DOOR_UNLOCK);
err:=BASS_ErrorGetCode();
end;
   if not BASS_CD_Release(0) then
    err:=BASS_ErrorGetCode(); }
 // Timer1.Enabled:=False;
end;

procedure TForm_player.BGRAShape2DblClick(Sender: TObject);
begin

end;


procedure TForm_player.BGRAShape2MouseLeave(Sender: TObject);
begin
//MouseRefreshTimer.Enabled:=True;
MouseRefreshTimerTimer(Sender);
end;

procedure TForm_player.BGRAShape2MouseMove(Sender: TObject);
begin
BGRAShape2.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape2.Refresh;
//MouseRefreshTimer.Enabled:=True;
BgraShape2.ShowHint:=True;
//MouseRefreshTimer.Enabled:=false;
//mouseRefreshTimer.OnTimer(self);
end;


procedure TForm_player.BGRAShape3Click(Sender: TObject);
begin
  //Check if playback is in progress
if mode=play then
begin
 BASS_ChannelPause(Channel);//pause playback
 mode:=paused;//set playmode to pause
 scrollbar1.Enabled:=false;
//DrawNet;
end
else
  if mode=paused then begin
  mode:=play;
BASS_ChannelPlay(Channel, false);
scrollbar1.Enabled:=true;
end;

end;

procedure TForm_player.BGRAShape3MouseLeave(Sender: TObject);
begin
//MouseRefreshTimerTimer(Sender);
//MouseRefreshTimer.Enabled:=True;
mouseRefreshTimer.OnTimer(self);
end;

procedure TForm_player.BGRAShape3MouseMove(Sender: TObject; X, Y: Integer);
begin
//if (x > 0) and (x<15) and (y>0) and (y<20) then begin
BGRAShape3.FillGradient.StartColor:=clGradientInActiveCaption;
//BGRAShape3.Refresh;
BGRAShape4.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape4.Refresh;
//MouseRefreshTimer.Enabled:=True;
BgraShape3.ShowHint:=True;
BgraShape4.ShowHint:=True;
//MouseRefreshTimer.Enabled:=false;
//mouseRefreshTimer.OnTimer(self);


end;


procedure TForm_player.BGRAShape4MouseLeave(Sender: TObject);
begin
//  MouseRefreshTimer.Enabled:=True;
 // MouseRefreshTimerTimer(Sender);
  mouseRefreshTimer.OnTimer(self);
end;

procedure TForm_player.BGRAShape4MouseMove(Sender: TObject);
begin
  BGRAShape3.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape3.Refresh;
BGRAShape4.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape4.Refresh;
//MouseRefreshTimer.Enabled:=True;
mouseRefreshTimer.OnTimer(self);
BgraShape4.ShowHint:=True;
end;

procedure TForm_player.BGRAShape5Click(Sender: TObject);

begin
 //  if not isCue then begin

if Frm_list.lb1.ItemIndex<Frm_list.lb1.Items.Count-1 then  begin
Frm_list.lb1.ItemIndex:=ListBox1ItemIndex;
Frm_list.lb1.ItemIndex:=Frm_list.lb1.ItemIndex+1;
Frm_List.LB2.ItemIndex:=Frm_list.lb1.ItemIndex;
Frm_List.LB3.ItemIndex:=Frm_list.lb1.ItemIndex;
Frm_List.LB4.ItemIndex:=Frm_list.lb1.ItemIndex;
//Caption:=lb3.Items[LB3.ItemIndex];
Frm_List.LB1DblClick(Sender);
end;
 { end
else begin
if Frm_list.lb1.ItemIndex<Frm_list.lb1.Items.Count-1 then  begin
Frm_list.lb1.ItemIndex:=Frm_list.lb1.ItemIndex+1;
ListBox1DblClick(Sender);
end;
end;   }
end;

procedure TForm_player.BGRAShape5MouseLeave(Sender: TObject);
begin
//MouseRefreshTimer.Enabled:=True;
mouseRefreshTimer.OnTimer(self);
//MouseRefreshTimerTimer(Sender);
end;

procedure TForm_player.BGRAShape5MouseMove(Sender: TObject);
begin
BGRAShape5.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape6.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape5.Refresh;
BGRAShape6.Refresh;
//mouseRefreshTimer.OnTimer(self);
//MouseRefreshTimer.Enabled:=false;
 BgraShape5.ShowHint:=True;
  BgraShape6.ShowHint:=True;
end;


procedure TForm_player.BGRAShape6MouseLeave(Sender: TObject);
begin

end;

procedure TForm_player.BGRAShape6MouseMove(Sender: TObject);
begin
    BGRAShape5.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape5.Refresh;
mouseRefreshTimer.OnTimer(self);
//MouseRefreshTimer.Enabled:=True;
end;


procedure TForm_player.BGRAShape7Click(Sender: TObject);
begin
   if not isCue then begin
if Frm_list.lb1.ItemIndex>0 then  begin
Frm_list.lb1.ItemIndex:=ListBox1ItemIndex;
Frm_list.lb1.ItemIndex:=Frm_list.lb1.ItemIndex-1;
Frm_list.LB1DblClick(Sender);
end;
  end
else begin
if Frm_list.lb1.ItemIndex>0 then  begin
Frm_list.lb1.ItemIndex:=ListBox1ItemIndex;
Frm_list.lb1.ItemIndex:=Frm_list.lb1.ItemIndex-1;
Frm_list.LB1DblClick(Sender);
end;
end;
end;

procedure TForm_player.BGRAShape7MouseLeave(Sender: TObject);
begin
 BGRAShape7.FillGradient.StartColor:=clHighLight;;
BGRAShape8.FillGradient.StartColor:=clHighLight;;
BGRAShape7.Refresh;
BGRAShape8.Refresh;
mouseRefreshTimer.OnTimer(self);
//MouseRefreshTimer.Enabled:=True;
//MouseRefreshTimer.Enabled:=True;
//MouseRefreshTimerTimer(Sender);
end;

procedure TForm_player.BGRAShape7MouseMove(Sender: TObject);
begin
BGRAShape7.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape8.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape7.Refresh;
BgraShape7.ShowHint:=True;
BGRAShape8.Refresh;
//mouseRefreshTimer.OnTimer(self);
//MouseRefreshTimer.Enabled:=false;
//caption:='X-'+x.ToString+'Y-'+Y.ToString;
//MouseRefreshTimer.Enabled:=True;
end;


procedure TForm_player.BGRAShape8MouseLeave(Sender: TObject);
begin
mouseRefreshTimer.OnTimer(self);
//  MouseRefreshTimer.Enabled:=True;
end;

procedure TForm_player.BGRAShape8MouseMove(Sender: TObject);
begin
BGRAShape7.FillGradient.StartColor:=clGradientInActiveCaption;
BGRAShape7.Refresh;
//mouseRefreshTimer.OnTimer(self);
//MouseRefreshTimer.Enabled:=True;
end;

procedure TForm_player.BitBtn1Click(Sender: TObject);
begin
if  Frm_Effects.Visible then  begin
Frm_Effects.Close;
exit;
   end;
effecttop:=not options_frm.Visible;

if (Left+ width +Frm_Effects.Width)< screen.Width then
Frm_Effects.left:=left+width
else
Frm_Effects.left:=left-Frm_Effects.Width;
  if effecttop then
  Frm_Effects.top:=top
  else
   Frm_Effects.top:= top+options_frm.Height;
  Frm_Effects.Show;
end;

procedure TForm_player.BitBtn2Click(Sender: TObject);
begin

if  options_frm.Visible then begin
    options_frm.Close;
exit;
end;

effecttop:=Frm_Effects.Visible;


if (Left+ width +options_frm.Width)< screen.Width then
options_frm.left:=left+width
else
options_frm.left:=left-options_frm.Width;
 if not effecttop then
 options_frm.top:=top
 else
 options_frm.top:=top+Frm_Effects.Height;
 Options_frm.Show;
end;

procedure TForm_player.PopupAnalizPopup(Sender: TObject);
begin
//SetDefaultLang(tLang[Language.Tag], 'languages');
Language.Caption:=languages;
//Form_player.Repaint;
   if off_Analizer then begin
MenuStopStart.ImageIndex:=4;
MenuStopStart.Caption:=startanalizer;
end
else begin
  MenuStopStart.ImageIndex:=3;
  MenuStopStart.Caption:=stopanalizer;
end;
{if Spectrum.LinePeak then Begin MenuItem3.Caption:=bargraph;
    MenuItem3.ImageIndex:=0;
    end
  else  begin MenuItem3.Caption:=line;
    MenuItem3.ImageIndex:=5;
  end;    }
  if Eq_Hide then begin
HideEq.Visible:=true;
HideEq.ImageIndex:=4;
end
else begin
  HideEq.ImageIndex:=1;
end;
end;

procedure TForm_player.PopupMenu1Popup(Sender: TObject);
begin
if Eq_Hide then begin
HideEqualizer.Visible:=true;
HideEq.ImageIndex:=1;
end
else begin
  HideEq.ImageIndex:=4;
end;
   if Off_Equalizer then begin
OffEqualizer.ImageIndex:=4;
OffEqualizer.Caption:=oneq;
end
else begin
  OffEqualizer.ImageIndex:=3;
  OffEqualizer.Caption:=ofeq;
end;
LabelEqRefresh;
end;


procedure TForm_player.PBMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
 newPosition : integer;
 //v:double;
 tempPB:TProgressBar;
 tempLB:TLabel;
// max:integer;
begin

//   if Off_Equalizer then exit;
tempPB:=(Sender as TProgressBar);
TempLB:=(FindComponent('LblEQ'+IntToStr(tempPB.tag)) as TLabel);
   if tempLB.Enabled  then
tempPB.Cursor:=crSizeNS
else
tempPB.Cursor:=crDefault;
//Application.ProcessMessages;


   if ssLeft in Shift then
 begin
 y:=y-40;


      newPosition := Trunc((-y * tempPB.Max / tempPB.ClientWidth)/2) ;

      tempPB.Position := newPosition;
       (FindComponent('LblEQ'+IntToStr((Sender as TProgressBar).tag)) as TLabel).Caption:=FloatToStrF(((Sender as TProgressBar).Position/1000),ffFixed,0,1);;
// if Off_Equalizer then exit;
BASS_FXGetParameters(fx[tempPB.tag], @p);
p.fgain := tempPB.Position/1000;
BASS_FXSetParameters(fx[tempPB.tag], @p);
   UpdateEQ(aEqualizer);
     if Custom.Checked then
  aCustom[(Sender as TProgressBar).tag]:=(Sender as TProgressBar).Position/1000;
 end;

 if ssExtra1 in Shift then
 begin


BASS_FXGetParameters(fx[tempPB.tag], @p);
p.fgain := tempPB.Position/1000;
BASS_FXSetParameters(fx[tempPB.tag], @p);
  (FindComponent('LblEQ'+IntToStr(tempPB.tag)) as TLabel).Caption:=FloatToStrF(((Sender as TProgressBar).Position/1000),ffFixed,0,1);;
  tempLB.Caption:=FloatToStrF((tempPB.Position/1000),ffFixed,0,1);

 end;

end;

{
procedure TForm_player.ProgressBar2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
 newPosition : integer;
begin
 PB2.Color:=clRed;
 if ssLeft in Shift then
 begin
//   PB2.Cursor := crNo;
   newPosition := Round(y * (PB2.Max / PB2.ClientWidth)*2) ;
   PB2.Position := newPosition;
    //label4.Caption:=(PB2.Position/100).ToString;
 end
 else
 begin
   PB2.Cursor := crDefault;
 end;
end;
 }


procedure TForm_player.ScrollBar1Change(Sender: TObject);
begin

// Form_Player.Caption:=IntToStr(Form_Player.scrollBar1.Min)+'-'+IntToStr(Form_Player.scrollBar1.Position);
 if mode = stop then  begin
 ScrollBar1.Position:=0;
  ScrollBar1.Enabled:=false;
  if BASS_ChannelSetPosition( Channel , 0, BASS_POS_BYTE) then  begin
    end;
  ScrollBar1.Enabled:=true;
  end;
 if mode=play then
  if ScrollBar1.Position<3 then begin
  levelLeft.Position:=0;
  levelRight.Position:=levelLeft.Position;
 end;
end;


procedure TForm_player.ScrollBar1Scroll(Sender: TObject);
var
  s:string;
    lng: DWORD;
begin
if mode=stop then begin
scrollBar1.Max:= scrollBar1.Min;
exit;
end;
scrollbar1.Enabled:=true;
   if Channel>0 then begin
if ((mode=play)or not(mode=paused)) then  begin
Timer1.Interval:=1000;

//mode:=paused;
 BASS_ChannelPause(Channel);
//timer2.Enabled:=true;
timer3.Interval:=400;

//init:=false;
//Timer3.OnTimer(self);
timer3.Enabled:=true;
 end;
 //BASS_ChannelPause(Channel);
 //posTime:=ScrollBar1.Position ;

 //    updateTonComp;
 posTime:=ScrollBar1.Position ;

  if BASS_ChannelSetPosition( Channel , BASS_ChannelSeconds2Bytes(Channel,PosTime+1), BASS_POS_BYTE) then  begin
 //  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_VOL, 1);
  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_VOL, 0);
 BASS_ChannelPlay(Channel, false);
  end;


  lng := qbass_gettime(channel);
  s:= qbass_formattime(lng,false);
  lng := qbass_getpos(channel);
  s:= qbass_formattime(lng,false);
//  Label1.Caption:=s;

   end;
end;


 {
procedure TForm_player.Timer1Timer(Sender: TObject);
var
  //fpos:LongInt;
  lng:Double;
  ppp:QWORD;
  s:string;
// flags:Float;
 // i, mCc,
  //  lng: DWORD;
begin
if Frm_list.lb1.ItemIndex>-1 then begin
b1:=Pb1.Position/1000;
b2:=Pb2.Position/1000;
b3:=Pb3.Position/1000;
b4:=Pb4.Position/1000;
b5:=Pb5.Position/1000;
b6:=Pb6.Position/1000;
b7:=Pb7.Position/1000;
b8:=Pb8.Position/1000;
b9:=Pb9.Position/1000;
b10:=Pb10.Position/1000;
b11:=Pb11.Position/1000;
b12:=Pb12.Position/1000;
b13:=Pb13.Position/1000;
b14:=Pb14.Position/1000;
b15:=Pb15.Position/1000;
b16:=Pb16.Position/1000;
b17:=Pb17.Position/1000;
b18:=Pb18.Position/1000;
if (lb3.Items[Frm_list.lb1.ItemIndex]='') then
isCue:=false
else
iscue:=true;
begin

end;
  if not isCue then begin
   lng := qbass_getpos(channel);
   PosTime:=Round(Lng);
 s:= qbass_formattime(round(lng) ,false);
 Label1.Caption:=s;
 lng := qbass_gettime(channel);
s:= qbass_formattime(round(lng),false);
Label2.Caption:=s;
ScrollBar1.Max := Round(lng);
  If qbass_gettime(channel)= qbass_getpos(channel) then

    if (ListBox1ItemIndex=Frm_list.lb1.Items.Count-1) and (scrollBar1.Position = scrollBar1.Max-1)  then
    BGRAShape2Click(self)
  else
  begin

if ListBox1ItemIndex<Frm_list.lb1.Items.Count-1 then  begin
Frm_list.lb1.ItemIndex:=Frm_list.lb1.ItemIndex+1;
//ListBox1ItemIndex:=Frm_list.lb1.ItemIndex;
LB1DblClick(Sender);
end;
 end;
  end
else begin

lng := (BASS_ChannelBytes2Seconds(Channel, BASS_ChannelGetPosition(Channel , BASS_POS_BYTE)));
PosTime:=Trunc(Lng);
s:= qbass_formattime(Round(lng)-ScrollBar1.Min, false);
Label1.Caption:=s;
lng := qbass_gettime(channel); ;
s:= qbass_formattime(ScrollBar1.Max-ScrollBar1.Min,false);
Label2.Caption:=s;
 //s:= qbass_formattime(lng,false);
if ScrollBar1.Position=ScrollBar1.Max-2 then
     if (ListBox1ItemIndex=Frm_list.lb1.Items.Count-1) and (scrollBar1.Position > scrollBar1.Max-3)  then
    BGRAShape2Click(self)
  else
  begin
if ListBox1ItemIndex<Frm_list.lb1.Items.Count-1 then  begin
Frm_list.lb1.ItemIndex:=Frm_list.lb1.ItemIndex+1;
ListBox1ItemIndex:=Frm_list.lb1.ItemIndex;
LB1DblClick(Sender);
end;

  end;

end;

ScrollBar1.Position := Trunc(PosTime);

//  flags:=BASS_GetConfig( BASS_CONFIG_SRC);
  end;

  end;

}

procedure TForm_player.Timer1Timer(Sender: TObject);
var
  PosTime: Integer;
  lng: Double;
  s: string;
begin
  if mode = stop then
    Exit;
  if Frm_list.lb1.ItemIndex > -1 then
  begin

 {   b1 := Pb1.Position / 1000;
    b2 := Pb2.Position / 1000;
    b3 := Pb3.Position / 1000;
    b4 := Pb4.Position / 1000;
    b5 := Pb5.Position / 1000;
    b6 := Pb6.Position / 1000;
    b7 := Pb7.Position / 1000;
    b8 := Pb8.Position / 1000;
    b9 := Pb9.Position / 1000;
    b10 := Pb10.Position / 1000;
    b11 := Pb11.Position / 1000;
    b12 := Pb12.Position / 1000;
    b13 := Pb13.Position / 1000;
    b14 := Pb14.Position / 1000;
    b15 := Pb15.Position / 1000;
    b16 := Pb16.Position / 1000;
    b17 := Pb17.Position / 1000;
    b18 := Pb18.Position / 1000;    }

    if Frm_list.lb3.Items[Frm_list.lb1.ItemIndex] = '' then
      isCue := false
    else
      iscue := true;

    if not isCue then
    begin

    lng := qbass_getpos(channel);
      PosTime := Round(lng);
      s := qbass_formattime(PosTime, false);
      Label1.Visible:=mode=play;
      Label1.Caption := s;

      lng := qbass_gettime(channel);
      s := qbass_formattime(Round(lng), false);
      if not isStream then
      Label2.Visible:=Label1.Visible;
      Label2.Caption := s;
      if not isStream then
      ScrollBar1.Max := Round(lng);

      if lng = qbass_getpos(channel) then
      begin
        if (ListBox1ItemIndex = Frm_list.lb1.Items.Count - 1) and (ScrollBar1.Position = ScrollBar1.Max - 1) then
          BGRAShape2Click(Self)
        else
        begin
          if ListBox1ItemIndex < Frm_list.lb1.Items.Count - 1 then
          begin
            Frm_list.lb1.ItemIndex := Frm_list.lb1.ItemIndex + 1;
            Frm_list.LB1DblClick(Sender);
          end;
        end;
      end;
    end
    else
    begin

      lng := BASS_ChannelBytes2Seconds(Channel, BASS_ChannelGetPosition(Channel, BASS_POS_BYTE));

 //         lng := Trunc(BASS_ChannelBytes2Seconds(Channel, pos));
             cueEndPos:= BASS_ChannelSeconds2Bytes(Channel, tmn);
            // cueEndPos:= BASS_ChannelSeconds2Bytes(Chanm, tmn);
  //           CueEndPos:=BASS_ChannelSeconds2Bytes(Channel,  lng);
      PosTime := Trunc(lng);
      s := qbass_formattime(PosTime - ScrollBar1.Min, false);
      Label1.Visible:=(mode=play) or (mode=paused);
 label4.Visible:= Label1.Visible; ;
label5.Visible:=label1.Visible;
label7.Visible:=label1.Visible;
label6.Visible:=label1.Visible;

      Label1.Caption := s;
    // caption:=s;
      lng := qbass_gettime(channel);
      cuePos:= BASS_ChannelSeconds2Bytes(Channel, ScrollBar1.Min);
  //     cueEndPos:= BASS_ChannelSeconds2Bytes(Channel, ScrollBar1.Max);
 //      CueEndPos:=BASS_ChannelSeconds2Bytes(Channel,  ScrollBar1.Max - ScrollBar1.Min );
// if  ScrollBar1.Min=0 then
// ScrollBar1.Max:=tmn;
      s := qbass_formattime(ScrollBar1.Max - ScrollBar1.Min, false);
       if not isStream then
      Label2.Visible:=Label1.Visible;
      Label2.Caption := s;


      if ScrollBar1.Position = ScrollBar1.Max - 2 then begin
        if (ListBox1ItemIndex = Frm_list.lb1.Items.Count - 1) and (ScrollBar1.Position >= ScrollBar1.Max-2 ) then begin
      if   ScrollBar1.Position >= ScrollBar1.Max-1  then
//      BGRAShape2Click(Self);
        end
        else
        begin
          if ListBox1ItemIndex < Frm_list.lb1.Items.Count - 1 then
          begin
            Frm_list.lb1.ItemIndex := Frm_list.lb1.ItemIndex + 1;
            ListBox1ItemIndex := Frm_list.lb1.ItemIndex;
            Frm_list.LB1DblClick(Sender);
          end;
        end;
      end;
    end;

     {
      if ScrollBar1.Position = ScrollBar1.Max - 2 then
      begin
        if (ListBox1ItemIndex = Frm_list.lb1.Items.Count - 1) and (ScrollBar1.Position > ScrollBar1.Max - 3) then
          BGRAShape2Click(Self)
        else
        begin
          if ListBox1ItemIndex < Frm_list.lb1.Items.Count - 1 then
          begin
            Frm_list.lb1.ItemIndex := Frm_list.lb1.ItemIndex + 1;
            ListBox1ItemIndex := Frm_list.lb1.ItemIndex;
            Frm_list.LB1DblClick(Sender);
          end;
        end;
      end;
    end;  }

    ScrollBar1.Position := PosTime;
  end;
end;




procedure TForm_player.Timer2Timer(Sender: TObject);
var
  i:integer;
begin

  timer2.Enabled:=False;
  for i:=0 to Frm_list.lb1.Count-1 do
  if Frm_list.lb1.Selected[i] then
  filename:=Frm_List.LB2.Items[i];
  mode:=play;
         if not player then exit;

   //  Timer1.Interval:=30;

end;

procedure TForm_player.Timer3Timer(Sender: TObject);
var
  maxval:Integer;
begin
  if init then begin
  timer3.Enabled:=False;
 if  Off_Equalizer then begin
  UpdateTonComp();
 exit;
 end;
   if channel>0 then   begin
    UpdateEQ(aEqualizer);
            maxval:=0;
   end;
end
  else begin
  UpdateTonComp();
  timer3.Enabled:=false;

end;

end;

procedure TForm_player.Timer4Timer(Sender: TObject);
var
  i:integer;
  //s:string;
begin
   if first then begin
 first:=false;
//options_frm.ComboBox1.ItemIndex:=4;
options_frm.ComboBox3.ItemIndex:=2;
options_frm.ComboBox4.ItemIndex:=0;
options_frm.ComboBox5.ItemIndex:=4;
end;

HideListClick(self);


eq_hide := not panel1.Visible;
  timer4.Enabled:=false;
    timer2.Enabled:=False;

 MenuItem2Click1(Self);
  for i:=0 to Frm_list.lb1.Count-1 do begin
  if Frm_list.lb1.Selected[i] then begin
  filename:=Frm_list.LB2.Items[i];

 // mode:=play;
     if autoStart then  begin
    //  caption:= intToStr(frm_list.LB1.ItemIndex)+'--'+intToStr(ScrollBar1.max)+'--'+intToStr(ScrollBar1.Position);
     mode:=play;
     player;
          end
         else  begin
     ScrollBar1.Position:=0;
         mode:=stop;

         end;
      Frm_Effects.RunEffects() ;
  if (Length(Frm_list.LB3.Items[i])>0) then
  isCue:=true;
  BASS_ChannelSetPosition( Channel , BASS_ChannelSeconds2Bytes(Channel,ScrollBar1.Position+1), BASS_POS_BYTE);


  exit;
  end;


      end;

end;



procedure TForm_player.TrackBar12MouseLeave(Sender: TObject);
begin
    trackBar12.Cursor:=crDefault;
Application.ProcessMessages;
end;

procedure TForm_player.TrackBar12MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    trackBar12.Cursor:=crSizeWE;
Application.ProcessMessages;
end;

procedure TForm_player.TrackBar12MouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
 TrackBar12.Position:=TrackBar12.Position+(WheelDelta div 120);
 Handled := True;
end;

function Max(A, B: Integer): Integer;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;


var
httptext, track_name:string;
procedure TForm_player.TimerRenderTimer(Sender: TObject);
var
//FFTData: TFFTData;
Hnd: LongInt;
//val: float;
br, maxnumber:integer;
LevL, LevR: Single;
urlpos,i, offset : integer;
s, s1 , s2,ss, btr, sr:string ;
begin
//exit;
s2:=' ';
  if (Channel <= 0) or (not Visible) or (mode <> play) or (scrollBar1.Position >= ScrollBar1.Max-3) then
begin
levelLeft.Hide;
levelRight.Hide;
{if scrollBar1.Position> scrollBar1.Max-2 then begin
caption:='Exit';
//Exit;
end;  }
end;

  if channel=0 then exit;

if isStream then  begin
s:='';
s:=BASS_ChannelGetTags(FChannel,BASS_TAG_META);
if s='StreamTitle='''';' then
s:='';
urlpos:=pos('StreamUrl',s);
if UrlPos>0 then begin
s1:=copy(s,0,urlpos-1);
s:=s1;
end;

 if ( s>'') then begin
 if frm_list.caption <> (frm_list.LB1.Items[ListBox1ItemIndex]+' - ' + Trim(Copy(s ,  14,  (Length(s) - Pos('"', s) - 15)))) then begin
 frm_list.caption:=frm_list.LB1.Items[ListBox1ItemIndex]+' - ' + Trim(Copy(s ,  14,  (Length(s) - Pos('"', s) - 15)));
 if isWrite then  begin
 Str.Add(Label1.Caption+' - ' +  frm_list.caption);
//  Str.Add(frm_list.caption);
 str.SaveToFile(textfile);
//  encoder := BASS_Encode_Start(FChannel, PChar('./'+frm_list.caption+'.wav'), BASS_ENCODE_PCM or BASS_ENCODE_AUTOFREE, nil, nil);
 end;
 end;
 end
 else
 frm_list.caption:=frm_list.LB1.Items[ListBox1ItemIndex];
 end;
 if (init and (atrfq <> ATTRIB_FREQ)) or changeBand then   begin
changeBand:=false;
atrfq := ATTRIB_FREQ;
Spectrum.DrawPeak := True;


if  ATTRIB_FREQ>=44100 then
if  Spectrum.ColWidth=7 then
Spectrum.DrawRes:=0.65
else
if  Spectrum.ColWidth=6 then
Spectrum.DrawRes:=0.56
else
if  Spectrum.ColWidth=5 then
Spectrum.DrawRes:=0.48
else
if  Spectrum.ColWidth=4 then
Spectrum.DrawRes:=0.41
else
if  Spectrum.ColWidth=3 then
Spectrum.DrawRes:=0.32
else
if  Spectrum.ColWidth=2 then
Spectrum.DrawRes:=0.24;

if  ATTRIB_FREQ>=48000 then
if  Spectrum.ColWidth=7 then
Spectrum.DrawRes:=0.635
else
if  Spectrum.ColWidth=6 then
Spectrum.DrawRes:=0.55
else
if  Spectrum.ColWidth=5 then
Spectrum.DrawRes:=0.47
else
if  Spectrum.ColWidth=4 then
Spectrum.DrawRes:=0.39
else
if  Spectrum.ColWidth=3 then
Spectrum.DrawRes:=0.31
else
if  Spectrum.ColWidth=2 then
Spectrum.DrawRes:=0.232;

if  ATTRIB_FREQ>=88200 then
if  Spectrum.ColWidth=7 then
Spectrum.DrawRes:=0.46
else
if  Spectrum.ColWidth=6 then
Spectrum.DrawRes:=0.4
else
if  Spectrum.ColWidth=5 then
Spectrum.DrawRes:=0.34
else
if  Spectrum.ColWidth=4 then
Spectrum.DrawRes:=0.28
else
if  Spectrum.ColWidth=3 then
Spectrum.DrawRes:=0.22
else
if  Spectrum.ColWidth=2 then
Spectrum.DrawRes:=0.17;

if  ATTRIB_FREQ>=96000 then
if  Spectrum.ColWidth=7 then
Spectrum.DrawRes:=0.43
else
if  Spectrum.ColWidth=6 then
Spectrum.DrawRes:=0.37
else
if  Spectrum.ColWidth=5 then
Spectrum.DrawRes:=0.32
else
if  Spectrum.ColWidth=4 then
Spectrum.DrawRes:=0.264
else
if  Spectrum.ColWidth=3 then
Spectrum.DrawRes:=0.214
else
if  Spectrum.ColWidth=2 then
Spectrum.DrawRes:=0.16;

if  ATTRIB_FREQ>=176400 then
if  Spectrum.ColWidth=7 then
Spectrum.DrawRes:=0.321
else
if  Spectrum.ColWidth=6 then
Spectrum.DrawRes:=0.28
else
if  Spectrum.ColWidth=5 then
Spectrum.DrawRes:=0.239
else
if  Spectrum.ColWidth=4 then
Spectrum.DrawRes:=0.198
else
if  Spectrum.ColWidth=3 then
Spectrum.DrawRes:=0.157
else
if  Spectrum.ColWidth=2 then
Spectrum.DrawRes:=0.116;

if  ATTRIB_FREQ>=192000 then
if  Spectrum.ColWidth=7 then
Spectrum.DrawRes:=0.302
else
if  Spectrum.ColWidth=6 then
Spectrum.DrawRes:=0.264
else
if  Spectrum.ColWidth=5 then
Spectrum.DrawRes:=0.226
else
if  Spectrum.ColWidth=4 then
Spectrum.DrawRes:=0.188
else
if  Spectrum.ColWidth=3 then
Spectrum.DrawRes:=0.15
else
if  Spectrum.ColWidth=2 then
Spectrum.DrawRes:=0.112;

//Spectrum.DrawRes :=Spectrum.DrawRes/3.5;
Spectrum.DrawType := 1;
  end;
// Hnd := BASS_ChannelGetData(Channel, @FFTData,  BASS_DATA_FFT1024);
// if Hnd < 0 then Exit;
 //     BASS_ChannelGetData(Channel, @FFTData,  BASS_DATA_FFT1024);

 Spectrum.Paused:=Mode=paused;
 if (not Off_Analizer) and (not isCopy) then  begin
 //if mode=stop then

 BASS_ChannelGetData(Channel, @FFTData,  BASS_DATA_FFT1024);
  level := BASS_ChannelGetLevel(channel);
 //if mode=play then
 Spectrum.Draw( FFTData,0, -2);
 isCopy:=false;
 end
 else
 if not isCopy  then begin
 isCopy:=True;
 Spectrum.ifend:=false;
 PaintBox1.Canvas.CopyRect(Rect(0, 0, Spectrum.BackBmp.Width -0 , Spectrum.BackBmp.Height),
 Spectrum.BackBmp.Canvas, Rect(0, 0, Spectrum.BackBmp.Width-0, Spectrum.BackBmp.Height));
 // DrawNet;
 end;



  if mode=play then
  BrightC(BgraShape1.FillGradient.StartColor, 100);

  if mode=play then begin
  levL:=chLeft;
  LevR:=chright;
 // BASS_ChannelGetLevelEx(channel, val, 0,02, BASS_LEVEL_STEREO);
//level := BASS_ChannelGetLevel(channel);
//level := BASS_ChannelGetLevel(channel);
if off_analizer then
TimerRender.Interval:=100
else
TimerRender.Interval:=50;
  end
else
begin
level:=0;
 TimerRender.Interval:=100;
end;

chleft := LOWORD(level);
chright := HIWORD(level);
if Options_frm.ComboBox4.ItemIndex = 1 then
begin
chleft := chleft + chright div 2;
chright := chleft;
end;

{if levelLeft.Position<chLeft then
levelLeft.Position :=chLeft //Trunc((chLeft+LevL)/2)
  else
  levelLeft.Position:= levelLeft.Position-Trunc((chLeft+levelLeft.Position)/30);
//levelLeft.Position:= levelLeft.Position-Trunc((levelLeft.Position)/30);
if  chLeft<10 then
//levelLeft.Position:=chLeft;
//if levelLeft.Position>chleft-800 then
  levelLeft.Position:=levelLeft.Position-400
  else
  if   levelLeft.Position>chleft-100 then
   levelLeft.Position:=levelLeft.Position-10;  }
   levelLeft.Position := chLeft;
 {
if levelRight.Position<chRight then
   levelRight.Position :=chRight  //Trunc((chRight+LevR)/2)
   else
levelRight.Position:=levelRight.Position-Trunc((levelRight.Position)/30);
maxnumber:= Max(chLeft, chRight) ;
 if chRight<10 then
    levelRight.Position:=chRight; }
 levelRight.Position:=chRight;
if  (chRight > 32766) then
TimerRighOverDrive.Enabled :=true;
 if  chLeft > 32766 then
TimerLeftOverDrive.Enabled :=true;
if TimerLeftOverDrive.Enabled then begin
LeftOver.Visible:= true;

end;
if TimerRighOverDrive.Enabled then begin
RightOver.Visible:= true;
//SetFxVolume;
end;
//BASS_ChannelGetAttribute(Channel, BASS_ATTRIB_CPU, val);
//label6.Caption := FloatToStrF(val, ffFixed, 0, 1)+'%';
//if  not label6.Visible then
//label6.Visible:=true;
label6.Caption := FloatToStrF(BASS_GetCPU(), ffFixed, 0, 1)+'%';
if mode=play then begin
levelLeft.Visible := True;
levelRight.Visible := True;
end
else begin
levelLeft.Visible := false;
levelRight.Visible := false;
end;
if mode=play then begin
LevelLeft.Visible:= not Off_Analizer;
LevelRight.Visible:= not Off_Analizer;
end
else begin
LevelLeft.Visible:= false;
LevelRight.Visible:= false;
 end;




if mode=play then
PlayMenu.Checked:=true;
if mode=paused then
PauseMenu.Checked:=true;
If mode=stop then
StopMenu.Checked:=true;
end;



//var
//dirapp:string;
procedure TForm_player.FormCreate(Sender: TObject);
var
  dw:longint;
  s, path,fname:string;
 Ver:DWORD ;
 loa:boolean;
i:integer;
Fil1: File of Single;
begin
LevelRight.Height:=6;
LevelLeft.Height:=6;
path:= ExtractFilePath(ParamStr(0))+'lib'+DirectorySeparator;
fname:=PChar(path+'libbass.so');
                          if not Load_BASSDLL(PChar(fname)) then
                           begin showMessage('won''t happen!'); exit end;

LoadLibsInDirs( ExtractFilePath(ParamStr(0))+'lib'+DirectorySeparator);
LoadLibsInDirs( ExtractFilePath(ParamStr(0)));

// verify the correctness of the loaded libbass.so
if (HIWORD(BASS_GetVersion) <> BASSVERSION)  then
	begin
		MessageBox(0,'Incorrect version of libbass.so',nil,MB_ICONERROR);
	Halt;
	end;

// Loading the libbass_fx.so library
//
//setenv('LD_LIBRARY_PATH', PChar(ExtractFilePath(ParamStr(0)) + 'lib' + DirectorySeparator + 'fx'));
//s:=PChar(ExtractFilePath(ParamStr(0))+'lib'+DirectorySeparator+'fx/libbass_fx.so');
loa:= Load_BASSFXDLL(PChar(ExtractFilePath(ParamStr(0))+'lib'+DirectorySeparator+'fx/libbass_fx.so'));
loa:= Load_BASSENCDLL(PChar(ExtractFilePath(ParamStr(0))+'lib'+DirectorySeparator+'fx/libbassenc.so'));
loa:= LoadBASSCDLibrary(PChar(ExtractFilePath(ParamStr(0))+'lib'+DirectorySeparator+'fx/libbasscd.so'));
BASS_CD_SetInterface(0);
//loa:= Load_BASSENCMP3DLL(PChar(ExtractFilePath(ParamStr(0))+'lib'+DirectorySeparator+'fx/libbassenc_mp3.so'));
 //ver:=HIWORD(BASS_FX_GetVersion);
BGRAShape1.FillGradient.StartColor:=TrackBar1.Color;
 BGRAShape1.FillGradient.StartColor:=BrightC(BGRAShape1.FillGradient.StartColor,70);
Spectrum    := TSpectrum.Create(PaintBox1.Width, PaintBox1.Height);
TimerRender.Enabled:=True;
 GetVerInfo(self);

setDefaultLang('de', 'languages');
//BitBtn2.Caption:='';
//BitBtn1.Glyph := Nil;;
//BitBtn2.Glyph := Nil;;
// HidePlayList:= Options_frm.CheckBox7.Checked;


i:=0;
if FileExists('./swampproperties/customEq.dat') then begin
AssignFile(fil1, './swampproperties/customEq.dat');
Reset(fil1);
  While Not(Eof(fil1)) Do  begin
   Read(fil1, aCustom[i]); // read element
      Write(aCustom[i]);
      Inc(i);
    End;

   end;

  DBusKeys := TDBusKeyHandler.Create;
  DBusKeys.Activate;

end;



procedure TForm_player.TrackBar1MouseLeave(Sender: TObject);
begin
  trackBar1.Cursor:=crDefault;
Application.ProcessMessages;
end;

procedure TForm_player.TrackBar1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  trackBar1.Cursor:=crSizeWE;
Application.ProcessMessages;
end;

procedure TForm_player.TrackSpeedClick(Sender: TObject);
begin
   if FXTempo=-25 then
    neg75.Checked:=true
    else
  if FXTempo=-50 then
     neg50.Checked:=true
     else
     if FXTempo=-75 then
    neg25.Checked:=true
    else
    if FXTempo=0 then
    SNormal.Checked:=true
    else
    if FXTempo=25 then
    S125.Checked:=true
    else
    if FXTempo=50 then
    S150.Checked:=true
    else


    if FXTempo=75 then
    S175.Checked:=true
    else
    if FXTempo=100 then
    S200.Checked:=true
    else
    if FXTempo=125 then
    S225.Checked:=true
    else
    if FXTempo=150 then
    S250.Checked:=true
    else
    if FXTempo=175 then
    S275.Checked:=true
    else
    if FXTempo=200 then
    S300.Checked:=true;


end;

procedure TForm_player.OpenFormClick(Sender: TObject);
begin
//Application.CreateForm(TOptions_frm, Options_frm);

Frm_Effects.Show;


end;

procedure TForm_player.PaintBox1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TForm_player.Panel1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
i:integer;
tPB:TProgressBar;
tLbl:Tlabel;
begin
 if Off_Equalizer then exit;
  for i:=1 to 18 do begin
  tPB:=(FindComponent('Pb'+IntToStr(i)) as TProgressBar);
     tLbl:= (FindComponent('LblEQ'+IntToStr(i)) as TLabel);
        tPB.Position:=tPB.Position + WheelDelta;
           Handled := True;
        tLbl.Caption:=FloatToStrF((tPB.Position/1000), ffFixed,0,1);;
    BASS_FXGetParameters(fx[tPB.tag], @p);
  p.fgain := tpB.Position/1000;
BASS_FXSetParameters(fx[tPB.tag], @p);
  end;

end;






end.
