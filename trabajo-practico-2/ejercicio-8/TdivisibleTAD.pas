unit TdivisibleTAD;

interface

uses
  System.SysUtils;
type
  NumeroOf = object
private
  Numero : integer;
  NumeroEnS : string;
public
  function DivisibleXseten(NumeroString : string; NumeroAlterado, posicionNumS,NaComparar  : integer): string;
end;

implementation
  function NumeroOf.DivisibleXseten(NumeroString : string; NumeroAlterado, posicionNumS, NaComparar : integer): string;
  var NumeroDeSconvertido : integer;
  begin
    if (NaComparar > 70) then begin
      NumeroAlterado := (copy(NumeroString,posicionNumS,posicionNumS).ToInteger)*2;
      NumeroDeSconvertido := copy(NumeroString,1,posicionNumS-1).ToInteger;
      NaComparar := NumeroDeSconvertido - NumeroAlterado;
      NumeroString :=NaComparar.ToString;
      NumeroOf.DivisibleXseten(NumeroString, NumeroAlterado, posicionNumS, NaComparar);
    end else begin
      if ((NaComparar mod 7) = 0) then
        result:= 'Es divisible por 7'
      else
        result := 'No es divisible por 7'
    end;
  end;
end.
{Ejercicio 8

Escribir una función que implemente el método que se describe para saber si un número es divisible por 7.

    Se separa la primera cifra de la derecha, se la multiplica por 2, y se resta este producto de lo que queda
    a la izquierda y así sucesivamente, hasta que el resultado obtenido sea un número menor a 70.
    El número original será multiplo de 7 si el resultado da cero o múltiplo de 7.

Por ejemplo:

32291   ->  1x2=2.
3229 - 2 =
3227    ->  7x2=14.
322 - 14 =
308     ->  8x2=16
30 - 16 =
14      ->  Múltiplo de 7`
}