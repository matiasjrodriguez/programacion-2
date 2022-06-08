unit TADABM;

interface

uses
  ArbolesBinariosBusqueda, Tipos, Sysutils, Variants, ListPointer;

type
  RegistroPersona = record
    CUIT: LongInt;
    RazonSocial: string[50];
    Domicilio: string[50];
    Telefono: string[50];
    Celular: string[50];
    ACTIVO: boolean;
  end;

  APersona = File of RegistroPersona;

  TADRegistro = object
    private
      Indice: ArbolBB;
      Archivo: APersona;
      Posicion: Longint;
      //Ejercicio 8
      IndiceCelular: ArbolBB;
      PosicionCelulares: integer;
      ArchivoCelulares: APersona;

      IndiceRS: ArbolBB;
      PosicionRS: integer;

      //Una funcion que encontre en internet porque delphi no tiene un variant to integer
      function VarToInt(AVariant: Variant): integer;
    public
      procedure Inicializar(ruta: string);
      function EstaRegistrado(C: LongInt):boolean;
      function EstaActivo(C: LongInt): boolean;
      function Buscar(C: LongInt): RegistroPersona;
      procedure Alta(RP: RegistroPersona);
      procedure Baja(C: LongInt);
      procedure Modificacion(RP: RegistroPersona);
      function RetornarArchivo:string;
      function ArmarArbol: ArbolBB;
      //Ejercicio 8
      procedure ArmarArbolCelulares();
      function BuscarPorCelular(Cel: string): RegistroPersona;
      procedure GenerarArchivoCelulares(ruta:string);
      function MostrarArchivoCelulares: string;
      procedure ArmarArbolRS();
      function BuscarPorRS(RS: string): RegistroPersona;
      function BuscarRSAprox(RS: string): Lista;
  end;

implementation

{ TADRegistro }

procedure TADRegistro.Inicializar(ruta: string);
begin
  AssignFile(Archivo,ruta);
  Posicion := 0;
  PosicionCelulares := 0;
  PosicionRS := 0;
  Indice.Crear(Numero,500);
  IndiceCelular.Crear(Cadena,500);
  IndiceRS.Crear(Cadena,500);
  if not FileExists(ruta) then
    Rewrite(Archivo)
  else begin
    ArmarArbol();
    ArmarArbolCelulares();
    ArmarArbolRS();
  end;
end;

function TADRegistro.ArmarArbol: ArbolBB;
var
  X:TipoElemento;
  R: RegistroPersona;
begin
  reset(Archivo);
  while not EOF(Archivo) do begin
    Read(Archivo,R);
    X.Clave := R.CUIT;
    X.Valor1 := Posicion;
    Indice.Insertar(X);
    inc(Posicion);
  end;
  CloseFile(Archivo);
end;

function TADRegistro.EstaActivo(C: LongInt): boolean;
var
  R:RegistroPersona;
  X: TipoElemento;
  PosRegistro:integer;
  PosArbol: PosicionArbol;
  Esta: boolean;
begin
  if EstaRegistrado(C) then begin
    Reset(Archivo);
    X.Clave := C;
    PosArbol := Indice.BusquedaBinaria(X);
    PosRegistro := VarToInt(Indice.Recuperar(PosArbol).Valor1);
    Seek(Archivo,PosRegistro);
    Read(Archivo,R);
    Closefile(Archivo);
    Esta := R.ACTIVO;
  end
  else
    Esta := False;
  result := Esta;
end;

function TADRegistro.EstaRegistrado(C: LongInt): boolean;
var
  X:TipoElemento;
begin
  X.Clave := C;
  result := (Indice.BusquedaBinaria(X) <> NULO);
end;

procedure TADRegistro.Alta(RP: RegistroPersona);
var
  X,X2,X3: TipoElemento;
  PosRegistro:integer;
  PosArbol: PosicionArbol;
  RAux: RegistroPersona;
begin
  Reset(Archivo);
  X.Clave := RP.CUIT;
  if not EstaRegistrado(RP.CUIT) then begin
    X.Valor1 := Posicion;
    RP.ACTIVO := True;
    Indice.Insertar(X);
    Seek(Archivo,Posicion);
    Write(Archivo,RP);
    inc(Posicion);
    //Para el arbol de celulares
    X2.Clave := RP.Celular;
    X2.Valor1 := PosicionCelulares;
    IndiceCelular.Insertar(X2);
    inc(PosicionCelulares);
    //Para el arbol de razon social
    X3.Clave := RP.RazonSocial;
    X3.Valor1 := PosicionRS;
    IndiceRS.Insertar(X3);
    inc(PosicionRS);
  end
  else begin
    PosArbol := Indice.BusquedaBinaria(X);
    PosRegistro := VarToInt(Indice.Recuperar(PosArbol).Valor1);
    Seek(Archivo,PosRegistro);
    Read(Archivo,RAux);
    RAux.ACTIVO := True;
    Seek(Archivo,PosRegistro);
    Write(Archivo,RAux);
  end;
  CloseFile(Archivo);
end;

procedure TADRegistro.Baja(C: LongInt);
var
  R: RegistroPersona;
  X: TipoElemento;
  PosRegistro: integer;
  PosArbol: PosicionArbol;
begin
  Reset(Archivo);
  X.Clave := C;
  PosArbol := Indice.BusquedaBinaria(X);
  PosRegistro := VartoInt(Indice.Recuperar(PosArbol).Valor1);
  Seek(Archivo,PosRegistro);
  Read(Archivo,R);
  R.ACTIVO := False;
  Seek(Archivo,PosRegistro);
  Write(Archivo,R);
  Closefile(Archivo);
end;

procedure TADRegistro.Modificacion(RP: RegistroPersona);
var
  PosArbol: PosicionArbol;
  X: TipoElemento;
  PosRegistro: integer;
  RPAux: RegistroPersona;
begin
  Reset(Archivo);
  X.Clave := RP.CUIT;
  PosArbol := Indice.BusquedaBinaria(X);
  PosRegistro := VarToInt(Indice.Recuperar(PosArbol).Valor1);
  seek(Archivo,PosRegistro);
  Read(Archivo,RPAux);
  RP.ACTIVO := RPAux.ACTIVO;
  RP.CUIT := RPAux.CUIT;
  seek(Archivo,PosRegistro);
  Write(Archivo,RP);
  Closefile(Archivo);
end;

function TADRegistro.Buscar(C: LongInt): RegistroPersona;
var
  R:RegistroPersona;
  X: TipoElemento;
  PosRegistro:integer;
  PosArbol: PosicionArbol;
begin
  Reset(Archivo);
  X.Clave := C;
  PosArbol := Indice.BusquedaBinaria(X);
  if PosArbol <> NULO then begin
    PosRegistro := VarToInt(Indice.Recuperar(PosArbol).Valor1);
    Seek(Archivo,PosRegistro);
    Read(Archivo,R);
  end
  else
    R.CUIT := -1;
  Closefile(Archivo);
  result := R;
end;

function TADRegistro.RetornarArchivo: string;
var
  R: RegistroPersona;
  s: string;
  X:TipoElemento;

  procedure Recorrido(Q: PosicionArbol); // InOrder para que aparezca ordenado
  begin
    if not Indice.RamaNula(Q) then begin
      Recorrido(Indice.HijoIzquierdo(Q));
      X := Indice.Recuperar(Q);
      R := Buscar(X.Clave);
      s := s + '[' + R.CUIT.ToString + ']: ' + R.RazonSocial + '; ' + R.Domicilio + '; ' + R.Telefono + '; ' + R.Celular + '; ';
      if R.ACTIVO then
        s := s + 'ACTIVO' + cCRLF
      else
        s := s + 'NO ACTIVO' + cCRLF;
      Recorrido(Indice.HijoDerecho(Q));
    end;
  end;

begin
  s := '';
  Recorrido(Indice.Root);
  result := s;
end;

function TADRegistro.VarToInt(AVariant: Variant):integer;
begin
  Result := StrToIntDef(Trim(VarToStr(AVariant)), 0);
end;

///////////// EJERCICIO 8 /////////////////

procedure TADRegistro.ArmarArbolCelulares();
var
  X:TipoElemento;
  R: RegistroPersona;
begin
  reset(Archivo);
  while not EOF(Archivo) do begin
    Read(Archivo,R);
    X.Clave := R.Celular;
    X.Valor1 := PosicionCelulares;
    IndiceCelular.Insertar(X);
    inc(PosicionCelulares);
  end;
  CloseFile(Archivo);
end;

function TADRegistro.BuscarPorCelular(Cel: string): RegistroPersona;
var
  R:RegistroPersona;
  X: TipoElemento;
  PosRegistro:integer;
  PosArbol: PosicionArbol;
begin
  Reset(Archivo);
  X.Clave := Cel;
  PosArbol := IndiceCelular.BusquedaBinaria(X);
  if PosArbol <> NULO then begin
    PosRegistro := VarToInt(IndiceCelular.Recuperar(PosArbol).Valor1);
    Seek(Archivo,PosRegistro);
    Read(Archivo,R);
  end
  else
    R.Celular := '-1';
  Closefile(Archivo);
  result := R;
end;

function TADRegistro.BuscarPorRS(RS: string): RegistroPersona;
var
  R:RegistroPersona;
  X: TipoElemento;
  PosRegistro:integer;
  PosArbol: PosicionArbol;
begin
  Reset(Archivo);
  X.Clave := RS;
  PosArbol := IndiceRS.BusquedaBinaria(X);
  if PosArbol <> NULO then begin
    PosRegistro := VarToInt(IndiceRS.Recuperar(PosArbol).Valor1);
    Seek(Archivo,PosRegistro);
    Read(Archivo,R);
  end
  else
    R.RazonSocial := '-1';
  Closefile(Archivo);
  result := R;
end;

procedure TADRegistro.GenerarArchivoCelulares(ruta:string);
var
  X:TipoElemento;
  R: RegistroPersona;

  procedure Recorrido(Q:PosicionArbol);
  begin
    if not IndiceCelular.RamaNula(Q) then begin
      Recorrido(IndiceCelular.HijoIzquierdo(Q));
      X := IndiceCelular.Recuperar(Q);
      R := BuscarPorCelular(X.Clave);
      Seek(ArchivoCelulares, PosicionCelulares);
      Write(ArchivoCelulares, R);
      Recorrido(IndiceCelular.HijoDerecho(Q));
    end;
  end;

begin
  AssignFile(ArchivoCelulares,ruta);
  Rewrite(ArchivoCelulares);
  Recorrido(IndiceCelular.Root);
  CloseFile(ArchivoCelulares);
end;

function TADRegistro.MostrarArchivoCelulares: string;
var
  R: RegistroPersona;
  s: string;
  X:TipoElemento;

  procedure Recorrido(Q: PosicionArbol); // InOrder para que aparezca ordenado
  begin
    if not IndiceCelular.RamaNula(Q) then begin
      Recorrido(IndiceCelular.HijoIzquierdo(Q));
      X := IndiceCelular.Recuperar(Q);
      R := BuscarPorCelular(X.Clave);
      s := s + '[' + R.Celular + ']: ' + R.CUIT.ToString + '; ' + R.RazonSocial + '; ' + R.Domicilio + '; ' + R.Telefono + '; ';
      if R.ACTIVO then
        s := s + 'ACTIVO' + cCRLF
      else
        s := s + 'NO ACTIVO' + cCRLF;
      Recorrido(IndiceCelular.HijoDerecho(Q));
    end;
  end;

begin
  s := '';
  Recorrido(IndiceCelular.Root);
  result := s;
end;

procedure TADRegistro.ArmarArbolRS;
var
  X:TipoElemento;
  R: RegistroPersona;
begin
  reset(Archivo);
  while not EOF(Archivo) do begin
    Read(Archivo,R);
    X.Clave := R.RazonSocial;
    X.Valor1 := PosicionRS;
    IndiceRS.Insertar(X);
    inc(PosicionRS);
  end;
  CloseFile(Archivo);
end;

function TADRegistro.BuscarRSAprox(RS: string): Lista;
var
  RPointer: ^RegistroPersona;
  RP: RegistroPersona;
  X,X2: TipoElemento;
  L:Lista;

  procedure Recorrido(Q: PosicionArbol);
  begin
    if not IndiceRS.RamaNula(Q) then begin
      X := IndiceRS.Recuperar(Q);
      if RS[1] = VarToStr(X.Clave)[1] then begin
        New(RPointer);
        RP := BuscarPorRS(VarToStr(X.Clave));
        RPointer^ := RP;
        X2.TipoElementoVacio;
        X2.Clave := VarToStr(X.Clave);
        X2.Valor2 := RPointer;
        L.Agregar(X2);
      end;
      Recorrido(IndiceRS.HijoIzquierdo(Q));
      Recorrido(IndiceRS.HijoDerecho(Q));
    end;
  end;

begin
  L.Crear(IndiceRS.DatoDeLaClave,IndiceRS.SizeTree);
  Recorrido(IndiceRS.Root);
  result := L;
end;

end.
