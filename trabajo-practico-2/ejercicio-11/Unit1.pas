unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Vector = array[1..10] of integer;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Explotar(bomba,n,i:integer;V:Vector): Vector;
var
  n1:integer;
begin
  if n <= bomba then begin
    V[i]:= n;
    Explotar := V;
  end
  else begin
    n1 := n div bomba;
    if n1 > bomba then begin
      Explotar := Explotar(bomba,n1,i,V);
    end
    else begin
      V[i] := n1;
      Explotar := Explotar(bomba,(n - (n div bomba)),i+1,V);
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  V:Vector;
begin
  for I := 1 to length(v) do
    v[i] := 0;
  V := Explotar(5,20,1,V);
end;

end.
