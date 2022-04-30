unit UnitTAD;

interface

uses
  Variants, Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  PilaPalindromo = object
    private
      miPila: Pila;
    public
      procedure crearPila(tamaño:integer);
      procedure apilarPila(caracter:string);
      function esPalindromo():boolean;
      function Iguales(P:Pila):boolean;
      function mostrar():string;
  end;

implementation

{ PilaPalindromo }

procedure PilaPalindromo.apilarPila(caracter: string);
var
  X:TipoElemento;
begin
  X.Clave := caracter;
  miPila.Apilar(X);
end;

procedure PilaPalindromo.crearPila(tamaño: integer);
begin
  miPila.Crear(Cadena,tamaño);
end;

function PilaPalindromo.esPalindromo: boolean;
var
  PAux,PAux2: Pila;
  X: TipoElemento;
begin
  PAux.Crear(miPila.DatoDeLaClave,miPila.SizeStack);
  PAux2.Crear(miPila.DatoDeLaClave,miPila.SizeStack);
  while not miPila.EsVacia do begin
    X := miPila.Recuperar;
    miPila.DesApilar;
    PAux.Apilar(X);
    PAux2.Apilar(X);
  end;
  miPila.InterCambiar(PAux2,True);
  result := (Iguales(PAux));
end;

function PilaPalindromo.Iguales(P: Pila): boolean;
var
  PAux1,PAux2:Pila;
  X1,X2:TipoElemento;
  Igual: boolean;
begin
  igual := True;
  PAux1.Crear(miPila.DatoDeLaClave,miPila.SizeStack);
  PAux2.Crear(miPila.DatoDeLaClave,miPila.SizeStack);
  while not miPila.EsVacia do begin
    X1 := miPila.Recuperar;
    X2 := P.Recuperar;
    if X1.Clave <> X2.Clave then
      Igual := False;
    miPila.DesApilar;
    P.DesApilar;
    PAux1.Apilar(X1);
    PAux2.Apilar(X1);
  end;
  miPila.InterCambiar(PAux1,True);
  P.InterCambiar(PAux2,True);
  result := igual;
end;

function PilaPalindromo.mostrar: string;
begin
  result := miPila.RetornarClaves;
end;

end.
