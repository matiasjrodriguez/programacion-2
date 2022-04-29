program ej1Proj;

uses
  Vcl.Forms,
  formEj1 in 'formEj1.pas' {Form1},
  ManejoPilas in 'ManejoPilas.pas',
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
