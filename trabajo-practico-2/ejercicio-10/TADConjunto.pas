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
  end;

implementation

procedure OConjunto.acumular(indice:integer; conjunto:iVector; var acumulador:integer; var suma:string);
begin
  acumulador := acumulador+conjunto[indice];
  suma := suma + conjunto[indice].ToString + ' ';
end;


function OConjunto.sumatoria(numero, acumulador, I, J, auxJ:integer; conjunto:iVector; suma:string; var cadenas:sVector):sVector;

begin
  if acumulador = numero then begin
    setLength(cadenas, length(cadenas)+1);
    cadenas[high(cadenas)] := suma;
    sumatoria := cadenas;
  end else if J = length(conjunto)+1 then begin
    sumatoria := cadenas;
  end else begin
    if (j = auxJ-1) and (numero >= conjunto[I]) and (numero >= acumulador+conjunto[I]) then
      acumular(I, conjunto, acumulador, suma)
    else if (numero >= conjunto[J]) and (numero >= acumulador+conjunto[J]) then
      acumular(J, conjunto, acumulador, suma);

    sumatoria := sumatoria(numero, acumulador, I, J+1, auxJ, conjunto, suma, cadenas);
  end;
  if j = auxJ then
    if auxJ = length(conjunto)+1 then
      sumatoria := sumatoria(numero, 0, I+1, I+1, I+2, conjunto, '', cadenas)
    else
      sumatoria := sumatoria(numero, 0, I, auxJ, auxJ+1, conjunto, '', cadenas);
  if (i = j) and (j = auxJ) then
    sumatoria := sumatoria(numero, 0, I+1, I+1, I+2, conjunto, '', cadenas)
end;

function OConjunto.iniciarSumatoria(numero:integer; v:iVector):sVector;
var cadena:sVector;
begin
  result := sumatoria(numero, 0, 1, 1, 2, v, '', cadena);
end;

end.
