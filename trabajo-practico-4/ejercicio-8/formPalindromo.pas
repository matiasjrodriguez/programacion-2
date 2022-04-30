unit formPalindromo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls, Tipos, unitTAD,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  TForm1 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure cargar();

var
  Form1: TForm1;
  Dimension:integer;
  P: PilaPalindromo;

implementation

{$R *.dfm}

procedure cargar();
var
  i: Integer;
begin
  P.crearPila(Dimension);
  for i := Dimension - 1 downto 0 do
    if form1.StringGrid1.Cells[0,i] <> '' then
      P.apilarPila(form1.StringGrid1.Cells[0,i]);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Clear;
  cargar();
  //memo1.Lines.Add(P.mostrar);
  if P.esPalindromo then
    memo1.Lines.Add('--Es Palíndromo--')
  else
    memo1.Lines.Add('--No es Palíndromo--');
  //memo1.Lines.Add(P.mostrar);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Dimension := 10;
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  stringgrid1.RowCount := strtoint(edit1.Text);
  Dimension := strtoint(edit1.Text)
end;

end.
