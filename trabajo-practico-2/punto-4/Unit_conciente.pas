unit Unit_conciente;

interface
uses
   system.sysutils,system.StrUtils;
type
   conciente=object
   private
         resultado:integer;
   public
        function cocienteEntreDosNumeros(num1,num2:string):string;
        function obtenerResultado():string;
   end;

implementation
function conciente.cocienteEntreDosNumeros(num1: string; num2: string): string;
var       retorno:string;
  numero1,numero2:integer;
begin
    numero1:=num1.ToInteger;
    numero2:=num2.ToInteger;
    if not (numero1<numero2) then
     begin
         numero1:=numero1-numero2;
         resultado:=resultado+1;
         retorno:=cocienteEntreDosNumeros(numero1.ToString,numero2.ToString);
     end
    else
    begin
        retorno:=numero1.ToString;
    end;
    cocienteEntreDosNumeros:=AnsiMidStr(retorno,1,4);
end;
function conciente.obtenerResultado: string;
begin
    obtenerResultado:= resultado.ToString;
end;
end.
