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
    public
      procedure InicializarContenedores();
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
  end;

implementation

{ CajaRegistradora }

function CajaRegistradora.getContenedores: RegContenedores;
begin
  result:= Contenedores;
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
