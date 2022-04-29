unit ManejoPilas;

interface

Uses
  Tipos, stdctrls, SysUtils, Variants,
  //StackArray;
  //StackCursor;
  StackPointer;

const
  LARGO = 15;

type TADManejoPilas = object
  private
    miPila: Pila;
  public
    procedure LlenarRandom(Desde,Hasta:integer);
    function buscarClave(n:integer):boolean;
    function retornarString():string;
    procedure agregarElementoFondo(n:integer);
    procedure eliminarOcurrencias(n:integer);
    procedure intercambiar();
    procedure Duplicar();
    function ContarElementos():integer;
end;

implementation

{ TADManejoPilas }

procedure TADManejoPilas.agregarElementoFondo(n: integer);
var
  PAux: Pila;
  X,XN: TipoElemento;
begin
  PAux.Crear(Numero,LARGO);
  while not miPila.EsVacia do begin
    X := miPila.Recuperar;
    miPila.DesApilar;
    PAux.Apilar(X);
  end;
  miPila.Crear(Numero,LARGO + 1); //Creo otra vez la pila con el tamaño anterior + 1 para almacenar el nuevo dato
  XN.Clave := n;
  miPila.Apilar(XN);
  miPila.InterCambiar(PAux,False);
end;

function TADManejoPilas.buscarClave(n: integer): boolean;
var
  PAux: Pila;
  X: TipoElemento;
  Encontro:boolean;
begin
  Encontro := False;
  PAux.Crear(Numero,LARGO);
  while not miPila.EsVacia do begin
    X := miPila.Recuperar;
    if X.Clave = n then
      Encontro := True;
    miPila.DesApilar;
    PAux.Apilar(X);
  end;
  miPila.InterCambiar(PAux,True);
  result := Encontro;
end;

function TADManejoPilas.ContarElementos: integer;
var
  PAux:Pila;
  X:TipoElemento;
  cantidad:integer;
begin
  PAux.Crear(Numero,LARGO);
  cantidad := 0;
  while not miPila.EsVacia do begin
    X := miPila.Recuperar;
    inc(cantidad);
    PAux.Apilar(X);
    miPila.DesApilar;
  end;
  miPila.InterCambiar(PAux,True);
  result := cantidad;
end;

procedure TADManejoPilas.Duplicar;
var
  PAux,PAux2:Pila;
  X:TipoElemento;
begin
  PAux.Crear(Numero,LARGO);
  PAux2.Crear(Numero,LARGO);
  while not miPila.EsVacia do begin
    X := miPila.Recuperar;
    PAux.Apilar(X);
    PAux2.Apilar(X);
    miPila.DesApilar;
  end;
  miPila.Crear(Numero,LARGO * 2);
  miPila.InterCambiar(PAux,True);
  miPila.InterCambiar(PAux2,False);
end;

procedure TADManejoPilas.eliminarOcurrencias(n: integer);
var
  PAux: Pila;
  X: TipoElemento;
begin
  PAux.Crear(Numero,LARGO);
  while not miPila.EsVacia do begin
    X := miPila.Recuperar;
    if X.Clave = n then
      miPila.DesApilar
    else begin
      miPila.DesApilar;
      PAux.Apilar(X);
    end;
  end;
  miPila.InterCambiar(PAux,True);
end;

procedure TADManejoPilas.intercambiar;
var
  PAux: Pila;
  X,Tope,Fondo:TipoElemento;
begin
  Tope := miPila.Recuperar;
  miPila.DesApilar;
  PAux.Crear(Numero,LARGO);
  while not miPila.EsVacia do begin
    X := miPila.Recuperar;
    miPila.DesApilar;
    PAux.Apilar(X);
  end;
  Fondo := PAux.Recuperar;
  PAux.DesApilar;
  miPila.Apilar(Tope);
  miPila.InterCambiar(PAux,False);
  miPila.Apilar(Fondo);
end;

procedure TADManejoPilas.LlenarRandom(Desde,Hasta:integer);
begin
  miPila.LlenarClavesRandom(LARGO,Desde,Hasta);
end;

function TADManejoPilas.retornarString: string;
begin
  result := miPila.RetornarClaves;
end;

end.
