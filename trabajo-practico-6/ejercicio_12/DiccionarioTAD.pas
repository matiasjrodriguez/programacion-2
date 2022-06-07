unit DiccionarioTAD;


interface

uses

  System.SysUtils, System.Variants, System.Classes, Tipos, ArbolN, ListPointer;

const

  MIN = 'A';
  MAX = 'Ñ';
  MAXL = 50000;
  MAXMU = 1000;

type

  Diccionario = Object
    private
      Arbol : ArbolNario;
      ListaPalabras : Lista;
      ListaMasUsadas : Lista;
    public
      Procedure Create(A : ArbolNario);
      Function Prediccion ( C : String) : Lista;
      Function Listado () : Lista;
    private
      procedure CargarPalabras(var L : Lista);
  End;

implementation

    Procedure Diccionario.Create(A: ArbolNario);

      begin
          self.Arbol := A;
          ListaPalabras.Crear(cadena,MAXL);
      end;

    Function Diccionario.Prediccion(C: String): Lista;
      var
        L : Lista;
        H : PosicionArbol;
      procedure ListaPrediccion(P : PosicionArbol);
      var index : Char;
          X : TipoElemento;
        begin
           index := MIN;
           if not Arbol.RamaNula(P) then
              begin
                 if P.Datos.Valor1 <> '' then begin
                    X.Clave := P.Datos.Valor1;
                    L.Agregar(X);
                 end;
                 while (not L.EsLLena) and (index <= MAX) do begin
                   if not Arbol.Hijo(P,index).Datos.EsTEVacio then
                      ListaPrediccion(Arbol.Hijo(P,index));
                   inc(index);
                 end;
              end;
        end;


      begin
          C := C.ToUpper;
          L.Crear(cadena,5);
          H := Arbol.UltimaLetra(Arbol.Root,C);
          if not H.Datos.EsTEVacio then
              ListaPrediccion(H);
          result := L;
      end;


      procedure Diccionario.CargarPalabras(var L : Lista);
      Var P : PosicionArbol;
        Procedure Recursion(P : PosicionArbol);
          var index : Char;
          X : TipoElemento;
          begin
             index := MIN;
             if not Arbol.RamaNula(P) then
                begin
                   if P.Datos.Valor1 <> '' then begin
                      X.Clave := P.Datos.Valor1;
                      L.Agregar(X);
                   end;
                   while (not ListaPalabras.EsLLena) and (index <= MAX) do begin
                     if not Arbol.Hijo(P,index).Datos.EsTEVacio then
                       Recursion(Arbol.Hijo(P,index));
                     inc(index);
                   end;
                end;
        end;

       begin
         P := Arbol.Root;
         Recursion(P);
       end;

       Function Diccionario.Listado: Lista;

       begin
         ListaPalabras.Crear(cadena,MAXL);
         cargarPalabras(ListaPalabras);
         Result := self.ListaPalabras;
       end;




end.