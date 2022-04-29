unit McdForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StackCursor, Tipos, McdTAD,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    resultadoMCD: TMemo;
    EditN1: TEdit;
    EditN2: TEdit;
    LNum1: TLabel;
    LNum2: TLabel;
    PanelValid: TPanel;
    Label1: TLabel;
    LHints: TLabel;
    BotonMCD: TButton;
    Panel1: TPanel;
    procedure HintsValid(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure HintsValidClear(Sender: TObject);
    procedure EditN1Change(Sender: TObject);
    function  ambosValidos(): Boolean;
    procedure EditN2Change(Sender: TObject);
    procedure BotonMCDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InitGrid();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Mcd  : MaximoComunDivisor;
  PLlamados : Pila;
  R , C : Integer;
implementation

{$R *.dfm}
function Tform1.ambosValidos: Boolean;
var NingunoVacio : Boolean;
  begin
    NingunoVacio := (EditN1.Text <> '') and (EditN2.Text <> '');
    result := (StrToInt(EditN1.Text) <> 0) and (StrToInt(EditN2.Text) <> 0) and NingunoVacio ;
  end;
procedure TForm1.BotonMCDClick(Sender: TObject);
var
  Apilados : integer;
begin
  Apilados := 0;
  Mcd.Create(StrToInt(EditN1.Text),StrToInt(EditN2.Text));
  PLlamados := Mcd.calcularMCD;
  while not PLlamados.EsVacia do begin
    inc(Apilados);
    StringGrid1.RowCount := Apilados+1;
    StringGrid1.Cells[0,Apilados] := PLlamados.Recuperar.Clave;
    R := Apilados+1;
    PLlamados.DesApilar;
  end;
  resultadoMCD.Clear;
  resultadoMCD.Lines.Add('MCD('+EditN1.Text+','+EditN2.Text+') = '+Mcd.getResultado.ToString);
end;

procedure TForm1.EditN1Change(Sender: TObject);
begin
  if ambosValidos() then
    begin
      BotonMCD.Enabled := true;
      PanelValid.Color := clGreen;
    end
  else
    begin
      BotonMCD.Enabled := false;
      PanelValid.Color := clRed;
    end;
end;

procedure TForm1.EditN2Change(Sender: TObject);
begin
  if ambosValidos() then
    begin
      BotonMCD.Enabled := true;
      PanelValid.Color := clGreen;
    end
  else
    begin
      BotonMCD.Enabled := false;
      PanelValid.Color := clRed;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   initGrid();
end;

procedure TForm1.HintsValid(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   LHints.Caption := 'Valido si ambos numeros mayores que 0';
end;

procedure TForm1.HintsValidClear(Sender: TObject);
begin
   LHints.Caption := '';
end;

procedure TForm1.InitGrid;

begin
  StringGrid1.Cells[0,0] := 'Pila Recursiva';
end;

end.
