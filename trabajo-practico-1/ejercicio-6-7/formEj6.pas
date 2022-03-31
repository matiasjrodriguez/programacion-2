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
    btnEscribirArchivo: TButton;
    btnLeerArchivo: TButton;
    editDiaBuscar: TEdit;
    Label10: TLabel;
    editMesBuscar: TEdit;
    Label11: TLabel;
    editAñoBuscar: TEdit;
    btnBuscarEnArchivo: TButton;
    GroupBox1: TGroupBox;
    procedure btnIngresarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnEscribirArchivoClick(Sender: TObject);
    procedure btnLeerArchivoClick(Sender: TObject);
    procedure btnBuscarEnArchivoClick(Sender: TObject);
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

  tarifa := strtoint(editMediaEstadia.text);
  esta.setMediaEstadia(tarifa);

  tarifa := strtoint(editEstadiaCompleta.text);
  esta.setEstadiaCompleta(tarifa)
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

procedure TForm1.btnBuscarEnArchivoClick(Sender: TObject);
var
  añoUsuario, mesUsuario, diaUsuario, añoArchivo, mesArchivo, diaArchivo:word;
  archivo: File of regAutos;
  rAutos: regAutos;
  coincidencias: boolean;
  percibidoHora, percibidoMedia, percibidoCompleta: double;
begin
  Memo1.Clear;
  añoUsuario := strtoint(editAñoBuscar.text);
  mesUsuario := strtoint(editMesBuscar.text);
  diaUsuario := strtoint(editDiaBuscar.text);
  coincidencias := false;
  percibidoHora := 0;
  percibidoMedia := 0;
  percibidoCompleta := 0;

  AssignFile(archivo, 'registro.dat');
  reset(archivo);

  while not EOF(archivo) do begin
    read(archivo, rAutos);
    DecodeDate(rAutos.salida, añoArchivo, mesArchivo, diaArchivo);

    if (añoArchivo = añoUsuario) and (mesArchivo = mesUsuario) and (diaArchivo = diaUsuario) then begin
      case rAutos.tipotarifa of
        porHora: percibidoHora := percibidoHora + rAutos.abona;
        porMediaEstadia: percibidoMedia := percibidoMedia + rAutos.abona;
        porEstadiaCompleta: percibidoCompleta := percibidoCompleta + rAutos.abona;
      end;

      coincidencias := true;
    end
  end;

  if not(coincidencias) then
    Memo1.Lines.Add('No se encuentra la fecha en el archivo.')
  else begin
    Memo1.Lines.Add('Cantidad percibida:');
    Memo1.Lines.Add('Por hora: $' + percibidoHora.ToString);
    Memo1.Lines.Add('Por media estadía: $' + percibidoMedia.ToString);
    Memo1.Lines.Add('Por estadía completa: $' + percibidoCompleta.ToString);
  end;


  CloseFile(archivo);
end;

procedure TForm1.btnEscribirArchivoClick(Sender: TObject);
var
  archivo: File of regAutos;
  autos: vecAutos;
  rAutos: regAutos;
  I:integer;
begin

  AssignFile(archivo, 'registro.dat');
  ReWrite(archivo);
  autos := esta.getAutos();

  for I := 0 to high(autos) do begin
    rAutos := autos[I];
    write(archivo, rAutos);
  end;

  CloseFile(archivo);

end;

procedure TForm1.btnLeerArchivoClick(Sender: TObject);
var
  archivo: File of regAutos;
  rAutos: regAutos;

begin
  Memo1.Clear;
  AssignFile(archivo, 'registro.dat');
  reset(archivo);

  while not EOF(archivo) do begin
    read(archivo, rAutos);
    Memo1.Lines.Add('Entrada: ' + DateTimeToStr(rAutos.entrada));
    Memo1.Lines.Add('Salida: ' + DateTimeToStr(rAutos.salida));
    Memo1.Lines.Add('Abona: $' + floattostr(rAutos.abona));

    case rAutos.tipotarifa of
      porHora: Memo1.Lines.Add('Tipo tarifa: por hora');
      porMediaEstadia: Memo1.Lines.Add('Tipo tarifa: por media estadía');
      porEstadiaCompleta: Memo1.Lines.Add('Tipo tarifa: por estadía completa');
    end;

    Memo1.Lines.Add('');

  end;

end;

end.
