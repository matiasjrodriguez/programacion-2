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
       function deudaTotal(patente : String) : Double;
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


function ListadoVehiculos.multar(patente: string; numActa: string; fecha: TDate; importe: Real): Resultado;
  var
    multa , Vehiculo : TipoElemento;
    datosMulta : RecordMulta;
    LMultas   : Lista;
    PDatosMulta : ^RecordMulta;
  begin
    datosMulta.importe := importe;
    datosMulta.Estado := Pendiente;
    new(PDatosMulta);
    Lmultas := recuperarMultas(patente);
    multa.Clave := numActa;
    multa.Valor1 := fecha;
    PDatosMulta^ := datosMulta;
    multa.Valor2 := PDatosMulta;
    LMultas.Agregar(multa);
    actualizarMultas(patente,LMultas);
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
