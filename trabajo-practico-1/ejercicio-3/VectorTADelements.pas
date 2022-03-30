unit VectorTADelements;

interface

uses
  System.SysUtils, Math, System.Character;

const
  min = 1;
  max = 10;

type
  TipoVector = array [min .. max] of integer;
  TipoVectorS = array [min .. max] of integer;

  Vector = object
  private
    items: TipoVector;
    itemsString: TipoVectorS;
  public
    procedure CargaAleatoria(min, max: integer; letra: string);
    function SumatoriaElementosVector(): integer;
    function PromedioVector(): double;
    function MaximoDelVector(var posicion: integer): integer;
    function MinimoDelVector(var posicion: integer): integer;
    function DevolucionIntercalada(separador: string): string;
    function MultiplicacionEscalar(escalar: integer): Vector;
    function SumaVectores(VectorParametro : Vector): Vector;
    procedure SetVector1(Parametros: integer);
    function GetVector1(): TipoVector;
    procedure SetPosicionElegida(posicion, Parametros: integer);
    function GetPosicionElegida(posicion: integer): integer;
    procedure StringAVector(cadena: string);
  end;

implementation

procedure Vector.CargaAleatoria(min, max: integer; letra: string);
var
  i, l, n, itemAasignar: integer;
  NuevosItems: Vector;
  Distinto, UnoIgual, bandera: boolean;
begin
  if letra = 'NR' then
  begin
    bandera := TRUE
  end
  else
  begin
    bandera := FALSE
  end;

  if (bandera = TRUE) then
  begin
    UnoIgual := FALSE;
    Distinto := FALSE;
    randomize;
    // Asegura que cada numero generado sea diferente a los demas generados
    n := 0;
    i := 1;
    items[i] := random(20);
    NuevosItems.SetPosicionElegida(i, items[i]);
    while i <= max do
    begin
      l := i - 1;
      itemAasignar := random(20);
      if (min < i) and (i <= max) then
      begin
        for n := min to l do
        begin
          if (itemAasignar <> NuevosItems.GetPosicionElegida(n)) and
            (UnoIgual = FALSE) then
          begin
            Distinto := TRUE;
            if (n = l) and (Distinto = TRUE) then
            begin
              items[i] := itemAasignar;
              NuevosItems.SetPosicionElegida(i, items[i]);
            end;
          end
          else
          begin
            Distinto := FALSE;
            UnoIgual := TRUE;
          end;

          if (n = l) and (Distinto = FALSE) then
          begin
            i := i - 1;
          end;

        end;
        Distinto := FALSE;
        UnoIgual := FALSE;
      end;
      i := i + 1;
    end;
  end
  else
  begin
    for i := min to max do
    begin
      items[i] := random(20);
      NuevosItems.SetPosicionElegida(i, items[i]);
    end;
  end;

end;

function Vector.SumatoriaElementosVector(): integer;
var
  i, SumaTotalVector: integer;
begin
  SumaTotalVector := 0;
  for i := min to max do
  begin
    SumaTotalVector := items[i] + SumaTotalVector;
  end;
  result := SumaTotalVector;
end;

function Vector.SumaVectores(VectorParametro: Vector): Vector;
var
  I: Integer;  VR: Vector;
begin
  for I := 1 to max do begin
    VR.SetPosicionElegida(i,items[i] + VectorParametro.GetPosicionElegida(i));
  end;
  result := VR;
end;

function Vector.PromedioVector(): double;
var
  i, l, SumaTotal: integer;
  promedio: double;
begin
  SumaTotal := 0;
  for i := min to max do
  begin
    SumaTotal := items[i] + SumaTotal;
  end;
  promedio := SumaTotal / max;
  result := promedio;
end;

function Vector.MaximoDelVector(var posicion: integer): integer;
var
  i, Mayor: integer;
begin
  Mayor := items[1];
  posicion := 1;
  for i := min to max do
  begin
    if Mayor <= items[i] then
    begin
      Mayor := items[i];
      posicion := i;
    end;
  end;
  result := Mayor;
end;

function Vector.MinimoDelVector(var posicion: integer): integer;
var
  i, Menor: integer;
begin
  Menor := items[1];
  posicion := 1;
  for i := min to max do
  begin
    if Menor >= items[i] then
    begin
      Menor := items[i];
      posicion := i;
    end;
  end;
  result := Menor;
end;

function Vector.DevolucionIntercalada(separador: string): string;
var
  i: integer;
  ListaIntercalada: string;
begin
  ListaIntercalada := '';
  for i := min to max do
  begin
    ListaIntercalada := ListaIntercalada + items[i].ToString + separador;
  end;
  result := ListaIntercalada;
end;

function Vector.MultiplicacionEscalar(escalar: integer): Vector;
var
  nEscalar, i: integer;
  NuevosItems: Vector;
begin
  nEscalar := escalar;
  for i := min to max do
  begin
    items[i] := items[i] * nEscalar;
    NuevosItems.SetPosicionElegida(i, items[i]);
  end;
  result := NuevosItems;
end;

procedure Vector.SetVector1(Parametros: integer);
var
  i: integer;
begin
  for i := min to max do
  begin
    items[i] := Parametros;
  end;
end;

procedure Vector.StringAVector(cadena: string);
var
  i,p: integer;
begin
  for i := min to max do
    Items[i] := 0;

  i := 0;
  cadena := cadena + ' ';
  p := pos(' ', cadena);

  while P > 0 do begin
    Inc(i);
    Items[i] := strtoint(Copy(cadena, 1, p - 1));
    cadena := copy(cadena, P + 1, length(cadena));
    p := pos(' ', cadena);
  end;
end;

  function Vector.GetVector1(): TipoVector;
  begin
    result := items;
  end;

  // SET Y GET Posiciones
  function Vector.GetPosicionElegida(posicion: integer): integer;
  begin
    result := items[posicion];
  end;

  procedure Vector.SetPosicionElegida(posicion, Parametros: integer);
  begin
    items[posicion] := Parametros;
  end;

end.
