unit miListArray;

interface

uses Tipos, stdctrls, SysUtils, Variants;

Const
  MIN = 1;
  MAX = 2000;
  NULO = 0;

Type
  PosicionLista = LongInt;

  Lista = Object
    Private
      Elementos: Array Of TipoElemento;
      Inicio, Final: PosicionLista;   // Bandera de inicio y fin de la lista
      Q_Items: Integer;               // Lleva la cantidad de elementos de la lista
      TDatoDeLaClave: TipoDatosClave; // Tipo de Dato de la Clave recibida en el crear lista vacia
      Size: LongInt;                  // Tamaño de la Lista
    Public
      Function Crear(TipoClave: TipoDatosClave; tamaño: LongInt): Resultado;
      Function EsVacia: Boolean;
      Function EsLlena: Boolean;
      Function Agregar(X:TipoElemento): Resultado;
      Function Insertar(X:TipoElemento; P:PosicionLista): Resultado;
      Function Eliminar(P:PosicionLista): Resultado;
      Function Buscar(X:TipoElemento):PosicionLista;
      Function Siguiente(P:PosicionLista): PosicionLista;
      Function Anterior(P:PosicionLista): PosicionLista;
      Function Ordinal(PLogica: Integer): PosicionLista;
      Function Recuperar(P:PosicionLista): TipoElemento;
      Function Actualizar(X:TipoElemento; P:PosicionLista): Resultado;
      Function ValidarPosicion(P:PosicionLista): Boolean;
      Function RetornarClaves: String;
      Function LlenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta: LongInt): Resultado;
      Function Comienzo: PosicionLista;
      Function Fin: PosicionLista;
      Function CantidadElementos: LongInt;
      Function DatoDeLaClave: TipoDatosClave;
      Function SizeList: LongInt;
      Function MaxSizeList: LongInt;
      Procedure Sort(Ascendente: Boolean);
      Procedure Intercambio (P,Q: PosicionLista);
  End;

implementation

function Lista.Crear(TipoClave: TipoDatosClave; tamaño: LongInt): Resultado;
Begin
  if (tamaño >= Min) and (tamaño <= Max) then Begin
    Inicio := NULO;
    Final := NULO;
    Q_Items := 0;
    TDatoDeLaClave := TipoClave;
    Size := tamaño;
    SetLength(Elementos, (tamaño+1));
    Crear := OK;
  end
  else
     Crear:= CError;
End;

function Lista.EsVacia: Boolean;
begin
  result := (Inicio = NULO);
end;

function Lista.EsLlena: Boolean;
begin
  result := (Final = Size);
end;

function Lista.Agregar(X:TipoElemento):Resultado;
begin
  Agregar := CError;

  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then Begin
    Agregar := ClaveIncompatible;
    Exit;
  End;

  if EsLlena then
    result := LLena
  else begin
    Final := Final + 1;
    Elementos[final] := X;
    inc(Q_items);
    if EsVacia then
      Inicio := Final;
    Agregar := OK;
  End;
End;

function Lista.Insertar(X: TipoElemento; P: Integer): Resultado;
var
  Q:PosicionLista;
begin
  Insertar := CError;

  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then Begin
    Insertar := ClaveIncompatible;
    Exit;
  End;

  if EsLlena then
    Insertar := LLena
  else begin
    if ValidarPosicion(P) then begin
      for Q := Final downTo P do
        Elementos[Q+1] := Elementos[Q];
      Elementos[P] := X;
      Inc(Final);
      Inc(Q_items);
      Insertar := OK;
    end
    else
      Insertar := PosicionInvalida;
  end;
end;

Function Lista.Ordinal(PLogica: Integer): PosicionLista;
Begin
  Ordinal := Nulo;
  if (PLogica > 0) And (PLogica <= Q_Items) then
    Ordinal := PLogica;
End;

function Lista.Eliminar(P: Integer): Resultado;
var
  Q:PosicionLista;
begin
  Eliminar := CError;
  If EsVacia Then
    Eliminar := Vacia

  else Begin
    If ValidarPosicion(P) Then Begin
      For Q := P To (Final - 1) Do
        Elementos[Q] := elementos[Q + 1];
      Dec(Final);
      Dec(Q_Items);
      If Final < Inicio Then
        Crear(TDatoDeLaClave, Size); //Si se elimina el unico elemento, se crea una vacia con el mismo tamaño
      Eliminar := OK;
    End
  else
    Eliminar := PosicionInvalida;
  End;
end;

Function Lista.Buscar(X:TipoElemento): PosicionLista;
Var Q: PosicionLista;
    Encontre: Boolean;
Begin
  Buscar := Nulo; //Nulo = False = 0

  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then
    Exit;

  Encontre:= False;
  Q := Inicio;
  While (Q <> Nulo) And (Q <= Final) And Not(Encontre) Do Begin
    If Elementos[Q].Clave = X.Clave Then
      Encontre := True
    Else
      Q := Siguiente(Q);
  End;

  If Encontre Then
    Buscar := Q;
End;

Function Lista.Siguiente(P:PosicionLista): PosicionLista;
Begin
  Siguiente := Nulo;
  If ValidarPosicion(P) and (P < Final) Then
    Siguiente := P + 1;
End;

Function Lista.Anterior(P:PosicionLista): PosicionLista;
Begin
  Anterior := Nulo;
  If ValidarPosicion(P) and (P > Inicio) Then
    Anterior := P - 1;
End;

Function Lista.Recuperar(P:PosicionLista): TipoElemento;
Var X: TipoElemento;
Begin
  If ValidarPosicion(P) Then
    Recuperar := Elementos[P]
  else
    Recuperar := X.TipoElementoVacio;
End;

Function Lista.Actualizar(X:TipoElemento; P:PosicionLista): Resultado;
Begin
  Actualizar := CError;

  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then Begin
    Actualizar := ClaveIncompatible;
    Exit;
  End;

  If ValidarPosicion(P) Then Begin
    Elementos[P] := X;
    Actualizar := OK;
  End;
End;

Function Lista.ValidarPosicion(P:PosicionLista): Boolean;
Begin
  ValidarPosicion := False;
  If Not EsVacia and (P >= Inicio) And (P <= Final) Then
    ValidarPosicion := True;
End;

Procedure Lista.Intercambio (P,Q: PosicionLista);
Var X1, X2: TipoElemento;
Begin
  X1 := Elementos[P];
  X2 := Elementos[Q];
  Elementos[P] := X2;
  Elementos[Q] := X1;
End;

Procedure Lista.Sort(Ascendente: Boolean); //Burbujeo
var P,Q: PosicionLista;
    X1,X2: TipoElemento;
begin
  P := Inicio;
  While (P <> Nulo) Do Begin
    Q := Inicio;
    while (Q <> Nulo) Do Begin
      X1 := Elementos[Q];
      If Siguiente(Q) <> Nulo Then Begin
        X2 := Elementos[Q+1];
        if Ascendente then begin
          if X1.Clave > X2.Clave Then
            Intercambio(Q, (Q+1))
        end
        else begin
          if X1.Clave < X2.Clave Then
            Intercambio(Q, (Q+1));
        end;
      end;
      Q := Siguiente(Q);
    end;
    P := Siguiente(P);
  end;
end;

Function Lista.RetornarClaves: String;
var Q: PosicionLista;
    X: TipoElemento;
    S,SFinal: String;
Begin
  SFinal:= '';
  Q := Inicio;
  While Q <> Nulo Do Begin
    X := Recuperar(Q);
    S := X.ArmarString;
    SFinal := SFinal + S + cCRLF;
    Q := Siguiente(Q);
  End;
  RetornarClaves := SFinal;
End;

function Lista.Comienzo: Integer;
begin
  result := Inicio;
end;

function Lista.Fin: Integer;
begin
  result := Final;
end;

function Lista.CantidadElementos: Integer;
begin
  result := Q_items;
end;

Function Lista.LlenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta: LongInt): Resultado;
Var
  X: TipoElemento;
Begin
  LlenarClavesRandom := CError;
  TDatoDeLaClave := Numero;

  If Crear(TDatoDeLaClave, alSize) = OK Then Begin //Si se crea exitosamente
    X.Inicializar(TDatoDeLaClave, '');
    Randomize;
    While Not EsLLena Do Begin
      X.Clave := RangoDesde + Random(RangoHasta);
      Agregar(X);
    End;
    LlenarClavesRandom := OK;
  end
  else begin
    LlenarClavesRandom := CError;
  end;
End;

Function Lista.DatoDeLaClave: TipoDatosClave;
Begin
  result := TDatoDeLaClave;
End;

Function Lista.SizeList(): LongInt;
Begin
  result := Size;
End;

Function Lista.MaxSizeList(): LongInt;
Begin
  result := MAX;
End;

end.
