program Project1;

uses
  Vcl.Forms,
  form in 'form.pas' {Form1},
  ManejoAVL in 'ManejoAVL.pas',
  StackPointer in 'StackPointer.pas',
  Tipos in 'Tipos.pas',
  ArbolesBinarios in 'ArbolesBinarios.pas',
  ArbolesBinariosAVL in 'ArbolesBinariosAVL.pas',
  ArbolesBinariosBusqueda in 'ArbolesBinariosBusqueda.pas',
  QueuesPointer in 'QueuesPointer.pas',
  ListPointer in 'ListPointer.pas',
  BTree in 'BTree.pas',
  BTreeMejorado in 'BTreeMejorado.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
