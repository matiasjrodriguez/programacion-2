object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'DIVIDIR'
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
    Left = 56
    Top = 13
    Width = 56
    Height = 13
    Caption = 'DIVIDENDO'
  end
  object Label2: TLabel
    Left = 56
    Top = 77
    Width = 42
    Height = 13
    Caption = 'DIVISOR'
  end
  object Label3: TLabel
    Left = 56
    Top = 133
    Width = 51
    Height = 13
    Caption = 'COCIENTE'
  end
  object Edit1: TEdit
    Left = 56
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 56
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 264
    Top = 30
    Width = 75
    Height = 25
    Caption = 'DIVIDIR'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Edit3: TEdit
    Left = 56
    Top = 152
    Width = 481
    Height = 21
    TabOrder = 3
  end
end
