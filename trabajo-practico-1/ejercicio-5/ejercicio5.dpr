program ejercicio5;

uses
  Vcl.Forms,
  formEj5 in 'formEj5.pas' {Form1},
  TADFecha in 'TADFecha.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
