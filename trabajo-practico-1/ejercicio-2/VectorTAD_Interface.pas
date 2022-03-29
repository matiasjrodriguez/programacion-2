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
    procedure Genere_VectorClick(Sender: TObject);
    procedure Devolucion_intercaladaClick(Sender: TObject);
    procedure Sumatoria_del_VectorClick(Sender: TObject);
    procedure Multiplicar_escalarClick(Sender: TObject);
    procedure Promedio_del_VectorClick(Sender: TObject);
    procedure Minimo_del_VectorClick(Sender: TObject);
    procedure Maximo_del_VectorClick(Sender: TObject);
    procedure Sumar_un_vectorClick(Sender: TObject);

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



procedure TForm1.Devolucion_intercaladaClick(Sender: TObject);
var separadorParametro : string;
  i : integer;
begin
  separadorParametro := edit2.Text;
  memo1.Lines.Add(VectorGenerado.DevolucionIntercalada( separadorParametro));
end;



procedure TForm1.Genere_VectorClick(Sender: TObject);
var letra : string;
begin
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
begin
  NuevoVector := (VectorGenerado.MultiplicacionEscalar());
  for i := min to max do begin
     s := (s+NuevoVector.GetVector1[i].ToString+ ' ');
  end;
  memo1.Lines.Add(s);
end;


procedure TForm1.Promedio_del_VectorClick(Sender: TObject);
begin
  memo1.Lines.Add(VectorGenerado.PromedioVector().ToString) //revisar
end;


procedure TForm1.Sumar_un_vectorClick(Sender: TObject);
begin
  memo1.Lines.Add(VectorGenerado.PromedioVector().ToString) //revisar
end;
{var i, cadenaAseparar : integer;
  imprimeVector, cadena : string;
begin
  cadena := edit1.Text;
  cadenaAseparar := Pos(' ', cadena);
  cadenaAseparar := Copy(cadena,1, cadenaAseparar-1);
  memo1.Lines.Add(cadenaAseparar.ToString)

end; }

{var VectorParametroListo : Vector;
  i: Integer;
  vectorEntrada : integer;
  s, s2 : string;
begin
  trystrtoint(edit1.Text,vectorEntrada);
   VectorParametro := VectorParametro.SplitParametros(vectorEntrada.ToString, ' ');
  for i := min to max do begin
     s := (s+ ' '+ VectorParametro.GetVector1[i].ToString);
     memo1.Lines.Add(s);
  end;
  VectorParametroListo := VectorGenerado.SumaVectores(VectorParametro);
  for i := min to max do begin
    s2 := (s2+ ' '+ VectorParametroListo.GetVector1[i].ToString);
    memo1.Lines.Add(s2);
  end;
end;  }


procedure TForm1.Sumatoria_del_VectorClick(Sender: TObject);
begin
  memo1.Lines.Add(VectorGenerado.SumatoriaElementosVector().ToString);
end;

end.
