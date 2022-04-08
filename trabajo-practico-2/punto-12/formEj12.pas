unit formEj12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, TADCampoMinado;

type
  TForm1 = class(TForm)
    sg: TStringGrid;
    Button1: TButton;
    memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MC: CampoMinado;

implementation

{$R *.dfm}

procedure cargarMatriz(var M:MChars);
var
  i,j:integer;
begin
  for I := 1 to FILAS do
    for j := 1 to COLUMNAS do
      M[i,j] := trim(form1.sg.Cells[j-1,i-1]).ToUpper[1];
end;

procedure InicializarSG();
var
  i,j:integer;
begin
  for I := 1 to FILAS do
    for j := 1 to COLUMNAS do
      form1.sg.Cells[j-1,i-1] := 'P';
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  PosEntrada,PosSalida:Coordenadas;
  MAux : MChars;
  VC: VCamino;
  i: Integer;
begin
  memo1.Clear;
  cargarMatriz(MAux);
  MC.SetMatrizC(MAux);
  MC.InicializarMB;
  MC.InicializarVC;
  PosEntrada := MC.UbicarEntrada(FILAS,COLUMNAS);
  PosSalida := MC.UbicarSalida(FILAS,COLUMNAS);

  if (PosEntrada.F <> -1) or (PosSalida.F <> -1) then begin
    memo1.Lines.Add('Entrada: [' + PosEntrada.F.ToString + ';' + PosEntrada.C.ToString + ']');
    memo1.Lines.Add('Salida: [' + PosSalida.F.ToString + ';' + PosSalida.C.ToString + ']');

    VC := MC.BuscarCaminoSeguro(PosEntrada.F,PosEntrada.C);

    for i := 1 to length(VC) do
      if VC[i].Direccion <> ' ' then
        memo1.Lines.Add('(' + VC[i].Direccion + ',' + VC[i].Situacion + ')');
  end
  else
    memo1.Lines.Add('ERROR: No se encontro el punto de Entrada o de Salida');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
  InicializarSG();
end;

end.
