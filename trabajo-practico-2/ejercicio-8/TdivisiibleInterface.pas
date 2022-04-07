unit TdivisiibleInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TdivisibleTAD;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
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
var NumeroENs :string;
  NumeroDiv: NumeroOf;
  posicionInicial, n : integer;
begin
  n := 99999999;
  NumeroENs := edit1.Text;
  posicionInicial := length(NumeroENs);
  memo1.Lines.Add(NumeroDiv.DivisibleXseten(NumeroENs,0,posicionInicial,n));
end;

end.
