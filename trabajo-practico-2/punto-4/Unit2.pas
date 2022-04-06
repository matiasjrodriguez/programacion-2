unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,unit_conciente;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
var resto, cociente:string;
             numero:conciente;
begin
    if not (edit2.Text = '0') then
      begin
        resto:=numero.cocienteEntreDosNumeros(edit1.Text,edit2.Text);
        cociente:= numero.obtenerResultado;
        edit3.Text:= 'COCIENTE: ' + cociente + ' RESTO: '+ resto;
      end
    else
      begin
          edit3.Text:= 'NO SE PUEDE DIVIDIR POR CERO'
      end;
end;

end.
