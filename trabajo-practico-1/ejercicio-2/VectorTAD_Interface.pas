unit VectorTAD_Interface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VectorTADelements;

type
  TForm1 = class(TForm)
    Sumatoria_del_Vector: TButton;
    Promedio_del_Vector: TButton;
    Maximo_del_Vector: TButton;
    Minimo_del_Vector: TButton;
    Devolucion_intercalada: TButton;
    Multiplicar_escalar: TButton;
    Sumar_un_vector: TButton;
    Genere_Vector: TButton;
    Edit2: TEdit;
    Edit1: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Inserte_un_vector_separado_por_espacios: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Edit4: TEdit;
    procedure Genere_VectorClick(Sender: TObject);
    procedure Devolucion_intercaladaClick(Sender: TObject);
    procedure Sumatoria_del_VectorClick(Sender: TObject);
    procedure Multiplicar_escalarClick(Sender: TObject);
    procedure Promedio_del_VectorClick(Sender: TObject);
    procedure Minimo_del_VectorClick(Sender: TObject);
    procedure Maximo_del_VectorClick(Sender: TObject);
    procedure Sumar_un_vectorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  VectorGenerado : Vector; VectorParametro : Vector;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
  memo1.Clear;
  for i := 1 to max do begin
    memo1.Lines.Add(VectorGenerado.GetPosicionElegida(i).ToString);
  end;
  memo1.Lines.Add('------------------------');
end;

procedure TForm1.Devolucion_intercaladaClick(Sender: TObject);
var separadorParametro : string;
begin
  separadorParametro := edit2.Text;
  memo1.Lines.Add(VectorGenerado.DevolucionIntercalada(separadorParametro));
end;

procedure TForm1.Genere_VectorClick(Sender: TObject);
var letra : string;
begin
  memo1.Clear;
  letra := edit3.Text;
  VectorGenerado.CargaAleatoria(min,max,letra);
end;


procedure TForm1.Maximo_del_VectorClick(Sender: TObject);
var posicion : integer;
begin
  memo1.Lines.Add('El numero '+VectorGenerado.MaximoDelVector(posicion).ToString +' en la posicion '+ posicion.ToString);
end;


procedure TForm1.Minimo_del_VectorClick(Sender: TObject);
var posicion : integer;
begin
  memo1.Lines.Add('El numero '+VectorGenerado.MinimoDelVector(posicion).ToString+' en la posicion '+ posicion.ToString);
end;


procedure TForm1.Multiplicar_escalarClick(Sender: TObject);
var NuevoVector : Vector;
  i: Integer;
  s : string;
  escalar: integer;
begin
  trystrtoint(edit4.Text,escalar);
  NuevoVector := (VectorGenerado.MultiplicacionEscalar(escalar));
  s:= '[';
  for i := min to max do begin
     s := (s+NuevoVector.GetVector1[i].ToString+ ',');
  end;
  s := s + ']';
  memo1.Lines.Add(s);
end;


procedure TForm1.Promedio_del_VectorClick(Sender: TObject);
begin
  memo1.Lines.Add('Promedio: ' + VectorGenerado.PromedioVector().ToString)
end;


procedure TForm1.Sumar_un_vectorClick(Sender: TObject);
var V2,VR : Vector;
  i: Integer;
begin
  V2.StringAVector(trim(edit1.Text));
  VR := VectorGenerado.SumaVectores(V2);
  for i := 1 to max do
    memo1.Lines.Add(VR.GetPosicionElegida(i).ToString)
end;


procedure TForm1.Sumatoria_del_VectorClick(Sender: TObject);
begin
  memo1.Lines.Add('Sumatoria: ' + VectorGenerado.SumatoriaElementosVector().ToString);
end;

end.
