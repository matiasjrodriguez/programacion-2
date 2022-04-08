unit formEj12;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, TADCampoMinado;

type
  TForm1 = class(TForm)
    sg: TStringGrid;
    btBuscar: TButton;
    memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    btLimpiar: TButton;
    procedure btBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btLimpiarClick(Sender: TObject);
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

function ValidarSG():boolean;
var i,j:integer;
begin
  for I := 1 to FILAS do
    for j := 1 to COLUMNAS do
      if (form1.sg.Cells[j-1,i-1] = 'P') or (form1.sg.Cells[j-1,i-1] = 'S') or
      (form1.sg.Cells[j-1,i-1] = 'E') or (form1.sg.Cells[j-1,i-1] = 'D') or
      (form1.sg.Cells[j-1,i-1] = 'M') then
        result := True
      else begin
        result := False;
        exit;
      end;
end;

procedure TForm1.btBuscarClick(Sender: TObject);
var
  PosEntrada,PosSalida:Coordenadas;
  MAux : MChars;
  VC,VCRes: VCamino;
  VM,VMRes: VMinas;
  i:integer;
begin
  memo1.Clear;
  memo2.Clear;
  MC.ResetVectores;
  cargarMatriz(MAux);
  MC.SetMatrizC(MAux);
  MC.InicializarMB;
  PosEntrada := MC.UbicarEntrada(FILAS,COLUMNAS);
  PosSalida := MC.UbicarSalida(FILAS,COLUMNAS);

  if not ValidarSG() then begin
    memo1.Lines.Add('ERROR: Entrada invalida');
    exit;
  end;

  if (PosEntrada.F <> -1) or (PosSalida.F <> -1) then begin

    MC.BuscarCaminoSeguro(PosEntrada.F,PosEntrada.C,VC,VM);
    VCRes := MC.getCamino;
    VMres := MC.getMinas;

    if length(VCRes) = 0 then
      memo1.Lines.Add('ERROR: No se ha encontrado una conexion entre la entrada (E) y la salida (D)')
    else begin
      for i := low(VCRes) to high(VCRes) do
        memo1.Lines.Add('(' + VCRes[i].Direccion + ',' + VCRes[i].Situacion + ')');

      if length(VMRes) = 0 then
        memo2.Lines.Add('No hay minas')
      else
        for i := low(VMRes) to high(VMRes) do
          memo2.Lines.Add('(' + VMRes[i].F.ToString + ',' + VMRes[i].C.ToString + ')');
    end;
  end
  else
    memo1.Lines.Add('ERROR: No se encontro el punto de Entrada o de Salida');

end;

procedure TForm1.btLimpiarClick(Sender: TObject);
begin
  InicializarSG();
  memo1.Clear;
  memo2.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
  memo2.Clear;
  InicializarSG();
end;

end.
