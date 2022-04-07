unit ProductoTAD;

interface

uses
  System.SysUtils;
type
  Tnumeros = object
  private
    x : integer;
  public
    function Producto(n1 : integer ;n2:integer):integer;
  end;

implementation

  function Tnumeros.Producto(n1: integer ;n2:integer):integer;
  begin
    if (n2 = 1) then
      producto := n1
    else if (n2 >1) then
      producto := n1 + Tnumeros.Producto(n1,n2-1 );
  end;
end.

{If P = 1 Then CifraPos := (N mod 10) // Esto es lo que retorna
Else CifraPos := CifraPos ((N div 10), P-1)}
