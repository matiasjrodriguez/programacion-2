unit OndasTAD;

interface
uses
  System.SysUtils;
type
  onda = object
private
  Unidad : string;
public
  function ondadigital(lista: string; i: Integer): string;
  function corrigeonda(listaFaseii : string; i : integer):string;
  end;

implementation
  function onda.ondadigital(lista: string;  i: Integer ): string;
  var caracter, nuevaLista : string;
  begin
     if (i <= length(lista)) then begin
        caracter := lista[i];
        if (caracter = 'L') then begin
          ondadigital := '_'+ondadigital(lista,i+1);
        end else if (caracter = 'H') then begin
          ondadigital := '¯'+ondadigital(lista,i+1);
        end;
     end;
  end;

  function onda.corrigeonda(listaFaseii : string; i : integer):string;
  begin
    if i <= length(listaFaseii) then begin
      if ((listaFaseii[i]) <> (listaFaseii[i+1])) and ((i+1) <= (length(listaFaseii))) then begin
        corrigeonda := listaFaseii[i]+'|'+corrigeonda(listaFaseii, i+1);
      end else begin
        corrigeonda := listaFaseii[i]+corrigeonda(listaFaseii, i+1);
      end;
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

