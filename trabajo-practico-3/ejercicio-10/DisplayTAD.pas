unit DisplayTAD;

interface

uses ListPointer, Tipos, System.SysUtils, System.Variants, System.Classes;

const
     MAXCIFRAS = 6;
     Cod7S : Array [0..9] of String = ('1111110','0110000','1101101','1111001','0110011','1011011','1011111','1110000','1111111','1111011');

type

  CocientRest = Record
    cociente : Lista;
    resto    : Lista;

  End;

  Digital = Object
    private
       numero1, numero2 : Lista;

    public
       constructor Create();
       function cargar(n1,n2 : String) : Resultado;
       function getN1 () : Lista;
       function getN2 () : Lista;
       function Sumar() : Lista;
       function Restar() : Lista;
       function Multiplicar() : Lista;
       function Division() : CocientRest;
    private
       function numToCod7s(n : String) : Lista;
       function Code7SToNum(n : Lista) : String;

  End;


implementation

    constructor Digital.Create;
      // los numeros seran Strings para poder manejar mas facil sus cifras.
    begin
      self.numero1.Crear(cadena,MAXCIFRAS);
      self.numero2.Crear(cadena,MAXCIFRAS);
    end;


    function Digital.cargar(n1: string; n2: string) : Resultado;
    begin
       if (Length(n1)<= MAXCIFRAS) and (Length(n2) <= MAXCIFRAS) then begin
         self.numero1:= numToCod7s(n1);
         self.numero2:= numToCod7s(n2);
         result := Resultado.OK;
       end
       else
         result := Resultado.CError;
    end;

    function Digital.numToCod7s(n: string): Lista;
    var
      TipoN : TipoElemento;
      Lnum : Lista;
      i: Integer;
      j: Integer;
    begin
      Lnum.Crear(cadena,MAXCIFRAS);
       for i := 1 to Length(n) do begin
         TipoN.Inicializar(cadena,Cod7s[StrToInt(n[i])]);
         TipoN.Clave := Cod7s[StrToInt(n[i])];
         TipoN.Valor1:= Cod7s[StrToInt(n[i])];
         Lnum.Agregar(TipoN)
      end;
      result := Lnum;
    end;

    function Digital.getN1: Lista;
      begin
        result := self.numero1;
      end;

    function Digital.getN2: Lista;

    begin
        result := self.numero2;
    end;

    function Digital.Sumar: Lista;
    var
     n1,n2,suma : integer;
    begin
      n1 := StrToInt(Code7SToNum(self.numero1));
      n2 := StrToInt(Code7SToNum(self.numero2));
      suma := n1+n2;
      if Length(suma.ToString)<=5 then
         result := numToCod7s(suma.ToString);
    end;

    function Digital.Restar: Lista;
    var
    n1,n2,resta : integer;
    begin
      n1 := StrToInt(Code7SToNum(self.numero1));
      n2 := StrToInt(Code7SToNum(self.numero2));
      resta := n1-n2;
      if resta >= 0 then
        result := numToCod7s(resta.ToString);
    end;

    function Digital.Multiplicar: Lista;
    var
     n1,n2,multi : integer;
    begin
      n1 := StrToInt(Code7SToNum(self.numero1));
      n2 := StrToInt(Code7SToNum(self.numero2));
      multi := n1*n2;
      if Length(multi.ToString)<=5 then
         result := numToCod7s(multi.ToString);
    end;

    function Digital.Division: CocientRest;
    var
      n1,n2,cociente,resto : integer;
      resultado : CocientRest;
    begin
      n1 := StrToInt(Code7SToNum(self.numero1));
      n2 := StrToInt(Code7SToNum(self.numero2));
      if n2 > 0 then begin
        cociente := n1 div n2;
        resto := n1 mod n2;
        resultado.cociente := numToCod7s(cociente.ToString);
        resultado.resto    := numToCod7s(resto.ToString);
      end
      else begin
        resultado.cociente := numToCod7s('');
        resultado.resto    := numToCod7s('');
      end;
      result := resultado;
    end;

    function Digital.Code7SToNum(n : Lista) : String;
    var
      numStr : String;
      i: Integer;
      j: Integer;
      p : PosicionLista;
    begin
      numStr := '';
      p := n.Comienzo;
        while p <> Nil do begin
            j := 0;
            while (n.Recuperar(p).Clave <> Cod7s[j]) and (j <= 9)do
              inc(j);
            numStr := numStr+j.ToString;
            p := p.Prox;
        end;
      result := numStr;
    end;

end.
