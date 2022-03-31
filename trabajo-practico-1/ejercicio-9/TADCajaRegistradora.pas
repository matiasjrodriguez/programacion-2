unit TADCajaRegistradora;

interface

uses
  system.Math;

const
  min = 1;
  max = 13;
  Valores : array [min..max] of double = (0.25,0.50,1,2,5,10,10,20,50,100,200,500,1000);

type
  RegDinero = Record
    Valor: double;
    Cantidad: integer;
  end;
  ArrayContenedores = array[min..max] of RegDinero;
  CajaRegistradora = object
    private
      Contenedores: ArrayContenedores;
      Vuelto: ArrayContenedores;
    public
      procedure InicializarContenedores();
      procedure InicializarVuelto();
      function getContenedores():ArrayContenedores;
      procedure setContenedores(C:ArrayContenedores);
      function getLongitud():integer;
      function getVuelto(): ArrayContenedores;
      function GenerarVuelto(CCliente:ArrayContenedores; cobro:Double;var aDevolver:Double):boolean;
      function ValidarCobro(Billetes:ArrayContenedores;cobro:double):boolean;
      function Saldo(C:ArrayContenedores):Double;
      procedure AgregarACaja(CCliente:ArrayContenedores);
      function CerrarCaja(var SaldoFinal:Double):ArrayContenedores;
  end;

implementation

{ CajaRegistradora }

function CajaRegistradora.getContenedores: ArrayContenedores;
begin
  result:= Contenedores;
end;

function CajaRegistradora.getLongitud: integer;
begin
  result := max;
end;

function CajaRegistradora.getVuelto: ArrayContenedores;
begin
  result := Vuelto;
end;

procedure CajaRegistradora.setContenedores(C:ArrayContenedores);
begin
  Contenedores := C;
end;

procedure CajaRegistradora.InicializarContenedores;
var
  i: Integer;
begin
  for i := 1 to length(Contenedores) do begin
    Contenedores[i].Cantidad := 0;
    Contenedores[i].Valor := Valores[i];
  end;
end;

procedure CajaRegistradora.InicializarVuelto();
var
  i:integer;
begin
  for i := 1 to length(Vuelto) do begin
    Vuelto[i].Cantidad := 0;
    Vuelto[i].Valor := Valores[i];
  end;
end;

function CajaRegistradora.Saldo(C: ArrayContenedores): Double;
var
  suma : double; i:integer;
begin
  suma := 0;
  for i := 1 to length(Contenedores) do
    suma := suma + C[i].Cantidad * C[i].Valor;
  result := suma;
end;

function CajaRegistradora.ValidarCobro(Billetes:ArrayContenedores; cobro:double):boolean;
var
  suma: double;
begin
  suma := Saldo(Billetes);
  result := suma >= cobro;
end;

function CajaRegistradora.GenerarVuelto(CCliente: ArrayContenedores; cobro:Double; var aDevolver:Double):boolean;
var
  i,j: integer; V:Double;
  contenedoresAux: ArrayContenedores;
  k: Integer;
begin
  V := Saldo(CCliente) - cobro;
  aDevolver := V;
  i := GetLongitud();
  j := GetLongitud();
  for k := 1 to getLongitud do
    contenedoresAux[k].Cantidad := Contenedores[k].Cantidad;

  while j > 0 do begin
    while i > 0 do begin
      while (Contenedores[i].Cantidad > 0) and (V >= Contenedores[i].Valor) do begin
        V := V - Contenedores[i].Valor;
        inc(Vuelto[i].Cantidad);
        dec(Contenedores[i].Cantidad);
      end;
      dec(i);
    end;
    if v > 0 then begin
      dec(j);
      i := j;
      v := aDevolver;
      InicializarVuelto();
      for k := 1 to getLongitud do
        Contenedores[k].Cantidad := contenedoresAux[k].Cantidad;
    end else
      j := 0;
  end;
  result := (v = 0);
end;

procedure CajaRegistradora.AgregarACaja(CCliente: ArrayContenedores);
  var i:integer;
begin
  for i := 1 to length(contenedores) do
    Contenedores[i].Cantidad := Contenedores[i].Cantidad + CCliente[i].Cantidad;
end;

function CajaRegistradora.CerrarCaja(var SaldoFinal:Double):ArrayContenedores;
begin
  SaldoFinal := Saldo(Contenedores);
  result := Contenedores;
end;

end.
