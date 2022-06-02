unit TADArb;

interface

uses
  Tipos, ArbolesBinarios, ArbolesBinariosBusqueda, ArbolesBinariosAVL, ListPointer;

type
  ManejoArboles = Object
    private
    public
      function ListarHojas(var A:Arbol):Lista;
      function ListarInteriores(var A:Arbol):Lista;
      function MismoNivel(var A:Arbol):boolean;
      function Ocurrencias(var A:Arbol; X:TipoElemento):Lista;
      function Padre(X:TipoElemento; var A:Arbol):TipoElemento;
      function Hijos(X:TipoElemento; var A:Arbol): Lista;
      function Hermanos(X:TipoElemento; var A:Arbol): Lista;
      function Nivel(X:TipoElemento; var A:Arbol): integer;
      function ArbolesEquivalentes(var A1,A2: Arbol):boolean;
      function AlturaNario(var A:Arbol):integer;
      function NivelNario(var A:Arbol; P:ArbolesBinarios.PosicionArbol): integer;
      function InterioresNario(var A:Arbol):Lista;

  End;

implementation

{ ManejoArboles }

function ManejoArboles.ListarHojas(var A: Arbol): Lista;
var
  L:Lista;
  X: TipoElemento;

  procedure Recorrido(Q: ArbolesBinarios.PosicionArbol);
  begin
    if Q <> Nulo then begin
      if (A.HijoIzquierdo(Q) = Nulo) and (A.HijoDerecho(Q) = Nulo) then begin
        X := A.Recuperar(Q);
        L.Agregar(X);
      end;
      Recorrido(A.HijoIzquierdo(Q));
      Recorrido(A.HijoDerecho(Q));
    end;
  end;

begin
  L.Crear(A.DatoDeLaClave,A.SizeTree);
  Recorrido(A.Root);
  result := L;
end;

function ManejoArboles.ListarInteriores(var A: Arbol): Lista;
var
  L: Lista;
  X: TipoElemento;

  procedure Recorrido(Q: ArbolesBinarios.PosicionArbol);
  begin
    if (Q <> NULO) then begin
      if ( (Q <> A.Root) and ((A.HijoIzquierdo(Q) <> NULO) or (A.HijoDerecho(Q) <> NULO)) ) then begin
        X := A.Recuperar(Q);
        L.Agregar(X);
      end;
      Recorrido(A.HijoIzquierdo(Q));
      Recorrido(A.HijoDerecho(Q));
    end;
  end;

begin
  L.Crear(A.DatoDeLaClave,A.SizeTree);
  Recorrido(A.Root);
  result := L;
end;

function ManejoArboles.MismoNivel(var A:Arbol): boolean;
var
  F: boolean;
  Altura: integer;

  procedure Recorrido(Q: ArbolesBinarios.PosicionArbol);
  begin
    if Q <> NULO then begin
      if (A.HijoIzquierdo(Q) = NULO) and (A.HijoDerecho(Q) = NULO) then begin
        if (Altura <> A.Nivel(Q) + 1) then
          F := False;
      end;
      Recorrido(A.HijoIzquierdo(Q));
      Recorrido(A.HijoDerecho(Q));
    end;
  end;

begin
  Altura := A.Altura;
  F := True;
  Recorrido(A.Root);
  result := F;
end;

function ManejoArboles.Nivel(X: TipoElemento; var A: Arbol): integer;
var
  N: integer;

  procedure Recorrido(Q: ArbolesBinarios.PosicionArbol);
  begin
    if Q <> NULO then begin
      if A.Recuperar(Q).Clave = X.Clave then
        N := A.Nivel(Q);
      Recorrido(A.HijoIzquierdo(Q));
      Recorrido(A.HijoDerecho(Q));
    end;
  end;

begin
  N := -1;
  Recorrido(A.Root);
  result := N;
end;

function ManejoArboles.NivelNario(var A: Arbol;P: ArbolesBinarios.PosicionArbol): integer;
var
  N:integer;

  procedure Recorrido(Q: ArbolesBinarios.PosicionArbol; Contador:integer);
  begin
    if not A.RamaNula(Q) then begin
      if P = Q then
        N := Contador;
      Recorrido(A.HijoIzquierdo(Q), Contador + 1);
      Recorrido(A.HijoDerecho(Q), Contador);
    end;
  end;
begin
  N := 0;
  Recorrido(A.Root,0);
  result := N;
end;

function ManejoArboles.Ocurrencias(var A: Arbol; X: TipoElemento): Lista;
var
  Contador:integer;
  L:Lista;
  XO: TipoElemento;

  procedure Recorrido(Q: ArbolesBinarios.PosicionArbol);
  begin
    if Q <> NULO then begin
      inc(Contador);
      if X.Clave = A.Recuperar(Q).Clave then begin
        XO.Clave := Contador;
        L.Agregar(XO);
      end;
      Recorrido(A.HijoIzquierdo(Q));
      Recorrido(A.HijoDerecho(Q));
    end;
  end;

begin
  Contador := 0;
  L.Crear(Numero,A.SizeTree);
  Recorrido(A.Root);
  result := L;
end;

function ManejoArboles.Padre(X:TipoElemento; var A: Arbol): TipoElemento;
var
  XP: TipoElemento;

  procedure Recorrido(Q: ArbolesBinarios.PosicionArbol);
  begin
    if Q <> NULO then begin
      if (A.Recuperar(A.HijoIzquierdo(Q)).Clave = X.Clave) or (A.Recuperar(A.HijoDerecho(Q)).Clave = X.Clave) then begin
        XP := A.Recuperar(Q); //Para la primera ocurrencia
        Exit
      end;
      Recorrido(A.HijoIzquierdo(Q));
      Recorrido(A.HijoDerecho(Q));
    end;
  end;

begin
  if X.Clave = A.Recuperar(A.Root).Clave then
    XP.TipoElementoVacio
  else
    Recorrido(A.Root);
  result := XP;
end;


function ManejoArboles.Hijos(X: TipoElemento; var A: Arbol): Lista;
var
  L:Lista;
  H1,H2: TipoElemento;

  procedure Recorrido(Q: ArbolesBinarios.PosicionArbol);
  begin
    if Q <> NULO then begin
      if (A.Recuperar(Q).Clave = X.Clave) then begin
        if not A.RamaNula(A.HijoIzquierdo(Q)) then begin
          H1 := A.Recuperar(A.HijoIzquierdo(Q));
          L.Agregar(H1);
        end;
        if not A.RamaNula(A.HijoDerecho(Q)) then begin
          H2 := A.Recuperar(A.HijoDerecho(Q));
          L.Agregar(H2);
        end;
      end;
      Recorrido(A.HijoIzquierdo(Q));
      Recorrido(A.HijoDerecho(Q));
    end;
  end;

begin
  L.Crear(A.DatoDeLaClave,A.SizeTree);
  Recorrido(A.Root);
  result := L;
end;


function ManejoArboles.InterioresNario(var A: Arbol): Lista;
var
  L:Lista;

  procedure Recorrer(Q:ArbolesBinarios.PosicionArbol);
  begin
    if not A.RamaNula(Q) then begin
      if (not A.RamaNula(A.HijoIzquierdo(Q))) and (Q <> A.Root) then
        L.Agregar(A.Recuperar(Q));
      Recorrer(A.HijoIzquierdo(Q));
      Recorrer(A.HijoDerecho(Q));
    end;
  end;

begin
  L.Crear(A.DatoDeLaClave,A.SizeTree);
  Recorrer(A.Root);
  result := L;
end;

function ManejoArboles.AlturaNario(var A: Arbol): integer;
var
  H:integer;

  procedure Recorrido(Q:ArbolesBinarios.PosicionArbol; Contador: integer);
  begin
    if not A.RamaNula(Q) then begin
      Recorrido(A.HijoIzquierdo(Q),Contador + 1);
      Recorrido(A.HijoDerecho(Q), Contador);
    end
    else begin
      if Contador > H then
        H := Contador
    end;
  end;

begin
  H := 0;
  Recorrido(A.Root,0);
  result := H;
end;

function ManejoArboles.ArbolesEquivalentes(var A1, A2: Arbol): boolean;
var
  Iguales: boolean;

  procedure Recorrido(Q1,Q2: ArbolesBinarios.PosicionArbol);
  begin
    if not(A1.RamaNula(Q1) or A2.RamaNula(Q2)) then begin
      if A1.Recuperar(Q1).Clave = A2.Recuperar(Q2).Clave then begin
        Recorrido(A1.HijoIzquierdo(Q1),A2.HijoIzquierdo(Q2));
        Recorrido(A1.HijoDerecho(Q1),A2.HijoDerecho(Q2));
      end
      else begin
        Iguales := False;
      end;
    end
    else begin
      if not(A1.RamaNula(Q1) and A2.RamaNula(Q2)) then
        Iguales := False;
    end;
  end;
begin
  Iguales := True;
  Recorrido(A1.Root,A2.Root);
  result := Iguales;
end;

function ManejoArboles.Hermanos(X: TipoElemento; var A: Arbol): Lista;
var
  L: Lista;
  N: integer;
  PosX: ArbolesBinarios.PosicionArbol;

  procedure Recorrido(Q:ArbolesBinarios.PosicionArbol);
  begin
    if Q <> NULO then begin
      if (A.Nivel(Q) = N) and (Q <> PosX) then
        L.Agregar(A.Recuperar(Q));
      Recorrido(A.HijoIzquierdo(Q));
      Recorrido(A.HijoDerecho(Q));
    end;
  end;

begin
  PosX := A.BuscarPreOrden(X);
  N := A.Nivel(PosX);
  L.Crear(A.DatoDeLaClave,A.SizeTree);
  Recorrido(A.Root);
  result := L;
end;

end.
