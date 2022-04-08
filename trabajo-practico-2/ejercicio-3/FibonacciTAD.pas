unit FibonacciTAD;

interface
  uses
  System.SysUtils;
  type
    Onumero = object
  private
    numero : integer;
  public
    function Fibonacci(number : integer):integer;
    end;

implementation
  function Onumero.Fibonacci(number : integer):integer;
   begin
     if (number = 1) then begin
      Fibonacci := number;
     end else if (number = 0) then begin
      Fibonacci := number;
     end else begin
        Fibonacci := (Fibonacci(number-1) + Fibonacci(number-2));
     end;
  end;
end.
