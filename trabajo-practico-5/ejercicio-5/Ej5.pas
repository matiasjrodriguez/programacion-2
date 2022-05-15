unit Ej5;

interface

uses
  Variants, SysUtils, ListArray, QueuesArrayNC, StackArray, Tipos;

type

  TADEj5 = object
    private
      function copiarCola(var C:Cola):Cola;
      function copiarPila(var P:Pila):Pila;
      function BuscarEnPila(var P:Pila;X:Tipoelemento;var Pos:integer): boolean;
      function BuscarEnCola(var C:Cola;X:Tipoelemento;var Pos:integer): boolean;
    public
      function ValoresComunes(var C:Cola;var P:Pila):Lista;
  end;

implementation

{ TADEj5 }

function TADEj5.copiarCola(var C: Cola): Cola;
var
  X:TipoElemento;
  Aux1,Aux2,Copia: Cola;
begin
  Aux1.Crear(C.DatoDeLaClave,C.SizeQueue);
  Aux2.Crear(C.DatoDeLaClave,C.SizeQueue);
  Copia.Crear(C.DatoDeLaClave,C.SizeQueue);
  while not C.EsVacia do begin
    X := C.Recuperar;
    C.DesEncolar;
    Aux1.Encolar(X);
    Aux2.Encolar(X);
  end;
  C.InterCambiar(Aux1,True);
  Copia.InterCambiar(Aux2,True);
  result := Copia;
end;

function TADEj5.copiarPila(var P: Pila): Pila;
var
  X:TipoElemento;
  Aux1,Aux2,Copia: Pila;
begin
  Aux1.Crear(P.DatoDeLaClave,P.SizeStack);
  Aux2.Crear(P.DatoDeLaClave,P.SizeStack);
  Copia.Crear(P.DatoDeLaClave,P.SizeStack);
  while not P.EsVacia do begin
    X := P.Recuperar;
    P.DesApilar;
    Aux1.Apilar(X);
    Aux2.Apilar(X);
  end;
  P.InterCambiar(Aux1,True);
  Copia.InterCambiar(Aux2,True);
  result := Copia;
end;

function TADEj5.BuscarEnCola(var C:Cola; X:TipoElemento; var Pos:integer): boolean;
var
  Encontre: boolean;
  CAux: Cola;
  XA: TipoElemento;
  Contador: integer;
begin
  CAux.Crear(C.DatoDeLaClave,C.SizeQueue);
  Contador := 0;
  Encontre := False;
  while (not C.EsVacia) do begin
    inc(Contador);
    XA := C.Recuperar;
    if (XA.Clave = X.Clave) and (not Encontre) then begin
      Pos := Contador;
      Encontre := True;
    end;
    CAux.Encolar(XA);
    C.DesEncolar;
  end;
  C.InterCambiar(CAux,True);
  result := Encontre;
end;

function TADEj5.BuscarEnPila(var P:Pila; X:TipoElemento; var Pos:integer): boolean;
var
  Encontre: boolean;
  PAux: Pila;
  XA: TipoElemento;
  Contador: integer;
begin
  PAux.Crear(P.DatoDeLaClave,P.SizeStack);
  Contador := 0;
  Encontre := False;
  while (not P.EsVacia) do begin
    inc(Contador);
    XA := P.Recuperar;
    if (XA.Clave = X.Clave) and (not Encontre) then begin
      Pos := Contador;
      Encontre := True;
    end;
    PAux.Apilar(XA);
    P.DesApilar;
  end;
  P.InterCambiar(PAux,True);
  result := Encontre;
end;

//Tiene una complejidad algoritmica de O(n^2) porque en el peor de los casos cada iteracion tiene que pasar por otra iteracion (Sin implementacion)
function TADEj5.ValoresComunes(var C: Cola;var P: Pila): Lista;
var
  LR: Lista;
  X,XR: TipoElemento;
  PCopia: Pila;
  CCopia: Cola;
  PosCola,PosPila:integer;
begin
  PCopia := copiarPila(P);
  CCopia := copiarCola(C);

  if C.SizeQueue > P.SizeStack then
    LR.Crear(Cadena,C.SizeQueue)
  else
    LR.Crear(Cadena,P.SizeStack);

  while (not CCopia.EsVacia) and (not PCopia.EsVacia) do begin

    if C.SizeQueue > P.SizeStack then begin
      X := CCopia.Recuperar;
      if BuscarEnCola(C,X,PosCola) and BuscarEnPila(P,X,PosPila) then begin
        XR.Clave := VarToStr(X.Clave) + ':' + PosPila.ToString + ':' + PosCola.ToString;
        LR.Agregar(XR);
      end;
      CCopia.DesEncolar;
    end
    else begin
      X := PCopia.Recuperar;
      if BuscarEnCola(C,X,PosCola) and BuscarEnPila(P,X,PosPila) then begin
        XR.Clave := VarToStr(X.Clave) + ':' + PosPila.ToString + ':' + PosCola.ToString;
        LR.Agregar(XR);
      end;
      PCopia.DesApilar;
    end;

  end;
  result := LR;
end;

end.
