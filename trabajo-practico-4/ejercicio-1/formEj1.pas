unit formEj1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ManejoPilas,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Edit2: TEdit;
    Button2: TButton;
    Edit3: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  P: TADManejoPilas;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  n:integer;
begin
  memo1.Clear;
  n := strtoint(edit1.Text);
  P.LlenarRandom(1,10);
  memo1.Lines.Add(P.retornarString);
  memo1.Lines.Add('');
  if P.buscarClave(n) then
    memo1.Lines.Add(n.ToString + ' ENCONTRADO')
  else
    memo1.Lines.Add(n.ToString +  ' NO ENCONTRADO');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  n:integer;
begin
  memo1.Clear;
  n := strtoint(edit2.Text);
  P.LlenarRandom(1,10);
  memo1.Lines.Add(P.retornarString);
  memo1.Lines.Add('------------------------MODIFICADO--------------------------------');
  P.agregarElementoFondo(n);
  memo1.Lines.Add(P.retornarString);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  n:integer;
begin
  memo1.Clear;
  n := strtoint(edit3.Text);
  P.LlenarRandom(1,10);
  memo1.Lines.Add(P.retornarString);
  memo1.Lines.Add('------------------------MODIFICADO--------------------------------');
  P.eliminarOcurrencias(n);
  memo1.Lines.Add(P.retornarString);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Clear;
  P.LlenarRandom(1,10);
  memo1.Lines.Add(P.retornarString);
  memo1.Lines.Add('------------------------MODIFICADO--------------------------------');
  P.intercambiar;
  memo1.Lines.Add(P.retornarString);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Clear;
  P.LlenarRandom(1,10);
  memo1.Lines.Add(P.retornarString);
  memo1.Lines.Add('------------------------MODIFICADO--------------------------------');
  P.Duplicar;
  memo1.Lines.Add(P.retornarString);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  memo1.Clear;
  P.LlenarRandom(1,10);
  memo1.Lines.Add(P.retornarString);
  memo1.Lines.Add('');
  memo1.Lines.Add('Cantidad: ' + P.ContarElementos.ToString);
end;

end.
