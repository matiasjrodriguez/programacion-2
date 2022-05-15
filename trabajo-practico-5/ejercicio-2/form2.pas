unit form2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, stdctrls,QueuesPointer, Vcl.Grids, TADColas2;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure cargarColas();

var
  Form1: TForm1;
  C1,C2:Cola;
  OC: ObjColas;

implementation

{$R *.dfm}

procedure cargarColas();
var
  i: Integer;
  X,X2:TipoElemento;
begin
  C1.Crear(Numero,10);
  C2.Crear(Numero,10);
  for i := 0 to 9 do begin
    X.Clave := strtoint(form1.StringGrid1.Cells[0,i]);
    X2.Clave := strtoint(form1.StringGrid2.Cells[0,i]);
    C1.Encolar(X);
    C2.Encolar(X2);
  end;

end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Clear;
  cargarColas();
  if OC.Iguales(C1,C2)then
    memo1.Lines.Add('IGUALES')
  else
    memo1.Lines.Add('DISTINTOS');
  memo1.Lines.Add('');
  memo1.Lines.Add('C1');
  memo1.Lines.Add(C1.RetornarClaves);
  memo1.Lines.Add('C2');
  memo1.Lines.Add(C2.RetornarClaves);
end;

end.
