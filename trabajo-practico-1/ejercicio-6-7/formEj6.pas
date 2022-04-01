unit formEj6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEstacionamiento, DateUtils,
  Vcl.ComCtrls;

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
    FechaDeterminada: TGroupBox;
    GroupBox2: TGroupBox;
    editDesdeDia: TEdit;
    Label12: TLabel;
    editDesdeMes: TEdit;
    editDesdeAño: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    editHastaDia: TEdit;
    Label16: TLabel;
    editHastaMes: TEdit;
    Label17: TLabel;
    editHastaAño: TEdit;
    btnBuscarRango: TButton;
    Memo2: TMemo;
    procedure btnIngresarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnEscribirArchivoClick(Sender: TObject);
    procedure btnLeerArchivoClick(Sender: TObject);
    procedure btnBuscarEnArchivoClick(Sender: TObject);
    procedure btnBuscarRangoClick(Sender: TObject);
    procedure editPrecioOnChange(Sender: TObject);
    procedure editCargaOnChange(Sender:TObject);
    procedure FormCreate(Sender: TObject);
    procedure editDiaBuscarChange(Sender: TObject);
    procedure editDesdeDiaChange(Sender: TObject);
  private
    { Private declarations }
    flag: boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  esta:Estacionamiento;

implementation

{$R *.dfm}

function FechaAString(dia,mes,año:string): string;
begin
  result := año + '/' + mes + '/' + dia;
end;

procedure TForm1.btnAplicarClick(Sender: TObject);
var
  tarifa: integer;
begin
  tarifa := strtoint(editTarifaHora.text);
  esta.setTarifaHora(tarifa);

  tarifa := strtoint(editMediaEstadia.text);
  esta.setMediaEstadia(tarifa);

  tarifa := strtoint(editEstadiaCompleta.text);
  esta.setEstadiaCompleta(tarifa);

  IngresoAuto.Enabled := True;
  flag := True;
end;

procedure TForm1.btnIngresarClick(Sender: TObject);
var
  entrada, salida : TDateTime;
  vAutos : vecAutos;
  rAutos : regAutos;
  tipo : TARIFA;
  f: TDateTime;
begin
  //validación
  if (TryStrToDate(fechaAString(editAñoIngreso.Text,editMesIngreso.Text,EditdiaIngreso.Text),f)) and
    (TryStrToDate(fechaAString(editAñoSalida.Text,editMesSalida.Text,EditdiaSalida.Text),f)) and
    (strtoint(editHoraIngreso.Text) < 24) and (strtoint(editMinutoIngreso.Text) < 60) and
    ((strtoint(editHoraSalida.Text) < 24) and (strtoint(editMinutoSalida.Text) < 60)) and
    ((strtoint(editAñoIngreso.text) >= 1900)) and ((strtoint(editAñosalida.text) >= 1900)) then begin

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

    if CompareDateTime(entrada,salida) = -1 then begin
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

      btnEscribirArchivo.Enabled := True;
    end else
      memo1.Lines.Add('ERROR EN INGRESO DE AUTO: Los datos de ingreso son iguales o mayores a los de salida');
  end else
    memo1.lines.Add('ERROR EN INGRESO DE AUTO: Verifique que las fechas y los horarios sean correctos e intente de nuevo.');
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
    Memo1.Lines.Add('No se encuentra la fecha en el archivo. Intente buscar la fecha de salida.')
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

  memo1.Lines.Add('Archivo generado');
  CloseFile(archivo);
  btnLeerArchivo.Enabled := True;
end;

function agregarTiempo(texto:string):string;
begin
  if length(texto) = 10 then
    texto := texto + ' 00:00:00';
  result := texto;
end;

procedure TForm1.btnLeerArchivoClick(Sender: TObject);
var
  archivo: File of regAutos;
  rAutos: regAutos;
  entrada, salida:string;

begin
  Memo1.Clear;
  AssignFile(archivo, 'registro.dat');
  reset(archivo);

  while not EOF(archivo) do begin
    read(archivo, rAutos);

    entrada := agregarTiempo(DateTimeToStr(rAutos.entrada));
    salida := agregarTiempo(DateTimeToStr(rAutos.salida));

    Memo1.Lines.Add('Entrada: ' + entrada);
    Memo1.Lines.Add('Salida: ' + salida);
    Memo1.Lines.Add('Abona: $' + format('%.2f',[rAutos.abona]));

    case rAutos.tipotarifa of
      porHora: Memo1.Lines.Add('Tipo tarifa: por hora');
      porMediaEstadia: Memo1.Lines.Add('Tipo tarifa: por media estadía');
      porEstadiaCompleta: Memo1.Lines.Add('Tipo tarifa: por estadía completa');
    end;

    Memo1.Lines.Add('');

  end;

end;

procedure TForm1.btnBuscarRangoClick(Sender: TObject);
var
  dia, mes, año, I:integer;
  fechaDesde, fechaHasta, fecha: TDateTime;
  archivo: File of regAutos;
  rAutos: regAutos;
  rRecaudacion, rAux: regRecaudacion;
  vRecaudacion: vecRecaudacion;
  existe: boolean;
begin

  dia := strtoint(editDesdeDia.Text);
  mes := strtoint(editDesdeMes.Text);
  año := strtoint(editDesdeAño.Text);

  fechaDesde := EncodeDate(año, mes, dia);

  dia := strtoint(editHastaDia.Text);
  mes := strtoint(editHastaMes.Text);
  año := strtoint(editHastaAño.Text);

  fechaHasta := EncodeDate(año, mes, dia);

  AssignFile(archivo, 'registro.dat');
  reset(archivo);

  while not EOF(archivo) do begin
    read(archivo, rAutos);

    if (CompareDate(rAutos.salida, fechaDesde) in [0, 1]) and (CompareDate(rAutos.salida, fechaHasta) <> 1) then begin
      vRecaudacion := esta.getRecaudacion();
      if high(vRecaudacion) = -1 then begin
        rRecaudacion.fecha := rAutos.salida;
        rRecaudacion.monto := rAutos.abona;
        esta.agregarRecaudacion(rRecaudacion);
      end else begin
        I := 0;
        existe := false;
        while (I <= high(vRecaudacion)) and not existe do begin
          rAux := vRecaudacion[I];
          if IsSameDay(rAux.fecha, rAutos.salida) then begin
            vRecaudacion[I].monto := vRecaudacion[I].monto + rAutos.abona;
            esta.setRecaudacion(vRecaudacion);
            existe := true;
          end;
          Inc(I);
        end;
        if not existe then begin
          rRecaudacion.fecha := rAutos.salida;
          rRecaudacion.monto := rAutos.abona;
          esta.agregarRecaudacion(rRecaudacion);
        end;
      end;
    end;

  end;

  CloseFile(archivo);

  esta.ordenarRecaudacion;
  vRecaudacion := esta.getRecaudacion();
  Memo1.Clear;

  for I := 0 to High(vRecaudacion) do begin
    Memo1.Lines.Add('Fecha: ' + datetostr(vRecaudacion[I].fecha));
    Memo1.Lines.Add('Recaudación $' + vRecaudacion[I].monto.ToString);
    Memo1.Lines.Add('');
  end;

  esta.vaciarRecaudacion;
end;

procedure TForm1.editPrecioOnChange(Sender: TObject);
begin
  btnAplicar.Enabled := (editTarifaHora.Text <> '') and (editMediaEstadia.Text <> '') and (editEstadiaCompleta.Text <> '');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  btnLeerArchivo.Enabled := FileExists('registro.dat');
end;

procedure Tform1.editCargaOnChange(Sender: TObject);
begin
  btnIngresar.Enabled := (editHoraIngreso.text <> '') and
    (editMinutoIngreso.text <> '') and (editHoraSalida.text <> '') and
    (editMinutoSalida.text <> '') and (editAñoIngreso.text <> '') and
    (editMesIngreso.text <> '') and (editDiaIngreso.text <> '') and
    (editAñoSalida.text <> '') and (editMesSalida.text <> '') and
    (editDiaSalida.text <> '') and flag;
end;

procedure TForm1.editDesdeDiaChange(Sender: TObject);
begin
  btnBuscarRango.Enabled := (editDesdeDia.text <> '') and
    (editDesdeMes.text <> '') and (editDesdeAño.text <> '') and
    (editHastadia.text <> '') and (editHastaMes.text <> '') and
    (editHastaAño.text <> '') and FileExists('registro.dat');
end;

procedure TForm1.editDiaBuscarChange(Sender: TObject);
begin
  btnBuscarEnArchivo.Enabled := (editDiaBuscar.Text <> '') and (editMesBuscar.Text <> '') and (editAñoBuscar.Text <> '') and FileExists('registro.dat');
end;

end.
