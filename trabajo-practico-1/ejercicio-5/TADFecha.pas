unit TADFecha;

interface

uses
  sysutils;

type

  OPCION = (Mayor, Menor, Igual);

  Fecha = object
  private
    dia: byte;
    mes: byte;
    año: integer;
  public
    function getDia():byte;
    function getMes():byte;
    function getAño():integer;
    procedure setDia(nuevoDia:byte);
    procedure setMes(nuevoMes:byte);
    procedure setAño(nuevoAño:integer);
    function cargarFecha(nuevoDia, nuevoMes:byte; nuevoAño:integer):boolean;
    function stringFecha():string;
    function verificarFecha():boolean;
    function comparar(otraFecha:Fecha):OPCION;
    function esBisiesto():boolean;
    function diferencia(otraFecha:Fecha):Fecha;
    function convertirADias():integer;
  end;

implementation

function Fecha.getDia():byte;
begin
  result := dia;
end;

function Fecha.getMes():byte;
begin
  result := mes;
end;
function Fecha.getAño():integer;
begin
  result := año;
end;
procedure Fecha.setDia(nuevoDia:byte);
begin
  dia := nuevoDia;
end;
procedure Fecha.setMes(nuevoMes:byte);
begin
  mes := nuevoMes;
end;
procedure Fecha.setAño(nuevoAño:integer);
begin
  año := nuevoAño;
end;

function Fecha.cargarFecha(nuevoDia, nuevoMes:byte; nuevoAño:integer):boolean;
var exito:boolean;
begin
  exito := false;
  setDia(nuevoDia);
  setMes(nuevoMes);
  setAño(nuevoAño);
  if verificarFecha() then
    exito := true
  else begin
    setDia(0);
    setMes(0);
    setAño(0);
  end;

  result := exito;
end;

function Fecha.stringFecha():string;
begin
  result := getDia().ToString + '/' + getMes().ToString + '/' + getAño().ToString;
end;

function Fecha.verificarFecha(): Boolean;
var exito: boolean;
begin
  exito := false;
  if (getMes() in [1, 3, 5, 7, 8, 10, 12]) and ((getDia() <= 31) and (getDia() > 0)) then
    exito := true
  else if (getMes() in [4, 6, 9, 11]) and ((getDia() <= 30) and (getDia() > 0)) then
    exito := true
  else if (getMes() = 2) and ((getDia() <= 28) and (getDia() > 0)) then
    exito := true;

  result := exito

end;

function Fecha.comparar(otraFecha: Fecha): OPCION;
var comparacion:OPCION;
begin
  if getAño() > otraFecha.getAño() then
    comparacion := Mayor
  else if getAño() < otraFecha.getAño() then
    comparacion := Menor
  else if getMes() > otraFecha.getMes() then
    comparacion := Mayor
  else if getMes() < otraFecha.getMes() then
    comparacion := Menor
  else if getDia() > otraFecha.getDia() then
    comparacion := Mayor
  else if getDia() < otraFecha.getDia() then
    comparacion := Menor
  else
    comparacion := Igual;

  result := comparacion

end;

function Fecha.esBisiesto():boolean;
begin
  result := ((getAño() mod 4) = 0) and
    (not((getAño() mod 100) = 0) or ((getAño() mod 400) = 0))
end;

function Fecha.diferencia(otraFecha: Fecha): Fecha;
  var resultado: Fecha;
  var I: integer;
begin

  //////// HAY QUE CORREGIR ESTA FUNCIÓN ////////

  if getDia() > otraFecha.getDia() then
    resultado.setDia(getDia() - otraFecha.getDia())
  else
    resultado.setDia(otraFecha.getDia() - getDia());

  if getMes() > otraFecha.getMes() then
    resultado.setMes(getMes() - otraFecha.getMes())
  else
    resultado.setMes(otraFecha.getMes() - getMes());

  if getAño() > otraFecha.getAño() then
    resultado.setAño(getAño() - otraFecha.getAño())
  else
    resultado.setAño(otraFecha.getAño() - getAño());

  result := resultado;
end;

function Fecha.convertirADias(): Integer;
var totalDias, totalMeses, totalAños: integer;
begin
  totalDias := getDia();
  totalMeses := getMes() - 1;
  totalAños := getAño();

  while totalMeses > 0 do begin

    if (getMes() in [1, 3, 5, 7, 8, 10, 12]) then 
      Inc(totalDias, 31)
    else if (getMes() in [4, 6, 9, 11]) then
      Inc(totalDias, 30)
    else if esBisiesto() then
      Inc(totalDias, 29)
    else
      Inc(totalDias, 28);
             
    Dec(totalMeses);
    
  end;

  Dec(totalAños);
  
  while totalAños > 0 do begin
  
    if esBisiesto() then
      Inc(totalDias, 366)
    else
      Inc(totalDias, 365);

    Dec(totalAños);

  end;

  result := totalDias;
  
end;

end.
