program projEj1;

uses
  Vcl.Forms,
  formEj1 in 'formEj1.pas' {Form1},
  TADej1 in 'TADej1.pas',
  QueuesArrayNC in 'QueuesArrayNC.pas',
  QueuesArrayNCMejorada in 'QueuesArrayNCMejorada.pas',
  QueuesCursor in 'QueuesCursor.pas',
  QueuesPointer in 'QueuesPointer.pas',
  QueuesArray in 'QueuesArray.pas',
  Tipos in 'Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
