program Project7;

uses
  Vcl.Forms,
  ListadoDeMultasForm in 'ListadoDeMultasForm.pas' {Form1},
  ListadoDeMultasTAD in 'ListadoDeMultasTAD.pas',
  ListArray in 'ListArray.pas',
  ListCursor in 'ListCursor.pas',
  ListPointer in 'ListPointer.pas',
  Tipos in 'Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
