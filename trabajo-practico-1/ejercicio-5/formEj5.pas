unit formEj5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TADFecha, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    editDia: TEdit;
    labelDiagonal1: TLabel;
    labelDiagonal2: TLabel;
    editMes: TEdit;
    editA�o: TEdit;
    btnCargarFecha: TButton;
    Memo1: TMemo;
    label2Diagonal1: TLabel;
    label2Diagonal2: TLabel;
    edit2Dia: TEdit;
    edit2Mes: TEdit;
    edit2A�o: TEdit;
    btnSumarFecha: TButton;
    btnRestarFecha: TButton;
    btnCalcularDiferencia: TButton;
    btnCompararFechas: TButton;
    procedure btnCargarFechaClick(Sender: TObject);
    procedure btnCompararFechasClick(Sender: TObject);
    procedure cargarFecha(sDia1, sMes1, sA�o1, sDia2, sMes2, sA�o2:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fecha1, fecha2: Fecha;

implementation

{$R *.dfm}

procedure TForm1.cargarFecha(sDia1, sMes1, sA�o1, sDia2, sMes2, sA�o2:string);
var
  dia1, mes1, a�o1, dia2, mes2, a�o2:integer;
begin
  TryStrToInt(editDia.Text, dia1);
  TryStrToInt(editMes.Text, mes1);
  TryStrToInt(editA�o.Text, a�o1);
  TryStrToInt(edit2Dia.Text, dia2);
  TryStrToInt(edit2Mes.Text, mes2);
  TryStrToInt(edit2A�o.Text, a�o2);
  Memo1.Clear;

  if fecha1.cargarFecha(dia1, mes1, a�o1) and fecha2.cargarFecha(dia2, mes2, a�o2) then begin
    Memo1.Lines.Add(fecha1.stringFecha);
    Memo1.Lines.Add(fecha2.stringFecha);
  end else
    Memo1.Lines.Add('Error');
end;

procedure TForm1.btnCargarFechaClick(Sender: TObject);
begin
  cargarFecha(editDia.Text, editMes.Text, editA�o.Text, edit2Dia.Text, edit2Mes.Text, edit2A�o.Text);
end;

procedure TForm1.btnCompararFechasClick(Sender: TObject);
var comparacion: string;
begin
  cargarFecha(editDia.Text, editMes.Text, editA�o.Text, edit2Dia.Text, edit2Mes.Text, edit2A�o.Text);
  comparacion := fecha1.comparar(fecha2);
  Memo1.Lines.Add(comparacion);
end;

end.
