object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 366
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 82
    Width = 48
    Height = 13
    Caption = 'Ejercicio 1'
  end
  object Label2: TLabel
    Left = 80
    Top = 139
    Width = 48
    Height = 13
    Caption = 'Ejercicio 2'
  end
  object Memo1: TMemo
    Left = 224
    Top = 8
    Width = 606
    Height = 337
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 48
    Top = 24
    Width = 116
    Height = 36
    Caption = 'Cargar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Hojas'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 113
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Ocurrencias'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 87
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 48
    Top = 158
    Width = 33
    Height = 21
    Alignment = taCenter
    TabOrder = 5
  end
  object Button5: TButton
    Left = 64
    Top = 189
    Width = 75
    Height = 25
    Caption = 'Iguales?'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 51
    Top = 248
    Width = 113
    Height = 25
    Caption = 'Cargar Arbol n-ario'
    TabOrder = 7
    OnClick = Button6Click
  end
end
