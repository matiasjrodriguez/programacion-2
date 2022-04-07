unit ProductoInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ProductoTAD;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}



procedure TForm2.Button1Click(Sender: TObject);
var Entran1,Entran2 : integer;
 n1 : Tnumeros;
 caracter : string;
begin
   //memo1.Clear;
   TryStrToInt(edit1.Text, Entran1);
   TryStrToInt(edit2.text, Entran2);
   memo1.Lines.Add(n1.Producto(Entran1,Entran2).ToString);
end;

end.
