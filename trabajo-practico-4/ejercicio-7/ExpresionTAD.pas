unit ExpresionTAD;

interface

uses
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

const
  aParentesis = ['(', ')'];
  aNumero = ['0'..'9'];
  aIncognita = ['A'..'Z', 'a'..'z'];
  aOperador = ['+', '-', '/', '*'];


type
  char = (Parentesis, Numero, Incognita, Operador);

  Expresion = object
  private
    expPila: Pila;
    valida: boolean;
  public
    procedure setExpPila(e: string); //Tiene un solo ciclo, complejidad O(n)
    function getValida():boolean;
  end;

implementation

function Expresion.getValida():boolean;
begin
  result := valida;
end;

procedure Expresion.setExpPila(e: string);
var
  I: byte;
  X, antX: TipoElemento;
  cantParentesis: shortint;
begin
  expPila.Crear(Cadena, length(e));
  valida := True;
  cantParentesis := 0;

  X.Clave := e[length(e)];

  if e[length(e)] in aParentesis then begin
    if e[length(e)] = ')' then
        Inc(cantParentesis)
      else
        Dec(cantParentesis);
    X.Valor1 := Parentesis;

  end else if e[length(e)] in aNumero then
    X.Valor1 := Numero

  else if e[length(e)] in aIncognita then
    X.Valor1 := Incognita

  else if e[length(e)] in aOperador then
    X.Valor1 := Operador;

  for I := length(e)-1 downto 1 do begin
    if cantParentesis < 0 then
      valida := False;

    expPila.apilar(X);

    X.Clave := e[I];

    if e[I] in aParentesis then begin
      if e[I] = ')' then
          Inc(cantParentesis)
        else
          Dec(cantParentesis);
      X.Valor1 := Parentesis;

    end else if e[I] in aNumero then
      X.Valor1 := Numero

    else if e[I] in aIncognita then
      X.Valor1 := Incognita

    else if e[I] in aOperador then
      X.Valor1 := Operador;

    antX := expPila.Recuperar();
    if antX.Valor1 = Parentesis then begin
      if (expPila.Recuperar.Clave = ')') and not((X.Valor1 = Numero) or (X.Valor1 = Incognita))
      or (expPila.Recuperar.Clave = '(') and not(X.Valor1 = Operador) then
        valida := False;

    end else if (antX.Valor1 = Numero) and not((X.Valor1 = Numero) or (X.Valor1 = Operador) or ((X.Valor1 = Parentesis) and (X.Clave = '('))) then
      valida := False

    else if (antX.Valor1 = Incognita) and not((X.Valor1 = Operador) or ((X.Valor1 = Parentesis) and (X.Clave = '('))) then
      valida := False

    else if (antX.Valor1 = Operador) and not((X.Valor1 = Numero) or (X.Valor1 = Incognita)) then
      valida := False;

  end;

  expPila.apilar(X);

  if cantParentesis <> 0 then
    valida := false;

end;

end.
