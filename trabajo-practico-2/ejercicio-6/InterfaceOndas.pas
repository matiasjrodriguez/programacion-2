unit InterfaceOndas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,OndasTAD;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Memo1: TMemo;
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
var variable, variable2 :string;
VectorOndas : onda;
    i : integer;
begin
  i := 1;
 variable := edit1.Text;
 variable := variable.ToUpper;
 variable2 := VectorOndas.ondadigital(variable,i);
 memo1.Lines.Add(VectorOndas.corrigeonda(variable2,i));
 end;

end.
