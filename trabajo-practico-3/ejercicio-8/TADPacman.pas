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
    perdio: boolean;
  public
    procedure setRecorrido(L:Lista);
    function getPuntaje():integer;
    procedure setPuntaje(p:integer);
    function getBonus():byte;
    procedure setPerdio(p:boolean);
    function getPerdio():boolean;
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

function Pacman.getBonus: Byte;
begin
  result := bonus;
end;

procedure Pacman.setBonus(b: Byte);
begin
  bonus := b;
  if getBonus() > 10 then
    bonus := 0;
end;

function Pacman.getPerdio: Boolean;
begin
  result := perdio;
end;

procedure Pacman.setPerdio(p: Boolean);
begin
  perdio := p;
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
    while (J <= length(items)) and not getPerdio() do begin
      if dato.Clave = items[J] then begin
        if getBonus() = 0 then begin
          if dato.Clave = 'Fantasma' then
            setPerdio(True)
          else
            setPuntaje(getPuntaje() + puntos[J]);
        end else
          setPuntaje(getPuntaje() + (puntos[J]*2));
        J := length(items);
        setBonus(getBonus()-1);
      end else if dato.Clave = 'Bonus' then
        setBonus(10);
      Inc(J)
    end;

  end;

end;
end.
