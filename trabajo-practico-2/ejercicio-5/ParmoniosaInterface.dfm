object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 255
  ClientWidth = 304
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
    Left = 48
    Top = 24
    Width = 91
    Height = 13
    Caption = 'Ingrese un numero'
  end
  object Edit1: TEdit
    Left = 16
    Top = 43
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 7
    Top = 80
    Width = 289
    Height = 169
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 208
    Top = 43
    Width = 88
    Height = 23
    Caption = 'Parmaniosa'
    TabOrder = 2
    OnClick = Button1Click
  end
end
