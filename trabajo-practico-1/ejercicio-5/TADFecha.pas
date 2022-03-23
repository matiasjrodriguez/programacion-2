unit TADFecha;

interface

uses
  sysutils;

type
  Fecha = object
  private
    dia: byte;
    mes: byte;
    a�o: integer;
  public
    function getDia():byte;
    function getMes():byte;
    function getA�o():integer;
    procedure setDia(nuevoDia:byte);
    procedure setMes(nuevoMes:byte);
    procedure setA�o(nuevoA�o:integer);
    function cargarFecha(nuevoDia, nuevoMes:byte; nuevoA�o:integer):boolean;
    function stringFecha():string;
    function verificarFecha():boolean;
    function comparar(otraFecha:Fecha):string;

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
function Fecha.getA�o():integer;
begin
  result := a�o;
end;
procedure Fecha.setDia(nuevoDia:byte);
begin
  dia := nuevoDia;
end;
procedure Fecha.setMes(nuevoMes:byte);
begin
  mes := nuevoMes;
end;
procedure Fecha.setA�o(nuevoA�o:integer);
begin
  a�o := nuevoA�o;
end;

function Fecha.cargarFecha(nuevoDia, nuevoMes:byte; nuevoA�o:integer):boolean;
var exito:boolean;
begin
  exito := false;
  setDia(nuevoDia);
  setMes(nuevoMes);
  setA�o(nuevoA�o);
  if verificarFecha() then
    exito := true
  else begin
    setDia(0);
    setMes(0);
    setA�o(0);
  end;

  result := exito;
end;

function Fecha.stringFecha():string;
begin
  result := getDia().ToString + '/' + getMes().ToString + '/' + getA�o().ToString;
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

function Fecha.comparar(otraFecha: Fecha): string;
var comparacion:string;
begin
  if getA�o() > otraFecha.getA�o() then
    comparacion := 'Mayor'
  else if getA�o() < otraFecha.getA�o() then
    comparacion := 'Menor'
  else if getMes() > otraFecha.getMes() then
    comparacion := 'Mayor'
  else if getMes() < otraFecha.getMes() then
    comparacion := 'Menor'
  else if getDia() > otraFecha.getDia() then
    comparacion := 'Mayor'
  else if getDia() < otraFecha.getDia() then
    comparacion := 'Menor'
  else
    comparacion := 'Igual';

  result := comparacion

end;

end.
