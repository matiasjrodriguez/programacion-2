unit TADEstacionamiento;

interface
uses
  DateUtils;
type

  TARIFA = (porHora, porMediaEstadia, porEstadiaCompleta);

  regAutos = record
    entrada: TDateTime;
    salida: TDateTime;
    abona: single;
    tipotarifa: TARIFA;
  end;

  regRecaudacion = record
    fecha: TDateTime;
    monto: double;
  end;

  vecAutos = array of regAutos;

  vecRecaudacion = array of regRecaudacion;

  Estacionamiento = object
  private
    cantidadAutos: integer;
    autos: vecAutos;
    mediaEstadia: integer;
    estadiaCompleta: integer;
    tarifaHora: integer;
    recaudacion: vecRecaudacion;
  public
    function getRecaudacion():vecRecaudacion;
    procedure setRecaudacion(recauda:vecRecaudacion);
    procedure agregarRecaudacion(recauda:regRecaudacion);
    procedure vaciarRecaudacion();
    procedure ordenarRecaudacion();
    function getCantidadAutos():integer;
    procedure setCantidadAutos(n: integer);
    function getAutos():vecAutos;
    procedure setAutos(auto: regAutos);
    function getMediaEstadia():integer;
    procedure setMediaEstadia(n: integer);
    function getEstadiaCompleta():integer;
    procedure setEstadiaCompleta(n: integer);
    function getTarifaHora():integer;
    procedure setTarifaHora(n:integer);

    procedure ingresarAuto(tiempoEntrada, tiempoSalida: TDateTime);
  end;

implementation

function Estacionamiento.getRecaudacion: vecRecaudacion;
begin
  result := copy(recaudacion);
end;

procedure Estacionamiento.setRecaudacion(recauda:vecRecaudacion);
begin
  recaudacion := copy(recauda);
end;

procedure Estacionamiento.agregarRecaudacion(recauda: regRecaudacion);
var
  vectorRecaudacion: vecRecaudacion;
begin
  vectorRecaudacion := copy(getRecaudacion());
  setLength(vectorRecaudacion, length(vectorRecaudacion)+1);
  vectorRecaudacion[high(vectorRecaudacion)] := recauda;
  recaudacion := copy(vectorRecaudacion);
end;

procedure Estacionamiento.vaciarRecaudacion;
var
  vectorRecaudacion: vecRecaudacion;
begin
  vectorRecaudacion := copy(getRecaudacion());
  setLength(vectorRecaudacion, 0);
  recaudacion := copy(vectorRecaudacion);
end;

procedure Estacionamiento.ordenarRecaudacion;
var
  I, J: Integer;
  aux: TDateTime;
  vectorRecaudacion: vecRecaudacion;

begin
  vectorRecaudacion := getRecaudacion();
  For I := 1 to high(vectorRecaudacion) do begin
    aux := vectorRecaudacion[I].fecha;
    J := I;
    While ((J > 0) AND (CompareDate(vectorRecaudacion[J-1].fecha, aux) = 1)) do begin
      vectorRecaudacion[J].fecha := vectorRecaudacion[J-1].fecha;
      J := J - 1;
    End;
    vectorRecaudacion[J].fecha := aux;
  End;
  setRecaudacion(vectorRecaudacion);
end;

function Estacionamiento.getCantidadAutos():integer;
begin
  result := cantidadAutos;
end;

procedure Estacionamiento.setCantidadAutos(n: integer);
begin
  cantidadAutos := n;
end;

function Estacionamiento.getAutos():vecAutos;
begin
  result := copy(autos);
end;

procedure Estacionamiento.setAutos(auto: regAutos);
var vectorAutos: vecAutos;
begin
  vectorAutos := copy(getAutos());
  setLength(vectorAutos, length(vectorAutos)+1);
  vectorAutos[high(vectorAutos)] := auto;
  autos := copy(vectorAutos);
  setCantidadAutos(getCantidadAutos()+1);
end;

function Estacionamiento.getMediaEstadia: Integer;
begin
  result := mediaEstadia;
end;


procedure Estacionamiento.setMediaEstadia(n: Integer);
begin
  mediaEstadia := n;
end;

function Estacionamiento.getEstadiaCompleta: Integer;
begin
  result := estadiaCompleta;
end;

procedure Estacionamiento.setEstadiaCompleta(n: Integer);
begin
  estadiaCompleta := n;
end;

function Estacionamiento.getTarifaHora: Integer;
begin
  result := tarifaHora;
end;

procedure Estacionamiento.setTarifaHora(n: integer);
begin
  tarifaHora := n;
end;

procedure Estacionamiento.ingresarAuto(tiempoEntrada, tiempoSalida: TDateTime);
var
  auto: regAutos;
  añoEntrada, añoSalida, mesEntrada, mesSalida, diaEntrada, diaSalida,
  horaEntrada, horaSalida, minEntrada, minSalida, segEntrada, segSalida,
  milEntrada, milSalida, añoDif, mesDif, diaDif, horaDif, minDif, segDif,
  milDif, totalMinutos: word;
begin

  DecodeDateTime(tiempoEntrada, añoEntrada, mesEntrada, diaEntrada, horaEntrada,
    minEntrada, segEntrada, milEntrada);

  DecodeDateTime(tiempoSalida, añoSalida, mesSalida, diaSalida, horaSalida,
    minSalida, segSalida, milSalida);

  if horaSalida < horaEntrada then
    horaDif := (horaSalida + 24) - horaEntrada
  else
    horaDif := horaSalida - horaEntrada;

  if minSalida < minEntrada then begin
    minDif := (minSalida + 60) - minEntrada;
    Dec(horaDif);
  end else
    minDif := minSalida - minEntrada;

  if horaDif < 3 then begin
    totalMinutos := minDif + (horaDif * 60);
    if totalMinutos mod 10 <> 0 then
      totalMinutos := totalMinutos - (totalMinutos mod 10) + 10;
    auto.abona := (totalMinutos * getTarifaHora()) / 60;
    auto.tipotarifa := porHora;
  end else if horaDif < 6 then begin
    auto.abona := getMediaEstadia();
    auto.tipotarifa := porMediaEstadia;
  end else begin
    auto.abona := getEstadiaCompleta();
    auto.tipotarifa := porEstadiaCompleta;
  end;

  auto.entrada := tiempoEntrada;
  auto.salida := tiempoSalida;

  setAutos(auto);
end;

end.
