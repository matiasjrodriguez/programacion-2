program ej8;

uses
  Vcl.Forms,
  formPalindromo in 'formPalindromo.pas' {Form1},
  UnitTAD in 'UnitTAD.pas',
  StackCursor in 'StackCursor.pas',
  StackPointer in 'StackPointer.pas',
  Tipos in 'Tipos.pas',
  StackArray in 'StackArray.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
