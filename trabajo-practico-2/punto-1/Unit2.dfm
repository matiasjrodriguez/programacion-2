object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
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
    Left = 144
    Top = 104
    Width = 100
    Height = 13
    Caption = 'ENTRADA DE DATOS'
  end
  object Label2: TLabel
    Left = 144
    Top = 149
    Width = 3
    Height = 13
  end
  object Edit1: TEdit
    Left = 144
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 296
    Top = 118
    Width = 129
    Height = 25
    Caption = 'VERIFICAR PALINDROMO'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
