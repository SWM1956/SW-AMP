{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit NewPackage;

{$warn 5023 off : no warning about unused units}
interface

uses
  FTrackBar, LazarusPackageIntf;

implementation

// Регистрация пакета NewPackage
procedure Register;
begin
  RegisterUnit('FTrackBar', @FTrackBar.Register);
end;

initialization
  RegisterPackage('NewPackage', @Register);
end.
