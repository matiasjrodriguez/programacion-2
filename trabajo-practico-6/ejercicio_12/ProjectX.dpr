program ProjectX;

uses
  Vcl.Forms,
  form in 'form.pas' {Form1},
  Tipos in '..\TADs\Tipos.pas',
  ArbolN in 'ArbolN.pas',
  ArbolesBinariosAVL in '..\TADs\ArbolesBinariosAVL.pas',
  QueuesPointer in '..\TADs\QueuesPointer.pas',
  StackPointer in '..\TADs\StackPointer.pas',
  ListPointer in '..\TADs\ListPointer.pas',
  DiccionarioTAD in 'DiccionarioTAD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
