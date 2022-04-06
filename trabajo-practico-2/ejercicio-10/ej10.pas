unit ej10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
const
  max=20;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  matriz = array[1..max,1..max] of integer;
  vector = array [1..6] of integer;
  iVector = array of integer;
  sVector = array of string;
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure InicializarMatriz(var m:matriz);
var
  i,j: Integer;
begin
  for i := 1 to max do
    for j := 1 to max do
      m[i,j] := 0;
end;

function Sumatorias(v:vector; n:integer):sVector;
var
  I,J:integer;
  m : matriz;
  aux, auxJ: integer;
  texto:string;
  cadenas:sVector;
begin
  InicializarMatriz(m);
  I:=1;
  texto := '';
  while I <= length(v) do begin
    aux := 0;
    if v[I] <= n then begin
      texto := v[I].ToString;
      aux := V[I];
      J := I+1;
      auxJ := J+1;
      if (aux = n) then begin
        setlength(cadenas, length(cadenas)+1);
        cadenas[high(cadenas)] := texto;
      end;
      while J <= length(v) do begin
        if (aux + v[J] <= n) then begin
          texto := texto + '-' + v[J].tostring;
          aux := aux + v[J];
          if aux = n then begin
            setlength(cadenas, length(cadenas)+1);
            cadenas[high(cadenas)] := texto;
          end;
        end;
        if J = length(v) then begin
          J := auxJ;
          auxJ := J+1;
          aux := v[I];
          texto := aux.ToString;
        end else
          Inc(J);
      end;
    end;
    Inc(I);
  end;

  result := copy(cadenas);
end;

function sumatoria(numero, acumulador, I, J:integer; conjunto:vector; suma:string; cadenas:sVector):sVector;
begin
  if acumulador = numero then begin
    setLength(cadenas, length(cadenas)+1);
    cadenas[high(cadenas)] := suma;
    sumatoria := cadenas;
  end else if I = length(conjunto)+1 then begin
    sumatoria := cadenas;
  end else begin

    if (numero >= conjunto[I]) and (numero >= acumulador+conjunto[I]) then begin
      acumulador := acumulador+conjunto[I];
      suma := suma + conjunto[I].ToString + ' - ';
    end;

    sumatoria := sumatoria(numero, acumulador, I+1, J, conjunto, suma, cadenas);
  end;
  sumatoria := sumatoria(numero, acumulador, 1, J+1, conjunto, suma, cadenas);
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  m: sVector;
  v: vector;
  I: byte;
  cadena: sVector;
begin
  Randomize;
  v[1] := 10;
  v[2] := 3;
  v[3] := 1;
  v[4] := 7;
  v[5] := 4;
  v[6] := 2;


  m := sumatoria(7, 0, 1, 2, v, '', cadena);
  memo1.Lines.add('');
end;

end.