program projEj12;

uses
  Vcl.Forms,
  formEj12 in 'formEj12.pas' {Form1},
  TADCampoMinado in 'TADCampoMinado.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
