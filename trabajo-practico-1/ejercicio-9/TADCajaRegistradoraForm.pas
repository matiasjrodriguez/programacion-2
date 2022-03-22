unit TADCajaRegistradoraForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TADCajaRegistradora, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids;

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
    sgCaja: TStringGrid;
    btCargar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btCargarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure Mostrar();

var
  Form1: TForm1;
  CR: CajaRegistradora;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  sgCaja.Cells[0,0] := 'CONTENEDOR';
  sgCaja.Cells[1,0] := 'CANTIDAD';
  sgCaja.Cells[0,1] := 'Monedas de $ 1';
  sgCaja.Cells[0,2] := 'Monedas de $ 2';
  sgCaja.Cells[0,3] := 'Monedas de $ 5';
  sgCaja.Cells[0,4] := 'Monedas de $ 10';
  sgCaja.Cells[0,5] := 'Billetes de $ 10';
  sgCaja.Cells[0,6] := 'Billetes de $ 20';
  sgCaja.Cells[0,7] := 'Billetes de $ 50';
  sgCaja.Cells[0,8] := 'Billetes de $ 100';
  sgCaja.Cells[0,9] := 'Billetes de $ 200';
  sgCaja.Cells[0,10] := 'Billetes de $ 500';
  sgCaja.Cells[0,11] := 'Billetes de $ 1000';
  for i := 1 to 11 do
    sgCaja.Cells[1,i] := '0';
  CR.InicializarContenedores;
end;

procedure TForm1.btCargarClick(Sender: TObject);
begin
  CR.cargarMonedasDe1(strtoint(trim(eMonedasDe1.Text)));
  CR.cargarMonedasDe2(strtoint(trim(eMonedasDe2.Text)));
  CR.cargarMonedasDe5(strtoint(trim(eMonedasDe5.Text)));
  CR.cargarMonedasDe10(strtoint(trim(eMonedasDe10.Text)));
  CR.cargarBilletesDe10(strtoint(trim(eBilletesDe10.Text)));
  CR.cargarBilletesDe20(strtoint(trim(eBilletesDe20.Text)));
  CR.cargarBilletesDe50(strtoint(trim(eBilletesDe50.Text)));
  CR.cargarBilletesDe100(strtoint(trim(eBilletesDe100.Text)));
  CR.cargarBilletesDe200(strtoint(trim(eBilletesDe200.Text)));
  CR.cargarBilletesDe500(strtoint(trim(eBilletesDe500.Text)));
  CR.cargarBilletesDe1000(strtoint(trim(eBilletesDe1000.Text)));
  Mostrar();
end;

procedure Mostrar();
begin
  with CR.getContenedores do begin
    form1.sgCaja.Cells[1,1] := MonedasDe1.ToString;
    form1.sgCaja.Cells[1,2] := MonedasDe2.ToString;
    form1.sgCaja.Cells[1,3] := MonedasDe5.ToString;
    form1.sgCaja.Cells[1,4] := MonedasDe10.ToString;
    form1.sgCaja.Cells[1,5] := BilletesDe10.ToString;
    form1.sgCaja.Cells[1,6] := BilletesDe20.ToString;
    form1.sgCaja.Cells[1,7] := BilletesDe50.ToString;
    form1.sgCaja.Cells[1,8] := BilletesDe100.ToString;
    form1.sgCaja.Cells[1,9] := BilletesDe200.ToString;
    form1.sgCaja.Cells[1,10] := BilletesDe500.ToString;
    form1.sgCaja.Cells[1,11] := BilletesDe1000.ToString;
  end;
end;


end.
