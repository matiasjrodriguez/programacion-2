unit formEj10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADTarjetaDeCredito,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    btPagar: TButton;
    Memo1: TMemo;
    eNumero: TEdit;
    Label1: TLabel;
    eMonto: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    eUnaCuota: TEdit;
    eVariasCuotas: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    btLimites: TButton;
    btValidar: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    eMes: TEdit;
    eAño: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    eCuotas: TEdit;
    Label10: TLabel;
    GroupBox2: TGroupBox;
    UpDown1: TUpDown;
    Label11: TLabel;
    lFecha: TLabel;
    procedure btPagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btValidarClick(Sender: TObject);
    procedure btLimitesClick(Sender: TObject);
    procedure eNumeroChange(Sender: TObject);
    procedure eUnaCuotaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  tdc : TarjetaDeCredito;
  fecha: TDateTime;

implementation

{$R *.dfm}

procedure TForm1.btLimitesClick(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add(tdc.mostrarLimites());
end;

procedure TForm1.btPagarClick(Sender: TObject);
var
  monto, cuotas: integer;
  lim: RegLimite;
begin
  memo1.Clear;
  monto := strtoint(eMonto.Text);
  cuotas := strtoint(eCuotas.Text);
  if eUnaCuota.Enabled and eVariasCuotas.Enabled then begin
    lim.unaCuota := strtoint(eUnaCuota.Text);
    lim.variasCuotas := strtoint(eVariasCuotas.Text);
    tdc.setLimite(lim);
  end;
  if cuotas = 1 then begin
    if tdc.comprarUnaCuota(monto) then
      memo1.Lines.Add('Compra efectuada con exito')
    else
      memo1.Lines.Add('ERROR: Limite de credito de una cuota excedido');

  end else

  if cuotas > 1 then begin
    if tdc.comprarMuchasCuotas(monto,cuotas) then
      memo1.Lines.Add('Compra efectuada con exito')
    else
      memo1.Lines.Add('ERROR: Limite de credito de varias cuotas excedido');
  end;
  btLimites.Enabled := True;
  eUnaCuota.Enabled := False;
  eVariasCuotas.Enabled := False;
  eMonto.Clear;
  eCuotas.Text := '0';
end;

procedure TForm1.btValidarClick(Sender: TObject);
var
  n: string;
  fechaVencimiento: TdateTime;
  mes,año: integer;
begin
  n := eNumero.Text;
  if length(n) = 16 then begin
    tdc.setNumero(n);
    mes := strtoint(eMes.Text);
    año := strtoint('20' + eAño.Text);

    if (mes >= 1) and (mes <= 12) and (año >= 2000) then begin

      fechaVencimiento := encodeDate(año,mes,28);

      if (tdc.validarNro()) and (tdc.entidadEmisora <> Null) and (fecha <= FechaVencimiento) then begin
        memo1.Clear;
        memo1.Lines.Add('Numero de tarjeta: ' + tdc.getNumero);
        case tdc.entidadEmisora of
          Visa: Memo1.Lines.Add('Emisora: Visa');
          Mastercard: Memo1.Lines.Add('Emisora: Mastercard');
          AmericanExpress: Memo1.Lines.Add('Emisora: AmericanExpress');
          Maestro: Memo1.Lines.Add('Emisora: Maestro');
        end;
        eUnaCuota.Clear;
        eVariasCuotas.Clear;

      end else begin
        memo1.Clear;
        memo1.Lines.Add('ERROR:');
        if not tdc.validarNro() then
          memo1.Lines.Add('La tarjeta no es valida.');
        if (tdc.entidadEmisora = Null) then
          memo1.Lines.Add('La tarjeta no corresponde a ninguna emisora.');
        if fecha > fechaVencimiento then
          memo1.Lines.Add('La tarjeta se encuentra vencida.');
        btPagar.Enabled := False;
        eUnaCuota.Clear;
        eVariasCuotas.Clear;
        eUnaCuota.Enabled := True;
        eVariasCuotas.Enabled := True;
        btLimites.Enabled := False;
      end;

    end else
      messagedlg('Ingrese una fecha válida (mm/aa)',mtError,[mbOk],0);

  end else
    messagedlg('El número de la tarjeta debe tener 16 caracteres',mtError,[mbOk],0);
end;

procedure TForm1.eNumeroChange(Sender: TObject);
begin
  if (eAño.Text <> '') and (eMes.Text <> '') and (eNumero.Text <> '') then
    btValidar.Enabled := True
  else
    btValidar.Enabled := False;
end;

procedure TForm1.eUnaCuotaChange(Sender: TObject);
begin
  if (eUnaCuota.Text <> '') and (eVariasCuotas.Text <> '') and (eMonto.Text <> '') and
  ((strtoint(eCuotas.Text) > 0)) and (eAño.Text <> '') and (eMes.Text <> '') and (eNumero.Text <> '') then
    btPagar.Enabled := true
  else
    btPagar.Enabled := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fecha := Now;
  lFecha.Caption := datetostr(fecha);
  memo1.Clear;
  btValidar.Enabled := False;
  btPagar.Enabled := False;
  btLimites.Enabled := False;
end;

end.
