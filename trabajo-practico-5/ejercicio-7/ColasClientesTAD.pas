unit ColasClientesTAD;



interface

uses
  QueuesArray, Tipos, System.SysUtils, System.Variants, System.Classes;

const
  MAXClients = 20;

type

  ArrayColas = Array [1..3] of Cola;
  MinAtendidosxCola = Array[1..2,1..3] of integer; // guarda en la primer fila los minutos que lleva
                                                   // atendida esa fila, y en la segunda la cantidad
                                                   // clientes atendida.. cuando se atiende un client
                                                   // el valor en la primer fila se resetea
FilasClientes = Object
  private
    Colas : ArrayColas;
    ColaAtendidos : Cola;
    TiempoAtendidos : MinAtendidosxCola;
  public
    procedure Create() ;
    function Atender (Q : integer) : Cola;
    procedure CargarFila(Cliente : Integer; numCola : integer);
    function TodoVacio() : boolean;
  private
    procedure atenderFila(Q : integer ; numFila : integer);
    procedure CargarAtendido(numFila : Integer);
    procedure Inicializar();
End;

implementation

    procedure FilasClientes.Create();

      begin
         self.Colas[1].Crear(numero,MAXclients);
         self.Colas[2].Crear(numero,MAXclients);
         self.Colas[3].Crear(numero,MAXclients);
         Inicializar();
      end;

    function FilasClientes.Atender(Q: Integer): Cola;
var
  i: Integer;

    begin
       Inicializar();
       while not todoVacio do
        begin
          for i := 1 to Length(self.Colas) do
            begin
              if not self.Colas[i].EsVacia then
                atenderFila(Q,i);
            end;
        end;
       result := self.ColaAtendidos;
    end;

    procedure FilasClientes.atenderFila(Q: Integer; numFila : integer);

    begin
      if self.Colas[numFila].Recuperar.Clave - Q - self.TiempoAtendidos[1,numFila] <= 0 then
        begin
          self.TiempoAtendidos[1,numFila] := 0;
          inc(self.TiempoAtendidos[2,numFila]);
          cargarAtendido(numFila);
          self.Colas[numFila].DesEncolar;
        end
      else
        begin
          self.TiempoAtendidos[1,numFila] := self.TiempoAtendidos[1,numFila] + Q;
        end;
    end;

    procedure FilasClientes.CargarAtendido(numFila : integer);
    var
      X : TipoElemento;
      begin
        X.Inicializar(cadena,'clienteX');
        X.Clave := 'Cliente '+self.TiempoAtendidos[2,numFila].ToString+' Fila '+numFila.ToString;
        self.ColaAtendidos.Encolar(X);
      end;

    procedure FilasClientes.CargarFila(Cliente: Integer; numCola : integer) ;
    var
      X : TipoElemento;
      i: Integer;
    begin
        X.Inicializar(numero,'Cliente');
        X.Clave:= Cliente;
        self.Colas[numCola].Encolar(X);
    end;

    function FilasClientes.TodoVacio: Boolean;
    begin
      result := (self.Colas[1].EsVacia) and (self.Colas[2].EsVacia) and (self.Colas[3].EsVacia);
    end;

    procedure FilasClientes.Inicializar;

    begin
        self.ColaAtendidos.Crear(cadena,Maxclients*3);
        self.TiempoAtendidos[1,1]  := 0;
        self.TiempoAtendidos[1,2]  := 0;
        self.TiempoAtendidos[1,3]  := 0;
        self.TiempoAtendidos[2,1]  := 0;
        self.TiempoAtendidos[2,2]  := 0;
        self.TiempoAtendidos[2,3]  := 0;
    end;


end.
