unit TADCajaRegistradoraForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TADCajaRegistradora, Vcl.StdCtrls, System.UITypes,
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
    btCobrar: TButton;
    sgVuelto: TStringGrid;
    Label12: TLabel;
    Label13: TLabel;
    eCantidadACobrar: TEdit;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Memo1: TMemo;
    btSaldo: TButton;
    btCerrarCaja: TButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btCargarClick(Sender: TObject);
    procedure btCobrarClick(Sender: TObject);
    procedure btSaldoClick(Sender: TObject);
    procedure btCerrarCajaClick(Sender: TObject);
    procedure eCantidadACobrarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure MostrarCaja();
  procedure MostrarVuelto();
  procedure LimpiarEdits();
  procedure CargarValores(var C:CajaRegistradora);

var
  Form1: TForm1;
  CR: CajaRegistradora; // Los contenedores de la caja registradora
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
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
  sgVuelto.Cells[0,0] := 'TIPO';
  sgVuelto.Cells[1,0] := 'CANTIDAD';
  sgVuelto.Cells[0,1] := 'Monedas de $ 1';
  sgVuelto.Cells[0,2] := 'Monedas de $ 2';
  sgVuelto.Cells[0,3] := 'Monedas de $ 5';
  sgVuelto.Cells[0,4] := 'Monedas de $ 10';
  sgVuelto.Cells[0,5] := 'Billetes de $ 10';
  sgVuelto.Cells[0,6] := 'Billetes de $ 20';
  sgVuelto.Cells[0,7] := 'Billetes de $ 50';
  sgVuelto.Cells[0,8] := 'Billetes de $ 100';
  sgVuelto.Cells[0,9] := 'Billetes de $ 200';
  sgVuelto.Cells[0,10] := 'Billetes de $ 500';
  sgVuelto.Cells[0,11] := 'Billetes de $ 1000';
  CR.InicializarContenedores;
  CR.InicializarVuelto;
  MostrarCaja();
  MostrarVuelto();
  memo1.Clear;
  btCobrar.Enabled := False;
  eCantidadACobrar.Enabled := False;
end;

procedure MostrarCaja();
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

procedure MostrarVuelto();
begin
  with CR.getVuelto do begin
    form1.sgVuelto.Cells[1,1] := MonedasDe1.ToString;
    form1.sgVuelto.Cells[1,2] := MonedasDe2.ToString;
    form1.sgVuelto.Cells[1,3] := MonedasDe5.ToString;
    form1.sgVuelto.Cells[1,4] := MonedasDe10.ToString;
    form1.sgVuelto.Cells[1,5] := BilletesDe10.ToString;
    form1.sgVuelto.Cells[1,6] := BilletesDe20.ToString;
    form1.sgVuelto.Cells[1,7] := BilletesDe50.ToString;
    form1.sgVuelto.Cells[1,8] := BilletesDe100.ToString;
    form1.sgVuelto.Cells[1,9] := BilletesDe200.ToString;
    form1.sgVuelto.Cells[1,10] := BilletesDe500.ToString;
    form1.sgVuelto.Cells[1,11] := BilletesDe1000.ToString;
  end;
end;

procedure LimpiarEdits();
begin
  form1.eMonedasDe1.text := '0';
  form1.eMonedasDe2.text := '0';
  form1.eMonedasDe5.text := '0';
  form1.eMonedasDe10.text := '0';
  form1.eBilletesDe10.text := '0';
  form1.eBilletesDe20.text := '0';
  form1.eBilletesDe50.text := '0';
  form1.eBilletesDe100.text := '0';
  form1.eBilletesDe200.text := '0';
  form1.eBilletesDe500.text := '0';
  form1.eBilletesDe1000.text := '0';
end;

procedure TForm1.btCargarClick(Sender: TObject);
begin
  CargarValores(CR);
  MostrarCaja();
  LimpiarEdits();
  eCantidadACobrar.Enabled := True;
  memo1.Clear;
end;

procedure CargarValores(var C:CajaRegistradora);
begin
  with C do begin
    cargarMonedasDe1(strtoint(trim(form1.eMonedasDe1.Text)));
    cargarMonedasDe2(strtoint(trim(form1.eMonedasDe2.Text)));
    cargarMonedasDe5(strtoint(trim(form1.eMonedasDe5.Text)));
    cargarMonedasDe10(strtoint(trim(form1.eMonedasDe10.Text)));
    cargarBilletesDe10(strtoint(trim(form1.eBilletesDe10.Text)));
    cargarBilletesDe20(strtoint(trim(form1.eBilletesDe20.Text)));
    cargarBilletesDe50(strtoint(trim(form1.eBilletesDe50.Text)));
    cargarBilletesDe100(strtoint(trim(form1.eBilletesDe100.Text)));
    cargarBilletesDe200(strtoint(trim(form1.eBilletesDe200.Text)));
    cargarBilletesDe500(strtoint(trim(form1.eBilletesDe500.Text)));
    cargarBilletesDe1000(strtoint(trim(form1.eBilletesDe1000.Text)));
  end;
end;

procedure TForm1.btCobrarClick(Sender: TObject);
var
  aCobrar: integer;
  ContenedoresCliente: CajaRegistradora; //Se crea otro objeto para los contenedores del cliente para calcular si se puede efectuar el cobro
  nVuelto: integer;
  CRCopia: CajaRegistradora; // se crea una copia para verificar si se puede efectuar el vuelto con los contenedores de la caja y asi no perder valores en el proceso
  valor:boolean;
begin
  CR.InicializarVuelto();
  CRCopia := CR;
  MostrarVuelto();
  ContenedoresCliente.InicializarContenedores;
  CargarValores(ContenedoresCliente);
  aCobrar := strtoint(trim(eCantidadaCobrar.Text));

  if not ContenedoresCliente.ValidarCobro(ContenedoresCliente.getContenedores,aCobrar) then
    messagedlg('La cantidad ingresada no es suficiente para cobrar',mtError,[mbOK],0)

  else begin

    if not CRCopia.GenerarVuelto(ContenedoresCliente.getContenedores,aCobrar,nVuelto) then begin //se verifica con la copia del objeto si se puede efectuar el vuelto

      messagedlg('La caja no posee el dinero necesario para efectuar el vuelto exacto de $' + nVuelto.ToString ,mtError,[mbOK],0);
      Exit;

    end
    else begin
      valor := CR.GenerarVuelto(ContenedoresCliente.getContenedores,aCobrar,nVuelto);
      CR.AgregarACaja(ContenedoresCliente.getContenedores);
      MostrarVuelto();
      MostrarCaja();
      LimpiarEdits();
      memo1.Clear;
      eCantidadACobrar.Clear;
      memo1.Lines.Add('A cobrar: $' + aCobrar.ToString);
      memo1.Lines.Add('Se deben entregar $' + nVuelto.ToString + ' de vuelto. En la tabla se muestran la cantidad de cada moneda o billete que se devolverá y se han actualizado los datos de la Caja Registradora.');
    end;
  end;

end;

procedure TForm1.btSaldoClick(Sender: TObject);
var
  s: LongInt;
begin
  s:= CR.Saldo(CR.getContenedores());
  memo1.Clear;
  memo1.Lines.Add('El saldo total de la caja es: $' + s.ToString);
end;

procedure TForm1.btCerrarCajaClick(Sender: TObject);
var
  ContRestantes: RegContenedores;
  saldofinal: integer;
begin
  ContRestantes := CR.CerrarCaja(saldofinal);
  with ContRestantes do begin
    memo1.Clear;
    memo1.Lines.Add('Cerrando el turno...');
    memo1.Lines.Add('Monedas de 1: ' + MonedasDe1.ToString);
    memo1.Lines.Add('Monedas de 2: ' + MonedasDe2.ToString);
    memo1.Lines.Add('Monedas de 5: ' + MonedasDe5.ToString);
    memo1.Lines.Add('Monedas de 10: ' + MonedasDe10.ToString);
    memo1.Lines.Add('Billetes de 10: ' + BilletesDe10.ToString);
    memo1.Lines.Add('Billetes de 20: ' + BilletesDe20.ToString);
    memo1.Lines.Add('Billetes de 50: ' + BilletesDe50.ToString);
    memo1.Lines.Add('Billetes de 100: ' + BilletesDe100.ToString);
    memo1.Lines.Add('Billetes de 200: ' + BilletesDe200.ToString);
    memo1.Lines.Add('Billetes de 500: ' + BilletesDe500.ToString);
    memo1.Lines.Add('Billetes de 1000: ' + BilletesDe1000.ToString);
    memo1.Lines.Add('-----------------------------------------------------------------');
    memo1.Lines.Add('TOTAL ACUMULADO: $' + saldofinal.ToString);
  end;
  eCantidadACobrar.Clear;
  CR.InicializarContenedores;
  CR.InicializarVuelto;
  MostrarCaja();
  MostrarVuelto();
  btCobrar.Enabled := False;
  eCantidadACobrar.Enabled := False
end;

procedure TForm1.eCantidadACobrarChange(Sender: TObject);
begin
  if eCantidadACobrar.Text = '' then
    btCobrar.Enabled := False
  else
    btCobrar.Enabled := True;
end;

end.
