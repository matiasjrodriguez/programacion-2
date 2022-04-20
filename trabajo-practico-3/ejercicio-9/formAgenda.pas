unit formAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, AgendaTAD, miListArray, Tipos,
  Vcl.WinXPickers, system.Character;


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
    ComboBox1: TComboBox;
    Label6: TLabel;
    TimePicker2: TTimePicker;
    eDia: TEdit;
    Label7: TLabel;
    UpDown2: TUpDown;
    procedure btCargarTiemposClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btMostrarTiemposClick(Sender: TObject);
    procedure btTerminarClick(Sender: TObject);
    procedure btCargarActividadClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A: TADAgenda;
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
  Tiempo := trim(eTiempo.Text).ToLower;
  eActividad.Clear;
  eTiempo.Text := '0';

  cbActividades.Items.Add(Act);
  X.Clave := Act;
  X.Valor1 := strtoint(Tiempo);
  Tiempos.Agregar(X);
  A.setListadoTiempo(Tiempos);

  inc(indice);
  btCargarTiempos.Caption := 'Cargar ' + indice.ToString + 'º';
end;

procedure TForm1.btCargarActividadClick(Sender: TObject); //carga las actividades de un dia
var
  Act,Horario:string;
  X: TipoElemento;
  j:integer;
begin
  Act := cbActividades.Text;
  Horario := timetostr(TimePicker1.Time);

  if not A.AgregarActividadAAgenda(Act,Horario) then
    memo1.Lines.Add('El horario ingresado no esta disponible. Intente con otro horario')
  else begin
    memo1.Lines.Add('Actividad agregada en la agenda:');
    memo1.Lines.Add('Dia 1: ' + Act + '. ' + 'Horario: ' + A.FormatearHorario(Horario));
    memo1.Lines.Add('');
  end;
end;

procedure TForm1.btTerminarClick(Sender: TObject); //cuando se quiera terminar carga en el TADagendas la Agenda del dia actual
begin
  A.AgregarAgenda(dia);
  inc(dia);
  btTerminar.Caption := 'Terminar Dia ' + dia.ToString;
end;

procedure TForm1.btMostrarTiemposClick(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add(A.getListadoTiempo.RetornarClaves);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  indice:= 1;
  dia := 1;
  Tiempos.Crear(Cadena,LIMITE);
end;

end.
