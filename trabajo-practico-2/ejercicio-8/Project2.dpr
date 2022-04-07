program Project2;

uses
  Vcl.Forms,
  TdivisiibleInterface in 'TdivisiibleInterface.pas' {Form2},
  TdivisibleTAD in 'TdivisibleTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
