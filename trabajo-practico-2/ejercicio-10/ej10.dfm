object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 216
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
  object Button1: TButton
    Left = 112
    Top = 126
    Width = 105
    Height = 43
    Caption = 'Calcular conjuntos'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 314
    Top = 44
    Width = 79
    Height = 157
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object eVector: TEdit
    Left = 42
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object eNumero: TEdit
    Left = 42
    Top = 80
    Width = 47
    Height = 21
    TabOrder = 3
  end
end
