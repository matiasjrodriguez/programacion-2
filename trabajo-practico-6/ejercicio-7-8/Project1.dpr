program Project1;

uses
  Vcl.Forms,
  formABM in 'formABM.pas' {Form1},
  TADABM in 'TADABM.pas',
  Tipos in 'Tipos.pas',
  ArbolesBinariosBusqueda in 'ArbolesBinariosBusqueda.pas',
  QueuesPointer in 'QueuesPointer.pas',
  StackPointer in 'StackPointer.pas',
  ListPointer in 'ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
