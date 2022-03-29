unit VectorTADelements;

interface
  uses
    System.SysUtils, Math;
  const
    min = 1;
    max = 10;
  type
    TipoVector = array[min..max]of integer;
    TipoVectorS = array[min..max]of integer;
    Vector = object
      private
        items : TipoVector;
        itemsString : TipoVectorS;
      public
        procedure CargaAleatoria(min,max: integer; letra :string);
        function SumatoriaElementosVector(): integer;
        function PromedioVector(): integer;
        function MaximoDelVector(var posicion:integer): integer;
        function MinimoDelVector(var posicion : integer): integer;
        function DevolucionIntercalada(separador : string): string;
        function MultiplicacionEscalar(): Vector;
       // function SumaVectores(VectorParametro : Vector): Vector;
        procedure SetVector1(Parametros : integer);
        function GetVector1(): TipoVector;
        procedure SetPosicionElegida(posicion, Parametros : integer);
        function GetPosicionElegida(posicion: integer):integer;
       // procedure SplitParametros(cadena,separador: string; var VectorArmado:TipoVectorS);
    end;

implementation

        procedure Vector.CargaAleatoria(min,max: integer; letra :string);
        var
          i, l,n, itemAasignar: Integer;
          NuevosItems : Vector;
          Distinto, UnoIgual, bandera : boolean;
        begin
          if letra = 'NR' then begin
            bandera := TRUE
          end else begin
            bandera := FALSE
          end;


          if (bandera= TRUE) then begin
            UnoIgual := FALSE;
            Distinto := FALSE;
            randomize; // Asegura que cada numero generado sea diferente a los demas generados
            n := 0;
            i := 1;
            items[i] := random(20);
            NuevosItems.SetPosicionElegida(i,items[i]);
            while i<=max do begin
              l := i-1;
              itemAasignar:= random(20);
              if (min<i) and (i<=max) then begin
                for n := min to l do begin
                  if (itemAasignar <> Nuevositems.GetPosicionElegida(n)) and (UnoIgual=FALSE) then begin
                    Distinto := TRUE;
                    if (n = l) and (Distinto = TRUE) then begin
                      items[i] := itemAasignar;
                      NuevosItems.SetPosicionElegida(i,items[i]);
                    end;
                  end else begin
                    Distinto := FALSE;
                    UnoIgual := TRUE;
                  end;

                  if (n = l) and (Distinto = FALSE) then begin
                    i := i-1;
                  end;


                end;
                Distinto := FALSE;
                UnoIgual := FALSE;
              end;
              i := i+1;
            end;
          end else begin
            for i := min to max do begin
              items[i] := random(20);
              NuevosItems.SetPosicionElegida(i,items[i]);
            end;
          end;

        end;


        function Vector.SumatoriaElementosVector(): integer;
        var
           i , SumaTotalVector : integer;
        begin
          for i := min to max do begin
            SumaTotalVector := items[i] + SumaTotalVector;
          end;
          result := SumaTotalVector;
        end;


        function Vector.PromedioVector(): integer;
        var i, l, promedio, SumaTotal : integer;
        begin
          SumaTotal := 0;
          for i := min to max do begin
             SumaTotal := items[i] + SumaTotal;
          end;
          l := i-1;
          promedio := SumaTotal div l;
          result := promedio;
        end;


        function Vector.MaximoDelVector(var posicion:integer): integer;
        var i, Mayor : integer;
        begin
          Mayor := items[1];
          posicion := 1;
          for i := min to max do begin
             if Mayor <= items[i] then begin
                Mayor := items[i];
                posicion := i;
             end;
          end;
        result := Mayor;
        end;

        
        function Vector.MinimoDelVector(var posicion : integer): integer;
        var i, Menor : integer;
        begin
          Menor := items[1];
          posicion := 1;
          for i := min to max do begin
            if Menor >= items[i] then begin
              Menor := items[i];
              posicion := i;
            end;
          end;
          result := Menor;
        end;


        function Vector.DevolucionIntercalada(separador : string): string;
        var i : integer ;
          ListaIntercalada : string;
        begin
          for i := min to max do begin
            ListaIntercalada :=  ListaIntercalada+separador+items[i].ToString ;
          end;
        result := ListaIntercalada;
        end;


        function Vector.MultiplicacionEscalar(): Vector;
        var nEscalar, i : integer;
          NuevosItems : Vector;
        begin
          nEscalar := 2;
          for i := min to max do begin
            items[i] := items[i] * nEscalar;
            NuevosItems.SetPosicionElegida(i, items[i]);
          end;
        result := NuevosItems;
        end;

        // SET Y GET

        procedure Vector.SetVector1(Parametros : integer);
        var i: integer;
        begin
          for i := min to max do begin
            items[i] := Parametros;
          end;
        end;


        function Vector.GetVector1():TipoVector;
        begin
          result := items;
        end;

        // SET Y GET Posiciones
        function Vector.GetPosicionElegida(posicion: integer):integer;
        begin
          result := items[posicion];
        end;


        procedure Vector.SetPosicionElegida(posicion, Parametros : integer);
        begin
          items[posicion] := Parametros;
        end;

        //      _____-----____
        //procedure Vector.SplitParametros(cadena,separador: string; var VectorArmado:TipoVectorS);
       { var i, cadenaAseparar : integer;
        begin
          i := 0;
          cadenaAseparar := Pos(separador, cadena);
          while cadenaAseparar >0 do begin
            i := i+1;
            itemsString[i] := Copy(cadena,1, cadenaAseparar-1);
            cadena := Copy(cadena, cadenaAseparar+1, Length(cadena));
            cadenaAseparar := Pos(separador, cadena);
          end;
        end;}

        {function Vector.SumaVectores(VectorParametro : Vector): Vector;
        ar i, Resultado : integer;
          NuevosItems : Vector;
        begin
          for i := min to max do begin
             Resultado := VectorParametro.GetPosicionElegida(i) + items[i];
             NuevosItems.SetPosicionElegida(i,Resultado);
          end;
          result := NuevosItems;
        end;  }
        end.
