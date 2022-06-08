Unit BTree;

Interface

Uses
Tipos, SysUtils;

Const
  Orden = 5;                // Orden del Arbol B
  MinClaves = Orden div 2;  // cantidad minima de claves x pagina
  MaxClaves = Orden - 1;    // cantidad maxima de claves x pagina
  Nulo = Nil;               // Posicion NO valida de una pagina
  MAX = 2000;              // Cantidad Maxima de claves a almacenar
  MIN = 1;

Type
  PosicionArbolB = ^Pagina;

  Indice = 0..MaxClaves;

  Pagina = Object
    Cantidad : Indice;
    Claves : Array[1..MaxClaves] of TipoElemento;
    Ramas : Array[Indice] of PosicionArbolB;
  End;

  ArbolB = Object
    Private
      Raiz: PosicionArbolB;
      Q_Claves : LongInt;
      Q_Paginas: LongInt;
      TDatoDeLaClave: TipoDatosClave;
      Size: LongInt;
    Public
      Function Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Resultado;
      Function EsVacio(): Boolean;
      Function EsLLeno(): Boolean;
      Function RamaNula(P: PosicionArbolB): Boolean;
      Function Insertar(X:TipoElemento): Resultado;
      Function Eliminar(X:TipoElemento): Resultado;
      Function BuscarClave(X:TipoElemento; Var k: indice): PosicionArbolB;
      Function Recuperar(P: PosicionArbolB; k:Indice): TipoElemento;
      Function LLenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta: LongInt): Resultado;
      Function InOrden(): String;
      Function Root(): PosicionArbolB;
      Function CantidadPaginas(): LongInt;
      Function CantidadClaves(): LongInt;
      Function Altura (): LongInt;
      Function CantidadClavesPagina(P: PosicionArbolB): Integer;
      Function HijoDeLaRama(P: PosicionArbolB; K:indice): PosicionArbolB;
      Function DatoDeLaClave: TipoDatosClave;
      Function SizeTree(): LongInt;
      Function MaxSizeTree(): LongInt;
    End;

Var
  Inserte: Boolean; // Indica si efectivamente creamos claves
  Elimine: Boolean; // Indica si efectivamente eliminamos claves
  NewPage: Integer; // Usada para Contar las paginas nuevas creadas
  OldPage: Integer; // Usada para Contar cuantas paginas se eliminaron


Implementation

// Crea el arbol vacio
Function ArbolB.Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Resultado;
Begin
  if alSize < Min then Crear:= CError;
  if alSize > Max then Crear:= CError;
  if (alSize >= Min) And (alSize <= Max) then Begin
    Raiz := Nulo;
    Q_Claves := 0;
    Q_Paginas:= 0;
    TDatoDeLaClave := avTipoClave;
    Size := alSize;
    Crear := OK;
  End;
End;

// Control de arbol vacio
Function ArbolB.EsVacio(): Boolean;
Begin
  EsVacio := (Raiz = Nulo);
End;

// Control de arbol lleno
Function ArbolB.EsLLeno(): Boolean;
Begin
  EsLLeno := (Q_Claves = Size);
End;

// Control de rama nula
Function ArbolB.RamaNula(P: PosicionArbolB): Boolean;
Begin
  RamaNula := (P = Nulo);
End;

{------------------------------------------------------------------------
recibe: x = clave nueva; P = posicion de la pagina
retorna: encontre = true si lo encontro; k = posicion del indice de la clave dentro
de la pagina
--------------------------------------------------------------------------}
Procedure BuscarNodo(x: TipoElemento; P:PosicionArbolB; Var Encontre: Boolean; Var K:Indice);
Begin
  If X.Clave < P^.claves[1].Clave Then begin
    Encontre := False;
    k := 0;
  End
  Else Begin
    k := P^.Cantidad;
    While (X.Clave < P^.claves[k].Clave) And (K > 1) Do
      k := K - 1;
    Encontre := (X.Clave = P^.claves[k].Clave);
  End;
End;

{------------------------------------------------------------------------
recibe: x = clave nueva; B = raiz del arbol B
retorna: encontre = true si lo encontro; P = posicion de la pagina encotrada;
k = posicion del indice de la clave dentro de la pagina
--------------------------------------------------------------------------}
Function ArbolB.BuscarClave(X:TipoElemento; Var k: indice): PosicionArbolB;
Var Encontre: Boolean;
// Proceso interno que busca la clave
  Procedure Buscar(Q: PosicionArbolB; Var Encontre: Boolean);
  Begin
    If RamaNula(Q) Then Encontre := False
    Else begin
      BuscarNodo(X, Q, Encontre, k);
      If Encontre Then BuscarClave := Q
      Else Buscar(Q^.Ramas[k], Encontre);
    End;
  End;
// Cuerpo de la Funcion principal
Begin
  Encontre := False;
  BuscarClave := Nulo;
  K := 0;
  Buscar(Raiz, Encontre);
End;

{------------------------------------------------------------------------
recibe: x = clave nueva; pd = posicion del rama derecha; p = posicion de la pagina;
k = indice de la clave
--------------------------------------------------------------------------}
Procedure MeterHoja(x: TipoElemento; pd, p: PosicionArbolB; k: indice);
Var i: integer;
Begin
  // Se realiza el corrimiento a la derecha para generar el Hueco
  // donde poner la clave
  For i:= P^.cantidad Downto (K + 1) Do Begin
    P^.claves[i + 1] := P^.claves[i];
    P^.ramas[i + 1] := P^.ramas[i];
  End;
  // Se pone la clave nueva en la posicion K+1 y se apunta a la pagina derecha
  P^.claves[k + 1] := x;
  P^.ramas [k + 1] := pd;
  P^.cantidad := P^.cantidad + 1;
  Inserte := True;
End;

{------------------------------------------------------------------------
recibe: x = clave nueva; pd = posicion del rama derecha; p = posicion de la pagina
k = indice de la clave
retorna: cm = clave de la mediana a subir; pcm = posicion de la rama derecha de la
clave mediana
--------------------------------------------------------------------------}
Procedure DividirNodo(X:TipoElemento; pd,P: PosicionArbolB; k:indice; Var cm:TipoElemento; Var pcm: PosicionArbolB);
Var i, pm: indice;
Begin
  {Se saca si la clave va a la izq o a la derecha}
  If k <= MinClaves Then pm := MinClaves
  Else pm := MinClaves + 1;
  {se crea el nuevo nodo y se pasan las claves de mas a la derecha}
  New(pcm);
  For i:= pm + 1 To MaxClaves do Begin
    pcm^.claves[i - pm] := P^.claves[i];
    pcm^.Ramas [i - pm] := P^.ramas[i];
  End;
  {Se saca la cantidad de claves que quedan en cada nodo}
  pcm^.cantidad := MaxClaves - pm;
  P^.cantidad := pm;
  {Se inserta la clave y su rama derecha}
  If k <= MinClaves Then MeterHoja(x, pd, P, k)
  Else MeterHoja(x, pd, pcm, k - pm);
  {Se actualizan los valores}
  cm := P^.claves[P^.cantidad];
  pcm^.Ramas[0] := P^.ramas[P^.cantidad];
  P^.cantidad := P^.cantidad - 1;
  // Marco que genere una pagina nueva
  NewPage := NewPage + 1;
End;

{------------------------------------------------------------------------
recibe: x = clave nueva; p = posicion de la pagina
retorna: empujaarriba = true o false segun corresponda; cm = clave mediana;
pd = puntero rama derecha
Profesor: Carlos Rodriguez
Lic. en Sistemas de Información
Programación 2
--------------------------------------------------------------------------}
Procedure Empujar(X:TipoElemento; P:PosicionArbolB; Var empujaarriba: Boolean; Var cm: TipoElemento; Var pd: PosicionArbolB);
Var k: indice;
    esta: boolean;
Begin
  {llegue a una rama vacia}
  If P = Nulo Then begin
    empujaarriba := True;
    cm := X;
    pd := Nulo;
  End
  Else Begin
    BuscarNodo(X, P, Esta, k);
    {Clave repetida}
    If Esta Then Begin
      Exit;
    End;
    {llamo recursivamante con la rama K que retorna el buscarnodo}
    Empujar(X, P^.ramas[k], empujaarriba, cm, pd);
    {si hay que empujar hacia arriba}
    If empujaarriba Then
      {si el nodo no esta lleno solo pongo la hoja y salgo}
      If P^.cantidad < MaxClaves Then Begin
        empujaarriba := False;
        MeterHoja(cm, pd, P, k);
      End
      { si el nodo esta lleno tengo que dividirlo}
    Else Begin
      empujaarriba := True;
      DividirNodo(cm, pd, P, k, cm, pd);
    End;
  End;
End;

{------------------------------------------------------------------------
recibe: x = clave nueva; B = Arbol B
--------------------------------------------------------------------------}
Function ArbolB.Insertar(X:TipoElemento): Resultado;
  // Proceso interno que hace la insercion
  Procedure Inserta(Var P: PosicionArbolB);
  Var empujaarriba: Boolean;
      x1: TipoElemento;
      pd, Q: PosicionArbolB;
  Begin
    { llamo a empujar arriba}
    Empujar(X, P, empujaarriba, x1, pd);
    { si se empujo entonces creo una nueva raiz}
    If empujaarriba Then begin
      New(Q);
      Q^.cantidad := 1;
      Q^.claves[1]:= x1; {pongo la clave mediana}
      Q^.ramas [0]:= P; {apunto a la raiz actual}
      Q^.Ramas [1]:= pd; {apunto al nuevo nodo que resulto de la division}
      P := Q; {retorno la nueva raiz}
      Inserte := True;
      NewPage := NewPage + 1;
    End;
  End;
// Cuerpo de la Funcion
Begin
  if X.TipoDatoClave (X.Clave) <> TDatoDeLaClave  then Begin
    Insertar := ClaveIncompatible;
    Exit;
  End;
  // Ahora intenta insertalo
  Insertar := CError;
  NewPage := 0;
  Inserte := False;
  If EsLLeno() Then Insertar := Llena
  Else Begin
    Inserta(raiz);
    If Inserte Then Begin
      Inc(Q_Claves);
      Q_Paginas := Q_Paginas + NewPage;
    End;
    Insertar := OK;
  End;
End;

{------------------------------------------------------------------------
recibe: P = posicion de pagina; k = indice
--------------------------------------------------------------------------}
Procedure MoverDerecha(P: PosicionArbolB; k: indice);
Var J: indice;
Begin
  {Genera un hueco mandando claves a la derecha}
  For J:= P^.ramas[k]^.cantidad Downto 1 Do Begin
    P^.ramas[k]^.claves[J + 1] := P^.ramas[k]^.claves[J];
    P^.ramas[k]^.ramas [J + 1] := P^.ramas[k]^.ramas[J];
  End;
  {inserta la clave K del nodo padre}
  P^.ramas[k]^.cantidad := P^.ramas[k]^.cantidad + 1;
  P^.ramas[k]^.ramas[1] := P^.ramas[k]^.ramas[0];
  P^.ramas[k]^.claves[1] := P^.claves[k];
  {Asciende la clave mayor del hermano izquierdo padre P}
  P^.claves[k] := P^.Ramas[k - 1]^.claves[P^.Ramas[k - 1]^.cantidad];
  P^.ramas [k]^.ramas[0] := P^.Ramas[k - 1]^.ramas[P^.Ramas[k - 1]^.cantidad];
  P^.Ramas[k - 1]^.cantidad := P^.Ramas[k - 1]^.cantidad - 1;
End;

{------------------------------------------------------------------------
recibe: P = posicion de pagina; k = indice
--------------------------------------------------------------------------}
Procedure MoverIzquierda(P: PosicionArbolB; k: indice);
Var J: indice;
Begin
  {Desciende la clave k(1) del nodo padre (P) al hijo izquierdo y la
  inserta en la posicion mas alta, asi se reestablece el minimo de claves}
  P^.Ramas[k - 1]^.cantidad := P^.Ramas[k - 1]^.cantidad + 1;
  P^.Ramas[k - 1]^.claves[P^.Ramas[k - 1]^.cantidad] := P^.claves[k];
  P^.Ramas[k - 1]^.ramas[P^.Ramas[k - 1]^.cantidad] := P^.ramas[k]^.ramas[0];
  {Sube la clave 1 del hermano derecho}
  P^.claves[k] := P^.ramas[k]^.claves[1];
  P^.ramas[k]^.ramas[0] := P^.ramas[k]^.ramas[1];
  P^.ramas[k]^.cantidad := P^.ramas[k]^.cantidad - 1;
  {se corren las claves y las ramas un lugar a la izquierda}
  For J:= 1 To P^.ramas[k]^.cantidad Do Begin
    P^.ramas[k]^.claves[J] := P^.ramas[k]^.claves[J + 1];
    P^.ramas[k]^.ramas[J] := P^.ramas[k]^.ramas[J + 1];
  End ;
End;

{------------------------------------------------------------------------
recibe: P = posicion de pagina; k = indice
--------------------------------------------------------------------------}
Procedure Combina(P: PosicionArbolB; k: indice);
Var J: indice;
    Q: PosicionArbolB;
Begin
  {Posicion a borrar}
  Q := P^.ramas[K];
  { Baja la clave mediana del nodo padre}
  P^.ramas[k - 1]^.cantidad := P^.ramas[k - 1]^.cantidad + 1;
  P^.ramas[k - 1]^.claves[P^.ramas[k - 1]^.cantidad] := P^.claves[k];
  P^.ramas[k - 1]^.ramas[P^.ramas[k - 1]^.cantidad] := Q^.ramas[0];
  { se pasan al final del nodo izquierdo el resto de las claves del nodo derecho a eliminar}
  For J:= 1 To Q^.cantidad Do Begin
    P^.ramas[k - 1]^.cantidad := P^.ramas[k - 1]^.cantidad + 1;
    P^.ramas[k - 1]^.claves[P^.ramas[k - 1]^.cantidad] := Q^.claves[j];
    P^.ramas[k - 1]^.ramas [P^.ramas[k - 1]^.cantidad] := Q^.ramas[j];
  End;
  { Se reconstruyen las claves y ramas del nodo padre ya que una clave descendio}
  For J:= K To P^.Cantidad - 1 Do Begin
    P^.claves[J] := P^.claves[j + 1];
    P^.ramas[J] := P^.ramas[j + 1];
  End;
  P^.cantidad := P^.cantidad - 1;
  { Libero el Nodo Q}
  Dispose(Q);
  // Marco que tengo una pagina menos
  OldPage := OldPage + 1;
End;

{------------------------------------------------------------------------
recibe: P = posicion de pagina; k = indice
--------------------------------------------------------------------------}
Procedure Restablecer(P: PosicionArbolB; k: indice);
Begin
  {Si K > 0 tiene hermano izquierdo}
  If k > 0 Then
    { hay mas claves que el minimo, muevo a la derecha}
    if P^.ramas[k - 1]^.cantidad > MinClaves Then MoverDerecha(P, k)
    Else Combina(P, k) {debo combinar 2 nodos en uno}
  Else {Solo tengo hermano derecho}
    If P^.ramas[1]^.cantidad > MinClaves Then MoverIzquierda(P, 1)
    Else Combina(P, 1);
End;

{------------------------------------------------------------------------
recibe: P = posicion de pagina; k = indice
--------------------------------------------------------------------------}
Procedure Quitar(P: PosicionArbolB; k: indice);
Var J: indice;
Begin
  // realiza los corrimientos de claves a la izquierza
  // aplastando la posicion "k"
  For J:= k + 1 To P^.cantidad Do Begin
    P^.claves[j - 1] := P^.claves[j];
    P^.ramas [j - 1] := P^.ramas[j];
  End;
  P^.cantidad := P^.cantidad - 1;
  Elimine := True;
End;

{------------------------------------------------------------------------
recibe: P = posicion de pagina; k = indice
--------------------------------------------------------------------------}
Procedure Sucesor(P: PosicionArbolB; k: indice);
Var Q: PosicionArbolB;
Begin
  Q := P^.ramas[k];
  { va a la hoja mas a la izquierda}
  While Q^.ramas[0] <> Nulo Do
    Q := Q^.ramas[0];
  { reemplaza la clave K por la 1 del mas a la izquierda}
  P^.claves[k] := Q^.claves[1];
End;

{------------------------------------------------------------------------
recibe: x = Clave a buscar; P = posicion del arbol (raiz)
retorna: encontre = true o false segun corresponda
--------------------------------------------------------------------------}
Procedure EliminarRegistro(X:TipoElemento; P: PosicionArbolB; Var encontre: Boolean);
var k: indice;
Begin
  If P = Nulo Then encontre := False {la clave no esta en el Arbol B}
  Else Begin
    BuscarNodo(X, P, encontre, k);
    If encontre Then
      If P^.ramas[k - 1] = Nulo Then
        Quitar(P, k) {es un nodo hoja solo se quita la clave}
      Else Begin
        // No es nodo hoja, se necesita la clave sucesora y se la busca
        // de la pagina a la derecha, luego la mas a la izquierda
        Sucesor(P, k);
        EliminarRegistro(P^.claves[k], P^.ramas[k], encontre);
        If not encontre Then Begin
          Exit;
        End;
    End
    Else
      EliminarRegistro(X, P^.ramas[k], encontre);
      // Controla si debe o no reestablecer
      If P^.ramas[k] <> Nulo Then
        If P^.ramas[k]^.Cantidad < MinClaves Then
          Restablecer(P, k);
  End;
End;

{------------------------------------------------------------------------
recibe: x = Clave a buscar; B = Arbol B; Campo Donde esta la clave
--------------------------------------------------------------------------}
Function ArbolB.Eliminar(X:TipoElemento): Resultado;
// Proceso interno que elimina
  Procedure Elimina(Var P: PosicionArbolB);
  Var encontre: Boolean;
      Q: PosicionArbolB;
  Begin
    EliminarRegistro(X, P, encontre);
    If not encontre Then
    Else
      If P^.cantidad = 0 Then begin
        Q := P;
        P := P^.ramas[0];
        Dispose(Q);
        Elimine := True;
        OldPage := OldPage + 1;
      End;
  End;
// Cuerpo de la Funcion principal
Begin
  Eliminar := CError;
  Elimine := False;
  OldPage := 0;
  If EsVacio() Then Eliminar := Vacia
  Else Begin
    Elimina(Raiz);
    If Elimine Then Begin
      Dec(Q_Claves);
      Q_Paginas := Q_Paginas - OldPage;
    End;
    Eliminar := OK;
  End;
End;

{------------------------------------------------------------------------
Recibe: B = arbol B, P = Apuntador de la Pagina,
k Subindice donde esta la clave dentro de la pagina
--------------------------------------------------------------------------}
Function ArbolB.Recuperar(P: PosicionArbolB; k:Indice):TipoElemento;
Var X: TipoElemento;
Begin
  Recuperar := X.TipoElementoVacio;
  If Not EsVacio() Then Begin
    If Not RamaNula(P) Then Begin
      Recuperar := P^.claves[k];
    End;
  End;
End;

{------------------------------------------------------------------------
Recibe: B = Arbol B
Retorno todos los items del Arbol en un solo String
--------------------------------------------------------------------------}
Function ArbolB.InOrden(): String;
Var S, SS: String;
// Proceso Interno que recorre el arbol
  Procedure IOB(P: PosicionArbolB);
  Var I: Integer;
  Begin
    If Not RamaNula(P) Then Begin
      IOB(P^.Ramas[0]);
      For I := 1 To P^.cantidad Do Begin
        S := P^.claves[I].ArmarString;
        SS := SS + S + cCRLF;
        IOB(P^.Ramas[I]);
      End;
    End;
  End;
// Cuerpo de la Funcion
Begin
  SS := '';
  IOB(Raiz);
  InOrden := SS;
End;

// Carga el Arbol con valores random
Function ArbolB.LLenarClavesRandom(alSize: LongInt; RangoDesde, RangoHasta: LongInt): Resultado;
Var X: TipoElemento;
I: LongInt;
Begin
  TDatoDeLaClave := Numero;
  // Creo el arbol y controlo
  If Crear(TDatoDeLaClave, alSize) <> OK Then Begin
    LLenarClavesRandom := CError;
    Exit;
  End;
  // Ahora lo lleno Random
  X.Inicializar(TDatoDeLaClave, '');
  Randomize;
  I := 0;
  While Not EsLLeno() Do Begin
    X.Clave := RangoDesde + Random(RangoHasta);
    Insertar(X);
  End;
  LLenarClavesRandom := OK;
End;

// retorna como propiedad la raiz del arbol
Function ArbolB.Root(): PosicionArbolB;
Begin
  Root := raiz;
End;

// Retorna como propiedad la cantidad de paginas del arbol B
Function ArbolB.CantidadPaginas(): LongInt;
Begin
  CantidadPaginas := Q_Paginas;
End;

// Retorna como propiedad la cantidad de claves del arbol B
Function ArbolB.CantidadClaves(): LongInt;
Begin
  CantidadClaves := Q_Claves;
End;

// Retorna la Altura del Arbol “B”
Function ArbolB.Altura(): LongInt;
Var H: LongInt;
  // Proceso Interno que saca la altura
  Procedure Alt(P: PosicionArbolB; C: Integer);
  Begin
    If Not RamaNula(P) Then Begin
      P := P^.Ramas[0];
      Alt(P, C+1);
    End
    Else Begin
      If C > H Then H := C;
    End;
  End;
// Cuerpo de la Funcion
Begin
  H := 0;
  Alt(Raiz, 0);
  Altura := H;
End;

Function ArbolB.CantidadClavesPagina(P: PosicionArbolB): Integer;
Begin
  CantidadClavesPagina := 0;
  if not Ramanula(P) then Begin
    CantidadClavesPagina := P^.Cantidad;
  End;
End;

Function ArbolB.HijoDeLaRama(P: PosicionArbolB; K:indice): PosicionArbolB;
Begin
  HijoDeLaRama := Nulo;
  if not ramanula(P) then begin
    HijoDeLaRama := P^.Ramas[K];
  end;
End;

Function ArbolB.DatoDeLaClave: TipoDatosClave;
Begin
  DatoDeLaClave := TDatoDeLaClave;
End;

Function ArbolB.SizeTree(): LongInt;
Begin
  SizeTree := Size;
End;

Function ArbolB.MaxSizeTree(): LongInt;
Begin
  MaxSizeTree := MAX;
End;

End.
