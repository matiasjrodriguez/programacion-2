unit TADMatriz;

interface

uses sysutils, System.Math, VectorTADelements;

const
  MAX = 10;

type
  tipoVector = array[1..MAX] of integer;
  tipoMatriz = array[1..MAX,1..MAX] of integer;

  Matriz = Object
    private
      Items: tipoMatriz;
      nDimension: integer;
    public
      procedure setDimension(d:integer);
      function getDimension():integer;
      function getMatriz(): tipoMatriz;
      procedure setMatriz(m:tipoMatriz);
      procedure setItem(i,j,item:integer);
      function getItem(i,j:integer):integer;
      function Sumar(otraMatriz: Matriz): Matriz;
      function Multiplicar(otraMatriz: Matriz): Matriz;
      function MaximaFila(var suma:integer):integer;
      function MaximaColumna(var suma:integer):integer;
      function Escalar(n:integer):Matriz;
      procedure InicializarMatriz();
      function Buscar(item:integer;var nFila, nColumna: integer):boolean;
      function DiagonalPrincipal():Vector;
      function DiagonalOpuesta(): Vector;
  End;

implementation


function Matriz.getDimension: integer;
begin
  result := nDimension;
end;

procedure Matriz.setDimension(d: integer);
begin
  nDimension := d;
end;

function Matriz.getItem(i, j: integer): integer;
begin
  result:= Items[i,j];
end;

procedure Matriz.setItem(i, j, item: integer);
begin
  Items[i,j] := item;
end;

function Matriz.getMatriz: tipoMatriz;
begin
  result := Items;
end;

procedure Matriz.InicializarMatriz();
var
  i: Integer;j: Integer;
begin
  for i := 1 to nDimension do
    for j := 1 to nDimension do begin
      Items[i,j] := 0;
    end;
end;

procedure Matriz.setMatriz(m: tipoMatriz);
var
  i: Integer;
  j: Integer;
begin
  for i := 1 to nDimension do
    for j := 1 to nDimension do
      Items[i,j] := m[i,j];
end;

function Matriz.Sumar(otraMatriz: Matriz): Matriz;
var
  i,j,suma:integer; mRes: Matriz;
begin
  mRes.setDimension(nDimension);
  mRes.InicializarMatriz();
  for i := 1 to nDimension do
    for j := 1 to nDimension do begin
      suma := Items[i,j] + otraMatriz.getItem(i,j);
      mRes.setItem(i,j,suma);
    end;
  result := mRes;
end;


function Matriz.Multiplicar(otraMatriz: Matriz): Matriz;
var
  i,j,k,suma:integer; mRes: Matriz;
begin
  mRes.setDimension(nDimension);
  mRes.InicializarMatriz();
  for i := 1 to nDimension do
    for j := 1 to nDimension do begin
      suma := 0;
      for k := 1 to nDimension do
        suma := suma + Items[i,k] * otraMatriz.getItem(k,j);
      mRes.setItem(i,j,suma);
    end;
  result := mRes;
end;

function Matriz.MaximaFila(var suma:integer): integer;
var
  i,j,mayor,iMayor: Integer; vs:tipoVector;
begin
  for i := 1 to nDimension do begin
    suma := 0;
    for j := 1 to nDimension do begin
      suma := suma + Items[i,j];
    end;
    vs[i] := suma;
  end;

  mayor := -1;
  iMayor := 0;
  for I := 1 to nDimension do begin
    if vs[i] > mayor then begin
      mayor := vs[i];
      iMayor := i;
    end;
  end;

  suma := mayor;
  result := iMayor;
end;

function Matriz.MaximaColumna(var suma:integer): integer;
var
  i,j,mayor,iMayor: Integer; vs:tipoVector;
begin
  for j := 1 to nDimension do begin
    suma := 0;
    for i := 1 to nDimension do begin
      suma := suma + Items[i,j];
    end;
    vs[j] := suma;
  end;

  iMayor := 0;
  mayor := -1;
  for I := 1 to nDimension do begin
    if vs[i] > mayor then begin
      mayor := vs[i];
      iMayor := i;
    end;
  end;

  suma := mayor;
  result := iMayor;
end;

function Matriz.DiagonalPrincipal: Vector;
var
  i,j,k,n: Integer;
  VR: Vector;
begin
  k := 1;
  for i := 1 to nDimension do
    for j := 1 to nDimension do
      if i = j then begin
        n := Items[i,j];
        VR.SetPosicionElegida(k,n);
        inc(k);
      end;
  result := VR;
end;

function Matriz.DiagonalOpuesta: Vector;
var
  i,j,k,n: Integer;
  VR: Vector;
begin
  k := 1;
  for i := 1 to nDimension do
    for j := 1 to nDimension do
      if (i + j = nDimension + 1) then begin
        n := Items[i,j];
        VR.SetPosicionElegida(k,n);
        inc(k);
      end;
  result := VR;
end;

function Matriz.Escalar(n: integer): Matriz;
var
  i,j,res:integer; mRes:Matriz;
begin
  mRes.setDimension(nDimension);
  mRes.InicializarMatriz();
  for i := 1 to nDimension do
    for j := 1 to nDimension do begin
      res := Items[i,j] * n;
      mRes.setItem(i,j,res);
    end;
  result := mRes;
end;

function Matriz.Buscar(item:integer; var nFila,nColumna:integer):boolean;
var
  i,j:integer;
begin
  for i := 1 to nDimension do
    for j := 1 to nDimension do
      if item = Items[i,j] then begin
        nFila := i;
        nColumna := j;
        result := True;
        Exit;
      end;
  result := False;
end;

end.
