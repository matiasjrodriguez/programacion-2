unit Unit_numeroBinario;

interface

  uses
    sysutils,math;
  const
    inicio=1;
    fin=17;
  type
    numeroBinario = object
      private
        numeroBinario1: array [inicio..fin] of integer;
        numeroBinario2: array [inicio..fin] of integer;
      resultadoBinario: array [inicio..fin] of integer;
        memoria:string;
      public
        procedure setearValorMemoria(numero:string);
        function obtenerValorMemoria():string;
        function verificarDato(dato:string):boolean;
        procedure cargarNumeroBinario(num1,num2:string);
        function sumaBinaria():string;
        function complementoA2(num1:string):string;
        function restaBinaria(dato:string):string;
        function operacionOR (input1,input2:string):string;
        function operacionAND(input1,input2:string):string;
        function operacionXOR(input1,input2:string):string;
        function convertirADecimal(input:string):string;
        function converirABinario(input:string):string;
    end;

implementation
//CONVERTIR A BINARIO
//----------------------------------------------------------------------
function numeroBinario.converirABinario(input: string): string;
var i,dividendo,index:integer;
              retorno:string;
begin
        index:=17;
    dividendo:=input.ToInteger;
    while dividendo>0  do
        begin
            resultadoBinario[index]:= dividendo mod 2;
            dividendo:= dividendo div 2;
            index:=index-1
        end;
  retorno:='';
  for i := index +1 to 17 do
    begin
        retorno:=retorno + resultadoBinario[i].ToString
    end;

   converirABinario:=retorno;
end;
//CONVERTIR A DECIMAL
//----------------------------------------------------------------------
function numeroBinario.convertirADecimal(input:string): string;
var index,i,j,exponente,resultado:integer;
                   potencia,total:single;
begin
        total:=0;
    exponente:=0;
        index:=length(input);
    for i := 1 to length(input) do
      begin
          potencia:= system.Math.Power(2,exponente)*input.ToSingle(input[index]);
          exponente:=exponente+1;
          total:=total + potencia;
          index:=index-1;
      end;
    convertirADecimal:=total.ToString;
end;
//OPERACION XOR
//----------------------------------------------------------------------
function numeroBinario.operacionXOR(input1,input2:string):string;
var   i,rango:integer;
      retorno:string;
begin
  for i := 1 to 17 do
  begin
      if ((numeroBinario1[i]= 1) and(numeroBinario2[i]= 1)) or ((numeroBinario1[i]= 0) and(numeroBinario2[i]= 0)) then
       begin
           resultadoBinario[i]:=0;
       end
      else
       begin
           resultadoBinario[i]:=1;
       end;

  end;
  retorno:='';
  if length(input1)>length(input2) then
    begin
        if resultadoBinario[17-length(input1)]=0 then
           begin
             rango:= 18-length(input1);
           end
        else
           begin
             rango:=17-length(input1);
           end;
        for i := rango to 17 do
          begin
              retorno:=retorno + resultadoBinario[i].ToString
          end;
    end
  else
    begin
        if resultadoBinario[17-length(input2)]=0 then
           begin
             rango:= 18-length(input2);
           end
        else
           begin
             rango:=17-length(input2);
           end;
        for i := rango to 17 do
          begin
              retorno:=retorno + resultadoBinario[i].ToString
          end;
    end;
  operacionXOR:=retorno;
end;
//OPERACION AND
//----------------------------------------------------------------------
function numeroBinario.operacionAND(input1,input2:string):string;
var   i,rango:integer;
      retorno:string;
begin
  for i := 1 to 17 do
  begin
      if (numeroBinario1[i]= 1) and(numeroBinario2[i]= 1) then
       begin
           resultadoBinario[i]:=1;
       end
      else
       begin
           resultadoBinario[i]:=0;
       end;

  end;
  retorno:='';
  if length(input1)>length(input2) then
    begin
        if resultadoBinario[17-length(input1)]=0 then
           begin
             rango:= 18-length(input1);
           end
        else
           begin
             rango:=17-length(input1);
           end;
        for i := rango to 17 do
          begin
              retorno:=retorno + resultadoBinario[i].ToString
          end;
    end
  else
    begin
        if resultadoBinario[17-length(input2)]=0 then
           begin
             rango:= 18-length(input2);
           end
        else
           begin
             rango:=17-length(input2);
           end;
        for i := rango to 17 do
          begin
              retorno:=retorno + resultadoBinario[i].ToString
          end;
    end;
  operacionAND:=retorno;
end;
//OPERACION OR
//----------------------------------------------------------------------
function numeroBinario.operacionOR(input1,input2:string):string;
var   i,rango:integer;
      retorno:string;
begin
  for i := 1 to 17 do
  begin
      if (numeroBinario1[i]= 1) or(numeroBinario2[i]= 1) then
       begin
           resultadoBinario[i]:=1;
       end
      else
       begin
           resultadoBinario[i]:=0;
       end;

  end;
  retorno:='';
  if length(input1)>length(input2) then
    begin
       if resultadoBinario[17-length(input1)]=0 then
           begin
             rango:= 18-length(input1);
           end
        else
           begin
             rango:=17-length(input1);
           end;
        for i := rango to 17 do
          begin
              retorno:=retorno + resultadoBinario[i].ToString
          end;
    end
  else
    begin
        if resultadoBinario[17-length(input2)]=0 then
           begin
             rango:= 18-length(input2);
           end
        else
           begin
             rango:=17-length(input2);
           end;
        for i := rango to 17 do
          begin
              retorno:=retorno + resultadoBinario[i].ToString
          end;
    end;
  operacionOR:=retorno;
end;
//RESTA COMPLEMENTO A 2
//----------------------------------------------------------------------
function numeroBinario.restaBinaria(dato:string): string;
var primerCaracter:integer;
         resultado:integer;
               fin:integer;
    carry,posicion:integer;
           retorno:string;
                 i:integer;
begin
  carry:=0;
    fin:=17;
    while fin>0 do
        begin
            resultado:=numeroBinario1[fin]+numeroBinario2[fin]+carry;
            if resultado=0 then
              begin
                  resultadoBinario[fin]:=0;
                  carry:=0;
              end
            else if resultado=1 then
              begin
                  resultadoBinario[fin]:=1;
                  carry:=0;
              end
            else if resultado=2 then
              begin
                  resultadoBinario[fin]:=0;
                  carry:=1;
              end
            else if resultado=3 then
              begin
                  resultadoBinario[fin]:=1;
                  carry:=1;
              end;
            fin:=fin-1;
        end;
    if carry=1 then
      begin
          resultadoBinario[fin]:=1;
      end;
    posicion:= 17-length(dato);
    resultadoBinario[posicion]:=0;
    retorno:='';
    fin:=1;
    while fin<18 do
      begin
        if resultadoBinario[fin]=1 then
          begin
              primerCaracter:=fin;
              for i := primerCaracter to 17 do
                 begin
                     retorno:= retorno + resultadoBinario[i].ToString;
                 end;
              fin:=17
          end;
      fin:=fin+1
      end;
    restaBinaria:= retorno;
end;
//COMPLEMENTO A 2
//----------------------------------------------------------------------
function numeroBinario.complementoA2(num1: string): string;
var complemento:array [1..17] of integer;
        numero2:array [1..17] of integer;
   resultadobin:array [1..17] of integer;
carry,index,len:integer;
i,resultado,fin:integer;
        retorno:string;

begin
    len:=length(num1);
  index:=17;
    while index>0 do
        begin
            if (num1[len]='1') and (len>0) then
              begin
                complemento[index]:=0
              end
            else if (num1[len]='0') and (len>0) then
              begin
                complemento[index]:=1
              end
            else if (len<1) then
              begin
                complemento[index]:=1
              end;

            if index=17 then
              begin
                  numero2[index]:=1;
              end
            else
              begin
                numero2[index]:=0;
              end;
            len:=len-1;
          index:=index-1;
        end;
    carry:=0;
    fin:=17;
    while fin>0 do
        begin
            resultado:=complemento[fin]+numero2[fin]+carry;
            if resultado=0 then
              begin
                  resultadobin[fin]:=0;
                  carry:=0;
              end
            else if resultado=1 then
              begin
                  resultadobin[fin]:=1;
                  carry:=0;
              end
            else if resultado=2 then
              begin
                  resultadobin[fin]:=0;
                  carry:=1;
              end
            else if resultado=3 then
              begin
                  resultadobin[fin]:=1;
                  carry:=1;
              end;
            fin:=fin-1;
        end;
    if carry=1 then
      begin
          resultadobin[fin]:=1;
      end;

    retorno:='';

    for i := 1 to 17 do
       begin
           retorno:= retorno + resultadobin[i].ToString;
       end;

   complementoA2:=retorno;
end;
//SUMA BINARIA
//----------------------------------------------------------------------
function numeroBinario.sumaBinaria: string;
var primerCaracter:integer;
         resultado:integer;
               fin:integer;
             carry:integer;
           retorno:string;
                 i:integer;
begin
  carry:=0;
    fin:=17;
    while fin>0 do
        begin
            resultado:=numeroBinario1[fin]+numeroBinario2[fin]+carry;
            if resultado=0 then
              begin
                  resultadoBinario[fin]:=0;
                  carry:=0;
              end
            else if resultado=1 then
              begin
                  resultadoBinario[fin]:=1;
                  carry:=0;
              end
            else if resultado=2 then
              begin
                  resultadoBinario[fin]:=0;
                  carry:=1;
              end
            else if resultado=3 then
              begin
                  resultadoBinario[fin]:=1;
                  carry:=1;
              end;
            fin:=fin-1;
        end;
    if carry=1 then
      begin
          resultadoBinario[fin]:=1;
      end;

    retorno:='';
    fin:=1;
    while fin<18 do
      begin
        if resultadoBinario[fin]=1 then
          begin
              primerCaracter:=fin;
              for i := primerCaracter to 17 do
                 begin
                     retorno:= retorno + resultadoBinario[i].ToString;
                 end;
              fin:=17
          end;
      fin:=fin+1
      end;
    sumaBinaria:= retorno;
end;


//CARGA BINARIA
//----------------------------------------------------------------------
procedure numeroBinario.cargarNumeroBinario(num1,num2:string);
var i:integer;
  fin:integer;
 len1:integer;
 len2:integer;

 begin
   len1:=length(num1);
   len2:=length(num2);
    fin:=17;
    while fin>0 do
        begin
            if (num1[len1]='1') and (len1>0) then
              begin
                numeroBinario1[fin]:=1
              end
            else
              begin
                numeroBinario1[fin]:=0
              end;
            if (num2[len2]='1') and (len2>0)then
              begin
                numeroBinario2[fin]:=1
              end
            else
              begin
                numeroBinario2[fin]:=0
              end;
            fin:=fin-1;
            len1:=len1-1;
            len2:=len2-1;
        end;
    fin:=17-length(num1);
    for i := 1 to fin  do
      begin
          numeroBinario1[i]:=0

      end;
    for i := 1 to fin do
      begin
          numeroBinario2[i]:=0
      end;

end;

//VERIFICACION DE DATOS
//----------------------------------------------------------------------
function numeroBinario.verificarDato(dato: string): boolean;
var resultado:boolean;
    i:integer;
    a:integer ;
begin
    a:=length(dato);
   resultado:=true;
   if not (dato='')then
     begin
     for i := 1 to length(dato) do
       begin
           if not ((dato[i] = '0') or (dato[i] = '1')) then
             begin
                 resultado:=false;
             end;
       end;
     end;
  verificarDato:= resultado;
end;

//ENTRADA Y SALIDA DE DATOS
//----------------------------------------------------------------------
procedure numeroBinario.setearValorMemoria(numero: string);

begin
   memoria:=numero;
end;

function numeroBinario.obtenerValorMemoria(): string;
begin
  obtenerValorMemoria:=memoria;
end;

end.
