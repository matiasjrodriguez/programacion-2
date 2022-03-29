unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, unit_numeroBinario,
  Vcl.Buttons;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }




  end;

var
  Form2: TForm2;
  modoBinario:boolean;
  entrada:numeroBinario;
 entrada2:numeroBinario;
resultado:numeroBinario;
implementation

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
var numeroARestar:numeroBinario;
begin
if not(edit1.Text='') and not(edit2.Text='') and (modoBinario=true) then
    begin

      resultado.cargarNumeroBinario(edit1.Text,numeroArestar.complementoA2(edit2.Text));

      edit3.Text:=resultado.restaBinaria(edit2.Text);
    end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
   if modoBinario=true then
    begin
       modoBinario:=false;
       edit1.Enabled:=false;
       edit2.Enabled:=false;
       Button1.Enabled:=false;
       BitBtn1.Enabled:=false;
       BitBtn3.Enabled:=false;
       BitBtn4.Enabled:=false;
       BitBtn5.Enabled:=false;
       edit1.Text:= entrada.convertirADecimal(edit1.Text);
       edit2.Text:= entrada2.convertirADecimal(edit2.Text);
       edit3.Text:= resultado.convertirADecimal(edit3.Text);
    end
   else if modoBinario=false then
    begin
       modoBinario:=true;
       edit1.Enabled:=true;
       edit2.Enabled:=true;
       Button1.Enabled:=true;
       BitBtn1.Enabled:=true;
       BitBtn3.Enabled:=true;
       BitBtn4.Enabled:=true;
       BitBtn5.Enabled:=true;
       edit1.Text:= entrada.converirABinario(edit1.Text);
       edit2.Text:= entrada2.converirABinario(edit2.Text);
       edit3.Text:= resultado.converirABinario(edit3.Text);
    end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
   if not(edit1.Text='') and not(edit2.Text='') and (modoBinario=true) then
    begin
       resultado.cargarNumeroBinario(edit1.Text,edit2.Text);
       edit3.Text:= resultado.operacionOR(edit1.Text,edit2.Text);
    end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
   if not(edit1.Text='') and not(edit2.Text='') and (modoBinario=true) then
    begin
       resultado.cargarNumeroBinario(edit1.Text,edit2.Text);
       edit3.Text:= resultado.operacionAND(edit1.Text,edit2.Text);
    end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
   if not(edit1.Text='') and not(edit2.Text='') and (modoBinario=true) then
    begin
       resultado.cargarNumeroBinario(edit1.Text,edit2.Text);
       edit3.Text:= resultado.operacionXOR(edit1.Text,edit2.Text);
    end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
   if not(edit1.Text='') and not(edit2.Text='') and (modoBinario=true) then
    begin
      resultado.cargarNumeroBinario(edit1.Text,edit2.Text);

      edit3.Text:=resultado.sumaBinaria;
    end;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
if modoBinario=true then
begin
   if entrada.verificarDato(edit1.Text)and not(length(edit1.Text)>16) then
      begin
          entrada.setearValorMemoria(edit1.Text);
      end;
edit1.text := entrada.obtenerValorMemoria;
end;

end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
if modoBinario=true then
begin
   if entrada2.verificarDato(edit2.Text)and not(length(edit2.Text)>16)  then
      begin
          entrada2.setearValorMemoria(edit2.Text);
      end;
edit2.text := entrada2.obtenerValorMemoria;
end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   modoBinario:=true;
   edit3.Enabled:=false;
end;

end.
