object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 108
  ClientWidth = 474
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
    Left = 16
    Top = 21
    Width = 278
    Height = 13
    Caption = 'Inserte 2 numeros para obtener el producto entre ambos:'
  end
  object Label2: TLabel
    Left = 183
    Top = 43
    Width = 6
    Height = 13
    Caption = 'X'
  end
  object Label3: TLabel
    Left = 343
    Top = 43
    Width = 8
    Height = 13
    Caption = '='
  end
  object Edit1: TEdit
    Left = 40
    Top = 40
    Width = 106
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 223
    Top = 40
    Width = 106
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 144
    Top = 67
    Width = 81
    Height = 33
    Caption = 'Producto'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 361
    Top = 32
    Width = 88
    Height = 41
    ReadOnly = True
    TabOrder = 3
  end
end
