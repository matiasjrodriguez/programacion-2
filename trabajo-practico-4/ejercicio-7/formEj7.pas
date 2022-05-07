unit formEj7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ExpresionTAD, StackPointer;

type
  TForm1 = class(TForm)
    editExpresion: TEdit;
    btnValidarExp: TButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    procedure btnValidarExpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function sacarEspacios(cadena: string):string;
var
  cadenaAux:string;
  I:byte;
begin
  cadenaAux := '';
  for I := 1 to length(cadena) do begin
    if cadena[I] <> ' ' then
      cadenaAux := cadenaAux + cadena[I];
  end;
  result := cadenaAux
end;

procedure TForm1.btnValidarExpClick(Sender: TObject);
var
  exp:Expresion;
  expCadena:string;
begin
  expCadena := sacarEspacios(trim(editExpresion.text));
  exp.setExpPila(expCadena);
  if exp.getValida then
    Label1.Caption := 'La expresión es válida.'
  else
    Label1.Caption := 'La expresión no es válida.'
end;



end.
