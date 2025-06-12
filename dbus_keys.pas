unit dbus_keys;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DBus, ctypes;

// dbus-glib integration is required for handling
// the main loop. Lazarus' DBus unit may miss this
// declaration, so provide it here.
procedure dbus_connection_setup_with_g_main(conn: PDBusConnection;
  context: Pointer); cdecl; external 'dbus-glib-1';

type
  TDBusKeyHandler = class
  private
    FConnection : PDBusConnection;
    FError      : DBusError;
    procedure HandleMessage(msg: PDBusMessage);
    class function Filter(conn: PDBusConnection; msg: PDBusMessage; user_data: Pointer): DBusHandlerResult; cdecl; static;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Activate;
  end;

implementation

uses
  sw_player;

constructor TDBusKeyHandler.Create;
begin
  inherited Create;
  dbus_error_init(@FError);
  FConnection := dbus_bus_get(DBUS_BUS_SESSION, @FError);
  if FConnection <> nil then
  begin
    dbus_connection_setup_with_g_main(FConnection, nil);
    dbus_connection_add_filter(FConnection, @Filter, Self, nil);
  end;
end;

destructor TDBusKeyHandler.Destroy;
begin
  if FConnection <> nil then
    dbus_connection_unref(FConnection);
  inherited Destroy;
end;

procedure TDBusKeyHandler.Activate;
var
  match, app: PChar;
  msg: PDBusMessage;
  zero: cuint32;
begin
  if FConnection = nil then
    Exit;
  match := 'type=''signal'',interface=''org.gnome.SettingsDaemon.MediaKeys''';
  dbus_bus_add_match(FConnection, match, @FError);
  // grab multimedia keys from gnome settings daemon
  app := 'SW-AMP';
  zero := 0;
  msg := dbus_message_new_method_call('org.gnome.SettingsDaemon',
                                      '/org/gnome/SettingsDaemon/MediaKeys',
                                      'org.gnome.SettingsDaemon.MediaKeys',
                                      'GrabMediaPlayerKeys');
  if msg <> nil then
  begin
    dbus_message_append_args(msg,
      DBUS_TYPE_STRING, [@app, DBUS_TYPE_UINT32, @zero, DBUS_TYPE_INVALID]);
    dbus_connection_send(FConnection, msg, nil);
    dbus_message_unref(msg);
  end;
  dbus_connection_flush(FConnection);
end;

class function TDBusKeyHandler.Filter(conn: PDBusConnection; msg: PDBusMessage; user_data: Pointer): DBusHandlerResult; cdecl;
begin
  TDBusKeyHandler(user_data).HandleMessage(msg);
  Result := DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
end;

procedure TDBusKeyHandler.HandleMessage(msg: PDBusMessage);
var
  app: PChar;
  key: PChar;
begin
  if (dbus_message_is_signal(msg, 'org.gnome.SettingsDaemon.MediaKeys', 'MediaPlayerKeyPressed') > 0) then
  begin
    if dbus_message_get_args(msg, @FError,
      DBUS_TYPE_STRING, [@app, DBUS_TYPE_STRING, @key, DBUS_TYPE_INVALID]) <> 0 then
    begin
      if StrComp(key, 'Play') = 0 then
        Form_player.BGRAShape1Click(Form_player)
      else if StrComp(key, 'Stop') = 0 then
        Form_player.BGRAShape2Click(Form_player)
      else if (StrComp(key, 'Pause') = 0) or (StrComp(key, 'PlayPause') = 0) then
        Form_player.BGRAShape3Click(Form_player)
      else if StrComp(key, 'Next') = 0 then
        Form_player.BGRAShape5Click(Form_player)
      else if StrComp(key, 'Previous') = 0 then
        Form_player.BGRAShape7Click(Form_player);
    end;
  end;
end;

end.
