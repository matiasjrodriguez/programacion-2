unit form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ArbolesBinariosAVL, ListPointer, Tipos,
  Vcl.StdCtrls, ManejoAVL, ArbolesBinarios, ArbolesBinariosBusqueda, BTree, BTreeMejorado;



type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
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
  O: TADAVL;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  aAVL: ArbolAVL;
  aB: Arbol;
begin
  memo1.Clear;
  aB.Crear(Cadena,10);
  aAVL.Crear(Cadena,aB.SizeTree);
  aB.CargarArbol;
  memo1.Lines.Add('Arbol Normal: ' + aB.PreOrden);
  memo1.Lines.Add('Altura: ' + aB.Altura.ToString);
  memo1.Lines.Add('');
  aAVL := O.ConvertirArbolAVL(aB);
  memo1.Lines.Add('Arbol AVL: ' + aAVL.PreOrden);
  memo1.Lines.Add('Altura: ' + aAVL.Altura.ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  AB: ArbolBB;
  AV: ArbolAVL;
  Repeticiones, I: integer;
begin
  memo1.Clear;
  Repeticiones := strtoint(edit1.Text);
  for I := 1 to Repeticiones do begin
    AB.Crear(Numero,20);
    AV.Crear(Numero,20);
    O.cargarRandomsIguales(AB,AV,1,20);
    memo1.Lines.Add('[Arbol ' + I.ToString + ']:' + ' Altura Balanceado: ' + AB.Altura.ToString +
      ' / Altura AVL: ' + AV.Altura.ToString);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  AV: ArbolAVL;
  AB: ArbolB;
  ABPlus: ArbolBMejorado;
  Repeticiones, I:integer;
begin
  memo1.Clear;
  Repeticiones := strtoint(edit1.Text);
  for i := 1 to Repeticiones do begin
    AV.Crear(Numero, 50);
    AB.Crear(Numero, 50);
    ABPlus.Crear(Numero, 50);
    O.cargarRandomsAVLyB(AV,AB,ABPlus,1,50);
    memo1.Lines.Add('[Arbol ' + I.ToString + ']:' + ' Altura AVL: ' + AV.Altura.ToString +
      ' / Altura B: ' + AB.Altura.ToString + ' / Altura B+: ' + ABPlus.Altura.ToString);
  end;
end;

end.
