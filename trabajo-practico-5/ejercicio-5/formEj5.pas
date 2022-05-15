unit formEj5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  ListArray, QueuesArrayNC, StackArray, Tipos, Ej5;

const
  DESDE = 1;
  HASTA = 30;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Memo3: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  C: Cola;
  P: Pila;
  L: Lista;
  TE5: TADEj5;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Clear;
  memo2.Clear;
  button2.Enabled := True;
  C.LlenarClavesRandom(10,DESDE,HASTA);
  P.LlenarClavesRandom(10,DESDE,HASTA);
  memo1.Lines.Add(C.RetornarClaves);
  memo2.Lines.Add(P.RetornarClaves);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo3.Clear;
  L := TE5.ValoresComunes(C,P);
  memo3.Lines.Add(L.RetornarClaves);
end;

end.
