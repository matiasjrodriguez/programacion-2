unit formArb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Tipos, ArbolesBinarios, ArbolesBinariosBusqueda, ArbolesBinariosAVL, ListPointer, TADArb,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button4: TButton;
    Edit1: TEdit;
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
  MA: ManejoArboles;
  A1: Arbol;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Clear;
  A1.Crear(Cadena,10);
  A1.CargarArbol;
  memo1.Lines.Add(A1.PreOrden);
  memo1.Lines.Add('');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  LHojas, LInt:Lista;
begin
  LHojas := MA.ListarHojas(A1);
  LInt := MA.ListarInteriores(A1);
  memo1.Lines.Add('NODOS HOJAS:');
  memo1.Lines.Add(LHojas.RetornarClaves);
  memo1.Lines.Add('NODOS INTERIORES:');
  memo1.Lines.Add(LInt.RetornarClaves);
  if MA.MismoNivel(A1) then
    memo1.Lines.Add('Las hojas estan en el mismo nivel')
  else
    memo1.Lines.Add('Las hojas NO estan en el mismo nivel');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  L:Lista;
  X: TipoElemento;
begin
  X.Clave := 'B';
  L := MA.Ocurrencias(A1,X);
  if L.EsVacia then
    memo1.Lines.Add('La clave no se encuentra en el arbol')
  else
    memo1.Lines.Add(L.RetornarClaves);
end;


procedure TForm1.Button4Click(Sender: TObject);
var
  X,XR:TipoElemento;
  LHijos, LHermanos: Lista;
begin
  X.Clave := trim(edit1.Text);
  XR := MA.Padre(X,A1);
  if not XR.EsTEVacio then
    memo1.Lines.Add('Padre: ' + XR.ArmarString)
  else
    memo1.Lines.Add('No tiene Padre / No se encuentra');

  LHijos := MA.Hijos(X,A1);
  if not LHijos.EsVacia then begin
    memo1.Lines.Add('Hijos: ');
    memo1.Lines.Add(LHijos.RetornarClaves)
  end
  else
    memo1.Lines.Add('No tiene Hijos / No se encuentra');

  LHermanos := MA.Hermanos(X,A1);
  if not LHermanos.EsVacia then begin
    memo1.Lines.Add('Hermanos: ');
    memo1.Lines.Add(LHermanos.RetornarClaves)
  end
  else
    memo1.Lines.Add('No tiene Hermanos / No se encuentra');
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  A1,A2: Arbol;
begin
  A1.Crear(Cadena,10);
  A2.Crear(Cadena,10);
  A1.CargarArbol;
  memo1.Lines.Add('A1 CARGADO');
  memo1.Lines.Add(A1.PreOrden);
  A2.CargarArbol;
  memo1.Lines.Add('A2 CARGADO');
  memo1.Lines.Add(A2.PreOrden);
  if MA.ArbolesEquivalentes(A1,A2) then
    memo1.Lines.Add('IGUALES')
  else
    memo1.Lines.Add('DISTINTOS')
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  T: Arbol;
  P: ArbolesBinarios.PosicionArbol;
  X: TipoElemento;
  LN: Lista;
begin
  memo1.Clear;
  T.Crear(Cadena,17);
  T.CargarArbol;
  memo1.Lines.Add(T.PreOrden);
  memo1.Lines.Add('Altura Binario: ' + T.Altura.ToString);
  memo1.Lines.Add('Altura N-ario: ' + MA.AlturaNario(T).ToString);
  X.Clave := 'D';
  P := T.BuscarPreOrden(X);
  memo1.Lines.Add('Nivel de ' + X.ArmarString + ': ' + MA.NivelNario(T,P).ToString);
  memo1.Lines.Add('Nodos Interiores: ');
  memo1.Lines.Add('');
  LN := MA.InterioresNario(T);
  if LN.EsVacia then
    memo1.Lines.Add('No hay nodos interiores')
  else
    memo1.Lines.Add(LN.RetornarClaves);
end;

end.
