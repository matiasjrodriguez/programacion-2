unit ParmoniosaInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ParmoniosaTAD;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
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
var Ncant, min : integer;
  Invoca : lPalabra;
  listafinal : string;
begin
listafinal := ' ';
min := 0;
TryStrToInt(edit1.Text,Ncant);
memo1.Lines.Add(Invoca.Parmoniosa(min,Ncant, listafinal));
end;

end.
