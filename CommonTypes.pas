unit CommonTypes;

{$mode objfpc}{$H+}

{ CommonTypes by Alessandro Cappellozza
  version 0.8 02/2002
  http://digilander.Libero.it/Kappe/audioobject
}

interface

type
  TWaveData = array[0..2048] of DWORD;
  TFFTData  = array[0..1024] of Single;

implementation

end.
