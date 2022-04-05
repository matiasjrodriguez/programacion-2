program projEj9;

uses
  Vcl.Forms,
  formEj9 in 'formEj9.pas' {Form1},
  TADCarbonos in 'TADCarbonos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
