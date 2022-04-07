unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons, Unit_snake;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    Form2: TForm2;
    snake:serpiente;

implementation

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);

begin
    edit1.Text:=snake.buscarRecorrido(snake.buscarCabeza()) ;
    edit2.Text:=snake.obtenerLongitud;
end;

procedure TForm2.FormCreate(Sender: TObject);
var fila,columna:integer;
begin

  snake.cargarMatriz;
  for fila := 1 to 10 do
    begin
        StringGrid1.Cells[0,fila]:=fila.ToString;
        for columna := 1 to 10 do
          begin
              StringGrid1.Cells[columna,0]:=columna.ToString;
              StringGrid1.Cells[columna,fila]:= snake.obtenerMatriz(fila,columna);
          end;
    end;

end;

end.
