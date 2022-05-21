object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 636
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 160
    Top = 8
    Width = 552
    Height = 620
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 101
    Width = 129
    Height = 201
    Caption = 'Probar ejemplo'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 344
    Width = 129
    Height = 201
    Caption = 'Probar random'
    TabOrder = 2
    OnClick = Button2Click
  end
end
