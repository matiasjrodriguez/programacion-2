unit formAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, AgendaTAD, Tipos, Vcl.WinXPickers,
  system.Character,
  //miListArray;
  ListPointer;
  //ListCursor;


type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    eActividad: TEdit;
    btCargarTiempos: TButton;
    Label1: TLabel;
    eTiempo: TEdit;
    Label2: TLabel;
    UpDown1: TUpDown;
    GroupBox2: TGroupBox;
    cbActividades: TComboBox;
    Label3: TLabel;
    TimePicker1: TTimePicker;
    Label4: TLabel;
    btCargarActividad: TButton;
    Memo1: TMemo;
    btMostrarTiempos: TButton;
    btTerminar: TButton;
    GroupBox3: TGroupBox;
    btAgregar: TButton;
    Label5: TLabel;
    cbActividades2: TComboBox;
    Label6: TLabel;
    TimePicker2: TTimePicker;
    eDia: TEdit;
    Label7: TLabel;
    UpDown2: TUpDown;
    btMostrarAgenda: TButton;
    GroupBox4: TGroupBox;
    TimePicker3: TTimePicker;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    eDia2: TEdit;
    UpDown3: TUpDown;
    Label9: TLabel;
    btConsultar: TButton;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    Edit1: TEdit;
    UpDown4: TUpDown;
    btPorcentaje: TButton;
    procedure btCargarTiemposClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btMostrarTiemposClick(Sender: TObject);
    procedure btTerminarClick(Sender: TObject);
    procedure btCargarActividadClick(Sender: TObject);
    procedure btAgregarClick(Sender: TObject);
    procedure btMostrarAgendaClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Ag: TADAgenda;
  indice,dia:integer;
  Tiempos: Lista;  //lista de tiempo

implementation

{$R *.dfm}

procedure TForm1.btCargarTiemposClick(Sender: TObject); // carga el listado de tiempos
var
  Act,Tiempo:string;
  X: TipoElemento;
begin
  Act := trim(eActividad.Text).ToLower;
  Act[1] := Act[1].ToUpper;
  Tiempo := eTiempo.Text;
  eActividad.Clear;
  eTiempo.Text := '0';

  cbActividades.Items.Add(Act);
  cbActividades2.Items.Add(Act);
  X.Clave := Act;
  X.Valor1 := strtoint(Tiempo);
  Tiempos.Agregar(X);
  Ag.setListadoTiempo(Tiempos);

  inc(indice);
  btCargarTiempos.Caption := 'Cargar ' + indice.ToString + 'º';
end;

procedure TForm1.btCargarActividadClick(Sender: TObject); //carga las actividades de un dia
var
  Act,Horario:string;
begin
  Act := cbActividades.Text;
  Horario := timetostr(TimePicker1.Time);

  if not Ag.AgregarActividadAAgenda(Act,Horario) then
    memo1.Lines.Add('El horario ingresado no esta disponible. Intente con otro horario')
  else begin
    memo1.Lines.Add('Actividad agregada en la agenda:');
    memo1.Lines.Add('Dia ' + dia.ToString + ': ' + Act + '. ' + 'Horario: ' + Ag.FormatearHorario(Horario));
    memo1.Lines.Add('');
  end;
end;

procedure TForm1.btTerminarClick(Sender: TObject); //cuando se quiera terminar carga en el TADagendas la Agenda del dia actual
begin
  UpDown2.Max := dia;
  UpDown3.Max := dia;
  UpDown4.Max := dia;
  Ag.AgregarAgenda(dia);
  inc(dia);
  cbActividades.Text := '...';
  btTerminar.Caption := 'Terminar Dia ' + dia.ToString;
end;

procedure TForm1.btAgregarClick(Sender: TObject);
var
  D: integer;
  X: TipoElemento;
begin
  D := strtoint(eDia.Text);
  X.Clave := cbActividades2.Text;
  X.Valor1 := timetostr(TimePicker2.Time);
  if not Ag.InsertarActividadAgenda(X,D) then
    memo1.Lines.Add('El horario ingresado no esta disponible. Intente con otro horario')
  else begin
    memo1.Lines.Add('Actividad agregada en la agenda:');
    memo1.Lines.Add('Dia ' + D.ToString + ': ' + X.Clave + '. ' + 'Horario: ' + Ag.FormatearHorario(X.Valor1));
    memo1.Lines.Add('');
    cbActividades.Text := '...';
  end;
end;

procedure TForm1.btConsultarClick(Sender: TObject);
var
  Hora,ActActual:String;
  diaConsulta:integer;
begin
  diaConsulta := strtoint(eDia2.Text);
  hora := timetostr(TimePicker3.Time);
  ActActual := Ag.ConsultarActividad(diaConsulta,hora);
  memo1.Lines.Add('Dia ' + diaConsulta.ToString + ': ' + Ag.FormatearHorario(hora) + ' --> ' + ActActual);
end;

procedure TForm1.btMostrarAgendaClick(Sender: TObject);
begin
  memo1.Lines.Add(Ag.retornarAgendas);
end;

procedure TForm1.btMostrarTiemposClick(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add(Ag.getListadoTiempo.RetornarClaves);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
  indice:= 1;
  dia := 1;
  Tiempos.Crear(Cadena,LIMITE);
end;

end.
