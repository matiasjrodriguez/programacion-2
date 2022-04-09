object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 214
  ClientWidth = 522
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
    Left = 42
    Top = 25
    Width = 204
    Height = 13
    Caption = 'Ingrese el conjunto separado por espacios'
  end
  object Label2: TLabel
    Left = 42
    Top = 71
    Width = 87
    Height = 13
    Caption = 'Ingrese el n'#250'mero'
  end
  object Button1: TButton
    Left = 42
    Top = 126
    Width = 105
    Height = 43
    Caption = 'Calcular conjuntos'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 252
    Top = 25
    Width = 109
    Height = 157
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object eVector: TEdit
    Left = 42
    Top = 44
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object eNumero: TEdit
    Left = 42
    Top = 88
    Width = 47
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
end
