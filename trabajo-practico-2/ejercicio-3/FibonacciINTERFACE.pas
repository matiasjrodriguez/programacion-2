unit FibonacciINTERFACE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FibonacciTAD;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var numero : integer;
  n : Onumero;
begin
 memo1.clear;
 TrySTrToInt(edit1.Text,numero);
 memo1.Lines.Add(n.Fibonacci(numero).ToString);
end;

end.
