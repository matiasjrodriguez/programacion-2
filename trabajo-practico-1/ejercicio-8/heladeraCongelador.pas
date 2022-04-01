unit heladeraCongelador ;

interface

  uses
    sysutils;
    const
     kilos = 25;
  type
    congelador  = object
      private
        chocolate:single;
        crema_americana:single;
        frutilla:single;
        limon:single;
      public
        procedure cargarKilaje_chocolate(kilos:single);
        procedure cargarKilaje_cremaAmericana(kilos:single);
        procedure cargarKilaje_frutilla(kilos:single);
        procedure cargarKilaje_limon(kilos:single);

        function  obtenerKilaje_chocolate():single;
        function  obtenerKilaje_cremaAmericana():single;
        function  obtenerKilaje_frutilla():single;
        function  obtenerKilaje_limon():single;

        function consultar2sabores(sabor1,sabor2:single):boolean;
        function consultar3sabores(sabor1,sabor2,sabor3:single):boolean;

    end;


implementation
//------------------------------------------------------------------------
//te dejo algunos comentarios creo son utiles para resolver tu parte
//------------------------------------------------------------------------
  //Aumentar una cantidad de helado de un determinado sabor:
     //usa    obtenerKilaje
     //sumale una cantidad al retorno de obtenerKilaje
     //carga el resultado en cargarKilaje

  //También se puede servir un helado siempre y cuando
  //haya suficiente cantidad de helado de los sabores deseados:
     //usa    obtenerKilaje
     //resta una cantidad al retorno de obtenerKilaje
     //verifica si el reusltado de la resta es mayor o igual a 0
         //si es mayor o igual a cero carga el nuevo valor con: cargarKilaje
         //si es menor que cero no se puede servir el helado (mostrar mensaje de error pidiendo nueva cantidad)





//------------------------------------------------------------------------
//CONSULTAS
//------------------------------------------------------------------------

//3 SABORES
//------------------------------------------------------------------------
    //pasa por parametro los kilajes que obtuviste con el getValue de abajo
// (sabor 1 y sabor 2 respectivamente de la combinacion que hayas hecho en la interfaz, bien pueden
//  ser combinaciones de 2 sabores iguales o 2 diferentes)
function congelador.consultar3sabores(sabor1: Single; sabor2: Single; sabor3: Single): Boolean;
var cantTacho1,cantTacho2,cantTacho3:single;
                  retorno:boolean;
begin
  //cantTacho es la cantidad que queda en los tachos
  //despues de servir las bochas
   cantTacho1:=sabor1 - 0.25;
   cantTacho2:=sabor2 - 0.25;
   cantTacho3:=sabor3 - 0.25;
   if (cantTacho1 >= 0) and (cantTacho2>=0) and (cantTacho3>=0)then
    begin
       retorno:= true;
    end
   else
    begin
      retorno:=false;
    end;             //si es true restale 0.25 a los gustos y carga el resultado con cargarKilaje (
            //si es false no se puede servir esa combinacion de gusto)
   consultar3sabores:=retorno;
end;


//2 SABORES
//------------------------------------------------------------------------
                                    //pasa por parametro los kilajes que obtuviste con el getValue de abajo
                                    // (sabor 1 y sabor 2 respectivamente de la combinacion que hayas hecho en
                                    //la interfaz, bien pueden ser combinaciones de 2 sabores iguales o 2
                                    //diferentes)
function congelador.consultar2sabores(sabor1: Single; sabor2: Single): Boolean;
var cantTacho1,cantTacho2:single;
                  retorno:boolean;
begin
  //cantTacho es la cantidad que queda en los tachos
  //despues de servir las bochas

   cantTacho1:=sabor1 - 0.25;
   cantTacho2:=sabor2 - 0.25;
   if (cantTacho1 >= 0) and (cantTacho2>=0) then
    begin
       retorno:= true;
    end
   else
    begin
      retorno:=false;
    end;             //si es true restale 0.25 a los gustos y carga el resultado con cargarKilaje
            //(si es false no se puede servir esa combinacion de gusto)
   consultar2sabores:=retorno;
end;




//------------------------------------------------------------------------
//OBTENER KILAJES
//------------------------------------------------------------------------

//usa estas funciones para obtener el valor del kilaje total
//de cada gusto de helado dentro del congelador

//LIMON
//------------------------------------------------------------------------
function congelador.obtenerKilaje_limon: Single;
begin
   obtenerKilaje_limon:=limon;
end;
//CREMA AMERICANA
//------------------------------------------------------------------------
function congelador.obtenerKilaje_frutilla: Single;
begin
   obtenerKilaje_frutilla:=frutilla;
end;

//CREMA AMERICANA
//------------------------------------------------------------------------
function congelador.obtenerKilaje_cremaAmericana: Single;
begin
   obtenerKilaje_cremaAmericana:=crema_americana;
end;
//CHOCOLATE
//------------------------------------------------------------------------
function congelador.obtenerKilaje_chocolate: Single;
begin
   obtenerKilaje_chocolate:=chocolate;
end;


//------------------------------------------------------------------------
//CARGAR KILAJES
//------------------------------------------------------------------------

//usa estas funciones para cargar el valor del kilaje total
//de cada gusto de helado dentro del congelador
//la carga puede ser resultado de una suma o resta
//pero nunca menor o igual a cero, hace esa validacion en la interfaz

//LIMON
//------------------------------------------------------------------------
procedure congelador.cargarKilaje_limon(kilos:single);
begin
   limon:=kilos;
end;
//FRUTILLA
//------------------------------------------------------------------------
procedure congelador.cargarKilaje_frutilla(kilos:single);
begin
   frutilla:=kilos;
end;

//CREMA AMERICANA
//------------------------------------------------------------------------
procedure congelador.cargarKilaje_cremaAmericana(kilos:single);
begin
   crema_americana:=kilos;
end;
//CHOCOLATE
//------------------------------------------------------------------------
procedure congelador.cargarKilaje_chocolate(kilos: Single);
begin
   chocolate:=kilos;
end;


end.
