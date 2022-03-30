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
    Label19: TLabel;
    Label20: TLabel;
    eMonedasDe050: TEdit;
    UpDown12: TUpDown;
    eMonedasDe025: TEdit;
    UpDown13: TUpDown;
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
  CR: CajaRegistradora;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  sgCaja.Cells[0,0] := 'CONTENEDOR';
  sgCaja.Cells[1,0] := 'CANTIDAD';
  sgVuelto.Cells[0,0] := 'TIPO';
  sgVuelto.Cells[1,0] := 'CANTIDAD';

  for I := 1 to 6 do begin
    sgCaja.Cells[0,i] := 'Monedas de $ ' + Valores[i].ToString;
    sgVuelto.Cells[0,i] := 'Monedas de $ ' + Valores[i].ToString;
  end;

  for I := 7 to CR.getLongitud do begin
    sgCaja.Cells[0,i] := 'Billetes de $ ' + Valores[i].ToString;
    sgVuelto.Cells[0,i] := 'Billetes de $ ' + Valores[i].ToString;
  end;

  CR.InicializarContenedores;
  CR.InicializarVuelto;
  MostrarCaja();
  MostrarVuelto();
  memo1.Clear;
  btCobrar.Enabled := False;
  eCantidadACobrar.Enabled := False;
end;

procedure MostrarCaja();
var i:integer;
begin
  for i := 1 to CR.getLongitud do begin
    form1.sgCaja.Cells[1,i] := CR.getContenedores[i].Cantidad.ToString;
  end;
end;

procedure MostrarVuelto();
var i:integer;
begin
  for i := 1 to CR.getLongitud do
    form1.sgVuelto.Cells[1,i] := CR.getVuelto[i].Cantidad.ToString;
end;

procedure LimpiarEdits();
begin
  form1.eMonedasDe025.Text := '0';
  form1.eMonedasDe050.Text := '0';
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
var
  ContenedoresAux: ArrayContenedores;
begin
  ContenedoresAux[1].Cantidad := (strtoint(trim(form1.eMonedasDe025.Text)));
  ContenedoresAux[2].Cantidad := (strtoint(trim(form1.eMonedasDe050.Text)));
  ContenedoresAux[3].Cantidad := (strtoint(trim(form1.eMonedasDe1.Text)));
  ContenedoresAux[4].Cantidad := (strtoint(trim(form1.eMonedasDe2.Text)));
  ContenedoresAux[5].Cantidad := (strtoint(trim(form1.eMonedasDe5.Text)));
  ContenedoresAux[6].Cantidad := (strtoint(trim(form1.eMonedasDe10.Text)));
  ContenedoresAux[7].Cantidad := (strtoint(trim(form1.eBilletesDe10.Text)));
  ContenedoresAux[8].Cantidad := (strtoint(trim(form1.eBilletesDe20.Text)));
  ContenedoresAux[9].Cantidad := (strtoint(trim(form1.eBilletesDe50.Text)));
  ContenedoresAux[10].Cantidad := (strtoint(trim(form1.eBilletesDe100.Text)));
  ContenedoresAux[11].Cantidad := (strtoint(trim(form1.eBilletesDe200.Text)));
  ContenedoresAux[12].Cantidad := (strtoint(trim(form1.eBilletesDe500.Text)));
  ContenedoresAux[13].Cantidad := (strtoint(trim(form1.eBilletesDe1000.Text)));
  C.AgregarACaja(ContenedoresAux);
end;

procedure TForm1.btCobrarClick(Sender: TObject);
var
  aCobrar: double;
  ContenedoresCliente: CajaRegistradora; //Se crea otro objeto para los contenedores del cliente para calcular si se puede efectuar el cobro
  nVuelto: double;
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
  s: double;
begin
  s:= CR.Saldo(CR.getContenedores());
  memo1.Clear;
  memo1.Lines.Add('El saldo total de la caja es: $' + s.ToString);
end;

procedure TForm1.btCerrarCajaClick(Sender: TObject);
var
  ContRestantes: ArrayContenedores;
  saldofinal: double;
  i: Integer;
begin
  ContRestantes := CR.CerrarCaja(saldofinal);
  memo1.Clear;
  memo1.Lines.Add('Cerrando el turno...');
  for i := 1 to CR.getLongitud do
    memo1.Lines.Add('Monedas de ' + Valores[i].ToString + ': ' + ContRestantes[i].Cantidad.ToString);
  memo1.Lines.Add('-----------------------------------------------------------------');
  memo1.Lines.Add('TOTAL ACUMULADO: $' + saldofinal.ToString);
  eCantidadACobrar.Clear;
  CR.InicializarContenedores;
  CR.InicializarVuelto;
  MostrarCaja();
  MostrarVuelto();
  btCobrar.Enabled := False;
  eCantidadACobrar.Enabled := False;
end;

procedure TForm1.eCantidadACobrarChange(Sender: TObject);
begin
  if eCantidadACobrar.Text = '' then
    btCobrar.Enabled := False
  else
    btCobrar.Enabled := True;
end;

end.
