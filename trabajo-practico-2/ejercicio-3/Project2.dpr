program Project2;

uses
  Vcl.Forms,
  FibonacciINTERFACE in 'FibonacciINTERFACE.pas' {Form2},
  FibonacciTAD in 'FibonacciTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
