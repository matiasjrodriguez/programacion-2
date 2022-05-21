unit form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, QueuesPointer, Unit1,
  Vcl.StdCtrls;

const
  v1 : array[1..7] of string = ('A', 'B', 'E', 'D', 'H', 'A', 'Z');
  v2 : array[1..6] of string = ('B', 'A', 'D', 'H', 'Z', 'E');

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;   objeto: a;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  C1, C2: Cola;
  I:byte;
  X:TipoElemento;
  b: boolean;
begin
  C1.Crear(Cadena, 7);
  C2.Crear(Cadena, 6);

  for I := 1 to length(v2) do begin
    X.Clave := v1[I];
    C1.Encolar(X);
    X.Clave := v2[I];
    C2.Encolar(X);
  end;

  X.Clave := v1[I];
  C1.Encolar(X);

  memo1.clear;
  memo1.Lines.Add(C1.RetornarClaves);
  memo1.Lines.Add(C2.RetornarClaves);

  if objeto.sonIguales(C1, C2) and objeto.sonIguales(C2, C1) then
    memo1.Lines.add('Son iguales')
  else
    memo1.Lines.Add('No son iguales');

  memo1.Lines.Add('La cola no se rompe');

  memo1.Lines.Add(C1.RetornarClaves);
  memo1.Lines.Add(C2.RetornarClaves);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  C1, C2: Cola;
begin
  C1.Crear(Cadena, 10);
  C2.Crear(Cadena, 10);

  C1.LLenarClavesRandom(10, 1, 4);
  C2.LLenarClavesRandom(10, 1, 4);

  memo1.clear;
  memo1.Lines.Add(C1.RetornarClaves);
  memo1.Lines.Add(C2.RetornarClaves);

  if objeto.sonIguales(C1, C2) and objeto.sonIguales(C2, C1) then
    memo1.Lines.add('Son iguales')
  else
    memo1.Lines.Add('No son iguales');

  memo1.Lines.Add('La cola no se rompe');

  memo1.Lines.Add(C1.RetornarClaves);
  memo1.Lines.Add(C2.RetornarClaves);

end;


end.
