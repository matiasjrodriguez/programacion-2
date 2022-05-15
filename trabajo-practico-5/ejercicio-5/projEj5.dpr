program projEj5;

uses
  Vcl.Forms,
  formEj5 in 'formEj5.pas' {Form1},
  Ej5 in 'Ej5.pas',
  ListArray in 'ListArray.pas',
  ListCursor in 'ListCursor.pas',
  ListPointer in 'ListPointer.pas',
  QueuesArray in 'QueuesArray.pas',
  QueuesArrayNC in 'QueuesArrayNC.pas',
  QueuesArrayNCMejorada in 'QueuesArrayNCMejorada.pas',
  QueuesCursor in 'QueuesCursor.pas',
  QueuesPointer in 'QueuesPointer.pas',
  StackArray in 'StackArray.pas',
  StackCursor in 'StackCursor.pas',
  StackPointer in 'StackPointer.pas',
  Tipos in 'Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
