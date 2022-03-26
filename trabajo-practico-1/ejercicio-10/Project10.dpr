program Project10;

uses
  Vcl.Forms,
  formEj10 in 'formEj10.pas' {Form1},
  TADTarjetaDeCredito in 'TADTarjetaDeCredito.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
