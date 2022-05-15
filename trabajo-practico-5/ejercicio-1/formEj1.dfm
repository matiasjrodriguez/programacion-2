object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 419
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
  object Button1: TButton
    Left = 24
    Top = 24
    Width = 121
    Height = 49
    Caption = 'Generar Cola Random'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 416
    Top = 8
    Width = 89
    Height = 403
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 528
    Top = 8
    Width = 89
    Height = 403
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Memo3: TMemo
    Left = 304
    Top = 8
    Width = 89
    Height = 403
    Lines.Strings = (
      'Memo3')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Button2: TButton
    Left = 24
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button2Click
  end
end
