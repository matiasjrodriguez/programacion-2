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
    procedure btnPuntitoClick(Sender: TObject);
    procedure btnFrutillaClick(Sender: TObject);
    procedure btnBananaClick(Sender: TObject);
    procedure btnCerezaClick(Sender: TObject);
    procedure btnFantasmaClick(Sender: TObject);
    procedure btnBonusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRecorridoClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  Form1: TForm1;
  L: Lista;


implementation

{$R *.dfm}

procedure TForm1.btnPuntitoClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Puntito');
  X.Clave := 'Puntito';
  L.Agregar(X);
end;

procedure TForm1.btnRecorridoClick(Sender: TObject);
var
  P:Pacman;
begin
  P.setPuntaje(0);
  P.setRecorrido(L);
  P.calcularPuntaje;
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
  L.Agregar(X);
end;

procedure TForm1.btnBananaClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Banana');
  X.Clave := 'Banana';
  L.Agregar(X);
end;

procedure TForm1.btnCerezaClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Cereza');
  X.Clave := 'Cereza';
  L.Agregar(X);
end;

procedure TForm1.btnFantasmaClick(Sender: TObject);
var
  X: TipoElemento;
begin
  Memo1.Lines.Add('Fantasma');
  X.Clave := 'Fantasma';
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
