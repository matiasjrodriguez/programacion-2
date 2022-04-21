program projAgenda;

uses
  Vcl.Forms,
  formAgenda in 'formAgenda.pas' {Form1},
  miListArray in 'miListArray.pas',
  Tipos in 'Tipos.pas',
  AgendaTAD in 'AgendaTAD.pas',
  ListPointer in 'ListPointer.pas',
  ListCursor in 'ListCursor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
