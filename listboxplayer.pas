{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ListBoxPlayer;

{$warn 5023 off : no warning about unused units}
interface

uses
  ListBoxPlayer1, LazarusPackageIntf;

implementation

// Регистрация пакета ListBoxPlayer
procedure Register;
begin
  RegisterUnit('ListBoxPlayer1', @ListBoxPlayer1.Register);
end;

initialization
  RegisterPackage('ListBoxPlayer', @Register);
end.
