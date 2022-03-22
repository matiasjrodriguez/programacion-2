unit TADCajaRegistradoraForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TADCajaRegistradora, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.Outline;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    eMonedasDe1: TEdit;
    UpDown1: TUpDown;
    eMonedasDe2: TEdit;
    UpDown2: TUpDown;
    eMonedasDe5: TEdit;
    UpDown3: TUpDown;
    eMonedasDe10: TEdit;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    UpDown7: TUpDown;
    UpDown8: TUpDown;
    UpDown9: TUpDown;
    UpDown10: TUpDown;
    UpDown11: TUpDown;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    eBilletesDe10: TEdit;
    eBilletesDe100: TEdit;
    eBilletesDe1000: TEdit;
    eBilletesde20: TEdit;
    eBilletesDe200: TEdit;
    eBilletesDe50: TEdit;
    eBilletesDe500: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
