unit ej1ListasForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADmanejandoListas;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L: TADManejoListas;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  L2,L3:TADmanejoListas;
  P:integer;
begin
  button2.Enabled := True;
  memo1.Clear;
  L.generarListaRandom(10,1,20);
  L2.SetmiLista(L.ListaInvertida);
  memo1.Lines.Add('Lista: ' + Char(13) + Char(10) + L.ListaToString());
  memo1.Lines.Add('Invertida: ' + Char(13) + Char(10) + L2.ListaToString());
  memo1.Lines.Add('El menor elemento de la lista es [' + L.Menor(P).ToString + '] ' + 'en la Posicion ' + P.ToString);
  memo1.Lines.Add('El mayor elemento de la lista es [' + L.Mayor.ToString + ']. ' + 'Aparece ' + L.Ocurrencias(L.Mayor).ToString + ' veces');
  memo1.Lines.Add('Promedio: ' + L.Promedio.ToString);
  memo1.Lines.Add('');
  L3.SetmiLista(L.ReflejarLista(True));
  memo1.Lines.Add('Reflejada?: ' + Char(13) + Char(10) + L3.ListaToString());
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  n: integer;
  L2:TADManejoListas;
begin
  n := strtoint(edit1.Text);
  L2.SetmiLista(L.Multiplos(n));
  if L2.ListaToString <> '' then
    memo1.Lines.Add('Multiplos de ' + n.ToString + ':' + Char(13) + Char(10) + L2.ListaToString)
  else
    memo1.Lines.Add('Multiplos de ' + n.ToString + ':' + Char(13) + Char(10) + 'Ninguno');  
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  LU: TADmanejoListas;
begin
  memo1.Clear;
  LU.generarListaRandomUnica(10,1,10); // Tamaño debe ser menor o igual a RangoHasta
  memo1.Lines.Add('Lista Unica: ' + Char(13) + Char(10) + LU.ListaToString());
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  button2.Enabled := (edit1.Text <> '');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
  button2.Enabled := False;
end;

end.
