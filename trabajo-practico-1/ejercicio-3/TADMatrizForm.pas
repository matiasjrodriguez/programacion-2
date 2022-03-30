unit TADMatrizForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TADMatriz, Vcl.Grids, Vcl.StdCtrls,
  Vcl.ComCtrls, VectorTADelements;

type
  TForm1 = class(TForm)
    SGMatriz1: TStringGrid;
    SGMatriz2: TStringGrid;
    rbSumar: TRadioButton;
    rbMultiplicar: TRadioButton;
    Label1: TLabel;
    SGMatrizResultado: TStringGrid;
    Memo1: TMemo;
    UpDown1: TUpDown;
    eTamaño: TEdit;
    Label2: TLabel;
    btResultado: TButton;
    btMaxFila: TButton;
    Label3: TLabel;
    Label4: TLabel;
    eEscalar: TEdit;
    btEscalar: TButton;
    UpDown2: TUpDown;
    btBuscar: TButton;
    eBuscar: TEdit;
    btDiagonales: TButton;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure eTamañoChange(Sender: TObject);
    procedure btResultadoClick(Sender: TObject);
    procedure btMaxFilaClick(Sender: TObject);
    procedure btEscalarClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure btDiagonalesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure CargarMatrices();
  procedure MostrarGridResultado();
  function ValidarGrids():boolean;
  procedure InicializarGrids();
  procedure AsignarDimension(d:integer);

var
  Form1: TForm1;
  dimension : integer;
  M1,M2,MR: Matriz;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
  rbSumar.Checked := True;
  AsignarDimension(5);
  InicializarGrids();
  cargarMatrices();
end;

procedure TForm1.eTamañoChange(Sender: TObject);
begin
  AsignarDimension(strtoint(eTamaño.Text));
  SGMatriz1.RowCount := M1.getDimension;
  SGMatriz1.ColCount := M1.getDimension;
  SGMatriz2.RowCount := M2.getDimension;
  SGMatriz2.ColCount := M2.getDimension;
  SGMatrizResultado.RowCount := MR.getDimension;
  SGMatrizResultado.ColCount := MR.getDimension;
  InicializarGrids();
  cargarMatrices();

end;

procedure TForm1.btResultadoClick(Sender: TObject);
begin
  if ValidarGrids() then begin

    if rbSumar.Checked then begin
      CargarMatrices();
      MR := M1.Sumar(M2);
      MostrarGridResultado();
    end
    else if rbMultiplicar.Checked then begin
      CargarMatrices();
      MR := M1.Multiplicar(M2);
      MostrarGridResultado();
    end;

  end
  else begin
    Memo1.Clear;
    Memo1.Lines.Add('ERROR: Entrada invalida en una Matriz');
    Exit;
  end;

end;

procedure TForm1.btBuscarClick(Sender: TObject);
var
  n,nFila,nColumna:integer;
begin
   if ValidarGrids()  then begin

    if trystrtoint(trim(eBuscar.Text),n) then begin

      cargarMatrices();

      n := strtoint(trim(eBuscar.Text));
      if M1.Buscar(n,nFila,nColumna) then begin
        memo1.Clear;
        memo1.Lines.Add('El número ' + n.ToString + ' se encuentra en la posicion [' + nFila.ToString + ',' + nColumna.ToString + ']');
      end
      else begin
        memo1.Clear;
        memo1.Lines.Add('El número ' + n.ToString + ' no se encuentra en la matriz');
      end;
    end
    else begin
      memo1.Clear;
      memo1.Lines.Add('ERROR: Entrada Invalida. Ingrese un número valido');
      Exit;
    end;

   end
   else begin
    Memo1.Clear;
    Memo1.Lines.Add('ERROR: Entrada invalida en una Matriz');
    Exit;
   end;
end;

procedure TForm1.btDiagonalesClick(Sender: TObject);
var
  DPrincipal, DOpuesta: Vector;
  i: integer;
  s: string;
begin
  if ValidarGrids() then begin
    CargarMatrices();
    DPrincipal := M1.DiagonalPrincipal();
    DOpuesta := M1.DiagonalOpuesta;
    memo1.Clear;
    s := '';
    for i := 1 to M1.getDimension do
      s := s + DPrincipal.GetPosicionElegida(i).ToString + '; ';
    memo1.Lines.Add('Diagonal principal: ' + s);
    s := '';

    for i := 1 to M1.getDimension do
      s := s + DOpuesta.GetPosicionElegida(i).ToString + '; ';
    memo1.Lines.Add('');
    memo1.Lines.Add('Diagonal Opuesta: ' + s);
  end
  else begin
    Memo1.Clear;
    Memo1.Lines.Add('ERROR: Entrada invalida en una Matriz');
    Exit;
  end;
end;

procedure TForm1.btEscalarClick(Sender: TObject);
var n: integer;
begin
  if ValidarGrids() then begin
    CargarMatrices();
    n := strtoint(eEscalar.Text);
    MR := M1.Escalar(n);
    MostrarGridResultado()
  end
  else begin
    Memo1.Clear;
    Memo1.Lines.Add('ERROR: Entrada invalida en una Matriz');
    Exit;
  end;
end;

procedure TForm1.btMaxFilaClick(Sender: TObject);
var MaxFila,MaxCol,sumaF,sumaC:integer;
begin
  if ValidarGrids() then begin
    CargarMatrices();
    MaxFila := M1.MaximaFila(sumaF);
    MaxCol := M1.MaximaColumna(sumaC);
    memo1.Clear;
    memo1.Lines.Add('La ' + MaxFila.ToString + 'º fila tiene mayor sumatoria con resultado ' + sumaF.ToString);
    memo1.Lines.Add('La ' + MaxCol.ToString + 'º columna tiene mayor sumatoria con resultado ' + sumaC.ToString);
  end
  else begin
    Memo1.Clear;
    Memo1.Lines.Add('ERROR: Entrada invalida en una Matriz');
    Exit;
  end;
end;

procedure MostrarGridResultado();
var
  i: Integer; j: integer;
begin
  for i := 1 to dimension do
    for j := 1 to dimension do begin
      form1.SGMatrizResultado.Cells[j-1,i-1] := MR.getItem(i,j).ToString;
    end;
end;

procedure CargarMatrices();
var
  i: Integer; j: Integer;
begin
  for i := 1 to dimension do
    for j := 1 to dimension do begin
      M1.setItem(i,j,strtoint(trim(form1.SGMatriz1.Cells[j-1,i-1])));
      M2.setItem(i,j,strtoint(trim(form1.SGMatriz2.Cells[j-1,i-1])));
      MR.setItem(i,j,strtoint(trim(form1.SGMatrizResultado.Cells[j-1,i-1])));
    end;
end;

function ValidarGrids():boolean;
var
  i,j,n: integer;
begin
  for i := 1 to dimension do
    for j := 1 to dimension do
      if (not trystrtoint(form1.SGMatriz1.Cells[j-1,i-1], n)) or
      (not trystrtoint(form1.SGMatriz2.Cells[j-1,i-1], n)) then begin
        result := False;
        Exit;
      end;
  result := True;
end;

procedure InicializarGrids();
var i,j:integer;
begin
  for i := 1 to dimension do
    for j := 1 to dimension do begin
      form1.SGMatriz1.Cells[j-1,i-1] := 0.toString;
      form1.SGMatriz2.Cells[j-1,i-1] := 0.toString;
      form1.SGMatrizResultado.Cells[j-1,i-1] := 0.toString;
    end;
end;

procedure AsignarDimension(d:integer);
begin
  M1.setDimension(d);
  M2.setDimension(d);
  MR.setDimension(d);
  dimension := M1.getDimension;
end;

end.
