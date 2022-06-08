unit formABM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, ArbolesBinariosBusqueda, TADABM, ListPointer,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    eCUIT: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    eRazonSocial: TEdit;
    Label3: TLabel;
    eDomicilio: TEdit;
    Label4: TLabel;
    eTelefono: TEdit;
    Label5: TLabel;
    eCelular: TEdit;
    btCargar: TButton;
    Memo1: TMemo;
    Button1: TButton;
    btBuscar: TButton;
    btModificar: TButton;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    eCUIT2: TEdit;
    btBaja: TButton;
    Button2: TButton;
    Label7: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btCargarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure btModificarClick(Sender: TObject);
    procedure btBajaClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  O: TADRegistro;

implementation

{$R *.dfm}

procedure Limpiar();
begin
  with Form1 do begin
    eCuit.Clear;
    eRazonSocial.Clear;
    eDomicilio.Clear;
    eTelefono.Clear;
    eCelular.Clear;
  end;
end;

procedure TForm1.btBajaClick(Sender: TObject);
var
  C: LongInt;
begin
  memo1.Clear;
  C := strtoint(eCUIT2.Text);
  if O.EstaRegistrado(C) then begin
    O.Baja(C);
    memo1.Lines.Add('Registro dado de Baja!')
  end
  else
    memo1.Lines.Add('El CUIT no se encuentra registrado');
end;

procedure TForm1.btBuscarClick(Sender: TObject);
var
  R:registroPersona;
begin
  R.CUIT := -1;
  R := O.Buscar(strtoint(trim(eCUIT.Text)));
  if R.CUIT <> -1 then begin
    with R do begin
       eCUIT.Text := CUIT.ToString;
       eRazonSocial.Text := RazonSocial;
       eDomicilio.Text := Domicilio;
       eTelefono.Text := Telefono;
       eCelular.Text := Celular;
    end;
  end
  else
    memo1.Lines.Add('No esta registrado');
end;

procedure TForm1.btCargarClick(Sender: TObject);
var
  R: RegistroPersona;
begin
  memo1.Clear;
  with R do begin
    CUIT := strtoint(eCUIT.Text);
    RazonSocial := eRazonSocial.Text;
    Domicilio := eDomicilio.Text;
    Telefono := eTelefono.Text;
    Celular := eCelular.Text;
    ACTIVO := True;
  end;
  if not O.EstaActivo(R.CUIT) then begin
    O.Alta(R);
    memo1.Lines.Add('Registro dado de Alta!');
    Limpiar
  end
  else
    memo1.Lines.Add('El CUIT ya esta Activo');
end;

procedure TForm1.btModificarClick(Sender: TObject);
var
  R:RegistroPersona;
begin
  memo1.Clear;
  with R do begin
    CUIT := strtoint(eCUIT.Text);
    RazonSocial := eRazonSocial.Text;
    Domicilio := eDomicilio.Text;
    Telefono := eTelefono.Text;
    Celular := eCelular.Text;
  end;
  if O.EstaRegistrado(R.CUIT) then begin
    O.Modificacion(R);
    memo1.Lines.Add('Registro Modificado!');
    Limpiar
  end
  else
    memo1.Lines.Add('El CUIT no se encuentra registrado');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add(O.retornarArchivo);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  R:registroPersona;
begin
  R.Celular := '-1';
  R := O.BuscarPorCelular(trim(eCelular.Text));
  if R.Celular <> '-1' then begin
    with R do begin
       eCUIT.Text := CUIT.ToString;
       eRazonSocial.Text := RazonSocial;
       eDomicilio.Text := Domicilio;
       eTelefono.Text := Telefono;
       eCelular.Text := Celular;
    end;
  end
  else
    memo1.Lines.Add('No esta registrado');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Clear;
  O.GenerarArchivoCelulares('.\celulares.dat');
  memo1.Lines.Add(O.MostrarArchivoCelulares);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  RP: ^RegistroPersona;
  R: RegistroPersona;
  L: Lista;
  Q: PosicionLista;
  X: TipoElemento;
  s : string;
begin
  L := O.BuscarRSAprox(trim(eRazonSocial.Text));
  Q := L.Comienzo;
  memo1.Clear;
  while Q <> NULO do begin
    s := '';
    X := L.Recuperar(Q);
    new(RP);
    RP := X.Valor2;
    R := RP^;
    s := s + '[' + R.RazonSocial + ']: ' + R.CUIT.ToString + '; ' + R.Domicilio + '; ' + R.Telefono + '; ' + R.Celular + '; ';
    if R.ACTIVO then
      s := s + 'ACTIVO' + cCRLF
    else
      s := s + 'NO ACTIVO' + cCRLF;
    memo1.Lines.Add(s);
    Q := L.Siguiente(Q);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  O.Inicializar('.\personas.dat');
end;

end.
