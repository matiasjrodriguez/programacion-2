unit QueuesArray;

interface

Uses
  Tipos, stdctrls, SysUtils;

Const
  MIN = 1;  // Frente de la Cola
  MAX = 2001; // Final de la cola
  Nulo= 0;  // Posicion NO valida del Frente y Final de la Cola

Type
  PosicionCola = Integer;

  Cola = Object
    Private
      Elementos: Array Of TipoElemento;
      Inicio, Fin: PosicionCola;
      Q_Items: Integer;
      TDatoDeLaClave: TipoDatosClave;
      Size: LongInt;
      Function CantidadItems(): LongInt;
      Function Paso(P: PosicionCola): PosicionCola;
    Public
      Function Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Resultado;
      Function EsVacia(): Boolean;
      Function EsLlena(): Boolean;
      Function Encolar(X:TipoElemento): Resultado;
      Function DesEncolar(): Resultado;
      Function Recuperar(): TipoElemento;
      Function RetornarClaves(): String;
      Function LLenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta:LongInt): Resultado;
      Function Frente(): PosicionCola;
      Function Final(): PosicionCola;
      Function DatoDeLaClave: TipoDatosClave;
      Function InterCambiar(Var CAux: Cola; bCrearVacia: Boolean): LongInt;
      Function SizeQueue(): LongInt;
      Function MaxSizeQueue(): LongInt;
  End;


implementation

// crea la cola vacia
Function Cola.Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Resultado;
Begin
  if alSize < Min then Crear:= CError;
  if alSize > Max then Crear:= CError;
  if (alSize >= Min) And (alSize <= Max) then Begin
    SetLength(Elementos, (alSize + 1));
    Inicio := MIN;
    Fin := alSize;
    Q_Items := 0;
    TDatoDeLaClave := avTipoClave;
    Size := alSize;
    Crear := OK;
  End;
End;

// Adelante las posiciones frente y final de la cola circular
Function Cola.Paso(P: PosicionCola): PosicionCola;
Begin
  Paso := (P MOD Size) + 1;
End;

// control de cola vacia
Function Cola.EsVacia(): Boolean;
Begin
  EsVacia := (Paso(Fin) = Inicio);
End;

// control de cola llena
Function Cola.EsLLena(): Boolean;
Begin
  EsLLena := (Paso(Paso(Fin)) = Inicio);
End;

// Agrega un elemento a la Cola
Function Cola.Encolar(X:TipoElemento): Resultado;
Begin
  Encolar := CError;
  // Controla que el Tipo de Dato de la Clave sea Homogeneo a la Lista
  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then Begin
    Encolar := ClaveIncompatible;
    Exit;
  End;
  // Ahora Encolo
  If EsLlena() Then Encolar := Llena
  Else Begin
    Fin := Paso(Fin);
    Elementos[Fin] := X;
    Inc(Q_Items);
    Encolar := OK;
  End;
End;

// Elimina un elemento de la Cola. Siempre del Frente
Function Cola.DesEncolar(): Resultado;
Begin
  DesEncolar := CError;
  If EsVacia() Then DesEncolar := Vacia
  Else Begin
    Inicio := Paso(Inicio);
    Dec(Q_Items);
    DesEncolar := OK;
  End;
End;

// retorna el elemento del frente de la cola
Function Cola.Recuperar(): TipoElemento;
Var X: TipoElemento;
Begin
  Recuperar := X.TipoElementoVacio;
  Recuperar.Valor2 := NIL;
  If Not EsVacia() Then
  Begin
    Recuperar := Elementos[Inicio];
  End;
End;

// Pasa los elementos de una Cola Auxiliar a la Cola "Cola"
Function Cola.InterCambiar(Var CAux: Cola; bCrearVacia: Boolean): LongInt;
Var X: TipoElemento;
    I: LongInt;
Begin
  I := 0;
  If bCrearVacia = true Then Crear(TDatoDeLaClave, CAux.SizeQueue);
  While Not CAux.EsVacia() Do Begin
    X := CAux.Recuperar();
    If Encolar(X) = OK Then Inc(I);
    CAux.DesEncolar;
  End;
  InterCambiar := I;
End;

// Retorna un string con todos los elementos de Cola
// Cada Item separado por Retorno de Carro + Final de Linea
Function Cola.RetornarClaves():String;
Var X: TipoElemento;
    S, SS: String;
    CAux: Cola;
Begin
  SS:= '';
  CAux.Crear(TDatoDeLaClave, Size);
  While Not EsVacia() Do Begin
    X := Recuperar();
    CAux.Encolar(X);
    S := X.ArmarString;
    SS := SS + S + cCRLF;
    DesEncolar();
  End;
  InterCambiar(Caux, True);
  RetornarClaves := SS;
End;

// Llena la cola con valores aletarios en el atributo DI
// desde <RangoDesde> hasta <RangoHasta>
Function Cola.LLenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta:LongInt): Resultado;
Var X: TipoElemento;
Begin
  TDatoDeLaClave := Numero;
  // Creo la cola vacia
  If Crear(TDatoDeLaClave, alSize) <> OK Then Begin
    LLenarClavesRandom := CError;
    Exit;
  End;
  // Ahora la lleno random
  X.Inicializar(TDatoDeLaClave, '');
  Randomize;
  While Not EsLlena Do Begin
    X.Clave := RangoDesde + Random(RangoHasta);
    Encolar(X);
  End;
  LLenarClavesRandom := OK;
End;

// retorno posicion del frente
Function Cola.Frente(): PosicionCola;
Begin
  Frente := Inicio;
End;

// retorno posicion del final
Function Cola.Final(): PosicionCola;
Begin
  Final := Fin;
End;

// Retorno la cantidad de elementos
Function Cola.CantidadItems(): LongInt;
Begin
  CantidadItems := Q_Items;
End;

Function Cola.DatoDeLaClave: TipoDatosClave;
Begin
  DatoDeLaClave := TDatoDeLaClave;
End;

Function Cola.SizeQueue(): LongInt;
Begin
  SizeQueue := Size;
End;

Function Cola.MaxSizeQueue(): LongInt;
Begin
  MaxSizeQueue := MAX;
End;

end.



