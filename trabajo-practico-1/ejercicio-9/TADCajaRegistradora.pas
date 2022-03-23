unit TADCajaRegistradora;

interface

uses
  system.Math;

type
  RegContenedores = Record
    MonedasDe1: integer;
    MonedasDe2: integer;
    MonedasDe5: integer;
    MonedasDe10: integer;
    BilletesDe10: integer;
    BilletesDe20: integer;
    BilletesDe50: integer;
    BilletesDe100: integer;
    BilletesDe200: integer;
    BilletesDe500: integer;
    BilletesDe1000: integer;
  End;
  CajaRegistradora = object
    private
      Contenedores: RegContenedores;
      Vuelto: RegContenedores;
    public
      procedure InicializarContenedores();
      procedure InicializarVuelto();
      function getContenedores():RegContenedores;
      procedure cargarMonedasDe1(cantidad:integer);
      procedure cargarMonedasDe2(cantidad:integer);
      procedure cargarMonedasDe5(cantidad:integer);
      procedure cargarMonedasDe10(cantidad:integer);
      procedure cargarBilletesDe10(cantidad:integer);
      procedure cargarBilletesDe20(cantidad:integer);
      procedure cargarBilletesDe50(cantidad:integer);
      procedure cargarBilletesDe100(cantidad:integer);
      procedure cargarBilletesDe200(cantidad:integer);
      procedure cargarBilletesDe500(cantidad:integer);
      procedure cargarBilletesDe1000(cantidad:integer);
      function getVuelto(): RegContenedores;
      function GenerarVuelto(CCliente:RegContenedores; cobro:integer;var aDevolver:integer):boolean;
      function ValidarCobro(Billetes:RegContenedores;cobro:integer):boolean;
      function Saldo(C:RegContenedores):LongInt;
      procedure AgregarACaja(CCliente:RegContenedores);
      function CerrarCaja(var SaldoFinal:integer):RegContenedores;
  end;

implementation

{ CajaRegistradora }

function CajaRegistradora.getContenedores: RegContenedores;
begin
  result:= Contenedores;
end;

function CajaRegistradora.getVuelto: RegContenedores;
begin
  result := Vuelto;
end;

procedure CajaRegistradora.InicializarContenedores;
begin
  with Contenedores do begin
    MonedasDe1:= 0;
    MonedasDe2:= 0;
    MonedasDe5:= 0;
    MonedasDe10:= 0;
    BilletesDe10:= 0;
    BilletesDe20:= 0;
    BilletesDe50:= 0;
    BilletesDe100:= 0;
    BilletesDe200:= 0;
    BilletesDe500:= 0;
    BilletesDe1000:= 0;
  end;
end;

procedure CajaRegistradora.InicializarVuelto();
begin
  with Vuelto do begin
    MonedasDe1:= 0;
    MonedasDe2:= 0;
    MonedasDe5:= 0;
    MonedasDe10:= 0;
    BilletesDe10:= 0;
    BilletesDe20:= 0;
    BilletesDe50:= 0;
    BilletesDe100:= 0;
    BilletesDe200:= 0;
    BilletesDe500:= 0;
    BilletesDe1000:= 0;
  end;
end;

function CajaRegistradora.Saldo(C: RegContenedores): LongInt;
var
  suma : LongInt;
begin
  suma := 0;
  with C do begin
    suma := suma + MonedasDe1;
    suma := suma + MonedasDe2 * 2;
    suma := suma + MonedasDe5 * 5;
    suma := suma + MonedasDe10 * 10;
    suma := suma + BilletesDe10 * 10;
    suma := suma + BilletesDe20 * 20;
    suma := suma + BilletesDe50 * 50;
    suma := suma + BilletesDe100 * 100;
    suma := suma + BilletesDe200 * 200;
    suma := suma + BilletesDe500 * 500;
    suma := suma + BilletesDe1000 * 1000;
  end;
  result := suma;
end;

function CajaRegistradora.ValidarCobro(Billetes:RegContenedores; cobro:integer):boolean;
var
  suma: integer;
begin
  suma := Saldo(Billetes);
  if suma >= cobro then
    result := True
  else
    result := False;
end;

function CajaRegistradora.GenerarVuelto(CCliente: RegContenedores; cobro:integer; var aDevolver:integer):boolean;
var
  v:integer;
begin
  v := Saldo(CCliente) - cobro;
  aDevolver := v;
  with Contenedores do begin

    while (BilletesDe1000 > 0) and (v >= 1000) do begin
      v := v - 1000;
      inc(Vuelto.BilletesDe1000);
      dec(BilletesDe1000);
    end;

    while (BilletesDe500 > 0) and (v >= 500) do begin
      v := v - 500;
      inc(Vuelto.BilletesDe500);
      dec(BilletesDe500);
    end;

    while (BilletesDe200 > 0) and (v >= 200) do begin
      v := v - 200;
      inc(Vuelto.BilletesDe200);
      dec(BilletesDe200);
    end;

    while (BilletesDe100 > 0) and (v >= 100) do begin
      v := v - 100;
      inc(Vuelto.BilletesDe100);
      dec(BilletesDe100);
    end;

    while (BilletesDe50 > 0) and (v >= 50) do begin
      v := v - 50;
      inc(Vuelto.BilletesDe50);
      dec(BilletesDe50);
    end;

    while (BilletesDe20 > 0) and (v >= 20) do begin
      v := v - 20;
      inc(Vuelto.BilletesDe20);
      dec(BilletesDe20);
    end;

    while (BilletesDe10 > 0) and (v >= 10) do begin
      v := v - 10;
      inc(Vuelto.BilletesDe10);
      dec(BilletesDe10);
    end;

    while (MonedasDe10 > 0) and (v >= 10) do begin
      v := v - 10;
      inc(Vuelto.Monedasde10);
      dec(MonedasDe10);
    end;

    while (MonedasDe5 > 0) and (v >= 5) do begin
      v := v - 5;
      inc(Vuelto.Monedasde5);
      dec(MonedasDe5);
    end;

    while (MonedasDe2 > 0) and (v >= 2) do begin
      v := v - 2;
      inc(Vuelto.Monedasde2);
      dec(MonedasDe2);
    end;

    while (MonedasDe1 > 0) and (v >= 1) do begin
      v := v - 1;
      inc(Vuelto.Monedasde1);
      dec(MonedasDe1);
    end;

    result := (v = 0);
  end;
end;

procedure CajaRegistradora.AgregarACaja(CCliente: RegContenedores);
begin
  with Contenedores do begin
    MonedasDe1 := MonedasDe1 + CCliente.MonedasDe1;
    MonedasDe2 := MonedasDe2 + CCliente.MonedasDe2;
    MonedasDe5 := MonedasDe5 + CCliente.MonedasDe5;
    MonedasDe10 := MonedasDe10 + CCliente.MonedasDe10;
    BilletesDe10 := BilletesDe10 + CCliente.BilletesDe10;
    BilletesDe20 := BilletesDe20 + CCliente.BilletesDe20;
    BilletesDe50 := BilletesDe50 + CCliente.BilletesDe50;
    BilletesDe100 := BilletesDe100 + CCliente.BilletesDe100;
    BilletesDe200 := BilletesDe200 + CCliente.BilletesDe200;
    BilletesDe500 := BilletesDe500 + CCliente.BilletesDe500;
    BilletesDe1000 := BilletesDe1000 + CCliente.BilletesDe1000;
  end;
end;

function CajaRegistradora.CerrarCaja(var SaldoFinal:integer):RegContenedores;
begin
  SaldoFinal := Saldo(Contenedores);
  result := Contenedores;
end;

////////////// CARGAR ///////////////////


procedure CajaRegistradora.cargarMonedasDe1(cantidad:integer);
begin
  Contenedores.MonedasDe1 := Contenedores.MonedasDe1 + cantidad;
end;

procedure CajaRegistradora.cargarMonedasDe2(cantidad:integer);
begin
  Contenedores.MonedasDe2 := Contenedores.MonedasDe2 + cantidad;
end;

procedure CajaRegistradora.cargarMonedasDe5(cantidad:integer);
begin
  Contenedores.MonedasDe5 := Contenedores.MonedasDe5 + cantidad;
end;

procedure CajaRegistradora.cargarMonedasDe10(cantidad:integer);
begin
  Contenedores.MonedasDe10 := Contenedores.MonedasDe10 + cantidad;
end;

procedure CajaRegistradora.cargarBilletesDe10(cantidad:integer);
begin
  Contenedores.BilletesDe10 := Contenedores.BilletesDe10 + cantidad;
end;

procedure CajaRegistradora.cargarBilletesDe20(cantidad:integer);
begin
  Contenedores.BilletesDe20 := Contenedores.BilletesDe20 + cantidad;
end;

procedure CajaRegistradora.cargarBilletesDe50(cantidad:integer);
begin
  Contenedores.BilletesDe50 := Contenedores.BilletesDe50 + cantidad;
end;

procedure CajaRegistradora.cargarBilletesDe100(cantidad:integer);
begin
  Contenedores.BilletesDe100 := Contenedores.BilletesDe100 + cantidad;
end;

procedure CajaRegistradora.cargarBilletesDe200(cantidad:integer);
begin
  Contenedores.BilletesDe200 := Contenedores.BilletesDe200 + cantidad;
end;

procedure CajaRegistradora.cargarBilletesDe500(cantidad:integer);
begin
  Contenedores.BilletesDe500 := Contenedores.BilletesDe500 + cantidad;
end;

procedure CajaRegistradora.cargarBilletesDe1000(cantidad:integer);
begin
  Contenedores.BilletesDe1000 := Contenedores.BilletesDe1000 + cantidad;
end;

end.
