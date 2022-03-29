unit NumeroRacionalTAD;

interface

uses
  System.SysUtils, Math;

type
  NumeroRacional = Object
  private
    numerador: integer;
    denominador: integer;
  public
    procedure SetNumerador(Numero: integer);
    function GetNumerador(): integer;
    procedure SetDenominador(Numero: integer);
    function GetDenominador(): integer;
    function Fraccion(): string;

    function Suma(x: NumeroRacional): NumeroRacional;
    function Resta(x: NumeroRacional): NumeroRacional;
    function Multiplica(x: NumeroRacional): NumeroRacional;
    function Divide(x: NumeroRacional): NumeroRacional;
    function Potencias(exponente:integer): NumeroRacional;
    function Compara(x: NumeroRacional): String;
  End;

implementation

// SET y GET
procedure NumeroRacional.SetNumerador(Numero: integer);
begin
  numerador := Numero
end;

function NumeroRacional.GetNumerador(): integer;
begin
  Result := numerador
end;

procedure NumeroRacional.SetDenominador(Numero: integer);
begin
  denominador := Numero
end;

function NumeroRacional.GetDenominador(): integer;
begin
  Result := denominador
end;

// NUMERO devuelto como RACIONAL
function NumeroRacional.Fraccion(): string;
begin
  Result := GetNumerador().ToString + '/' + GetDenominador().ToString;
end;

// OPERACIONES SRMDPC
function NumeroRacional.Suma(x: NumeroRacional): NumeroRacional;
var
  y: NumeroRacional;
begin
  if GetDenominador() = x.GetDenominador() then
  begin
    y.SetNumerador(GetNumerador() + x.GetNumerador());
    y.SetDenominador(GetDenominador());
  end
  else
  begin
    y.SetNumerador((GetNumerador() * x.GetDenominador()) +
      (GetDenominador() * x.GetNumerador()));
    y.SetDenominador(GetDenominador() * x.GetDenominador());
  end;
  Result := y;
end;

function NumeroRacional.Resta(x: NumeroRacional): NumeroRacional;
var
  y: NumeroRacional;
begin
  if GetDenominador() = x.GetDenominador() then
  begin
    y.SetNumerador(GetNumerador() - x.GetNumerador());
    y.SetDenominador(GetDenominador());
  end
  else
  begin
    y.SetDenominador(GetDenominador() * x.GetDenominador());
    y.SetNumerador((GetNumerador() * x.GetDenominador()) -
      (GetDenominador() * x.GetNumerador()));
  end;
  Result := y;
end;

function NumeroRacional.Multiplica(x: NumeroRacional): NumeroRacional;
var
  y: NumeroRacional;
begin
  y.SetNumerador(GetNumerador() * x.GetNumerador());
  y.SetDenominador(GetDenominador() * x.GetDenominador());
  Result := y
end;

function NumeroRacional.Divide(x: NumeroRacional): NumeroRacional;
var
  y: NumeroRacional;
begin
  y.SetNumerador(GetNumerador() * x.GetDenominador());
  y.SetDenominador(GetDenominador() * x.GetNumerador());
  Result := y
end;

function NumeroRacional.Potencias(exponente:integer): NumeroRacional;
var
  y: NumeroRacional;
  potenciaNumerador,potenciaDenominador: single;

begin

  potenciaNumerador := Power(GetNumerador, exponente);
  y.SetNumerador(trunc(potenciaNumerador));
  potenciaDenominador := Power(GetDenominador, exponente);
  y.SetDenominador(trunc(potenciaDenominador));
  Result := y
end;

function NumeroRacional.Compara(x: NumeroRacional): String;
var
  resultadoComparacion: string;
  numero1, numero2, denominadorModificado, denominadorXModificado, i,
    l: integer;
  Esdivisible, EsdivisibleX: boolean;
begin
  i := 1;
  l := 1;
  Esdivisible := false;
  EsdivisibleX := false;
  numero1 := GetNumerador();
  numero2 := x.GetNumerador();
  denominadorModificado := GetDenominador();
  denominadorXModificado := x.GetDenominador();
  while denominadorModificado <> denominadorXModificado do
  begin
    if ((denominadorModificado MOD x.GetDenominador()) = 0) and
      (denominadorModificado >= denominadorXModificado) then
    begin
      Esdivisible := true
    end;
    if ((denominadorXModificado MOD GetDenominador()) = 0) and
      (denominadorXModificado >= denominadorModificado) then
    begin
      EsdivisibleX := true
    end;
    if (denominadorModificado > denominadorXModificado) and
      (EsdivisibleX = false) then
    begin
      i := i + 1;
      denominadorXModificado := x.GetDenominador() * i;
    end
    else if (denominadorXModificado > denominadorModificado) and
      (Esdivisible = false) then
    begin
      l := l + 1;
      denominadorModificado := GetDenominador() * l;
    end;
  end;
  SetNumerador(numero1 * l);
  x.SetNumerador(numero2 * i);
  SetDenominador(denominadorModificado);
  x.SetDenominador(denominadorXModificado);
  numero1 := GetNumerador();
  numero2 := x.GetNumerador();

  if numero1 = numero2 then
  begin
    resultadoComparacion := 'IGUAL';
  end
  else
  begin
    if numero1 > numero2 then
    begin
      resultadoComparacion := 'MAYOR';
    end
    else
    begin
      resultadoComparacion := 'MENOR';
    end;
  end;
  Result := resultadoComparacion
end;

end.
