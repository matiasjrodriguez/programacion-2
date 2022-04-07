program Project2;

uses
  Vcl.Forms,
  InterfaceOndas in 'InterfaceOndas.pas' {Form2},
  OndasTAD in 'OndasTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
