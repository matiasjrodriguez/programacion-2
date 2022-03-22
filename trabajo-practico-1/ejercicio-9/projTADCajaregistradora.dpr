program projTADCajaregistradora;

uses
  Vcl.Forms,
  TADCajaRegistradoraForm in 'TADCajaRegistradoraForm.pas' {Form1},
  TADCajaRegistradora in 'TADCajaRegistradora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
