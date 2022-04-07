program Project2;

uses
  Vcl.Forms,
  ProductoInterface in 'ProductoInterface.pas' {Form2},
  ProductoTAD in 'ProductoTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
