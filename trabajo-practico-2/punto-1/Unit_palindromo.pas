unit Unit_palindromo;

interface
uses
   System.SysUtils,system.StrUtils;
type
   palindromo=object
   private
         palabra:string;
   public
        function verificarPalindromo(dato:string):boolean;
   end;
implementation
function palindromo.verificarPalindromo(dato: string): Boolean;
var retorno:boolean;
begin
   retorno:= true;
   if (dato[1] = dato[length(dato)]) and (length(dato)>1)  then
    begin
        ;
        dato:=AnsiMidStr(dato,2,length(dato)-2);

        retorno:=palindromo.verificarPalindromo(dato);
    end
   else if length(dato)>1 then

    begin
      retorno:= false;
    end;
   verificarPalindromo:=retorno;
end;
end.
