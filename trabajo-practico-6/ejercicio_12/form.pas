unit form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,ArbolN,ListPointer,Tipos,DiccionarioTAD,
  Vcl.ExtDlgs, Vcl.FileCtrl, Vcl.ExtCtrls;

const
   ListaPalabras : Array [1..10] of String = ('Mariposa','Maria','Mar','Martin','Mariano','Marina','Mares','Mareas','Mario','Martillo');

type
  TForm1 = class(TForm)
    BotonMostrarDic: TButton;
    MemoDiccionario: TMemo;
    EditEscribiendo: TEdit;
    BotonAddDic: TButton;
    GroupBox1: TGroupBox;
    BotonP1: TButton;
    BotonP2: TButton;
    BotonP3: TButton;
    BotonP4: TButton;
    BotonP5: TButton;
    MemoTexto: TMemo;
    CargarDic: TButton;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure EditEscribiendoChange(Sender: TObject);
    procedure BotonAddDicClick(Sender: TObject);
    procedure BotonMostrarDicClick(Sender: TObject);
    procedure BotonP1Click(Sender: TObject);
    procedure BotonP2Click(Sender: TObject);
    procedure ClearAll();
    procedure BotonP3Click(Sender: TObject);
    procedure BotonP4Click(Sender: TObject);
    procedure BotonP5Click(Sender: TObject);
    procedure CargarArbol;
    procedure CargarDicClick(Sender: TObject);
    function SoloValidos(S : String) : Boolean;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Arbol : ArbolNario;
  Dic : Diccionario;

implementation

{$R *.dfm}

procedure TForm1.BotonAddDicClick(Sender: TObject);
begin
  Arbol.InsertarPalabra(EditEscribiendo.Text); //Agregar verificar palabra valida
  Arbol.IncrementarOcurrencia(EditEscribiendo.Text);
  MemoTexto.Lines.Add(EditEscribiendo.Text);
  ClearAll;
end;

procedure TForm1.BotonMostrarDicClick(Sender: TObject);
begin
  MemoDiccionario.Clear;
  MemoDiccionario.Lines.Add(Dic.Listado.RetornarClaves);
end;

procedure TForm1.BotonP1Click(Sender: TObject);
begin
  if BotonP1.Caption <> '' then
    begin
      MemoTexto.Lines.Add(BotonP1.Caption);
      Arbol.IncrementarOcurrencia(BotonP1.Caption);
      ClearAll();
    end
end;

procedure TForm1.BotonP2Click(Sender: TObject);
  begin
  if BotonP2.Caption <> '' then
    begin
      MemoTexto.Lines.Add(BotonP2.Caption);
      Arbol.IncrementarOcurrencia(BotonP2.Caption);
      ClearAll();
    end
  end;

procedure TForm1.BotonP3Click(Sender: TObject);
begin
  if BotonP3.Caption <> '' then
    begin
      MemoTexto.Lines.Add(BotonP3.Caption);
      Arbol.IncrementarOcurrencia(BotonP3.Caption);
      ClearAll();
    end
end;

procedure TForm1.BotonP4Click(Sender: TObject);
begin
   if BotonP4.Caption <> '' then
    begin
      MemoTexto.Lines.Add(BotonP4.Caption);
      Arbol.IncrementarOcurrencia(BotonP4.Caption);
      ClearAll();
    end
end;



procedure TForm1.BotonP5Click(Sender: TObject);
begin
  if BotonP5.Caption <> '' then
    begin
      MemoTexto.Lines.Add(BotonP5.Caption);
      Arbol.IncrementarOcurrencia(BotonP5.Caption);
      ClearAll();
    end
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  p:posicionlista;
  x:tipoElemento;
  l:lista;
begin
  MemoTexto.clear;
  l := dic.ListadoMU;
  p := l.Comienzo;
  while p <> nulo do begin
    x := l.Recuperar(p);
    memoTexto.Lines.Add(x.Clave + ' - Ocurrencias: ' + inttoStr(x.Valor1));
    p := l.Siguiente(p);
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   MemoTexto.clear;
end;

procedure TForm1.EditEscribiendoChange(Sender: TObject);
var L : Lista;
    P1,P2,P3,P4,P5 : PosicionLista;
begin
  L := Dic.Prediccion(EditEscribiendo.Text);
  if not L.EsVacia then
    begin
      MemoDiccionario.Clear;
      P1 := L.Comienzo;
      P2 := L.Siguiente(P1);
      P3 := L.Siguiente(P2);
      P4 := L.Siguiente(P3);
      P5 := L.Siguiente(P4);
      BotonP1.Caption := L.Recuperar(P1).ArmarString;
      BotonP2.Caption := L.Recuperar(P2).ArmarString;
      BotonP3.Caption := L.Recuperar(P3).ArmarString;
      BotonP4.Caption := L.Recuperar(P4).ArmarString;
      BotonP5.Caption := L.Recuperar(P5).ArmarString;
    end
  else
    begin
      MemoDiccionario.Clear;
      MemoDiccionario.Lines.Add('No Existen palabras para predecir en el diccionario');
      BotonAddDic.Enabled := True;
    end;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  Arbol.Crear;
  for i := 1 to 10 do
   begin
      Arbol.InsertarPalabra(ListaPalabras[i].ToUpper);
   end;
  Dic.Create(Arbol);
  MemoTexto.Clear;
end;

procedure TForm1.ClearAll;
begin
   BotonP1.Caption := '';
   BotonP2.Caption := '';
   BotonP3.Caption := '';
   BotonP4.Caption := '';
   BotonP5.Caption := '';
   EditEscribiendo.Text := '';
end;

procedure TForm1.CargarArbol();
Var T : TextFile;
    Palabra : String;
  begin
    AssignFile(T,'dic.txt');
    Reset(T);
    while not Eof(T) do
      begin
         ReadLn(T,Palabra);
         if soloValidos(Palabra.ToUpper) then
          Arbol.InsertarPalabra(Palabra.ToUpper);
      end;
    CloseFile(T);
  end;



procedure TForm1.CargarDicClick(Sender: TObject);
begin
  CargarArbol;
  CargarDic.Enabled := false;
end;

function TForm1.soloValidos(S :String) : boolean;
  begin
       if S = S.Empty then
         result := True
       else if (S[1] >= 'A') and (S[1] <= 'Z') then
         result := soloValidos(Copy(S,2,Length(S)-1))
       else
         result := false;
  end;
end.
