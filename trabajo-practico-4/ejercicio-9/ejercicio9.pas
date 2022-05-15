unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, tipos, stackpointer, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;


type

  array15Char = array [1..15] of string;


  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    baseEdit: TLabeledEdit;
    numEdit: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  vEquivalencias : array15Char = ('','','','','','','','','','A','B','C','D','E','F');

var
  Form1: TForm1;

implementation

{$R *.dfm}

function baseValida(b:integer):boolean;
begin
  result := true;
  if (b < 2) or (b > 16) then result := false;
end;

function cambioBase(n,b:integer ):string;
var
  pResult:pila;
  resultado:integer;
  x:tipoelemento;
  strResultado:string;
begin
  if n = 0 then begin
    result := '0';
    exit;
  end;
  if baseValida(b) then begin // 1
    strResultado := ''; // 1
    pResult.Crear(cadena, max); // const
    while n > 0 do begin // log n
      resultado := (n mod b);  // const
      if resultado >= 10 then // const
        x.Clave := vEquivalencias[resultado] // const
      else
        x.Clave := resultado.ToString; // const
      pResult.Apilar(x);  // const
      n := n div b;  // const
    end; // complejidad algoritmica O(log n)
    result := pResult.RetornarClaves; // const
  end
  else
    result := 'La base ingresada no es válida';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Lines.add(cambioBase(strToint(numEdit.Text),strToint(baseEdit.Text)));
end;

end.
