unit formEj6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEstacionamiento, DateUtils;

type
  TForm1 = class(TForm)
    IngresoAuto: TGroupBox;
    HorarioIngreso: TGroupBox;
    HorarioSalida: TGroupBox;
    editHoraIngreso: TEdit;
    Label1: TLabel;
    editMinutoIngreso: TEdit;
    editHoraSalida: TEdit;
    editMinutoSalida: TEdit;
    Label2: TLabel;
    Ajustes: TGroupBox;
    TarifaHora: TGroupBox;
    editTarifaHora: TEdit;
    Label3: TLabel;
    MediaEstadia: TGroupBox;
    Label4: TLabel;
    editMediaEstadia: TEdit;
    EstadiaCompleta: TGroupBox;
    Label5: TLabel;
    editEstadiaCompleta: TEdit;
    btnAplicar: TButton;
    Memo1: TMemo;
    btnIngresar: TButton;
    FechaIngreso: TGroupBox;
    editDiaIngreso: TEdit;
    editMesIngreso: TEdit;
    Label6: TLabel;
    editAñoIngreso: TEdit;
    Label7: TLabel;
    FechaSalida: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    editDiaSalida: TEdit;
    editMesSalida: TEdit;
    editAñoSalida: TEdit;
    Button1: TButton;
    procedure btnIngresarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  esta:Estacionamiento;

implementation

{$R *.dfm}

procedure TForm1.btnAplicarClick(Sender: TObject);
var
  tarifa: integer;
begin
  tarifa := strtoint(editTarifaHora.text);
  esta.setTarifaHora(tarifa);
end;

procedure TForm1.btnIngresarClick(Sender: TObject);
var
  entrada, salida : TDateTime;
  vAutos : vecAutos;
  rAutos : regAutos;
  tipo : TARIFA;
begin
  entrada := EncodeDateTime(
    strtoint(editAñoIngreso.text),
    strtoint(editMesIngreso.text),
    strtoint(editDiaIngreso.text),
    strtoint(editHoraIngreso.text),
    strtoint(editMinutoIngreso.text),
    0,
    0
  );

  salida := EncodeDateTime(
    strtoint(editAñoSalida.text),
    strtoint(editMesSalida.text),
    strtoint(editDiaSalida.text),
    strtoint(editHoraSalida.text),
    strtoint(editMinutoSalida.text),
    0,
    0
  );

  esta.ingresarAuto(entrada, salida);
  vAutos := copy(esta.getAutos());
  rAutos := vAutos[high(vAutos)];
  Memo1.Clear;
  Memo1.Lines.Add('Autos cargados: ' + esta.getCantidadAutos().ToString);
  Memo1.Lines.Add('Al momento de su retiro debe abonar $' + format('%.2f', [rAutos.abona]));
  tipo := rAutos.tipotarifa;
  case tipo of
    porHora: Memo1.Lines.Add('El tipo de tarifa a pagar es por hora');
    porMediaEstadia: Memo1.Lines.Add('El tipo de tarifa a pagar por media estadía');
    porEstadiaCompleta: Memo1.Lines.Add('El tipo de tarifa a pagar es por estadía completa');
  end;

end;

end.
