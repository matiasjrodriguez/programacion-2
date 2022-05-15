unit TADej1;

interface

uses Tipos, QueuesPointer;

type
 TADManejoColas = object
   public
    procedure ConcatenarColas(var C1,C2:Cola);
    function estaEnCola(C:Cola; E:integer):boolean;
    function insertarEnCola(P,E:integer;C:Cola):Cola;
 end;

implementation

{ TADManejoColas }

procedure TADManejoColas.ConcatenarColas(var C1,C2: Cola);
var
  X:TipoElemento;
  CAux: Cola;
begin
  CAux.Crear(C2.DatoDeLaClave,C2.SizeQueue*2);
  CAux.InterCambiar(C1,False);
  while not C2.EsVacia do begin
    X := C2.Recuperar;
    CAux.Encolar(X);
    C2.DesEncolar;
  end;
  C1.Crear(CAux.DatoDeLaClave,CAux.SizeQueue);
  C1.InterCambiar(CAux,False);
end;

function TADManejoColas.estaEnCola(C:Cola; E:integer): boolean;
var
  X:TipoElemento;
  esta:boolean;
begin
  esta := false;
  while not C.EsVacia do begin
    X := C.Recuperar;
    if X.Clave = E then
      esta := True;
    C.DesEncolar;
  end;
  result := esta;
end;

function TADManejoColas.insertarEnCola(P,E:integer; C:Cola): Cola;
var
  CAux:Cola;
  X,XE:TipoElemento;
  Contador:integer;
begin
  XE.Clave := E;
  CAux.Crear(C.DatoDeLaClave,C.SizeQueue);
  CAux.InterCambiar(C,True);
  C.Crear(CAux.DatoDeLaClave,CAux.SizeQueue + 1);
  Contador := 0;
  while not CAux.EsVacia do begin
    inc(Contador);
    if contador = P then
      C.Encolar(XE);
    X := CAux.Recuperar();
    C.Encolar(X);
    CAux.DesEncolar;
  end;
  result := C;
end;


end.
