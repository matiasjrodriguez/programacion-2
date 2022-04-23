unit formPolinomio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADPolinomio, Vcl.ComCtrls, miListArray;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Edit3: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    Edit4: TEdit;
    UpDown2: TUpDown;
    Edit5: TEdit;
    Label4: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  P: Polinomio;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Clear;
  P.setCoeficientes(P.StringToLista(trim(edit1.Text)));
  memo1.Lines.Add('Tu Polinomio:');
  memo1.Lines.Add(P.RetornarPolinomio);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  punto:integer;
begin
  punto := strtoint(trim(edit2.Text));
  memo1.Lines.Add('Resultado en X = ' + punto.ToString + ':');
  memo1.Lines.Add(P.ResolverPolinomio(punto).ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  desde,hasta:integer;
  intervalo,V,R: double;
  Resultados:Lista;
  Valores: Lista;
  Q: PosicionLista;
begin
  desde := strtoint(edit3.Text);
  hasta := strtoint(edit4.Text);
  intervalo := strtofloat(edit5.Text);
  Resultados := (P.ResolverRango(desde,hasta,intervalo,Valores));
  Q := Resultados.Comienzo;
  memo1.Lines.Add('');
  while Q <> NULO do begin
    V := Valores.Recuperar(Q).Clave;
    R := Resultados.Recuperar(Q).Clave;
    memo1.Lines.Add('P(' + V.ToString + ') = ' + R.ToString);
    Q := Resultados.Siguiente(Q);
  end;

end;

end.
