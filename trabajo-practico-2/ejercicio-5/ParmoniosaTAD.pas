unit ParmoniosaTAD;

interface
uses
  System.SysUtils;
const
  min = 0;
  max = 2;
type
  Tpalabra = array[min..max] of string;
  Tpatron = array[min..max] of string;
   lPalabra = object
  private
    patrones : Tpalabra;
    patronesR : Tpatron;
  public
    function Parmoniosa(principio,n:integer; var listado: string):string;
    end;

implementation
  function lPalabra.Parmoniosa(principio,n: Integer; var listado: string): string;
  var
    numero, Npatron, min: integer;
  begin
    patronesR[0] := ('**\/**');
    patronesR[1] := ('++\/++');
    if (principio < n) then begin
        Npatron := principio mod 2;
        insert(copy(patronesR[Npatron],((length(patronesR[Npatron])div 2)+1),length(patronesR[Npatron])),listado,length(listado));
        insert(copy(patronesR[Npatron],1,(length(patronesR[Npatron])div 2)),listado,1);
        lPalabra.Parmoniosa(principio+1,n, listado);
    end else begin
       Parmoniosa := listado;
    end;
  end;

end.
