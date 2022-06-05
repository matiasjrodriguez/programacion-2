unit ManejoAVL;

interface

uses
  ArbolesBinariosAVL, Tipos, QueuesPointer, StackPointer, ListPointer, ArbolesBinarios,
  ArbolesBinariosBusqueda, BTree, BTreeMejorado;

type
  TADAVL = object
    private
    public
      function ConvertirArbolAVL(var A:Arbol):ArbolAVL;
      procedure cargarRandomsIguales(var AB: ArbolBB; var AV: ArbolAVL; Desde,Hasta:integer);
      procedure cargarRandomsAVLyB(var AV: ArbolAVL; var AB: ArbolB; var ABPlus: ArbolBMejorado; Desde,Hasta:integer);
  end;

implementation

{ TADAVL }

procedure TADAVL.cargarRandomsAVLyB(var AV: ArbolAVL;var AB: ArbolB;var ABPlus: ArbolBMejorado; Desde,Hasta:integer);
var
  L:Lista;
  Q:PosicionLista;
  X:TipoElemento;
begin
  L.LlenarClavesRandom(AV.SizeTree, Desde, Hasta);
  Q := L.Comienzo;
  while Q <> NULO do begin
    X := L.Recuperar(Q);
    AV.Insertar(X);
    AB.Insertar(X);
    ABPlus.Insertar(X);
    Q := L.Siguiente(Q);
  end;
end;
{(Ejercicio 11) Conclusion: La altura de un Arbol B siempre va a ser menor en comparacion a uno AVL porque
al contener varios datos por nodo el arbol se simplifica bastante el arbol}

procedure TADAVL.cargarRandomsIguales(var AB: ArbolBB; var AV: ArbolAVL; Desde,Hasta:integer);
var
  L:Lista;
  Q:PosicionLista;
  X: TipoElemento;
begin
  L.LlenarClavesRandom(AB.SizeTree,Desde,Hasta);
  Q := L.Comienzo;
  while Q <> NULO do begin
    X := L.Recuperar(Q);
    AB.Insertar(X);
    AV.Insertar(X);
    Q := L.Siguiente(Q);
  end;
end;
{(Ejercicio 10) Conclusion: El arbol AVL siempre va a tener menor altura que cualquier otro arbol
debido a las operaciones de balanceo con rotaciones que lleva a cabo para lograr esto}

function TADAVL.ConvertirArbolAVL(var A: Arbol): ArbolAVL;
var
  AAVL: ArbolAVL;
  X: TipoElemento;

  procedure Recorrido(Q:ArbolesBinarios.PosicionArbol);
  begin
    if not A.RamaNula(Q) then begin
      X := A.Recuperar(Q);
      AAVL.Insertar(X);
      Recorrido(A.HijoIzquierdo(Q));
      Recorrido(A.HijoDerecho(Q));
    end;
  end;

begin
  AAVL.Crear(A.DatoDeLaClave,A.SizeTree);
  Recorrido(A.Root);
  result := AAVL;
end;
{(Ejercicio 9) El algoritmo tiene complejidad O(n) sin implementacion porque
recorre un arbol binario normal}

end.
