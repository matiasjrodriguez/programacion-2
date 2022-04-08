unit ej10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADConjunto;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  conjunto: OConjunto;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
var
  m: sVector;
  v: vector;
  cadena: sVector;
begin
  Randomize;
  v[1] := 1;
  v[2] := 2;
  v[3] := 3;
  v[4] := 4;
  v[5] := 5;
  v[6] := 6;


  m := OConjunto.iniciar
  memo1.Lines.add('');
end;

end.
