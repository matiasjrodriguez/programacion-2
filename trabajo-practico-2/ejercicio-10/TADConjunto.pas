unit TADConjunto;

interface
uses
  System.SysUtils;

type
  iVector = array of integer;
  sVector = array of string;

  OConjunto = object
  private
    conjuntoPrincipal: iVector;
    subconjuntos: sVector;
    procedure acumular(indice:integer; conjunto:iVector; var acumulador:integer; var suma:string);
    function sumatoria(numero, acumulador, I, J, auxJ:integer; conjunto:iVector; suma:string; var cadenas:sVector):sVector;
  public
    function iniciarSumatoria(numero:integer; v:iVector):sVector;
    function insertionsort(conjunto: iVector):iVector;
    procedure setConjunto(V:iVector);
    function getConjunto():iVector;
  end;

implementation

procedure OConjunto.acumular(indice:integer; conjunto:iVector; var acumulador:integer; var suma:string);
begin
  acumulador := acumulador+conjunto[indice];
  suma := suma + conjunto[indice].ToString + ' ';
end;


procedure OConjunto.setConjunto(V: iVector);
begin
  conjuntoPrincipal := V;
end;

function OConjunto.sumatoria(numero, acumulador, I, J, auxJ:integer; conjunto:iVector; suma:string; var cadenas:sVector):sVector;

begin
  if (acumulador = numero) {and not(numero = conjunto[I])} then begin
    setLength(cadenas, length(cadenas)+1);
    cadenas[high(cadenas)] := trim(suma);
    sumatoria := cadenas;
  end else if J = length(conjunto) then begin
    sumatoria := cadenas;
  end else begin
    if (j = auxJ-1) and (numero >= conjunto[I]) and (numero >= acumulador+conjunto[I]) then
      acumular(I, conjunto, acumulador, suma)
    else if (numero >= conjunto[J]) and (numero >= acumulador+conjunto[J]) then
      acumular(J, conjunto, acumulador, suma);

    sumatoria := sumatoria(numero, acumulador, I, J+1, auxJ, conjunto, suma, cadenas);
  end;
  if (j = auxJ) or (conjunto[i] = numero) then
    if auxJ = length(conjunto) then
      sumatoria := sumatoria(numero, 0, I+1, I+1, I+2, conjunto, '', cadenas)
    else
      sumatoria := sumatoria(numero, 0, I, auxJ, auxJ+1, conjunto, '', cadenas);
  if (i = j) and (j = auxJ) then
    sumatoria := sumatoria(numero, 0, I+1, I+1, I+2, conjunto, '', cadenas)
end;

function OConjunto.getConjunto: iVector;
begin
  result := ConjuntoPrincipal;
end;

function OConjunto.iniciarSumatoria(numero:integer; v:iVector):sVector;
  var cadena:sVector;
begin
  result := sumatoria(numero, 0, 0, 0, 1, getConjunto(), '', cadena);
end;

function OConjunto.insertionsort(conjunto: iVector):iVector;
var
  i, j, aux: integer;

begin
  for i := 1 to high(conjunto) do begin
    aux := conjunto[i];
    j := i;
    while ((j > 0) and (conjunto[j-1] > aux)) do begin
      conjunto[j] := conjunto[j-1];
      j := j - 1;
    end;
   conjunto[j] := aux;
  end;

  result := conjunto;
end;

end.
