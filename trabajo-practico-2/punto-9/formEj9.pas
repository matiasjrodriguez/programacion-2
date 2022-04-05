unit formEj9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, TADCarbonos;

type
  TForm1 = class(TForm)
    sg: TStringGrid;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MB: Mbool;
  CB: Carbonos;

implementation

{$R *.dfm}

procedure cargarMatriz(var M:MChars);
var
  i,j:integer;
begin
  for I := 1 to FILAS do
    for j := 1 to COLUMNAS do
      M[i,j] := trim(form1.sg.Cells[j,i]).ToUpper[1];
end;

procedure InicializarGrid();
var i,j:integer;
begin
  form1.memo1.Clear;
  for i := 1 to FILAS do
    for j := 1 to COLUMNAS do
      form1.sg.Cells[j,i] := '.';
  form1.sg.Cells[1,1]:= 'C';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  MAux:MChars;
  MB:MBool;
  i,j,acum:integer;
begin
  cargarMatriz(MAux);
  CB.setMatrizC(MAux);
  CB.InicializarMB;

  if CB.ValidarCeldas() then begin
    MB:= CB.CadenaLarga(1,1);
    acum := 0;
    for i := 1 to FILAS do
      for j := 1 to COLUMNAS do
        if MB[i,j] = true then begin
          sg.Cells[j,i]:= '(C)';
          acum:= acum + 1;
        end;
    memo1.Lines.Add('Cadena mas larga encontrada, se marca en la grilla como (C)');
    memo1.Lines.Add('La cadena tiene ' + acum.ToString + ' Carbonos');
    button1.Enabled:= false;
  end
  else
    Messagedlg('Valores incorrectos',mtError,[mbOk],0);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  InicializarGrid();
  button1.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InicializarGrid();
end;

end.
