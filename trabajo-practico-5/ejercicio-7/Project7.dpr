program Project7;

uses
  Vcl.Forms,
  ColasClientesForm in 'ColasClientesForm.pas' {Form1},
  ColasClientesTAD in 'ColasClientesTAD.pas',
  QueuesArray in 'QueuesArray.pas',
  QueuesArrayNC in 'QueuesArrayNC.pas',
  QueuesArrayNCMejorada in 'QueuesArrayNCMejorada.pas',
  QueuesCursor in 'QueuesCursor.pas',
  QueuesPointer in 'QueuesPointer.pas',
  Tipos in 'Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
