unit PilasIguales;

interface

Uses
  Tipos, stdctrls, SysUtils, Variants,
  //StackArray;
  //StackCursor;
  StackPointer;

const
  LARGO = 10;

type TADCompararPilas = object
    private
      miPila1 : Pila;
      miPila2 : Pila;
    public
      procedure CrearPilas();
      procedure setPilas(P1,P2:Pila);
      function Iguales():boolean;  // ej 2
      function retornarString():string;
      function invertirPila():Pila; // ej 3
      function eliminarOcurrencias(n: integer):Pila; // ej 4
      function insertarElemento(N,Pos:integer):boolean; // ej 5
  end;

implementation

{ TADCompararPilas }

procedure TADCompararPilas.CrearPilas;
begin
  miPila1.Crear(Numero,LARGO);
  miPila2.Crear(Numero,LARGO);
end;

procedure TADCompararPilas.setPilas(P1, P2: Pila);
begin
  miPila1 := P1;
  miPila2 := P2;
end;

function TADCompararPilas.eliminarOcurrencias(n: integer):Pila;
var
  PAux,PProcesada,PProcesadaAux: Pila;
  X: TipoElemento;
begin
  PAux.Crear(miPila1.DatoDeLaClave,miPila1.SizeStack);
  PProcesada.Crear(miPila1.DatoDeLaClave,miPila1.SizeStack);
  PProcesadaAux.Crear(miPila1.DatoDeLaClave,miPila1.SizeStack);
  while not miPila1.EsVacia do begin
    X := miPila1.Recuperar;
    if X.Clave = n then begin
      PAux.Apilar(X);
      miPila1.DesApilar
    end
    else begin
      miPila1.DesApilar;
      PAux.Apilar(X);
      PProcesadaAux.Apilar(X);
    end;
  end;
  miPila1.InterCambiar(PAux,True);
  PProcesada.InterCambiar(PProcesadaAux,True);
  result := PProcesada;
end;

function TADCompararPilas.Iguales: boolean;
var
  PAux1,PAux2:Pila;
  X1,X2:TipoElemento;
  Igual: boolean;
begin
  igual := True;
  PAux1.Crear(Numero,LARGO);
  PAux2.Crear(Numero,LARGO);
  while not miPila1.EsVacia do begin
    X1 := miPila1.Recuperar;
    X2 := miPila2.Recuperar;
    if X1.Clave <> X2.Clave then
      Igual := False;
    miPila1.DesApilar;
    miPila2.DesApilar;
    PAux1.Apilar(X1);
    PAux2.Apilar(X1);
  end;
  miPila1.InterCambiar(PAux1,True);
  miPila2.InterCambiar(PAux2,True);
  result := igual;
end;

function TADCompararPilas.insertarElemento(N, Pos: integer): boolean;
var
  PAux:Pila;
  X,XN:TipoElemento;
  Valido:boolean;
  contador: integer;
begin
  contador := 0;
  PAux.Crear(miPila1.DatoDeLaClave,miPila1.SizeStack + 1);
  if (Pos <= miPila1.SizeStack) and (Pos > 0) then begin
    Valido := true;
    while not miPila1.EsVacia do begin
      inc(contador);
      if contador = Pos then begin
        XN.Clave := N;
        PAux.Apilar(XN)
      end
      else begin
        X := miPila1.Recuperar;
        miPila1.DesApilar;
        PAux.Apilar(X);
      end;
    end;
    miPila1.Crear(PAux.DatoDeLaClave,PAux.SizeStack);
    miPila1.InterCambiar(PAux,True);
  end
  else begin
    Valido := False;
  end;
  result := valido;
end;

function TADCompararPilas.invertirPila: Pila;
var
  PAux,PInvertida:Pila;
  X:tipoElemento;
begin
  Paux.Crear(miPila1.DatoDeLaClave,miPila1.SizeStack);
  PInvertida.Crear(miPila1.DatoDeLaClave,miPila1.SizeStack);
  while not miPila1.EsVacia do begin
    X := miPila1.Recuperar;
    PAux.Apilar(X);
    PInvertida.Apilar(X);
    miPila1.DesApilar;
  end;
  miPila1.InterCambiar(PAux,True);
  result := PInvertida;
end;

function TADCompararPilas.retornarString: string;
begin
  result := miPila1.RetornarClaves + cCRLF + miPila2.RetornarClaves;
end;

end.
