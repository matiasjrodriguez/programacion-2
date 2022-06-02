program Project1;

uses
  Vcl.Forms,
  formArb in 'formArb.pas' {Form1},
  TADArb in 'TADArb.pas',
  ArbolesBinarios in 'ArbolesBinarios.pas',
  ArbolesBinariosAVL in 'ArbolesBinariosAVL.pas',
  ArbolesBinariosBusqueda in 'ArbolesBinariosBusqueda.pas',
  QueuesPointer in 'QueuesPointer.pas',
  StackPointer in 'StackPointer.pas',
  Tipos in 'Tipos.pas',
  ListPointer in 'ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
