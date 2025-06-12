{
  BASSenc v2.4.13 Delphi API, Copyright (c) 2003-2014 Un4seen Developments Ltd. Ian Luck.
  Requires BASS, available @ www.un4seen.com

  See the BASSENC.CHM file for more detailed documentation

********************************************************************************

  Dynamic_Bassenc.pas written by Wishmaster
  Updated by Wishmaster 02/11/2018

********************************************************************************
}

unit Dynamic_Bassenc;

interface

uses
 //{$IFDEF LINUX}
//  Libc
// {$ENDIF}
 {$IFDEF MSWINDOWS}
  Windows,
 {$ENDIF}
  lazdynamic_bass;


const
{$IFDEF MSWINDOWS}
  bassencdll = 'bassenc.dll';
{$ENDIF}
{$IFDEF LINUX}
  bassencdll = 'libbassenc.so';
{$ENDIF}
{$IFDEF MACOS}
  bassencdll = 'libbassenc.dylib';
{$ENDIF}


const
  // Additional error codes returned by BASS_ErrorGetCode
  BASS_ERROR_ACM_CANCEL           = 2000; // ACM codec selection cancelled
  BASS_ERROR_CAST_DENIED          = 2100; // access denied (invalid password)

  // Additional BASS_SetConfig options
  BASS_CONFIG_ENCODE_PRIORITY     = $10300; // encoder DSP priority
  BASS_CONFIG_ENCODE_QUEUE        = $10301;
  BASS_CONFIG_ENCODE_ACM_LOAD     = $10302;
  // Additional BASS_SetConfigPtr options
  BASS_CONFIG_ENCODE_CAST_TIMEOUT = $10310; // cast timeout
  BASS_CONFIG_ENCODE_CAST_PROXY   = $10311;

  //BASS_SetConfigPtr(BASS_CONFIG_ENCODE_ACM_LOAD, "l3codecp.acm");

  // BASS_Encode_Start flags
  BASS_ENCODE_NOHEAD            = 1;	// don't send a WAV header to the encoder
  BASS_ENCODE_FP_8BIT           = 2;	// convert floating-point sample data to 8-bit integer
  BASS_ENCODE_FP_16BIT          = 4;	// convert floating-point sample data to 16-bit integer
  BASS_ENCODE_FP_24BIT          = 6;	// convert floating-point sample data to 24-bit integer
  BASS_ENCODE_FP_32BIT          = 8;	// convert floating-point sample data to 32-bit integer
  BASS_ENCODE_FP_AUTO           = 14;	// convert floating-point sample data back to channel's format
  BASS_ENCODE_BIGEND            = 16;	// big-endian sample data
  BASS_ENCODE_PAUSE             = 32;	// start encording paused
  BASS_ENCODE_PCM               = 64;	// write PCM sample data (no encoder)
  BASS_ENCODE_RF64              = 128;	// send an RF64 header
  BASS_ENCODE_MONO              = $100; // convert to mono (if not already)
  BASS_ENCODE_QUEUE             = $200; // queue data to feed encoder asynchronously
  BASS_ENCODE_WFEXT             = $400; // WAVEFORMATEXTENSIBLE "fmt" chunk
  BASS_ENCODE_CAST_NOLIMIT      = $1000; // don't limit casting data rate
  BASS_ENCODE_LIMIT             = $2000; // limit data rate to real-time
  BASS_ENCODE_AIFF              = $4000; // send an AIFF header rather than WAV
  BASS_ENCODE_DITHER            = $8000; // apply dither when converting floating-point sample data to integer
  BASS_ENCODE_AUTOFREE          = $40000; // free the encoder when the channel is freed

  // BASS_Encode_GetACMFormat flags
  BASS_ACM_DEFAULT              = 1; // use the format as default selection
  BASS_ACM_RATE                 = 2; // only list formats with same sample rate as the source channel
  BASS_ACM_CHANS                = 4; // only list formats with same number of channels (eg. mono/stereo)
  BASS_ACM_SUGGEST              = 8; // suggest a format (HIWORD=format tag)

  // BASS_Encode_GetCount counts
  BASS_ENCODE_COUNT_IN          = 0; // sent to encoder
  BASS_ENCODE_COUNT_OUT         = 1; // received from encoder
  BASS_ENCODE_COUNT_CAST        = 2; // sent to cast server
  BASS_ENCODE_COUNT_QUEUE       = 3; // queued
  BASS_ENCODE_COUNT_QUEUE_LIMIT = 4; // queue limit
  BASS_ENCODE_COUNT_QUEUE_FAIL  = 5; // failed to queue

  // BASS_Encode_CastInit content MIME types
  BASS_ENCODE_TYPE_MP3          = 'audio/mpeg';
  BASS_ENCODE_TYPE_OGG          = 'application/ogg';
  BASS_ENCODE_TYPE_AAC          = 'audio/aacp';

  // BASS_Encode_CastGetStats types
  BASS_ENCODE_STATS_SHOUT       = 0; // Shoutcast stats
  BASS_ENCODE_STATS_ICE         = 1; // Icecast mount-point stats
  BASS_ENCODE_STATS_ICESERV     = 2; // Icecast server stats

  // Encoder notifications
  BASS_ENCODE_NOTIFY_ENCODER    = 1;   // encoder died
  BASS_ENCODE_NOTIFY_CAST       = 2;   // cast server connection died
  BASS_ENCODE_NOTIFY_CAST_TIMEOUT = $10000; // cast timeout
  BASS_ENCODE_NOTIFY_QUEUE_FULL   = $10001; // queue is out of space
  BASS_ENCODE_NOTIFY_FREE         = $10002; // encoder has been freed

 // BASS_Encode_ServerInit flags
  BASS_ENCODE_SERVER_NOHTTP	   	= 1;	// no HTTP headers
  BASS_ENCODE_SERVER_META       = 2; // Shoutcast metadata

type
  HENCODE = DWORD;   // encoder handle

  ENCODEPROC = procedure(handle:HENCODE; channel:DWORD; buffer:Pointer; length:DWORD; user:Pointer); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
  {
    Encoding callback function.
    handle : The encoder
    channel: The channel handle
    buffer : Buffer containing the encoded data
    length : Number of bytes
    user   : The 'user' parameter value given when calling BASS_EncodeStart
  }

  ENCODEPROCEX = procedure(handle:HENCODE; channel:DWORD; buffer:Pointer; length:DWORD; offset:QWORD; user:Pointer); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
  {
    Encoding callback function with offset info.
    handle : The encoder
    channel: The channel handle
    buffer : Buffer containing the encoded data
    length : Number of bytes
    offset : File offset of the data
    user   : The 'user' parameter value given when calling BASS_Encode_StartCA
  }

  ENCODERPROC = function(handle:HENCODE; channel:DWORD; buffer:Pointer; length:DWORD; maxout:DWORD; user:Pointer): DWORD; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
  {
    Encoder callback function.
    handle : The encoder
    channel: The channel handle
    buffer : Buffer containing the PCM data (input) and receiving the encoded data (output)
    length : Number of bytes in (-1=closing)
    maxout : Maximum number of bytes out
    user   : The 'user' parameter value given when calling BASS_Encode_StartUser
    RETURN : The amount of encoded data (-1=stop)
  }

  ENCODECLIENTPROC = function(handle:HENCODE; connect:BOOL; client:PAnsiChar; headers:PAnsiChar; user:Pointer): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
  {
    Client connection notification callback function.
    handle : The encoder
    connect: TRUE/FALSE=client is connecting/disconnecting
    client : The client's address (xxx.xxx.xxx.xxx:port)
    headers: Request headers (optionally response headers on return)
    user   : The 'user' parameter value given when calling BASS_Encode_ServerInit
    RETURN : TRUE/FALSE=accept/reject connection (ignored if connect=FALSE)
  }

  ENCODENOTIFYPROC = procedure(handle:HENCODE; status:DWORD; user:Pointer); {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
  {
    Encoder death notification callback function.
    handle : The encoder
    status : Notification (BASS_ENCODE_NOTIFY_xxx)
    user   : The 'user' parameter value given when calling BASS_Encode_SetNotify
  }





var
 BASS_Encode_GetVersion:function : DWORD; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_Start:function(handle:DWORD; cmdline:PChar; flags:DWORD; proc:ENCODEPROC; user:Pointer): HENCODE; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_StartLimit:function(handle:DWORD; cmdline:PChar; flags:DWORD; proc:ENCODEPROC; user:Pointer; limit : DWORD): HENCODE; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_AddChunk:function(handle:HENCODE; id:PChar; buffer:Pointer; length:DWORD): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_IsActive:function(handle:DWORD): DWORD; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_Stop:function(handle:DWORD): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_SetPaused:function(handle:DWORD; paused:BOOL): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_Write:function(handle:DWORD; buffer:Pointer; length:DWORD): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_SetNotify:function(handle:DWORD; proc:ENCODENOTIFYPROC; user:Pointer): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_GetCount:function(handle:HENCODE; count:DWORD): QWORD; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_SetChannel:function(handle:DWORD; channel:DWORD): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_GetChannel:function(handle:HENCODE): DWORD; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 {$IFDEF MSWINDOWS}
 BASS_Encode_GetACMFormat:function(handle:DWORD; form:Pointer; formlen:DWORD; title:PAnsiChar; flags:DWORD): DWORD; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_StartACM:function(handle:DWORD; form:Pointer; flags:DWORD; proc:ENCODEPROC; user:Pointer): HENCODE; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_StartACMFile:function(handle:DWORD; form:Pointer; flags:DWORD; filename:PChar): HENCODE; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 {$ENDIF}

 {$IFDEF MACOS}
  BASS_Encode_StartCA:function(handle,ftype,atype,flags,bitrate:DWORD; proc:ENCODEPROCEX; user:Pointer): HENCODE; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
  BASS_Encode_StartCAFile:function(handle,ftype,atype,flags,bitrate:DWORD; filename:PChar): HENCODE; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 {$ENDIF}

 BASS_Encode_CastInit:function(handle:HENCODE; server,pass,content,name,url,genre,desc,headers:PAnsiChar; bitrate:DWORD; pub:BOOL): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_CastSetTitle:function(handle:HENCODE; title,url:PAnsiChar): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_CastSendMeta:function(handle:HENCODE; mtype:DWORD; data:Pointer; length:DWORD): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_CastGetStats:function(handle:HENCODE; stype:DWORD; pass:PAnsiChar): PChar; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_ServerInit:function(handle:HENCODE; port:PAnsiChar; buffer,burst,flags:DWORD; proc:ENCODECLIENTPROC; user:Pointer): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
 BASS_Encode_ServerKick:function(handle:HENCODE; client:PAnsiChar): BOOL; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

var
 BASSENC_Handle:Thandle = 0;

function Load_BASSENCDLL(const dllfilename : string) : boolean;
procedure Unload_BASSENCDLL;


implementation


function Load_BASSENCDLL(const dllfilename : string) : boolean;
{$IFDEF MSWINDOWS}
	var oldmode : integer;
{$ENDIF}
begin
  if BASSENC_Handle <> 0 then // is it already there ?
   Result := true
  else
   begin {go & load the dll}
   {$IFDEF MSWINDOWS}
     oldmode := SetErrorMode($8001);
   {$ENDIF}

   {$IFDEF UNICODE}
     BASSENC_Handle:= LoadLibraryW(PWideChar(dllfilename));
   {$ELSE}
     BASSENC_Handle:= LoadLibrary(PChar(dllfilename));
   {$ENDIF}

   {$IFDEF MSWINDOWS}
    SetErrorMode(oldmode);
   {$ENDIF}

    if BASSENC_Handle <> 0 then
     begin
      @BASS_Encode_GetVersion:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_GetVersion'));
      @BASS_Encode_Start:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_Start'));
      @BASS_Encode_StartLimit:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_StartLimit'));
      @BASS_Encode_AddChunk:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_AddChunk'));
      @BASS_Encode_IsActive:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_IsActive'));
      @BASS_Encode_Stop:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_Stop'));
      @BASS_Encode_SetPaused:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_SetPaused'));
      @BASS_Encode_Write:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_Write'));
      @BASS_Encode_SetNotify:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_SetNotify'));
      @BASS_Encode_GetCount:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_GetCount'));
      @BASS_Encode_SetChannel:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_SetChannel'));
      @BASS_Encode_GetChannel:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_GetChannel'));
      {$IFDEF MSWINDOWS}
      @BASS_Encode_GetACMFormat:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_GetACMFormat'));
      @BASS_Encode_StartACM:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_StartACM'));
      @BASS_Encode_StartACMFile:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_StartACMFile'));
      {$ENDIF}
      {$IFDEF MACOS}
      @BASS_Encode_StartCA:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_StartCA'));
      @BASS_Encode_StartCAFile:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_StartCAFile'));
      {$ENDIF}
      @BASS_Encode_CastInit:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_CastInit'));
      @BASS_Encode_CastSetTitle:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_CastSetTitle'));
      @BASS_Encode_CastSendMeta:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_CastSendMeta'));
      @BASS_Encode_CastGetStats:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_CastGetStats'));
      @BASS_Encode_ServerInit:= GetProcAddress(BASSENC_Handle, PChar('BASS_Encode_ServerInit'));
      @BASS_Encode_ServerKick:= GetProcAddress(BASSENC_Handle, PChar( 'BASS_Encode_ServerKick'));

  If (@BASS_Encode_GetVersion = nil) or
     (@BASS_Encode_Start = nil) or
     (@BASS_Encode_StartLimit = nil) or
     (@BASS_Encode_IsActive = nil) or
     (@BASS_Encode_Stop = nil) or
     (@BASS_Encode_SetPaused = nil) or
     (@BASS_Encode_Write = nil) or
     (@BASS_Encode_SetNotify = nil) or
     (@BASS_Encode_GetCount = nil) or
     (@BASS_Encode_SetChannel = nil) or
     (@BASS_Encode_GetChannel = nil) or
     {$IFDEF MSWINDOWS}
     (@BASS_Encode_GetACMFormat = nil) or
     (@BASS_Encode_StartACM = nil) or
     (@BASS_Encode_StartACMFile = nil) or
     {$ENDIF}
     {$IFDEF MACOS}
     (@BASS_Encode_StartCA = nil) or
     (@BASS_Encode_StartCAFile = nil) or
     {$ENDIF}
     (@BASS_Encode_CastInit = nil) or
     (@BASS_Encode_CastSetTitle = nil) or
     (@BASS_Encode_CastSendMeta = nil) or
     (@BASS_Encode_CastGetStats = nil) or
     (@BASS_Encode_ServerInit = nil) or
     (@BASS_Encode_ServerKick = nil) then
    begin
     FreeLibrary(BASSENC_Handle);
     BASSENC_Handle := 0;
    end;
   end;
   result := (BASSENC_Handle <> 0);
 end;
end;

procedure Unload_BASSENCDLL;
begin
 if BASSENC_Handle <> 0 then
  FreeLibrary(BASSENC_Handle);
  BASSENC_Handle := 0;
end;


end.
