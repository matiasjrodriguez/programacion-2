unit formPilasIguales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PilasIguales, Vcl.StdCtrls, Vcl.Grids, Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    StringGrid2: TStringGrid;
    Label2: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Button4: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  CP: TADCompararPilas;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  P1,P2: Pila;
  i: Integer;
  X1,X2:TipoElemento;
begin
  memo1.Clear;
  P1.Crear(Numero,LARGO);
  P2.Crear(Numero,LARGO);
  for i := 9 downto 0 do begin
    X1.Clave := strtoint(StringGrid1.Cells[0,i]);
    X2.Clave := strtoint(StringGrid2.Cells[0,i]);
    P1.Apilar(X1);
    P2.Apilar(X2);
  end;
  CP.setPilas(P1,P2);
  memo1.Lines.Add(P1.RetornarClaves);
  memo1.Lines.Add(P2.RetornarClaves);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if CP.Iguales then
    memo1.Lines.Add('Iguales')
  else
    memo1.Lines.Add('Distintas');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  PI: Pila;
begin
  PI := CP.invertirPila;
  memo1.Lines.Add(PI.RetornarClaves);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  n:integer;
  P: Pila;
begin
  n := strtoint(edit1.Text);
  P := CP.eliminarOcurrencias(n);
  memo1.Lines.Add(P.RetornarClaves);
end;


procedure TForm1.Button5Click(Sender: TObject);
var
  n,pos:integer;
begin
  n := strtoint(edit2.Text);
  pos := strtoint(edit3.Text);
  if CP.insertarElemento(n,pos) then
    memo1.Lines.Add(CP.retornarString)
  else
    memo1.Lines.Add('Fuera de Rango');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CP.CrearPilas;
end;

end.
