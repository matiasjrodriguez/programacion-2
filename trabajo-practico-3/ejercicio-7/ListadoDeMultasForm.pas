unit ListadoDeMultasForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ListadoDeMultasTAD;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
var
  f1,f2,f3:TDateTime;
begin
  f1 := encodedate(2001,05,01);
  f2 := encodedate(2001,05,04);
  f3 := encodedate(2001,06,01);

  listVehiculos.Create;
  listVehiculos.agregarVehiculo('AA100 AA');
  listVehiculos.agregarVehiculo('AA103 AA');
  listVehiculos.agregarVehiculo('AA106 AA');
  listVehiculos.multar('AA100 AA','1000',f1,1500.00);
  listVehiculos.multar('AA100 AA','1001',f3,1700.00);
  listVehiculos.multar('AA100 AA','1002',f2,1800.00);
  listVehiculos.deudaTotal('AA100 AA');
  listVehiculos.multaAntigua('AA100 AA');
  listVehiculos.multaReciente('AA100 AA');
  listVehiculos.mayorInfracciones();
end;

end.
