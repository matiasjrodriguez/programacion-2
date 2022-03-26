unit formEj10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADTarjetaDeCredito;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  tdc: TarjetaDeCredito;
  empresa: EMISORAS;
begin
  tdc.setNumero(edit1.Text);

  if tdc.validarNro() then
    Memo1.Lines.Add('Es valida')
  else
    Memo1.Lines.Add('No es valida');

  empresa := tdc.entidadEmisora();

  case empresa of
    Visa: Memo1.Lines.Add('Visa');
    Mastercard: Memo1.Lines.Add('Mastercard');
    AmericanExpress: Memo1.Lines.Add('AmericanExpress');
    Maestro: Memo1.Lines.Add('Maestro');
    else Memo1.Lines.Add('No pertenece a ninguna empresa registrada');
  end;

end;

end.
