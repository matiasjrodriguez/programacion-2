unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, tipos, stackArray, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;


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
  if baseValida(b) then begin
    strResultado := '';
    pResult.Crear(cadena, max);
    while n > 0 do begin
      resultado := (n mod b);
      if resultado >= 10 then
        x.Clave := vEquivalencias[resultado]
      else
        x.Clave := resultado.ToString;
      pResult.Apilar(x);
      n := n div b;
    end;
    result := pResult.RetornarClaves;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Lines.add(cambioBase(strToint(numEdit.Text),strToint(baseEdit.Text)));
end;

end.
