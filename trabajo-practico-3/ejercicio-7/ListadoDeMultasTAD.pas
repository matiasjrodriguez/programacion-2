unit ListadoDeMultasTAD;

interface

uses
  ListPointer, Tipos, System.SysUtils, System.Variants, System.Classes;


type

  ListMultaPointer = ^Lista;

  EstadoMulta = (Pendiente,Abonada,Anulada);

  RecordMulta = Record
    importe : Double;
    Estado  : EstadoMulta;
  End;

  ListadoVehiculos = Object
    private
       listado : Lista;
    public
       constructor Create();
       function agregarVehiculo(patente : String) : Resultado;
       function multar(patente, numActa : String; fecha : TDATE ; importe : Real ) : Resultado;
       function getListado() : Lista;
       function deudaTotal(patente : String) : Double;   //
       function multaAntigua(patente:string):TipoElemento;    //
       function multaReciente(patente:string):TipoElemento;   //
       function mayorInfracciones():TipoElemento;
       function mayorDeuda():TipoElemento;
       function noDeuda():boolean;
       function VehiculoEsta(patente : String) : Boolean;
    private
       function recuperarMultas(patente : String) : Lista;
       procedure actualizarMultas(patente : String; List : Lista);

  End;

implementation
// Metodo Constructor..
  constructor ListadoVehiculos.Create;
      begin
        listado.Crear(cadena,MAX);
      end;

// Getters.....

  function ListadoVehiculos.getListado: Lista;
  begin
      result := self.listado;
  end;

// Metodos Publicos del ListadoVehiculos.....

  function ListadoVehiculos.agregarVehiculo(patente: string): Resultado;
  var
    LMPointer : ^Lista;
    LMultas   : Lista;
    vehiculo  : TipoElemento;
  begin
    LMultas.Crear(Cadena,MAX);
    New(LMPointer);
    LMPointer^ := LMultas;
    vehiculo.Inicializar(cadena,patente);
    vehiculo.Clave := patente;
    vehiculo.Valor2 := LMpointer;
    result := listado.Agregar(vehiculo);
  end;


function ListadoVehiculos.VehiculoEsta(patente: String): Boolean;
var
 pos : PosicionLista;
begin
  pos := self.listado.Comienzo;
  while (pos <> Nulo) and (patente <> self.listado.Recuperar(pos).Clave) do
     pos := self.listado.Siguiente(pos);
  result :=  patente = self.listado.Recuperar(pos).Clave
end;

function ListadoVehiculos.mayorDeuda: TipoElemento;
var
  Q,Q1:PosicionLista;
  L:Lista;
  X,X1,XF: TipoElemento;
  R: RecordMulta;
  RP: ^RecordMulta;
  importe,importeMayor : double;
begin
  importeMayor := 0;
  XF.Inicializar(Cadena,'');
  Q := listado.Comienzo;
  while Q <> NULO do begin
    importe := 0;
    X := Listado.Recuperar(Q);
    L := recuperarMultas(X.Clave);
    Q1 := L.Comienzo;
    while (Q1 <> Nulo) and (not L.EsVacia) do begin
      X1 := L.Recuperar(Q1);
      RP := X1.Valor2;
      R := RP^;
      if R.Estado = Pendiente then
        importe := importe + R.importe;
      Q1 := L.Siguiente(Q1);
    end;
    if importe > importeMayor then begin
      importeMayor := importe;
      XF := X;
    end;
    Q := listado.Siguiente(Q);
  end;
  result := XF;
end;
function ListadoVehiculos.mayorInfracciones: TipoElemento;
var
  Q,Q1:PosicionLista;
  L:Lista;
  mayor,acum: double;
  X,X1,XF: TipoElemento;
  R: RecordMulta;
  RP: ^RecordMulta;
begin
  mayor := 0;
  XF.Inicializar(Cadena,'');
  Q := listado.Comienzo;
  while Q <> NULO do begin
    acum := 0;
    X := Listado.Recuperar(Q);
    L := recuperarMultas(X.Clave);
    Q1 := L.Comienzo;
    while (Q1 <> Nulo) and (not L.EsVacia) do begin
      X1 := L.Recuperar(Q1);
      RP := X1.Valor2;
      R := RP^;
      if R.Estado <> Anulada then begin
        acum := acum + R.importe;
      end;
      Q1 := L.Siguiente(Q1);
    end;
    if mayor < acum then begin
      mayor := acum;
      XF := X;
    end;
    Q := listado.Siguiente(Q);
  end;
  result := XF;
end;

function ListadoVehiculos.multaAntigua(patente:string): TipoElemento;
var
  X,XF:TipoElemento;
  fechaAntigua:TdateTime;
  VMultas : Lista;
  pos : PosicionLista;
begin
  VMultas := recuperarMultas(patente);
  if VMultas.EsVacia then
    XF.Clave := 'No hay multas'
  else begin
    pos := VMultas.Comienzo;
    X := VMultas.Recuperar(pos);
    fechaAntigua := X.Valor1;
    XF := X;
    pos := VMultas.Siguiente(pos);
    while pos <> NULO do begin
      X := vMultas.Recuperar(pos);
      if fechaAntigua > X.Valor1 then begin
        fechaAntigua := X.Valor1;
        XF := X;
      end;
      pos := VMultas.Siguiente(pos);
    end;
  end;
  result := XF;
end;

function ListadoVehiculos.multar(patente: string; numActa: string; fecha: TDate; importe: Real): Resultado;
  var
    multa , Vehiculo : TipoElemento;
    datosMulta : RecordMulta;
    LMultas   : Lista;
    PDatosMulta : ^RecordMulta;
    retorno : Resultado;
  begin
    datosMulta.importe := importe;
    datosMulta.Estado := Pendiente;
    new(PDatosMulta);
    Lmultas := recuperarMultas(patente);
    multa.Clave := numActa;
    multa.Valor1 := fecha;
    PDatosMulta^ := datosMulta;
    multa.Valor2 := PDatosMulta;
    retorno := LMultas.Agregar(multa);
    actualizarMultas(patente,LMultas);
    result:= retorno;
  end;

function ListadoVehiculos.multaReciente(patente: string): TipoElemento;
var
  X,XF:TipoElemento;
  fechaReciente:TdateTime;
  VMultas : Lista;
  pos : PosicionLista;
begin
  VMultas := recuperarMultas(patente);
  if VMultas.EsVacia then
    XF.Clave := 'No hay multas'
  else begin
    pos := VMultas.Comienzo;
    X := VMultas.Recuperar(pos);
    fechaReciente := X.Valor1;
    XF := X;
    pos := VMultas.Siguiente(pos);
    while pos <> NULO do begin
      X := vMultas.Recuperar(pos);
      if fechaReciente < X.Valor1 then begin
        fechaReciente := X.Valor1;
        XF := X;
      end;
      pos := VMultas.Siguiente(pos);
    end;
  end;
  result := XF;
end;

function ListadoVehiculos.noDeuda: boolean;
var
  Q,Q1:PosicionLista;
  L:Lista;
  X,X1,XF: TipoElemento;
  R: RecordMulta;
  RP: ^RecordMulta;
  adeudando:boolean;
begin
  Adeudando := False;
  XF.Inicializar(Cadena,'');
  Q := listado.Comienzo;
  while Q <> NULO do begin
    X := Listado.Recuperar(Q);
    L := recuperarMultas(X.Clave);
    Q1 := L.Comienzo;
    while (Q1 <> NULO) and (not L.EsVacia) do begin
      X1 := L.Recuperar(Q1);
      RP := X1.Valor2;
      R := RP^;
      if R.Estado = Pendiente then
        adeudando := True;
      Q1 := L.Siguiente(Q1);
    end;
    Q := listado.Siguiente(Q);
  end;
  result := not adeudando;
end;

procedure ListadoVehiculos.actualizarMultas(patente: string; List : Lista);
  var
       X : TipoElemento ; L : ^Lista;
  begin
      New(L);
      L^ := List;
      X.Valor2 := L;
      X.Clave := patente;
      self.listado.Actualizar(X,self.listado.Buscar(X));
  end;

  function ListadoVehiculos.recuperarMultas(patente : String) : Lista;
  var
    X : TipoElemento; L:^Lista;
  begin
    X.Clave := patente;
    X := self.listado.Recuperar(self.listado.Buscar(X));
    L := X.Valor2;
    result := L^;
  end;


function ListadoVehiculos.deudaTotal(patente: String): Double;
  var
    deuda : Double;
    VMultas : Lista;
    pos : PosicionLista;
    PRM : ^RecordMulta;
    RM  : RecordMulta;
  begin
    deuda := 0;
    VMultas := recuperarMultas(patente);
    pos := VMultas.Comienzo;
    while pos <> Nulo do begin
       PRM := VMultas.Recuperar(pos).Valor2;
       RM := PRM^;
       if RM.Estado = Pendiente then
          deuda := deuda + RM.importe;
       pos := Vmultas.Siguiente(pos);
    end;
    result := deuda;
  end;

end.
