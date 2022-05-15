unit TADColas2;

interface

Uses
  Tipos, stdctrls, SysUtils, QueuesPointer;

type
  ObjColas = object
    function Iguales(var C1,C2:Cola):boolean;
  end;

implementation

{ ObjPilas }

function ObjColas.Iguales(var C1, C2: Cola): boolean;
var
  CAux: Cola;
  X1,X2:TipoElemento;
  Igual: boolean;
begin
  Igual := True;
  CAux.Crear(C1.DatoDeLaClave,C1.SizeQueue * 2);
  while not C1.EsVacia do begin
    X1 := C1.Recuperar;
    X2 := C2.Recuperar;
    if X1.Clave <> X2.Clave then
      Igual := False;
    CAux.Encolar(X1);
    CAux.Encolar(X2);
    C1.DesEncolar;
    C2.DesEncolar;
  end;
  while not CAux.EsVacia do begin  //Recuperar colas
    X1 := CAux.Recuperar;
    CAux.DesEncolar;
    X2 := CAux.Recuperar;
    CAux.DesEncolar;
    C1.Encolar(X1);
    C2.Encolar(X2);
  end;
  result := Igual;
end;

end.
