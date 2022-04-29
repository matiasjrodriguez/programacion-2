program ej2Proj;

uses
  Vcl.Forms,
  formPilasIguales in 'formPilasIguales.pas' {Form1},
  PilasIguales in 'PilasIguales.pas',
  StackArray in 'StackArray.pas',
  StackCursor in 'StackCursor.pas',
  StackPointer in 'StackPointer.pas',
  Tipos in 'Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
