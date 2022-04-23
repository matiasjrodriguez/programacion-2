unit TADPolinomio;

interface

uses
  stdctrls, SysUtils, Variants, miListArray, Tipos, Math;

type
  Polinomio = object
    private
      Coeficientes: Lista;
      function generarValoresRango(Desde,Hasta:integer;Intervalo:double):Lista;
    function retornarLista: string;
    public
      function StringToLista(cadena: string):Lista;
      procedure setCoeficientes(C:Lista);
      function RetornarPolinomio():string;
      function ResolverPolinomio(P:double):double;
      function Grado():integer;
      function CoeficientePrincipal():integer;
      function Ordenada():integer;
      function ResolverRango(Desde,Hasta:integer;Intervalo:double; var Valores:Lista):Lista;
  end;



implementation


function Polinomio.CoeficientePrincipal: integer;
begin
  result := Coeficientes.Recuperar(Coeficientes.Comienzo).Clave;
end;


function Polinomio.Grado(): integer;
begin
  result := Coeficientes.CantidadElementos - 1;
end;

function Polinomio.Ordenada: integer;
begin
  result := Coeficientes.Recuperar(Coeficientes.Fin).Clave;
end;

function Polinomio.ResolverPolinomio(P: double): double;
var
  Q:PosicionLista;
  Exponente,C:integer;
  Resultado:Double;
begin
  Resultado := 0;
  Q := Coeficientes.Comienzo;
  Exponente := Coeficientes.CantidadElementos - 1;
  while Q < Coeficientes.CantidadElementos do begin
    C := Coeficientes.Recuperar(Q).Clave;
    Resultado := Resultado + (C * power(P,Exponente));
    Dec(Exponente);
    Q := Coeficientes.Siguiente(Q);
  end;
  C := Coeficientes.Recuperar(Coeficientes.CantidadElementos).Clave;
  Resultado := Resultado + C;
  result := Resultado;
end;

function Polinomio.ResolverRango(Desde, Hasta: integer;Intervalo: double; var Valores:Lista): Lista;
var
  L:Lista;
  valor:double;
  Q: PosicionLista;
  resultado:TipoElemento;
begin
  Valores := generarValoresRango(Desde,Hasta,Intervalo);
  L.Crear(Numero,valores.CantidadElementos);
  Q := valores.Comienzo;
  while Q <> NULO do begin
    valor := valores.Recuperar(Q).Clave;
    resultado.Clave := ResolverPolinomio(valor);
    L.Agregar(Resultado);
    Q := valores.Siguiente(Q);
  end;
  result := L;
end;

function Polinomio.retornarLista: string;
begin
  result := Coeficientes.RetornarClaves;
end;

function Polinomio.RetornarPolinomio: string;
var
  Q:PosicionLista;
  S: string;
  Exponente,C: integer;
begin
  S := '';
  Q := Coeficientes.Comienzo;
  Exponente := Coeficientes.CantidadElementos - 1;
  while Q < Coeficientes.CantidadElementos do begin
    C := Coeficientes.Recuperar(Q).Clave;
    if C <> 0 then begin
      if C <> 1 then
        S := S + C.ToString + 'x^' + Exponente.ToString + ' + '
      else
        S := S + 'x^' + Exponente.ToString + ' + ';
    end;
    Dec(Exponente);
    Q := Coeficientes.Siguiente(Q);
  end;
  C := Coeficientes.Recuperar(Coeficientes.CantidadElementos).Clave;
  if C <> 0 then
    S := S + C.ToString;
  result := S;
end;

procedure Polinomio.setCoeficientes(C: Lista);
begin
  Coeficientes := C;
end;

function Polinomio.StringToLista(cadena: string):Lista;
var
  i,P: integer;
  L:Lista;
  X: TipoElemento;
begin
  L.Crear(Numero,length(cadena));
  i := 0;
  cadena := cadena + ' ';
  P := pos(' ', cadena);
  while P > 0 do begin
    Inc(i);
    X.Clave := strtoint(Copy(cadena, 1, P - 1));
    L.Agregar(X);
    cadena := copy(cadena, P + 1, length(cadena));
    P := pos(' ', cadena);
  end;
  result := L;
end;

function Polinomio.generarValoresRango(Desde,Hasta:integer; Intervalo:double): Lista;
var
  L:Lista;
  i:integer;
  X:TipoElemento;
  acum: Double;
begin
  acum := Desde;
  L.Crear(Numero,100);
  while acum <= Hasta do begin
    X.Clave := acum;
    L.Agregar(X);
    acum := acum + Intervalo;
  end;
  result := L;
end;

end.
