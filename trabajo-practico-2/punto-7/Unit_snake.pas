unit Unit_snake;

interface
uses
   system.SysUtils;
type
   serpiente=object

   private
        matriz : array[1..10 , 1..10] of string;
        coordenadas:string;
        ultimaPosicion_fila,ultimaPosicion_columna,longitud:integer;
   public

        procedure cargarMatriz();
        function obtenerMatriz(fila,columna:integer):string;
        function buscarCabeza():string;
        function buscarRecorrido(coordenada:string):string;
        function verificarAbajo(fila,columna:integer):boolean;
        function verificarArriba(fila,columna:integer):boolean;
        function verificarIzquierda(fila,columna:integer):boolean;
        function verificarDerecha(fila,columna:integer):boolean;
        function obtenerLongitud:string;


   end;

implementation
function serpiente.obtenerLongitud: string;
begin
    obtenerLongitud:=longitud.ToString;
end;
function serpiente.buscarRecorrido(coordenada: string):string;
var fila,columna,nuevaFil,nuevaCol:integer;
           nuevaCoordenada,retorno:string;

begin
    longitud:=longitud+1;
    coordenadas:= coordenadas+coordenada;
    fila:=coordenada.ToInteger(coordenada[3]);
    columna:=coordenada.ToInteger(coordenada[5]);
    nuevaCoordenada:='0';

    //borde
    if ((fila=1) or (fila=10)) or ((columna=1) or (columna=10)) then
     begin
         if (fila=1) and ((columna>1) and (columna<10)) then //izquierda, derecha, abajo
            begin
                //izquierda, derecha, abajo
                if verificarIzquierda(fila,columna) then //izquierda
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna-1) +')';
                      buscarRecorrido(nuevaCoordenada);
                  end
                else if verificarDerecha(fila,columna) then  //derecha
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna+1) +')';
                      buscarRecorrido(nuevaCoordenada);
                  end
                else if verificarAbajo(fila,columna) then  //abajo
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString(ultimaPosicion_fila+1) + ','+ ultimaPosicion_columna.ToString +')';
                      buscarRecorrido(nuevaCoordenada);
                  end;
            end
         else if (fila=1) and (columna=1) then//abajo, derecha
            begin
                if verificarAbajo(fila,columna) then  //abajo
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString(ultimaPosicion_fila+1) + ','+ ultimaPosicion_columna.ToString +')';
                      buscarRecorrido(nuevaCoordenada);
                  end
                else if verificarDerecha(fila,columna) then  //derecha
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna+1) +')';
                      buscarRecorrido(nuevaCoordenada);
                  end;
            //abajo, derecha
            end
         else if (fila=1) and (columna=10) then//abajo izquierda
            begin
                if verificarAbajo(fila,columna) then  //abajo
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString(ultimaPosicion_fila+1) + ','+ ultimaPosicion_columna.ToString +')';
                      buscarRecorrido(nuevaCoordenada);
                  end
                else if verificarIzquierda(fila,columna) then //izquierda
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna-1) +')';
                      buscarRecorrido(nuevaCoordenada);
                  end;
            end
          else if (fila=10) and ((columna>1) and (columna<10)) then //izquierda, derecha, arriba
            begin
                if verificarIzquierda(fila,columna) then //izquierda
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna-1) +')';
                      buscarRecorrido(nuevaCoordenada);
                  end
                 else if verificarDerecha(fila,columna) then  //derecha
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna+1) +')';
                      buscarRecorrido(nuevaCoordenada);
                  end
                 else if verificarArriba(fila,columna) then //arriba
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString(ultimaPosicion_fila-1) + ','+ ultimaPosicion_columna.ToString +')';
                      buscarRecorrido(nuevaCoordenada);
                  end;
            end
           else if (fila=10) and (columna=1) then //arriba, derecha
            begin
                if verificarArriba(fila,columna) then //arriba
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString(ultimaPosicion_fila-1) + ','+ ultimaPosicion_columna.ToString +')';
                      buscarRecorrido(nuevaCoordenada);
                  end
                else if verificarDerecha(fila,columna) then  //derecha
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna+1) +')';
                      buscarRecorrido(nuevaCoordenada);
                  end;
            end
           else if (fila=10) and (columna=10) then //arriba, izquierda
            begin
                if verificarArriba(fila,columna) then //arriba
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString(ultimaPosicion_fila-1) + ','+ ultimaPosicion_columna.ToString +')';
                      buscarRecorrido(nuevaCoordenada);
                  end
                else if verificarIzquierda(fila,columna) then //izquierda
                  begin
                      ultimaPosicion_fila:=fila;
                      ultimaPosicion_columna:=columna;
                      nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna-1) +')';
                      buscarRecorrido(nuevaCoordenada);
                  end;
            end;
     end
    else
     begin
         if verificarDerecha(fila,columna) then  //derecha
          begin
              ultimaPosicion_fila:=fila;
              ultimaPosicion_columna:=columna;
              nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna+1) +')';
              buscarRecorrido(nuevaCoordenada);
          end
         else if verificarIzquierda(fila,columna) then //izquierda
          begin
              ultimaPosicion_fila:=fila;
              ultimaPosicion_columna:=columna;
              nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString + ','+ ultimaPosicion_columna.ToString(ultimaPosicion_columna-1) +')';
              buscarRecorrido(nuevaCoordenada);
          end
         else if verificarAbajo(fila,columna) then  //abajo
          begin
              ultimaPosicion_fila:=fila;
              ultimaPosicion_columna:=columna;
              nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString(ultimaPosicion_fila+1) + ','+ ultimaPosicion_columna.ToString +')';
              buscarRecorrido(nuevaCoordenada);
          end
         else if verificarArriba(fila,columna) then //arriba
          begin
              ultimaPosicion_fila:=fila;
              ultimaPosicion_columna:=columna;
              nuevaCoordenada:=',('+ ultimaPosicion_fila.ToString(ultimaPosicion_fila-1) + ','+ ultimaPosicion_columna.ToString +')';
              buscarRecorrido(nuevaCoordenada);
          end;
     end;
   buscarRecorrido:=coordenadas;
end;
//-------------------------------------------------------------------
function serpiente.verificarDerecha(fila: Integer; columna: Integer): Boolean;
var retorno:boolean;
begin
    //derecha
    retorno:=false;
    if (matriz[fila,columna+1]='S') and not((ultimaPosicion_fila=fila) and (ultimaPosicion_columna=columna+1)) then
     begin
         retorno:=true;
     end;
    verificarDerecha:=retorno;
end;
function serpiente.verificarIzquierda(fila: Integer; columna: Integer): Boolean;
var retorno:boolean;
begin
    //izquierda
    retorno:=false;
    if (matriz[fila,columna-1]='S') and not((ultimaPosicion_fila=fila) and (ultimaPosicion_columna=columna-1)) then
     begin
         retorno:=true;
     end;
    verificarIzquierda:=retorno;
end;
function serpiente.verificarArriba(fila: Integer; columna: Integer): Boolean;
var retorno:boolean;
begin
    //arriba
    retorno:=false;
    if (matriz[fila-1,columna]='S') and not((ultimaPosicion_fila=fila-1) and (ultimaPosicion_columna=columna)) then
     begin
         retorno:=true;
     end;
    verificarArriba:=retorno;
end;
function serpiente.verificarAbajo(fila: Integer; columna: Integer): Boolean;
var retorno:boolean;
begin
    //abajo
    retorno:=false;
    if (matriz[fila+1,columna]='S') and not((ultimaPosicion_fila=fila+1) and (ultimaPosicion_columna=columna)) then
     begin
         retorno:=true;
     end;
    verificarAbajo:=retorno;
end;

//-------------------------------------------------------------------
function serpiente.buscarCabeza():string;
var fila,columna:integer;
         retorno:string;
begin

    fila:=1;
    retorno:='-0';
    while (fila<11) and (retorno='-0') do
      begin
          columna:=1;
          while (columna<11) and (retorno='-0') do
            begin
                if matriz[fila,columna]='C' then
                 begin
                     ultimaPosicion_fila:=fila;
                     ultimaPosicion_columna:=columna;
                     retorno:=' ('+ fila.ToString + ','+ columna.ToString +')';
                 end;
                columna:=columna+1;
            end;
          fila:=fila+1;
      end;

    buscarCabeza:=retorno;
end;
procedure serpiente.cargarMatriz;
begin
    matriz[2,2]:='S';
    matriz[3,2]:='S';
    matriz[3,3]:='S';
    matriz[4,3]:='S';
    matriz[5,3]:='S';
    matriz[5,4]:='S';
    matriz[5,5]:='S';
    matriz[5,6]:='S';
    matriz[5,7]:='S';
    matriz[5,8]:='S';
    matriz[6,8]:='S';
    matriz[7,8]:='S';
    matriz[8,8]:='S';
    matriz[8,7]:='S';
    matriz[8,6]:='C';
end;

function serpiente.obtenerMatriz(fila: Integer; columna: Integer): string;
begin
    obtenerMatriz:=matriz[fila,columna];
end;
end.
