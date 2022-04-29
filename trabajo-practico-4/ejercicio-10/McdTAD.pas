unit McdTAD;

interface

uses

   StackCursor, System.SysUtils, System.Variants, System.Classes, Tipos;

type

   MaximoComunDivisor = Object
   private
     pilaLlamados : Pila;
     num1, num2, resultado   : integer;
   public
     function Create(n1,n2 : integer) : Resultado;
     function calcularMCD() : Pila;
     function getResultado(): integer;
   private
     procedure Apilarllamado(m,n : integer);
     function MCD(m,n : integer) : integer;
   End;


implementation

    function MaximoComunDivisor.Create(n1,n2 : integer): Resultado;
    begin
      if (n1 > 0) and (n2 > 0) then
       begin
        pilaLlamados.Crear(cadena,MAX);
        num1 := n1;
        num2 := n2;
        self.resultado := -1;
        result := Ok;
       end
      else
        result := CError;
    end;

    function MaximoComunDivisor.calcularMCD: Pila;
    begin
      MCD(self.num1,self.num2);
      result := self.pilaLlamados;
    end;

    function MaximoComunDivisor.MCD(m, n: integer): Integer;

    begin
      if (m < n) then
        result := MCD(n,m)
      else begin
             //uso siempre primer parametro como el mayor
        if (m mod n = 0) then
        begin
          apilarLLamado(m,n);
          if m <> n then
            apilarLLamado(n,n);
          self.resultado := n;
          result := n;
        end
        else begin
          apilarLLamado(m,n);
          result := MCD(n,m mod n);
        end;
      end;
    end;

    procedure MaximoComunDivisor.ApilarLlamado(m,n : integer);
    var
      llamado : TipoElemento;
    begin
      llamado.Clave := 'MDC('+m.ToString+','+n.ToString+')';
      self.pilaLlamados.Apilar(llamado);
    end;

    function MaximoComunDivisor.getResultado: Integer;
    begin
      if self.resultado = -1 then
         MCD(self.num1,self.num2);
      result := self.resultado;
    end;


end.
