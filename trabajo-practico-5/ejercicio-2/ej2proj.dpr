program ej2proj;

uses
  Vcl.Forms,
  form2 in 'form2.pas' {Form1},
  TADColas2 in 'TADColas2.pas',
  QueuesCursor in 'QueuesCursor.pas',
  QueuesPointer in 'QueuesPointer.pas',
  Tipos in 'Tipos.pas',
  QueuesArray in 'QueuesArray.pas',
  QueuesArrayNC in 'QueuesArrayNC.pas',
  QueuesArrayNCMejorada in 'QueuesArrayNCMejorada.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
