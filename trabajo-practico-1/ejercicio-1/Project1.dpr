program Project1;

uses
  Vcl.Forms,
  NumeroRacionalTADinterface in 'NumeroRacionalTADinterface.pas' {Operaciones},
  NumeroRacionalTAD in 'NumeroRacionalTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TOperaciones, Operaciones);
  Application.Run;
end.
