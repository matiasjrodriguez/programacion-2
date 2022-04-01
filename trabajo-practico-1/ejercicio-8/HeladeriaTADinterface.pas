unit HeladeriaTADinterface;

interface

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////SIN TERMINAR////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, heladeraCongelador;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button3: TButton;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Label9: TLabel;
    Memo5: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  choco,cremaAmex, fruti, limon : congelador;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  c, cA, f, l : Single;
begin
 if checkbox1.Checked = True then
 begin
    choco.cargarKilaje_chocolate(kilos);
    c := choco.obtenerKilaje_chocolate;
    memo1.Lines.Add(c.tostring+'KG');
 end;
 if checkbox2.Checked = True then
 begin
  cremaAmex.cargarKilaje_cremaAmericana(kilos);
  cA := cremaAmex.obtenerKilaje_cremaAmericana;
   memo2.Lines.Add(cA.tostring+'KG');
 end;
 if checkbox3.Checked = True then
 begin
    fruti.cargarKilaje_frutilla(kilos);
   f := fruti.obtenerKilaje_frutilla;
   memo3.Lines.Add(f.tostring+'KG');
 end;
 if checkbox4.Checked = True then
 begin
   limon.cargarKilaje_limon(kilos);
   l := limon.obtenerKilaje_limon;
   memo4.Lines.Add(l.tostring+'KG');
 end;


end;

procedure TForm1.Button2Click(Sender: TObject);
var cant_bochas : single;
  congelador302 : congelador;
  sabor1, sabor2, sabor3 : single;
begin
    cant_bochas := StrtoFloat(edit1.Text);
  if cant_bochas = 3 then begin
    if checkbox1.Checked and checkbox2.Checked and checkbox3.Checked then   // 1 chooco, 2 crema americana
    begin                                                                    // 3 frutilla, 4 limon
      sabor1 := choco.obtenerKilaje_chocolate;                                   //choco,cremaAmex, fruti, limon
      sabor2 := cremaAmex.obtenerKilaje_cremaAmericana;
      sabor3 := fruti.obtenerKilaje_frutilla;
    end else if checkbox1.Checked and checkbox2.Checked and checkbox4.Checked then
    begin
      sabor1 := choco.obtenerKilaje_chocolate;
      sabor2 := cremaAmex.obtenerKilaje_cremaAmericana;
      sabor3 := limon.obtenerKilaje_limon;
    end else if checkbox1.checked and checkbox3.checked and checkbox4.checked then
    begin
      sabor1 := choco.obtenerKilaje_chocolate;
       sabor2 := fruti.obtenerKilaje_frutilla;
       sabor3 := limon.obtenerKilaje_limon;
    end else if checkbox2.Checked and checkbox3.Checked and checkbox4.Checked then
    begin
      sabor1 := cremaAmex.obtenerKilaje_cremaAmericana;
      sabor2 := fruti.obtenerKilaje_frutilla;
      sabor3 := limon.obtenerKilaje_limon;
    end;
    if (TRUE = congelador302.consultar3sabores(sabor1,sabor2,sabor3)) then
    begin
      memo5.Lines.Add('Si alcanza para estos 3 sabores');
    end else begin
      memo5.Lines.Add('No alcanza para estos 3 sabores')
    end;
  end else if cant_bochas = 2 then begin
    if checkbox1.Checked and checkbox2.Checked then
    begin
      sabor1 := choco.obtenerKilaje_chocolate;
      sabor2 := cremaAmex.obtenerKilaje_cremaAmericana;
    end else if checkbox1.Checked and checkbox3.Checked then                  // 1 chooco, 2 crema americana
    begin                                                                    // 3 frutilla, 4 limon
      sabor1 := choco.obtenerKilaje_chocolate;
      sabor2 := fruti.obtenerKilaje_frutilla;                                                                       //choco,cremaAmex, fruti, limon
    end else if checkbox1.Checked and checkbox4.Checked then
    begin
      sabor1 := choco.obtenerKilaje_chocolate;
      sabor2 := limon.obtenerKilaje_limon;
    end else if checkbox2.Checked and checkbox3.Checked then
    begin
      sabor1 := cremaAmex.obtenerKilaje_cremaAmericana;
      sabor2 := fruti.obtenerKilaje_frutilla;
    end else if checkbox2.Checked and checkbox4.Checked then
    begin
      sabor1 := cremaAmex.obtenerKilaje_cremaAmericana;
    end else if checkbox3.Checked and checkbox4.Checked then
    begin
      sabor1 := fruti.obtenerKilaje_frutilla;
      sabor2 := limon.obtenerKilaje_limon;
    end;
    if (TRUE = congelador302.consultar2sabores(sabor1,sabor2)) then
    begin
      memo5.Lines.Add('Si alcanza para estos 2 sabores');
    end else begin
      memo5.Lines.Add('No alcanza para estos 2 sabores')
    end;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  cant_bochas, bochas, unaBocha : single;
  cantEsperadac, cantEsperadacA, cantEsperadaf, cantEsperadal : single;
  c, cA, f, l : Single;
begin
  unaBocha := 0.25;
  cant_bochas := StrtoFloat(edit1.Text);
  if cant_bochas = 3 then begin
    bochas := 0.75;
  end else if cant_bochas = 2 then begin
   bochas := 0.50;
  end;

  if checkbox1.Checked = True then
  begin
     c := choco.obtenerKilaje_chocolate;
     cantEsperadac := c-bochas;
     if (cantEsperadac >= unaBocha)  then
     begin
      choco.cargarKilaje_chocolate(c-unaBocha);
      c := choco.obtenerKilaje_chocolate;
      memo1.Lines.Add(c.tostring+'KG');
      memo1.Lines.Add('Hay suficiente chocolate');
     end else begin
       memo1.Lines.Add('No hay suficiente chocolate');
     end;
  end;

  if checkbox2.Checked = True then
  begin
    cA := cremaAmex.obtenerKilaje_cremaAmericana;
    cantEsperadacA := cA-bochas;
    if (CantEsperadacA >= unaBocha) then
    begin
      cremaAmex.cargarKilaje_cremaAmericana(cA-unaBocha);
      cA := cremaAmex.obtenerKilaje_cremaAmericana;
      memo2.Lines.Add(cA.tostring+'KG');
      memo2.Lines.Add('Hay suficiente Crema Americana');
    end else begin
      memo2.Lines.Add('No hay suficiente Crema Americana');
    end;

  end;

  if checkbox3.Checked = True then
  begin
    f := fruti.obtenerKilaje_frutilla;
    cantEsperadaf := f-bochas;
    if (cantEsperadaf >= unaBocha) then
    begin
      fruti.cargarKilaje_frutilla(f-unaBocha);
      f := fruti.obtenerKilaje_frutilla;
      memo3.Lines.Add(f.tostring+'KG');
      memo3.Lines.Add('Hay suficiente Frutilla');
    end else begin
      memo3.Lines.Add('No hay suficiente Frutilla');
    end;
  end;

  if checkbox4.Checked = True then
  begin
   l := limon.obtenerKilaje_limon;
   cantEsperadal := l-bochas;
   if (cantEsperadal >= unaBocha) then
   begin
    limon.cargarKilaje_limon(l-unaBocha);
    l := limon.obtenerKilaje_limon;
    memo4.Lines.Add(l.tostring+'KG');
     memo4.Lines.Add('Hay suficiente Limon');
   end else begin
    memo4.Lines.Add('No hay suficiente Limon');
   end;
  end;
end;


procedure TForm1.Button4Click(Sender: TObject);
var   habilitaC, habilitaCa, habilitaF, habilitaL : boolean;
  c, cA, f, l, unaBocha : Single;
  cant_bochas:single;
    op1,op2,op3,op4, s : string;
begin
  op1 := 'chocolate';
  op2 := 'crema americana';
  op3 := 'frutilla';
  op4 := 'limon';
  s := '-';
  unaBocha := 0.25;
 if checkbox1.Checked = True then
  begin
     c := choco.obtenerKilaje_chocolate;
     if (c >= unaBocha)  then
     begin
      memo1.Lines.Add(c.tostring+'KG');
      habilitaC := TRUE;
     end;
  end;

  if checkbox2.Checked = True then
  begin
    cA := cremaAmex.obtenerKilaje_cremaAmericana;
    if (cA >= unaBocha) then
    begin
      memo2.Lines.Add(cA.tostring+'KG');
      habilitaCa := TRUE;
    end;

  end;

  if checkbox3.Checked = True then
  begin
    f := fruti.obtenerKilaje_frutilla;
    if (f >= unaBocha) then
    begin
      memo3.Lines.Add(f.tostring+'KG');
      habilitaF := TRUE;
    end;
  end;

  if checkbox4.Checked = True then
  begin
   l := limon.obtenerKilaje_limon;
   if (l >= unaBocha) then
   begin
    memo4.Lines.Add(l.tostring+'KG');
    habilitaL := TRUE;
   end;
  end;
  memo5.Lines.Add('Combinaciones disponibles:');
  if (habilitaC and habilitaCa and habilitaF and habilitaL) = TRUE then
  begin
    memo5.Lines.Add(op1+s+op2+s+op3);
    memo5.Lines.Add(op1+s+op3+s+op4);
    memo5.Lines.Add(op1+s+op2+s+op4);

    memo5.Lines.Add(op2+s+op3+s+op4);

    memo5.Lines.Add(op1+s+op2);
    memo5.Lines.Add(op1+s+op3);
    memo5.Lines.Add(op1+s+op4);
    memo5.Lines.Add(op2+s+op4);
    memo5.Lines.Add(op2+s+op3);
    memo5.Lines.Add(op3+s+op4);
  end else if (habilitaC and habilitaCa and habilitaF) = TRUE then
  begin
    memo5.Lines.Add(op1+s+op2+s+op3);
    memo5.Lines.Add(op1+s+op2);
    memo5.Lines.Add(op1+s+op3);
    memo5.Lines.Add(op2+s+op3);
  end else if (habilitaCa and habilitaF and habilitaL) = TRUE then
  begin
    memo5.Lines.Add(op2+s+op3+s+op4);
    memo5.Lines.Add(op2+s+op4);
    memo5.Lines.Add(op2+s+op3);
    memo5.Lines.Add(op3+s+op4);
  end else if (habilitaC and habilitaF and habilitaL) = TRUE then
  begin
    memo5.Lines.Add(op1+s+op3+s+op4);
    memo5.Lines.Add(op1+s+op3);
    memo5.Lines.Add(op1+s+op4);
    memo5.Lines.Add(op3+s+op4);
  end else if (habilitaC and habilitaCa and habilitaL) = TRUE then
  begin
    memo5.Lines.Add(op1+s+op2+s+op4);
    memo5.Lines.Add(op1+s+op2);
    memo5.Lines.Add(op1+s+op3);
    memo5.Lines.Add(op2+s+op3);

  end else if (habilitaC and habilitaCa ) = TRUE then
  begin
    memo5.Lines.Add(op1+s+op2);
  end else if (habilitaC and habilitaF) = TRUE then
  begin
    memo5.Lines.Add(op1+s+op3);
  end else if (habilitaC and habilitaL) = TRUE then
  begin
    memo5.Lines.Add(op1+s+op4);
  end else if (habilitaCa and habilitaL) = TRUE then
  begin
    memo5.Lines.Add(op2+s+op4);
  end else if (habilitaCa and habilitaF) = TRUE then
  begin
    memo5.Lines.Add(op2+s+op3);
  end else if (habilitaF and habilitaL) = TRUE then
  begin
    memo5.Lines.Add(op3+s+op4);
  end;

end;

end.
