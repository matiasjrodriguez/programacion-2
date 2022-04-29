unit formEj8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TADPacman, Tipos, Vcl.StdCtrls,
  ListPointer;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnPuntito: TButton;
    btnFrutilla: TButton;
    btnBanana: TButton;
    btnCereza: TButton;
    btnFantasma: TButton;
    btnBonus: TButton;
    btnRecorrido: TButton;
    btnEliminar: TButton;
    btnVaciar: TButton;
    procedure btnPuntitoClick(Sender: TObject);
    procedure btnFrutillaClick(Sender: TObject);
    procedure btnBananaClick(Sender: TObject);
    procedure btnCerezaClick(Sender: TObject);
    procedure btnFantasmaClick(Sender: TObject);
    procedure btnBonusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRecorridoClick(Sender: TObject);
    procedure btnVaciarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
  private
    { Private declarations }
  public L: Lista;
  end;

var
  Form1: TForm1;



implementation

{$R *.dfm}

procedure TForm1.btnPuntitoClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Puntito');
  X.Clave := 'Puntito';
  X.Valor1 := 1;
  L.Agregar(X);
end;

procedure TForm1.btnRecorridoClick(Sender: TObject);
var
  P:Pacman;
begin
  P.setPuntaje(0);
  P.setPerdio(False);
  P.setBonus(0);
  P.setRecorrido(L);
  P.calcularPuntaje;
  if P.getPerdio() then
    Memo1.Lines.Add('Perdiste')
  else
    Memo1.Lines.Add(P.getPuntaje().ToString);
end;

procedure TForm1.btnVaciarClick(Sender: TObject);
begin
  Memo1.clear;
  L.Crear(Cadena, 30);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  L.Crear(Cadena, 30);
end;

procedure TForm1.btnFrutillaClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Frutilla');
  X.Clave := 'Frutilla';
  X.Valor1 := 10;
  L.Agregar(X);
end;

procedure TForm1.btnBananaClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Banana');
  X.Clave := 'Banana';
  X.Valor1 := 30;
  L.Agregar(X);
end;

procedure TForm1.btnCerezaClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Cereza');
  X.Clave := 'Cereza';
  X.Valor1 := 50;
  L.Agregar(X);
end;

procedure TForm1.btnEliminarClick(Sender: TObject);
var
  pos: PosicionLista;
begin
  Memo1.Lines.Delete(Memo1.Lines.Count-1);
  pos := L.Fin;
  if L.CantidadElementos() = 1 then
    L.Crear(Cadena, 30)
  else
    L.Eliminar(pos);
end;

procedure TForm1.btnFantasmaClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Fantasma');
  X.Clave := 'Fantasma';
  X.Valor1 := 100;
  L.Agregar(X);
end;

procedure TForm1.btnBonusClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Bonus');
  X.Clave := 'Bonus';
  L.Agregar(X);
end;

end.
