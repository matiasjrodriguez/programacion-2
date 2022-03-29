program Project1;

uses
  Vcl.Forms,
  VectorTAD_Interface in 'VectorTAD_Interface.pas' {Form1},
  VectorTADelements in 'VectorTADelements.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
