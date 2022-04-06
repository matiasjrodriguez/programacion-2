unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADBomba;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  B:OBomba;
  V: Vector;
  numero,i:integer;
  s:string;
begin
  B.InicializarVector;
  numero:= strtoint(edit1.Text);
  B.setBomba(strtoint(edit2.Text));
  V := B.Explotar(numero,1);
  for i := 1 to length(V) do
    if V[i] <> 0 then
      s := s + V[i].ToString + ', ';
  s := '[' + s + ']';
  memo1.Lines.Add(s);
end;

end.
