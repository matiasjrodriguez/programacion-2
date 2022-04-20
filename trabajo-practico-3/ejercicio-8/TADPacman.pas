unit TADPacman;

interface
uses
  Tipos, ListPointer;

const
  items: array[1..5] of string = ('Puntito', 'Frutilla', 'Banana', 'Cereza', 'Fantasma');
  puntos: array[1..5] of byte = (1, 10, 30, 50, 100);
type


  Pacman = object
  private
    recorrido: Lista;
    puntaje: integer;
    bonus: byte;
  public
    procedure setRecorrido(L:Lista);
    function getPuntaje():integer;
    procedure setPuntaje(p:integer);
    function getBonus():byte;
    procedure setBonus(b:byte);
    procedure calcularPuntaje();
  end;

implementation

procedure Pacman.setRecorrido(L: Lista);
begin
  recorrido := L;
end;

function Pacman.getPuntaje:Integer;
begin
  result := puntaje;
end;

procedure Pacman.setPuntaje(p: Integer);
begin
  puntaje := p;
end;

procedure Pacman.calcularPuntaje;
var
  I, J, cantidadElementos:longint;
  posicion:PosicionLista;
  dato:TipoElemento;
begin
  cantidadElementos := recorrido.CantidadElementos;
  posicion := recorrido.Comienzo;

  for I := 1 to cantidadElementos do begin
    dato := recorrido.Recuperar(posicion);
    posicion := recorrido.Siguiente(posicion);

    J := 1;
    while J <= length(items) do begin
      if dato.Clave = items[J] then begin
        setPuntaje(getPuntaje() + puntos[J]);
        J := length(items);
      end;
      Inc(J)
    end;

  end;

end;
end.
