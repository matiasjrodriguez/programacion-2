unit NumeroRacionalTADinterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
var n1, n2 : NumeroRacional;
  entradaNumerador1, entradaNumerador2, entradaDenominador1, entradaDenominador2 : integer;
begin
  TryStrToInt(edit1.Text,entradaNumerador1);
  n1.SetNumerador(entradaNumerador1);

  TryStrToInt(edit2.Text, entradaDenominador1);
  n1.SetDenominador(entradaDenominador1);
  memo1.Lines.Add(n1.Fraccion);

  TryStrToInt(edit3.Text, entradaNumerador2);
  n2.SetNumerador(entradaNumerador2);

  TryStrToInt(edit4.Text, entradaDenominador2);
  n2.SetDenominador(entradaDenominador2);
  memo1.Lines.Add(n2.Fraccion());

  //memo1.Lines.Add(n1.Compara(n2));
//  memo1.Lines.Add(n1.Fraccion());

end;

procedure TOperaciones.DividirClick(Sender: TObject);
var n1, n2, n3 : NumeroRacional ;
  entradaNumerador1, entradaNumerador2, entradaDenominador1, entradaDenominador2 : integer;
begin
  trystrtoint(edit1.Text, entradaNumerador1);
  n1.SetNumerador(entradaNumerador1);

  TryStrToInt(edit2.Text, entradaDenominador1);
  n1.SetDenominador(entradaDenominador1);
  memo1.Lines.Add(n1.Fraccion());

  TryStrToInt(edit3.Text, entradaNumerador2);
  n2.SetNumerador(entradaNumerador2);

  TryStrToInt(edit4.Text, entradaDenominador2);
  n2.SetDenominador(entradaDenominador2);
  memo1.Lines.Add(n2.Fraccion());

  n3 := n1.Divide(n2);
  memo1.Lines.Add(n3.Fraccion());
end;

procedure TOperaciones.MultiplicarClick(Sender: TObject);
var n1,n2,n3 : NumeroRacional;
 entradaNumerador1, entradaNumerador2, entradaDenominador1, entradaDenominador2 : integer;
 begin
  trystrtoint(edit1.Text,entradaNumerador1);
  n1.SetNumerador(entradaNumerador1);

  TryStrToInt(edit2.Text, entradaDenominador1);
  n1.SetDenominador(entradaDenominador1);
  memo1.Lines.Add(n1.Fraccion());

  TrySTrToInt(edit3.Text,entradaNumerador2);
  n2.SetNumerador(entradaNumerador2);

  TryStrToInt(edit4.Text,entradaDenominador2);
  n2.SetDenominador(entradaDenominador2);
  memo1.Lines.Add(n2.Fraccion());

  n3 := n1.Multiplica(n2);
  memo1.Lines.Add(n3.Fraccion());


end;

procedure TOperaciones.PotenciaClick(Sender: TObject);
var n1, n2e, n3 : NumeroRacional;
  entradaNumerador, entradaExponente : integer;
begin
  TryStrToInt(edit1.Text,entradaNumerador);
  n1.SetNumerador(entradaNumerador);

  TryStrToInt(edit3.Text, entradaExponente);
  n2e.SetNumerador(entradaExponente);

  n3 :=  n1.Potencias(n2e);
  memo1.Lines.Add(n3.Fraccion());

end;

procedure TOperaciones.RestarClick(Sender: TObject);
var n1, n2, n3 : NumeroRacional;
  entradaNumerador1, entradaNumerador2, entradaDenominador1, entradaDenominador2 : integer;
begin
   TryStrToInt(edit1.Text,entradaNumerador1);
   n1.SetNumerador(entradaNumerador1);


   TryStrToInt(edit2.Text, entradaDenominador1);
   n1.SetDenominador(entradaDenominador1);
   memo1.lines.Add(n1.Fraccion());

   TryStrToInt(edit3.Text,entradaNumerador2);
   n2.SetNumerador(entradaNumerador2);

   TryStrToInt(edit4.Text, entradaDenominador2);
   n2.SetDenominador(entradaDenominador2);
   memo1.lines.add(n2.Fraccion());

   n3 := n1.Resta(n2);
   memo1.Lines.Add(n3.Fraccion());





end;

procedure TOperaciones.SumarClick(Sender: TObject);
var n1, n2, n3 : NumeroRacional;
  entradaNumerador1, entradaDenominador1, entradaNumerador2, entradaDenominador2  : integer;
begin
  TryStrtoInt(edit1.text,entradaNumerador1);
  n1.SetNumerador(entradaNumerador1);

  TryStrtoInt(edit2.text,entradaDenominador1);
  n1.SetDenominador(entradaDenominador1);
  memo1.lines.add(n1.Fraccion());

  trystrtoint(edit3.text, entradaNumerador2);
  n2.SetNumerador(entradaNumerador2);

  TryStrToInt(edit4.text, entradaDenominador2);
  n2.SetDenominador(entradaDenominador2);
  memo1.lines.add(n2.Fraccion());

  n3 := n1.Suma(n2);
  memo1.lines.add(n3.Fraccion());

end;

end.
