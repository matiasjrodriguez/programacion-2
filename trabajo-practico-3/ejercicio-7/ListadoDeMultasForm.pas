unit ListadoDeMultasForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ListadoDeMultasTAD, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids;

const
  GridCol : Array [0..1] of String = ('Consulta','Resultado');
  GridRow : Array [1..3] of String = ('Mayor Infractor','Mayor Deudor','Hay sin Deuda?');
type
  TForm1 = class(TForm)
    EditPatente: TEdit;
    BotonCargar: TButton;
    BotonConsultar: TButton;
    ListPatentes: TListBox;
    PatenteValida: TPanel;
    botonMultar: TButton;
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    consulta: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure EditPatenteChange(Sender: TObject);
    procedure BotonCargarClick(Sender: TObject);
    procedure initGrid();
    procedure actualizarGrid();
    procedure botonMultarClick(Sender: TObject);
    procedure BotonConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  listVehiculos : ListadoVehiculos;

implementation

{$R *.dfm}

function todasLetras(cadena : String) : boolean;
var
  esLetra : boolean;
begin
  esLetra := (cadena[Length(cadena)] >= #65)  and  (cadena[Length(cadena)] <= #90);
  if Length(cadena) = 1 then begin
     result := esLetra;
  end
  else if esLetra then
     result := todasLetras(Copy(cadena,1,Length(cadena)-1))
  else
     result:= esLetra;
end;

procedure TForm1.actualizarGrid;
begin
  StringGrid1.Cells[1,1] := listVehiculos.mayorInfracciones.Clave;
  StringGrid1.Cells[1,2] := listVehiculos.mayorDeuda.Clave;
  if listVehiculos.noDeuda then
     StringGrid1.Cells[1,3] := 'Si'
  else
     StringGrid1.Cells[1,3] := 'No'
end;

procedure TForm1.BotonCargarClick(Sender: TObject);
begin
  listVehiculos.agregarVehiculo(EditPatente.Text);
  listPatentes.AddItem(UpperCase(EditPatente.Text),ListPatentes);
  EditPatente.Clear;
end;

procedure TForm1.BotonConsultarClick(Sender: TObject);
begin
  consulta.Clear;
  consulta.Lines.Add('Deuda total del vehiculo : '+(listVehiculos.deudaTotal(UpperCase(EditPatente.Text)).ToString));
  consulta.Lines.Add('Multa mas Antigua        : '+listVehiculos.multaAntigua(UpperCase(editPatente.Text)).Clave);
  consulta.Lines.Add('Multa mas Reciente       : '+listVehiculos.multaReciente(UpperCase(editPatente.Text)).Clave);
end;

procedure TForm1.botonMultarClick(Sender: TObject);
var
  acta, valorMulta : String;
  valorM : Double;
  a : integer;
  fecha : TDATE;
begin
  fecha := now;
  if inputQuery('Haciendo Multa','Ingrese Numero de acta',acta) then
     if tryStrToInt(acta,a) then
        if inputQuery('Haciendo Multa','Ingrese Valor de multa',valorMulta) then
           if tryStrToFloat(valorMulta,valorM) then begin
              listVehiculos.multar(UpperCase(editPatente.Text),acta,fecha,valorM);
              actualizarGrid();
           end;
end;

procedure TForm1.EditPatenteChange(Sender: TObject);
var
  letras1, letras2, nums : String;
  n : integer;
  yaCargada : boolean;
  patente : String;
begin
   patente := UpperCase(EditPatente.Text);
   if Length(patente) = 6 then begin  //para las patentes viejas
      letras1 := (Copy(patente,1,3));
      nums := Copy(patente,4,3);
      if todasLetras(letras1) and TryStrToInt(nums,n) then begin
         PatenteValida.Color := clGreen;
         yaCargada := (listVehiculos.VehiculoEsta(patente)) and (not listVehiculos.getListado.EsVacia);
         BotonCargar.Enabled := not YaCargada;
         BotonConsultar.Enabled := YaCargada;
         BotonMultar.Enabled := YaCargada;
      end
      else begin
         PatenteValida.Color := clRed;
         BotonCargar.Enabled := false;
         BotonConsultar.Enabled := false;
         BotonMultar.Enabled := false;
      end;
   end
   else if Length(patente) = 7 then begin
      letras1 := Copy(patente,1,2);
      nums := Copy(patente,3,3);
      letras2 := UpperCase(Copy(patente,6,2));
      if todasLetras(letras1) and todasLetras(letras2) and TryStrToInt(nums,n) then begin
        PatenteValida.Color := clGreen;
        yaCargada := (listVehiculos.VehiculoEsta(patente)) and (not listVehiculos.getListado.EsVacia);
        BotonCargar.Enabled := not YaCargada;
        BotonConsultar.Enabled := YaCargada;
        BotonMultar.Enabled := YaCargada;
      end
      else begin
        PatenteValida.Color := clRed;
        BotonCargar.Enabled := false;
        BotonConsultar.Enabled := false;
        BotonMultar.Enabled := false;
      end;
   end
   else begin
      PatenteValida.Color := clRed;
      BotonCargar.Enabled := false;
      BotonConsultar.Enabled := false;
      BotonMultar.Enabled := false;
   end;
end;

procedure TForm1.initGrid();
var
  i, j: Integer;
  begin
    for j := 0 to StringGrid1.ColCount-1 do
      StringGrid1.Cells[j,0] := GridCol[j];
    for i := 1 to StringGrid1.RowCount-1 do
      StringGrid1.Cells[0,i] := GridRow[i];
  end;


procedure TForm1.FormCreate(Sender: TObject);
var
  f1,f2,f3:TDateTime;
begin
  listVehiculos.Create;
  initGrid();
  actualizarGrid();
 { listVehiculos.multar('AA100AA','1000',f1,1500.00);
  listVehiculos.multar('AA100AA','1001',f3,1700.00);
  listVehiculos.multar('AA100AA','1002',f2,1800.00);
  listVehiculos.deudaTotal('AA100AA');
  listVehiculos.multaAntigua('AA100AA');
  listVehiculos.multaReciente('AA100AA');
  listVehiculos.mayorInfracciones();
  listVehiculos.multaReciente('AA100AA');    }
end;


end.
