unit OndasTAD;

interface
uses
  System.SysUtils;
const
  min = 1;
  max = 100;
type
  Tonda = array [min..max] of string;
  Palabra = object
private
  Unidad : Tonda;
  Lacadena : string;
public
  function ConvierteOndas(cadena : string;ContI, ContF, posiciona : integer ):Tonda;
  procedure AsignaOnda(cadena :string; var posicionaAux : integer; asignadorAux : integer);
  end;

implementation
  function Palabra.ConvierteOndas(cadena : string; ContI, ContF, posiciona : integer ):Tonda;

  procedure Palabra.AsignaOnda(cadena :string; var posicionaAux : integer; asignadorAux : integer);
  var VectorOndas, VondaRTA, Vtraducido :Tonda;
  begin
    Vtraducido[1] := 'L';
    Vtraducido[1] := 'H';
    VondaRTA[1] := '_';
    VondaRTA[2] := '-';
    VondaRTA[3] := '|';

         if (cadena[ContI] = Vtraducido[asignadorAux]) then begin
          if (VectorOndas[posicionaAux-1] <> VondaRTA[asignadorAux]) then
              VectorOndas[posicionaAux]:=  VondaRTA[3];
              posicionaAux := posicionaAux+1;
          VectorOndas[posicionaAux] := VondaRTA[asignadorAux];
         end else begin
          AsignaOnda(cadena,posicionaAux,asignadorAux+1);
         end;
  end;
  var asignador, posicionaAux : integer;
  VectorOndas : Tonda;
  begin
    asignador := 1;
    if (ContI < ContF) then begin
      AsignaOnda(cadena,posicionaAux,asignador);
      ConvierteOndas(cadena,ContI+1,ContF,posicionaAux+1);
    end else begin
      result := VectorOndas;
    end;
  end;
end.
{Ejercicio 6

Se tiene una cadena que representa una onda digital de señales L (Low) y H (High).
Se pide mostrar la onda que representa utilizando _ y |.

Por ejemplo, si se tiene la cadena HHHHLLLLHHHHHLLHHLLHH, su onda digital
se puede ver algo así:

_ _ _ _            _ _ _ _ _         _ _         _ _
       | _ _ _ _ |           | _ _ |     | _ _ |              }

