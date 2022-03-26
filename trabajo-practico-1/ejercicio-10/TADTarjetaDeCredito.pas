unit TADTarjetaDeCredito;

interface

type

  EMISORAS = (Visa, Mastercard, AmericanExpress, Maestro);

  regLimite = record
    unaCuota: integer;
    variasCuotas: integer;
  end;

  TarjetaDeCredito = object
  private
    numero: string;
    fechaVencimiento: TDateTime;
    limite: regLimite;
  public
    procedure setNumero(num: string);
    function getNumero():string;
    procedure setFecha(fecha: TDateTime);
    function getFecha():TDateTime;
    procedure setLimite(lim: regLimite);
    function getLimite():regLimite;
    function validarNro():boolean;
    function entidadEmisora():EMISORAS;
    function comprar(monto:integer):boolean;
    function mostrarLimites():regLimite;
  end;

implementation

{ TarjetaDeCredito }

function TarjetaDeCredito.comprar(monto: integer): boolean;
begin

end;

function TarjetaDeCredito.entidadEmisora: EMISORAS;
begin

end;

function TarjetaDeCredito.getFecha: TDateTime;
begin

end;

function TarjetaDeCredito.getLimite: regLimite;
begin
  result := limite;
end;

function TarjetaDeCredito.getNumero: string;
begin
  result := numero
end;

function TarjetaDeCredito.mostrarLimites: regLimite;
begin

end;

procedure TarjetaDeCredito.setFecha(fecha: TDateTime);
begin

end;

procedure TarjetaDeCredito.setLimite(lim: regLimite);
begin
  limite := lim
end;

procedure TarjetaDeCredito.setNumero(num: string);
begin
  numero := num
end;

function TarjetaDeCredito.validarNro: boolean;
begin

end;

end.
