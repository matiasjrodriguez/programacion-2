program ejercicio10;

uses
  Vcl.Forms,
  McdForm in 'McdForm.pas' {Form1},
  McdTAD in 'McdTAD.pas',
  StackCursor in 'StackCursor.pas',
  Tipos in 'Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
