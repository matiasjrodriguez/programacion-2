program projPolinomio;

uses
  Vcl.Forms,
  formPolinomio in 'formPolinomio.pas' {Form1},
  TADPolinomio in 'TADPolinomio.pas',
  miListArray in 'miListArray.pas',
  Tipos in 'Tipos.pas',
  ListCursor in 'ListCursor.pas',
  ListPointer in 'ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
