unit TADBomba;

interface

type
  Vector = array[1..50] of integer;
  OBomba = object
    private
      Bomba:integer;
      V:Vector;
    public
      function Explotar(N,i:integer): Vector;
      procedure setBomba(b:integer);
      procedure InicializarVector();
  end;

implementation

function OBomba.Explotar(N,i:integer): Vector;
var
  n1:integer;
begin
  if N <= bomba then begin
    V[i]:= n;
    Explotar := V;
  end
  else begin
    n1 := n div bomba;
    if n1 > bomba then begin
      Explotar := Explotar(n1,i);
    end
    else begin
      V[i] := n1;
      Explotar := Explotar((n - (n div bomba)),i+1);
    end;
  end;
end;


procedure OBomba.InicializarVector;
var
  i: Integer;
begin
  for i := 1 to length(V) do
    V[i] := 0;
end;

procedure OBomba.setBomba(b: integer);
begin
  Bomba := b;
end;

end.
