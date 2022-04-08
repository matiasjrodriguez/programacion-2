unit ej10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADConjunto;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    eVector: TEdit;
    eNumero: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  Conjunto: OConjunto;

implementation

{$R *.dfm}

function Split(cadena: string):iVector;
var
  i,p: integer;
  V:iVector;
begin
  i := 1;
  cadena := cadena + ' ';
  p := pos(' ', cadena);
  while P > 0 do begin
    Inc(i);
    setlength(V,length(V)+1);
    V[high(V)] := strtoint(Copy(cadena, 1, p - 1));
    cadena := copy(cadena, P + 1, length(cadena));
    p := pos(' ', cadena);
  end;
  result := V;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  m: sVector;
  v: ivector;
  n: integer;
  i: Integer;
begin
  memo1.Clear;
  n := strtoint(eNumero.Text);
  v := split(trim(eVector.Text));
  Conjunto.setConjunto(V);
  m := Conjunto.iniciarSumatoria(n,v);
  for i := low(m) to high(m) do
    memo1.Lines.Add(m[i]);
end;

end.
