object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 453
  ClientWidth = 1003
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 56
    Top = 40
    Width = 57
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = ' 0'
  end
  object Button1: TButton
    Left = 111
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 320
    Top = 0
    Width = 683
    Height = 453
    Align = alRight
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    ExplicitLeft = 312
    ExplicitTop = 8
    ExplicitHeight = 437
  end
  object Edit2: TEdit
    Left = 56
    Top = 88
    Width = 57
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Text = ' 0'
  end
  object Button2: TButton
    Left = 111
    Top = 86
    Width = 90
    Height = 25
    Caption = 'Colocar fondo'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 56
    Top = 136
    Width = 57
    Height = 21
    NumbersOnly = True
    TabOrder = 5
    Text = ' 0'
  end
  object Button3: TButton
    Left = 111
    Top = 134
    Width = 90
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 56
    Top = 176
    Width = 145
    Height = 25
    Caption = 'Intercambiar tope y fondo'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 88
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Duplicar'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 88
    Top = 263
    Width = 75
    Height = 25
    Caption = 'Cantidad'
    TabOrder = 9
    OnClick = Button6Click
  end
end
