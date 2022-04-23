unit TADmanejandoListas;

interface

uses
  miListArray, sysutils, Tipos;

type
  TADManejoListas = object
  private
    miLista: Lista;
  public
    function GetmiLista:Lista;
    procedure SetmiLista(L:Lista);
    procedure generarListaRandom(Tamaño,Desde,Hasta:integer);
    function ListaInvertida(): Lista;
    function Menor(var Ord:PosicionLista): integer;
    function ListaToString(): string;
    function Mayor(): integer;
    function Ocurrencias(elementoMayor:integer): integer;
    function Promedio():double;
    function Multiplos(n:integer):Lista;
    procedure generarListaRandomUnica(Tamaño,Desde,Hasta:integer);
    function ReflejarLista(reflejar:boolean):Lista;
  end;


implementation

{ TADManejoListas }

procedure TADManejoListas.generarListaRandom(Tamaño,Desde,Hasta:integer);
begin
  miLista.LlenarClavesRandom(Tamaño,Desde,Hasta);
end;

procedure TADManejoListas.generarListaRandomUnica(Tamaño, Desde,Hasta: integer);
var
  X:TipoElemento;
  N: integer;
begin
  If miLista.Crear(Numero, Tamaño) = OK Then Begin //Si se crea exitosamente
    X.Inicializar(Numero, '');
    Randomize;
    While Not miLista.EsLLena() Do Begin
      X.Clave := Desde + Random(Hasta);
      if miLista.Buscar(X) = NULO then
        miLista.Agregar(X);
    End;
  end
end;

function TADManejoListas.GetmiLista: Lista;
begin
  result := miLista;
end;

procedure TADManejoListas.SetmiLista(L: Lista);
begin
  miLista := L;
end;

function TADManejoListas.ListaInvertida: Lista;
var
  L2: Lista;
  Q: PosicionLista;
begin
  L2.Crear(miLista.DatoDeLaClave,miLista.SizeList);
  Q := miLista.Fin;
  while (Q <> Nulo) do begin
    L2.Agregar(miLista.Recuperar(Q));
    Q := miLista.Anterior(Q);
  end;
  result := L2;
end;

function TADManejoListas.ListaToString: string;
var Q: PosicionLista;
    X: TipoElemento;
    S,SFinal: String;
Begin
  SFinal:= '';
  Q := miLista.Comienzo;
  While Q <> NULO Do Begin
    X := miLista.Recuperar(Q);
    S := X.ArmarString;
    SFinal := SFinal + S + cCRLF;
    Q := miLista.Siguiente(Q);
  End;
  ListaToString := SFinal;
End;


function TADManejoListas.Mayor(): integer;
var
  m: integer;
  Q: PosicionLista;
begin
  Q := miLista.Comienzo;
  m := miLista.Recuperar(Q).Clave;
  while Q <> NULO do begin
    if m < miLista.Recuperar(Q).Clave then begin
      m := miLista.Recuperar(Q).Clave;
    end;
    Q := miLista.Siguiente(Q);
  end;
  result := m;
end;

function TADManejoListas.Menor(var Ord: PosicionLista): integer;
var
  m: integer;
  Q: PosicionLista;
begin
  Q := miLista.Comienzo;
  m := miLista.Recuperar(Q).Clave;
  while Q <> NULO do begin
    if m > miLista.Recuperar(Q).Clave then begin
      m := miLista.Recuperar(Q).Clave;
      Ord := miLista.Ordinal(Q);
    end;
    Q := miLista.Siguiente(Q);
  end;
  result := m;
end;

function TADManejoListas.Multiplos(n: integer): Lista;
var
  L2:Lista;
  Q: PosicionLista;
begin
  L2.Crear(miLista.DatoDeLaClave,miLista.SizeList);
  Q := miLista.Comienzo;
  while Q <> NULO do begin
    if (miLista.Recuperar(Q).Clave mod n = 0) then
      L2.Agregar(miLista.Recuperar(Q));
    Q := miLista.Siguiente(Q);
  end;
  result := L2;
end;

function TADManejoListas.Ocurrencias(elementoMayor: integer): integer;
var
  Acum:integer;
  Q: PosicionLista;
begin
  Acum := 0;
  Q := miLista.Comienzo;
  while Q <> NULO do begin
    if elementoMayor = miLista.Recuperar(Q).Clave then
      inc(Acum);
    Q := miLista.Siguiente(Q);
  end;
  result := Acum;
end;

function TADManejoListas.Promedio: double;
var
  suma:double;
  Q: PosicionLista;
begin
  suma := 0;
  Q := miLista.Comienzo;
  while Q <> NULO do begin
    suma := suma + miLista.Recuperar(Q).Clave;
    Q := milista.Siguiente(Q);
  end;
  result := suma / miLista.CantidadElementos;
end;

function TADManejoListas.ReflejarLista(reflejar: boolean): Lista;
var
  Q1,Q2:PosicionLista;
  L2:Lista;
begin
  if reflejar then
    Q2 := miLista.Fin
  else
    Q2 := miLista.Anterior(miLista.Fin);

  L2.Crear(miLista.DatoDeLaClave,miLista.SizeList * 2);
  Q1 := miLista.Comienzo;
  while Q1 <> NULO do begin // Muevo la lista original a la nueva lista
    L2.Agregar(miLista.Recuperar(Q1));
    Q1 := miLista.Siguiente(Q1);
  end;
  while Q2 <> NULO do begin  //agrego los elementos desde el final al principio
    L2.Agregar(miLista.Recuperar(Q2));
    Q2 := miLista.Anterior(Q2);
  end;
  result := L2;
end;


end.
