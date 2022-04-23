program listasproj;

uses
  Vcl.Forms,
  ej1ListasForm in 'ej1ListasForm.pas' {Form1},
  Tipos in 'Tipos.pas',
  miListArray in 'miListArray.pas',
  TADmanejandoListas in 'TADmanejandoListas.pas',
  ListCursor in 'ListCursor.pas',
  ListPointer in 'ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
