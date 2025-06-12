{
  BASSenc_MP3 2.4 Delphi unit
  Copyright (c) 2018 Un4seen Developments Ltd.

  See the BASSENC_MP3.CHM file for more detailed documentation
}

Unit Dynamic_BASSenc_MP3;

interface

uses
 {$IFDEF LINUX}
  //Libc
 {$ENDIF}
 {$IFDEF MSWINDOWS}
  Windows,
 {$ENDIF}


const
{$IFDEF MSWINDOWS}
  bassencmp3dll = 'bassenc_mp3.dll';
     const

{$ENDIF}
{$IFDEF LINUX}
  bassencmp3dll = 'libbassenc_mp3.so';
{$ENDIF}
{$IFDEF MACOS}
  bassencmp3dll = 'libbassenc_mp3.dylib';
{$ENDIF}


var
  BASS_Encode_MP3_GetVersion:function : DWORD; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
  BASS_Encode_MP3_Start:function(handle:DWORD; options:PChar; flags:DWORD; proc:ENCODEPROC; user:Pointer): HENCODE; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};
  BASS_Encode_MP3_StartFile:function(handle:DWORD; options:PChar; flags:DWORD; filename:PChar): HENCODE; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF};

var
  BASSENCMP3_Handle : Thandle = 0;

function Load_BASSENCMP3DLL(const dllfilename : string) : boolean;
procedure Unload_BASSENCMP3DLL;

implementation

function Load_BASSENCMP3DLL(const dllfilename : string) : boolean;
{$IFDEF MSWINDOWS}
	var oldmode : integer;
{$ENDIF}
begin
  if BASSENCMP3_Handle <> 0 then // is it already there ?
   Result := true
  else
   begin {go & load the dll}
   {$IFDEF MSWINDOWS}
     oldmode := SetErrorMode($8001);
   {$ENDIF}

   {$IFDEF UNICODE}
     BASSENCMP3_Handle:= LoadLibraryW(PWideChar(dllfilename));
   {$ELSE}
     BASSENCMP3_Handle:= LoadLibrary(PChar(dllfilename));
   {$ENDIF}

   {$IFDEF MSWINDOWS}
    SetErrorMode(oldmode);
   {$ENDIF}


    if BASSENCMP3_Handle <> 0 then
     begin
      @BASS_Encode_MP3_GetVersion := GetProcAddress(BASSENCMP3_Handle, PChar('BASS_Encode_MP3_GetVersion'));
      @BASS_Encode_MP3_Start :=      GetProcAddress(BASSENCMP3_Handle, PChar('BASS_Encode_MP3_Start'));
      @BASS_Encode_MP3_StartFile :=  GetProcAddress(BASSENCMP3_Handle, PChar('BASS_Encode_MP3_StartFile'));


      If (@BASS_Encode_MP3_GetVersion = nil) or
       (@BASS_Encode_MP3_Start = nil) or
       (@BASS_Encode_MP3_StartFile = nil) then
       begin
        FreeLibrary(BASSENCMP3_Handle);
        BASSENCMP3_Handle := 0;
       end;
     end;
    Result := (BASSENCMP3_Handle <> 0);
   end;
end;


procedure Unload_BASSENCMP3DLL;
begin
 if BASSENCMP3_Handle <> 0 then
  FreeLibrary(BASSENCMP3_Handle);
  BASSENCMP3_Handle := 0
end;

end.
