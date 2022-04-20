program Project10;

uses
  Vcl.Forms,
  DisplayForm in 'DisplayForm.pas' {Form1},
  DisplayTAD in 'DisplayTAD.pas',
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
