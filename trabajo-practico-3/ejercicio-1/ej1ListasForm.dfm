object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 590
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 22
    Width = 113
    Height = 43
    Caption = 'Mostrar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 136
    Top = 8
    Width = 377
    Height = 574
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 88
    Width = 82
    Height = 25
    Caption = 'Multiplos de'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 96
    Top = 90
    Width = 25
    Height = 21
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 3
    Text = '1'
    OnChange = Edit1Change
  end
  object Button3: TButton
    Left = 8
    Top = 128
    Width = 113
    Height = 41
    Caption = 'Generar Lista Unica'
    TabOrder = 4
    OnClick = Button3Click
  end
end
