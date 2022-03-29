unit TADTarjetaDeCredito;

interface

uses
  SysUtils;

type

  EMISORAS = (Null, Visa, Mastercard, AmericanExpress, Maestro);

  regLimite = record
    unaCuota: single;
    variasCuotas: double;
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
    function comprarUnaCuota(monto:integer):boolean;
    function comprarMuchasCuotas(monto,cuotas:integer):boolean;
    function mostrarLimites():string;
  end;

implementation

{ TarjetaDeCredito }

function TarjetaDeCredito.comprarMuchasCuotas(monto,cuotas: integer): boolean;
begin
  if Limite.variasCuotas >= monto then begin
    if cuotas <= 6 then begin
      Limite.variasCuotas := Limite.variasCuotas - (monto * 0.90);
      Limite.unaCuota := Limite.unaCuota - (monto / cuotas);
    end else begin
      Limite.variasCuotas := Limite.variasCuotas - (monto * 0.70);
      Limite.unaCuota := Limite.unaCuota - (monto / cuotas);
    end;
    result := true;
  end else
    result := false;
end;

function TarjetaDeCredito.comprarUnaCuota(monto: integer): boolean;
begin
  if Limite.unaCuota >= monto then begin
    case entidadEmisora() of
      Visa: Limite.unaCuota := Limite.unaCuota - (monto * 0.80);
      AmericanExpress: Limite.unaCuota := Limite.unaCuota - (monto * 0.80);
    else
      Limite.unaCuota := Limite.unaCuota - monto;
    end;
    result := true
  end else
    result := false;
end;

function TarjetaDeCredito.entidadEmisora: EMISORAS;
var
  num:string;
  INN:integer;
  empresa: EMISORAS;
begin
  num := getNumero();

  if num[1] = '4' then
    empresa := Visa
  else begin
    INN := StrToInt(num[1] + num[2]);

    if (INN >= 34) and (INN <= 37) then
      empresa := AmericanExpress
    else if (INN = 50) or ((INN >= 56) and (INN <= 58)) then
      empresa := Maestro
    else if (INN >= 51) and (INN <= 55) then
      empresa := Mastercard
    else begin
      INN := StrToInt(num[1] + num[2] + num[3] + num[4]);
      if (INN >= 2021) and (INN <= 2720) then
        empresa := Mastercard;
    end;
  end;

  result := empresa;

end;

function TarjetaDeCredito.getFecha: TDateTime;
begin
  result := fechaVencimiento;
end;

function TarjetaDeCredito.getLimite: regLimite;
begin
  result := limite;
end;

function TarjetaDeCredito.getNumero: string;
begin
  result := numero
end;

function TarjetaDeCredito.mostrarLimites: string;
begin
  result := ('-Limite actual en una cuota: ' + limite.unaCuota.ToString + #13#10 + '-Limite actual en varias cuotas: ' + limite.variasCuotas.ToString);
end;

procedure TarjetaDeCredito.setFecha(fecha: TDateTime);
begin
  fechaVencimiento := fecha;
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
var
  num, numDuplicado:string;
  I, acumulador:byte;

begin
  num := getNumero();
  numDuplicado := '';
  acumulador := 0;

  for I := 1 to length(num) do begin
    if (I mod 2) <> 0 then
      numDuplicado := numDuplicado + (StrToInt(num[I])*2).ToString
    else
      numDuplicado := numDuplicado + num[I];
  end;

  for I := 1 to length(numDuplicado) do
    acumulador := acumulador + StrToint(numDuplicado[I]);

  result := (acumulador mod 10) = 0;
end;


end.
