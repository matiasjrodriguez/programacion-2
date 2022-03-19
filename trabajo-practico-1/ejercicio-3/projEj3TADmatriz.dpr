program projEj3TADmatriz;

uses
  Vcl.Forms,
  TADMatrizForm in 'TADMatrizForm.pas' {Form1},
  TADMatriz in 'TADMatriz.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
