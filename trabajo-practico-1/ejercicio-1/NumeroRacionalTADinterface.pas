unit NumeroRacionalTADinterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, NumeroRacionalTAD;

type
  TOperaciones = class(TForm)
    Sumar: TButton;
    Restar: TButton;
    Multiplicar: TButton;
    Dividir: TButton;
    Potencia: TButton;
    Comparar: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit5: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure SumarClick(Sender: TObject);
    procedure RestarClick(Sender: TObject);
    procedure MultiplicarClick(Sender: TObject);
    procedure DividirClick(Sender: TObject);
    procedure PotenciaClick(Sender: TObject);
    procedure CompararClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Operaciones: TOperaciones;

implementation

{$R *.dfm}

procedure TOperaciones.CompararClick(Sender: TObject);
var
  n1, n2: NumeroRacional;
  entradaNumerador1, entradaNumerador2, entradaDenominador1,
    entradaDenominador2: integer;
begin
  memo1.Clear;
  TryStrToInt(Edit1.Text, entradaNumerador1);
  n1.SetNumerador(entradaNumerador1);

  TryStrToInt(Edit2.Text, entradaDenominador1);
  n1.SetDenominador(entradaDenominador1);

  TryStrToInt(Edit3.Text, entradaNumerador2);
  n2.SetNumerador(entradaNumerador2);

  TryStrToInt(Edit4.Text, entradaDenominador2);
  n2.SetDenominador(entradaDenominador2);

  Memo1.Lines.Add(n1.Fraccion + ' es ' + n1.Compara(n2) + ' que ' + n2.Fraccion);
end;

procedure TOperaciones.DividirClick(Sender: TObject);
var
  n1, n2, n3: NumeroRacional;
  entradaNumerador1, entradaNumerador2, entradaDenominador1,
    entradaDenominador2: integer;
begin
  Memo1.Clear;
  TryStrToInt(Edit1.Text, entradaNumerador1);
  n1.SetNumerador(entradaNumerador1);

  TryStrToInt(Edit2.Text, entradaDenominador1);
  n1.SetDenominador(entradaDenominador1);

  TryStrToInt(Edit3.Text, entradaNumerador2);
  n2.SetNumerador(entradaNumerador2);

  TryStrToInt(Edit4.Text, entradaDenominador2);
  n2.SetDenominador(entradaDenominador2);
  Memo1.Lines.Add(n1.Fraccion + ' / ' + n2.Fraccion());
  Memo1.Lines.Add('-----------------------');

  n3 := n1.Divide(n2);
  Memo1.Lines.Add(n3.Fraccion());

end;

procedure TOperaciones.MultiplicarClick(Sender: TObject);
var
  n1, n2, n3: NumeroRacional;
  entradaNumerador1, entradaNumerador2, entradaDenominador1,
    entradaDenominador2: integer;
begin
  Memo1.Clear;
  TryStrToInt(Edit1.Text, entradaNumerador1);
  n1.SetNumerador(entradaNumerador1);

  TryStrToInt(Edit2.Text, entradaDenominador1);
  n1.SetDenominador(entradaDenominador1);

  TryStrToInt(Edit3.Text, entradaNumerador2);
  n2.SetNumerador(entradaNumerador2);

  TryStrToInt(Edit4.Text, entradaDenominador2);
  n2.SetDenominador(entradaDenominador2);
  Memo1.Lines.Add(n1.Fraccion() + ' * ' + n2.Fraccion());
  Memo1.Lines.Add('-----------------------');

  n3 := n1.Multiplica(n2);
  Memo1.Lines.Add(n3.Fraccion());

end;

procedure TOperaciones.PotenciaClick(Sender: TObject);
var
  n1, n3: NumeroRacional;
  entradaNumerador, entradaDenominador, entradaExponente: integer;
begin
  TryStrToInt(Edit1.Text, entradaNumerador);
  n1.SetNumerador(entradaNumerador);

  TryStrToInt(Edit2.Text, entradaDenominador);
  n1.SetDenominador(entradaDenominador);

  TryStrToInt(Edit5.Text, entradaExponente);

  n3 := n1.Potencias(entradaExponente);

  Memo1.Clear;
  Memo1.Lines.Add('Resultado: ' + n3.Fraccion());
end;

procedure TOperaciones.RestarClick(Sender: TObject);
var
  n1, n2, n3: NumeroRacional;
  entradaNumerador1, entradaNumerador2, entradaDenominador1,
    entradaDenominador2: integer;
begin
  Memo1.Clear;
  TryStrToInt(Edit1.Text, entradaNumerador1);
  n1.SetNumerador(entradaNumerador1);

  TryStrToInt(Edit2.Text, entradaDenominador1);
  n1.SetDenominador(entradaDenominador1);

  TryStrToInt(Edit3.Text, entradaNumerador2);
  n2.SetNumerador(entradaNumerador2);

  TryStrToInt(Edit4.Text, entradaDenominador2);
  n2.SetDenominador(entradaDenominador2);
  Memo1.Lines.Add(n1.Fraccion + ' - ' + n2.Fraccion());

  n3 := n1.Resta(n2);
  Memo1.Lines.Add('-------------------');
  Memo1.Lines.Add(n3.Fraccion());

end;

procedure TOperaciones.SumarClick(Sender: TObject);
var
  n1, n2, n3: NumeroRacional;
  entradaNumerador1, entradaDenominador1, entradaNumerador2,
    entradaDenominador2: integer;
begin
  Memo1.Clear;
  TryStrToInt(Edit1.Text, entradaNumerador1);
  n1.SetNumerador(entradaNumerador1);

  TryStrToInt(Edit2.Text, entradaDenominador1);
  n1.SetDenominador(entradaDenominador1);

  TryStrToInt(Edit3.Text, entradaNumerador2);
  n2.SetNumerador(entradaNumerador2);

  TryStrToInt(Edit4.Text, entradaDenominador2);
  n2.SetDenominador(entradaDenominador2);
  Memo1.Lines.Add(n1.Fraccion + ' + ' + n2.Fraccion());

  n3 := n1.Suma(n2);
  Memo1.Lines.Add('--------------------');
  Memo1.Lines.Add(n3.Fraccion());

end;

end.
