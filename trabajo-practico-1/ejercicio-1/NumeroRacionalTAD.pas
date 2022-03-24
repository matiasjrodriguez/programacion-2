unit NumeroRacionalTAD;

interface
uses
  System.SysUtils, Math;
type
  NumeroRacional = Object
  private
    numerador : integer;
    denominador : integer;
  public
    procedure SetNumerador(Numero : integer);
    function GetNumerador():integer;
    procedure SetDenominador(Numero : integer);
    function GetDenominador():integer;
    function Fraccion():string;

    function Suma(x:NumeroRacional):NumeroRacional;
    function Resta(x:NumeroRacional):NumeroRacional;
    function Multiplica(x:NumeroRacional):NumeroRacional;
    function Divide(x:NumeroRacional):NumeroRacional;
    function Potencias(x:NumeroRacional):NumeroRacional;
    function Compara(x:NumeroRacional):NumeroRacional;
  End;

implementation
// SET y GET
procedure NumeroRacional.SetNumerador(Numero : integer);
begin
    numerador := Numero
end;

function NumeroRacional.GetNumerador():integer;
begin
  Result :=  numerador
end;

procedure NumeroRacional.SetDenominador(Numero : integer);
begin
    denominador := Numero
end;

function NumeroRacional.GetDenominador():integer;
begin
  Result :=  denominador
end;
// NUMERO devuelto como RACIONAL
function NumeroRacional.Fraccion():string;
begin
  Result := GetNumerador().ToString +'/'+ GetDenominador().ToString;
end;
// OPERACIONES SRMDPC
function NumeroRacional.Suma(x: NumeroRacional): NumeroRacional;
var y : NumeroRacional;
begin
  if GetDenominador() = x.GetDenominador() then begin
    y.SetNumerador(GetNumerador() + x.GetNumerador());
    y.SetDenominador(GetDenominador());
  end else begin
     y.SetNumerador(1);
     y.SetDenominador(1);

  end;
result := y;
end;

function NumeroRacional.Resta(x:NumeroRacional):NumeroRacional;
var y: NumeroRacional;
begin
  if GetDenominador() = x.GetDenominador() then begin
    y.SetNumerador(GetNumerador() - x.GetNumerador());
    y.SetDenominador(GetDenominador());
  end else begin
    y.SetNumerador(1);
    y.SetDenominador(1);

  end;
result := y;
end;
function NumeroRacional.Multiplica(x:NumeroRacional):NumeroRacional;
var y:NumeroRacional;
begin
  y.SetNumerador(GetNumerador() * x.GetNumerador());
  y.SetDenominador(GetDenominador() * x.GetDenominador());
  result := y
end;
function NumeroRacional.Divide(x:NumeroRacional):NumeroRacional;
var y : NumeroRacional;
begin
  y.SetNumerador(GetNumerador() * x.GetDenominador());
  y.SetDenominador(GetDenominador()* x.GetNumerador());
  result := y
end;
function NumeroRacional.Potencias(x:NumeroRacional):NumeroRacional;
var y : NumeroRacional; potencia : single;

begin

potencia := (Power(GetNumerador(),x.GetNumerador()));
y.SetNumerador(trunc(potencia));
y.SetDenominador(1);
result := y
end;

function NumeroRacional.Compara(x:NumeroRacional):NumeroRacional;
var resultadoComparacion : string;
  numero1, numero2, denominadorModificado, denominadorXModificado, i, l : integer;
begin
i := 2
l := 2
  if GetDenominador() = x.GetDenominador() then begin
    numero1 := GetNumerador();
    numero2 := x.GetNumerador();
  end else begin
      while GetDenominador() <> x.GetDenominador do
        if GetDenominador() > x.GetDenominador() then
          denominadorXModificado :=  x.GetDenominador * i
          i := i+1
        else denominadorXModificado > GetDenominador()
          denominadorModificado := GetDenominador() * l
          l := l+1
      SetNumerador(numero1*l);
      x.SetNumerador(numero2*i);
      SetDenominador(denominadorModificado);
      x.SetDenominador(denominadorXModificado);
      numero1 := GetNumerador();
      numero2 := x.GetNumerador();
  end;

  if numero1 > numero2 then
    resultadoComparacion := 'Mayor :'
  else
    resultadoComparacion := 'Menor'
  else
    resultadoComparacion:= 'Igual';
  end;
result := resultadoComparacion
end;
end.
