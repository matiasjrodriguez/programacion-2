object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 101
  ClientWidth = 374
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
    Left = 8
    Top = 8
    Width = 98
    Height = 13
    Caption = 'Ingrese un numero :'
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 176
    Top = 8
    Width = 185
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 68
    Width = 97
    Height = 25
    Caption = 'Calcular Fibonacci'
    TabOrder = 2
    OnClick = Button1Click
  end
end
