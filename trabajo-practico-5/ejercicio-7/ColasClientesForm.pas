unit ColasClientesForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ColasClientesTAD, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, QueuesArray, Tipos;

const

  FILA1 : Array [0..2] of integer = (40,20,30);
  FILA2 : Array [0..1] of integer = (20,10);
  FILA3 : Array [0..2] of integer = (10,10,10);
type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Colas: TPanel;
    EditNumCola: TEdit;
    UpDown1: TUpDown;
    Panel3: TPanel;
    EditRequerido: TEdit;
    UpDown2: TUpDown;
    BotonAgregar: TButton;
    GroupBox2: TGroupBox;
    MemoResultado: TMemo;
    Panel4: TPanel;
    EditAtencion: TEdit;
    UpDown3: TUpDown;
    BotonAtender: TButton;
    procedure FormCreate(Sender: TObject);
    procedure initGrid();
    procedure clearGrid();
    procedure BotonAgregarClick(Sender: TObject);
    procedure BotonAtenderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Filas: FilasClientes;

implementation

{$R *.dfm}

procedure TForm1.BotonAgregarClick(Sender: TObject);
var
  i : integer;
begin
  i := 1;
  if Filas.TodoVacio then
    clearGrid();
  Filas.CargarFila(StrToInt(EditRequerido.Text),(StrToint(EditNumCola.Text)));
  while StringGrid1.Cells[StrToInt(EditNumCola.Text)-1,i] <> '' do
    inc(i);
  StringGrid1.Cells[StrToInt(EditNumCola.Text)-1,i] := EditRequerido.Text;
  i := 1;
end;

procedure TForm1.BotonAtenderClick(Sender: TObject);
var
  Atendidos : Cola;
begin
  Atendidos := Filas.Atender(StrToInt(EditAtencion.Text));
  MemoResultado.Clear;
  while not Atendidos.EsVacia do begin
    MemoResultado.Lines.Add(Atendidos.Recuperar.Clave);
    Atendidos.DesEncolar;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Filas.Create;
  Filas.Atender(10);
  initGrid()
end;

procedure TForm1.initGrid;

  begin
    StringGrid1.Cells[0,0] := 'Cola 1';
    StringGrid1.Cells[1,0] := 'Cola 2';
    StringGrid1.Cells[2,0] := 'Cola 3';

  end;

procedure TForm1.clearGrid;
var
  i: Integer;
  j: Integer;
  begin
    for i := 0 to StringGrid1.ColCount-1 do
      for j := 1 to StringGrid1.RowCount-1 do
        StringGrid1.Cells[i,j] := '';
  end;



end.
