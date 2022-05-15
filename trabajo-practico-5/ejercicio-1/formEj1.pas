unit formEj1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, QueuesPointer, TADej1;

const
  LIM = 10;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  C1,C2:Cola;
  TMC: TADmanejoColas;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Clear;
  memo2.Clear;
  memo3.Clear;
  C1.LLenarClavesRandom(LIM,1,20);
  C2.LLenarClavesRandom(LIM,1,20);

  TMC.ConcatenarColas(C1,C2);
  memo3.Lines.Add(C1.RetornarClaves);
  if TMC.estaEnCola(C1,5) then
    memo3.Lines.Add('ESTA')
  else
    memo3.Lines.Add('NO ESTA');
  C2.LlenarClavesRandom(LIM,1,20);
  memo2.Lines.Add(C2.RetornarClaves);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  CR: Cola;
begin
  memo2.Clear;
  CR := TMC.insertarEnCola(5,420,C2);
  memo2.Lines.Add(CR.RetornarClaves);
end;

end.
