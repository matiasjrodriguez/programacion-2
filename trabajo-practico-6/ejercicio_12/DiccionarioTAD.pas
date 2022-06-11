{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit DiccionarioTAD;


interface

uses

  System.SysUtils, System.Variants, System.Classes, Tipos, ArbolN, ListPointer;

const

  MIN = 'A';
  MAX = 'Ñ';
  MAXL = 2000;
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
       Function ListadoMU: Lista;
    private
      procedure CargarPalabras(var L : Lista);
      procedure CargarPalabrasMU(var L : Lista);
  End;

implementation

    Procedure Diccionario.Create(A: ArbolNario);

      begin
          self.Arbol := A;
          ListaPalabras.Crear(cadena,MAXL);
          ListaMasUsadas.Crear(cadena,MAXMU);
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

      procedure Diccionario.CargarPalabrasMU(var L : Lista);
      Var P : PosicionArbol;
        Procedure Recursion(P : PosicionArbol);
          var
            index : Char;
            X : TipoElemento;
            plista:posicionlista;
          begin
             index := MIN;

             if not Arbol.RamaNula(P) then begin
                x.Clave := p.Datos.valor1;
                if (p.Ocurrencias > 0) and (ListaMasUsadas.Buscar(x) = nulo) then begin
                  X.Clave := P.Datos.Valor1;
                  X.Valor1 := P.Ocurrencias;
                  ListaMasUsadas.agregar(x);
//                end else if (ListaMasUsadas.Buscar(x) <> nulo) then begin
//                  plista := ListaMasUsadas.Buscar(x);
//                  x := ListaMasUsadas.Recuperar(plista);
//                  inc(x.Valor1);
//                  ListaMasUsadas.Actualizar(x, plista);
                end;

                while (not ListaMasUsadas.EsLLena) and (index <= MAX) do begin
                   if not Arbol.Hijo(P,index).Datos.EsTEVacio then
                     Recursion(Arbol.Hijo(P,index));
                   inc(index);
                end;
            end;
          end;
        begin
           P := Arbol.Root;
           ListaMasUsadas.Crear(cadena,MAXL);
           Recursion(P);
        end;


    Function Diccionario.Listado: Lista;

       begin
         cargarPalabras(ListaPalabras);
         Result := self.ListaPalabras;
       end;

    Function Diccionario.ListadoMU: Lista;

       begin
         cargarPalabrasMU(ListaMasUsadas);
         Result := self.ListaMasUsadas;
       end;


end.