unit Unit1;
interface
uses Tipos, QueuesPointer;

type
a = object
  private
  function existe(X: TipoElemento; var Caux:Cola):boolean;
  public
  function sonIguales(var C1, C2:Cola):boolean;
end;
implementation

function a.existe(X: TipoElemento; var Caux: Cola):boolean;
var
  Xaux: TipoElemento;
  encontrado:boolean;
  Caux2: Cola;
begin
  encontrado := false;
  Caux2.Crear(Caux.DatoDeLaClave, Caux.SizeQueue);

  while not(Caux.EsVacia) do begin
    Xaux := Caux.Recuperar;
    Caux2.Encolar(Xaux);
    Caux.DesEncolar;
    if Xaux.Clave = X.Clave then
      encontrado := true;
  end;

  while not(Caux2.EsVacia) do begin
    Xaux := Caux2.Recuperar;
    Caux.Encolar(Xaux);
    Caux2.DesEncolar;
  end;

  result := encontrado;

end;

function a.sonIguales(var C1, C2: Cola): Boolean;
var
  X: TipoElemento;
  iguales: boolean;
  Caux: Cola;
begin
  iguales := true;
  Caux.Crear(C1.DatoDeLaClave, C1.SizeQueue);
  while not(C1.EsVacia) do begin
    X := C1.Recuperar;
    C1.DesEncolar;
    Caux.Encolar(X);
    if not(existe(X, C2)) then
      iguales := false;
  end;

  while not(Caux.EsVacia) do begin
    X := Caux.Recuperar;
    C1.Encolar(X);
    Caux.DesEncolar;
  end;
  result := iguales;
end;
end.
