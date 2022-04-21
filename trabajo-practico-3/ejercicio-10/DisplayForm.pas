unit DisplayForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, DisplayTAD, Vcl.Grids,
  Vcl.StdCtrls, Vcl.ExtCtrls, ListPointer;

const
  COLS0GRID : Array [0..MAXCIFRAS] of String = ('Operacion','Digito 6','Digito 5','Digito 4','Digito 3','Digito 2','Digito 1');
  ROWS0GRID : Array [1..7] of String = ('Numero 1','Numero 2' , 'Suma', 'Resta', 'Multiplicacion','Cociente Div', 'Resto Div');
type
  TForm1 = class(TForm)
    EditN1: TEdit;
    EditN2: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    GridCod7S: TStringGrid;
    Label3: TLabel;
    ButtonCargar: TButton;
    Panel3: TPanel;
    PanelValidacion: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure InitGrid();
    procedure ButtonCargarClick(Sender: TObject);
    procedure EditN1Change(Sender: TObject);
    procedure EditN2Change(Sender: TObject);
    procedure actualizarFilaGrid(fila : Integer; num : Lista);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  DisplayDigital : Digital;

implementation

{$R *.dfm}

procedure TForm1.InitGrid;
var i,j : integer;
begin
   for i := 0 to GridCod7S.RowCount-1 do
     for j := 0 to GridCod7s.ColCount-1 do begin
       GridCod7s.Cells[j,i] := '';
       GridCod7s.Cells[j,0] := COLS0GRID[j];
       GridCod7s.Cells[0,i] := ROWS0GRID[i];
     end;
end;

procedure TForm1.ButtonCargarClick(Sender: TObject);
begin
    initGrid();
    DisplayDigital.cargar(EditN1.Text,EditN2.Text);
    actualizarFilaGrid(1,DisplayDigital.getN1);
    actualizarFilaGrid(2,DisplayDigital.getN2);
    actualizarFilaGrid(3,DisplayDigital.Sumar);
    actualizarFilaGrid(4,DisplayDigital.Restar);
    actualizarFilaGrid(5,DisplayDigital.Multiplicar);
    actualizarFilaGrid(6,DisplayDigital.Division.cociente);
    actualizarFilaGrid(7,DisplayDigital.Division.resto);
end;


procedure Tform1.actualizarFilaGrid(fila: Integer; Num : Lista);
  var
   pos : PosicionLista;
   cantElem : integer;
  begin
     pos := Num.Fin;
     cantElem := Num.CantidadElementos;
     while (pos <> nil) and (cantElem > 0) do begin
        GridCod7s.Cells[cantElem + ((GridCod7s.ColCount- 1) - Num.CantidadElementos),fila] := Num.Recuperar(pos).Clave;
        pos := pos.Ante;
        dec(cantElem);
     end;
  end;


procedure TForm1.EditN1Change(Sender: TObject);
var validEdit1, validEdit2 : boolean;
begin
   validEdit1 := (Length(EditN1.Text) > 0) and (Length(EditN1.Text) <= MAXCIFRAS);
   validEdit2 := (Length(EditN1.Text) > 0) and (Length(EditN1.Text) <= MAXCIFRAS);
   if validEdit1 and validEdit2 then begin
       PanelValidacion.Color := clGreen;
       ButtonCargar.Enabled := true;
   end
   else begin
       PanelValidacion.Color := clRed;
       ButtonCargar.Enabled := false;
   end;
end;

procedure TForm1.EditN2Change(Sender: TObject);
var validEdit1, validEdit2 : boolean;
begin
   validEdit1 := ((Length(EditN1.Text) > 0) and (Length(EditN1.Text) <= MAXCIFRAS));
   validEdit2 := ((Length(EditN2.Text) > 0) and (Length(EditN1.Text) <= MAXCIFRAS));
   if validEdit1 and validEdit2 then begin
       PanelValidacion.Color := clGreen;
       ButtonCargar.Enabled := true;
   end
   else begin
       PanelValidacion.Color := clRed;
       ButtonCargar.Enabled := false;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
  begin
     InitGrid();
     DisplayDigital.Create;
  end;

end.
