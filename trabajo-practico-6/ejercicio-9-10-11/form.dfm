object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 264
  ClientWidth = 830
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
    Left = 44
    Top = 111
    Width = 61
    Height = 13
    Caption = 'Repeticiones'
  end
  object Memo1: TMemo
    Left = 224
    Top = 8
    Width = 598
    Height = 249
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 24
    Width = 185
    Height = 33
    Caption = 'Cargar y Comparar Normal con AVL'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 138
    Width = 193
    Height = 40
    Caption = 'Comparar Random Busqueda con AVL'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 111
    Top = 111
    Width = 33
    Height = 21
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 3
    Text = '1'
  end
  object Button3: TButton
    Left = 8
    Top = 184
    Width = 193
    Height = 33
    Caption = 'Comparar Randoms con AVL, B y B+'
    TabOrder = 4
    OnClick = Button3Click
  end
end
