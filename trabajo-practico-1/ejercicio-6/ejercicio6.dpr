program ejercicio6;

uses
  Vcl.Forms,
  formEj6 in 'formEj6.pas' {Form1},
  TADEstacionamiento in 'TADEstacionamiento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
