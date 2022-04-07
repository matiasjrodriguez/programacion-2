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
     if (number > 2) then
      Fibonacci := Fibonacci(number-1) + Fibonacci(number-2)
     else
      Fibonacci := number
   end;

end.
