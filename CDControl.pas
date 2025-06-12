unit CDControl;

{$mode objfpc}{$H+}

interface

uses
  DynLibs;

const
  // Замінюється на фактичне ім’я вашої бібліотеки
  LIBBASSCD = 'libbasscd.so';
  BASS_CD_DOOR_CLOSE =	0 ;
  BASS_CD_DOOR_OPEN  =	1 ;
  BASS_CD_DOOR_LOCK  =	2 ;
  BASS_CD_DOOR_UNLOCK=	3 ;
type
  DWORD = Cardinal;
  BOOL = LongBool;
  TBASS_CD_Info = record
    vendor: PChar;
    product: PChar;
    rev: PChar;
    letter: Char;
    rwflags: DWORD;
    canopen: BOOL;
    canlock: BOOL;
    maxspeed: DWORD;
    cache: DWORD;
    cdtext: BOOL;
    // BASS_CD_Door actions

  end;

  TBASS_CD_StreamCreate = function(drive, track: DWORD; flags: DWORD): DWORD; cdecl;
  TBASS_CD_GetTracks = function(drive: DWORD): DWORD; cdecl;
  TBASS_CD_GetInfo = function(drive: DWORD; var info: TBASS_CD_Info): BOOL; cdecl;
  TBASS_CD_Door = function(drive, action: DWORD): BOOL; cdecl;
  TBASS_CD_Release = function(drive: DWORD): BOOL; cdecl;
  TBASS_CD_SetInterface = function(drive: DWORD): BOOL; cdecl;
var
  BASS_CD_StreamCreate: TBASS_CD_StreamCreate;
  BASS_CD_GetTracks: TBASS_CD_GetTracks;
  BASS_CD_GetInfo: TBASS_CD_GetInfo;
  BASS_CD_Door: TBASS_CD_Door;
  BASS_CD_Release: TBASS_CD_Release;
  BASS_CD_SetInterface:  TBASS_CD_SetInterface;

function LoadBASSCDLibrary(const LibPath: string): Boolean;
procedure UnloadBASSCDLibrary;

implementation

var
  BASSCDHandle: TLibHandle = 0;

function LoadBASSCDLibrary(const LibPath: string): Boolean;
begin
  Result := False;

  if BASSCDHandle <> 0 then
    Exit(True); // already loaded

  BASSCDHandle := LoadLibrary(PChar(LibPath));
  if BASSCDHandle = 0 then Exit;

  Pointer(BASS_CD_StreamCreate) := GetProcAddress(BASSCDHandle, 'BASS_CD_StreamCreate');
  Pointer(BASS_CD_GetTracks)    := GetProcAddress(BASSCDHandle, 'BASS_CD_GetTracks');
  Pointer(BASS_CD_GetInfo)      := GetProcAddress(BASSCDHandle, 'BASS_CD_GetInfo');
  Pointer(BASS_CD_Door)         := GetProcAddress(BASSCDHandle, 'BASS_CD_Door');
  Pointer(BASS_CD_Release)         := GetProcAddress(BASSCDHandle, 'BASS_CD_Release');
  Pointer(BASS_CD_SetInterface)         := GetProcAddress(BASSCDHandle, 'BASS_CD_SetInterface');
  Result :=
    Assigned(BASS_CD_StreamCreate) and
    Assigned(BASS_CD_GetTracks) and
   Assigned(BASS_CD_GetInfo) and
   Assigned(BASS_CD_Door)  and
     Assigned(BASS_CD_SetInterface)  and
   Assigned(BASS_CD_Release)
  ;
  if not Result then
    UnloadBASSCDLibrary;
end;

procedure UnloadBASSCDLibrary;
begin
  if BASSCDHandle <> 0 then
  begin
    UnloadLibrary(BASSCDHandle);
    BASSCDHandle := 0;
  end;
end;

end.
