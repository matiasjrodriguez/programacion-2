object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 518
  ClientWidth = 697
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
    Top = 24
    Width = 198
    Height = 13
    Caption = 'Inserte L o H para representar una onda '
  end
  object Label2: TLabel
    Left = 56
    Top = 77
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object Edit1: TEdit
    Left = 56
    Top = 43
    Width = 274
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 336
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Onda digital'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 80
    Top = 136
    Width = 553
    Height = 321
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
end
