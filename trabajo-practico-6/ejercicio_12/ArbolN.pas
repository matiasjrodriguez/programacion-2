unit ArbolN;

interface

uses
    System.SysUtils, System.Variants, System.Classes, Tipos, QueuesPointer, StackPointer;

const

  Nulo= Nil;
  MIN = 'A';
  MAX = 'Ñ';

type

    PosicionArbol = ^NodoArbol;

    Hijos = Array [MIN..MAX] of PosicionArbol;

    NodoArbol = Object
      public
        Datos: TipoElemento;
        H : Hijos;
        Ocurrencias : integer;
    End;





    ArbolNario = Object
       private
          Raiz : PosicionArbol;
          TDatoDeLaClave: TipoDatosClave;
       public
          Function Crear(): Resultado;
          Function EsVacio(): Boolean;
          Function RamaNula(P:PosicionArbol): Boolean;
          Function Recuperar(P:PosicionArbol): TipoElemento;
          Function Hijo(P:PosicionArbol; index : Char): PosicionArbol;
          Function InsertarPalabra(Palabra : String):Resultado;
          Function Root(): PosicionArbol;
          Function CrearNodo(X:TipoElemento): PosicionArbol;
          Function UltimaLetra(P : PosicionArbol; C : String) : PosicionArbol;
          procedure IncrementarOcurrencia(C : String);

    End;

implementation

     function ArbolNario.Crear(): Resultado;
     var
        X : TipoElemento;
        begin
          self.raiz := ArbolNario.CrearNodo(X.TipoElementoVacio);
          self.TDatoDeLaClave := cadena;
          Crear := OK;
        end;

     function ArbolNario.EsVacio: Boolean;
        Begin
          EsVacio := (raiz = Nulo);
        End;

     Function ArbolNario.RamaNula(P:PosicionArbol): Boolean;
        begin
          RamaNula := (P = Nulo);
        end;

     Function ArbolNario.Recuperar(P:PosicionArbol): TipoElemento;
        begin
           Var X: TipoElemento;
              Begin
                Recuperar := X.TipoElementoVacio;
                If Not RamaNula(P) Then
                Begin
                  Recuperar := P^.Datos;
                End;
              End;
        end;

     Function ArbolNario.Hijo(P:PosicionArbol;index : Char): PosicionArbol;
       begin
         Hijo := Nulo;
         if P <> Nulo then
             if (P.H[index] <> Nulo) then
               Hijo:= P.H[index];
       end;

     Function ArbolNario.Root: PosicionArbol;
       begin
         Root := raiz;
       end;

     Function ArbolNario.InsertarPalabra(Palabra : String): Resultado;
     Var
       Pos : PosicionArbol;
       procedure insertando(P : PosicionArbol;C : String);
       var
         X : TipoElemento;
         N : PosicionArbol;
         Letra : char;
       begin
          if C <> C.Empty then begin
            Letra := C[1];
            X.Clave := Letra;
            if (P.H[Letra].Datos.EsTEVacio) then begin
               N := ArbolNario.CrearNodo(X);
               P.H[Letra] := N;
            end;
            insertando(P.H[C[1]],Copy(C,2,Length(C)-1));
          end
          else if P.Datos.Valor1 = '' then begin
            P.Datos.Valor1 := Palabra;
          end;
       end;

     begin
       Pos := self.raiz;
       insertando(Pos,Palabra.ToUpper);
       InsertarPalabra := Ok;
     end;

     Function ArbolNario.CrearNodo(X:TipoElemento): PosicionArbol;
      Var P,H: PosicionArbol;
       i: AnsiChar;
      Begin
        New(P);
        New(H);
        P^.Datos := X;
        P^.Ocurrencias := 0;
        H^.Datos := X.TipoElementoVacio;
        for i := MIN to MAX do
          P^.H[i] := H;
        CrearNodo := P;
      End;

      function ArbolNario.UltimaLetra(P : PosicionArbol; C : String) : PosicionArbol;
      var
          X  : TipoElemento;
          PHijo : PosicionArbol;
        begin
        if (C < MIN) or (C > MAX) then
          result := P

        else
          if Hijo(P,C[1]).Datos.EsteVacio then begin
             result := P;
          end
          else begin
            PHijo := Hijo(P,C[1]);
            C := Copy(C,2,Length(C)-1);
            result := UltimaLetra(PHijo,C);
          end;
        end;

      procedure ArbolNario.IncrementarOcurrencia(C : String);
        Var P : PosicionArbol;
      begin
        P := root;
        P := ArbolNario.UltimaLetra(P,C);
        P.Ocurrencias := P.Ocurrencias+1;
      end;

end.
