unit TADNumeroExplosivo;

interface

type

  vector = Array of integer;

  NumeroExplosivo = Object
  Private
    numero:integer;
    bomba:integer;
    numeros:vector;
  Public
    procedure setNumero(n:integer);
    function getNumero():integer;
    procedure setBomba(b:integer);
    function getBomba():integer;
    function getNumeros():vector;
    procedure setNumeros(v:vector);
    procedure addNumero(n:integer);
  End;

implementation

procedure NumeroExplosivo.setNumero(n: Integer);
begin
  numero := n;
end;

function NumeroExplosivo.getNumero():integer;
begin
  result := numero;
end;

procedure NumeroExplosivo.setBomba(b: Integer);
begin
  bomba := b;
end;

function NumeroExplosivo.getBomba():integer;
begin
  result := bomba;
end;

function NumeroExplosivo.getNumeros():vector;
begin
  result := copy(numeros);
end;

procedure NumeroExplosivo.setNumeros(v: vector);
begin
  numeros := copy(v);
end;

procedure NumeroExplosivo.addNumero(n: Integer);
var v:vector;
begin
  v := getNumeros();
  setLength(v, length(v)+1);
  v[high(v)] := n;
  setNumeros(v);
end;

end.
