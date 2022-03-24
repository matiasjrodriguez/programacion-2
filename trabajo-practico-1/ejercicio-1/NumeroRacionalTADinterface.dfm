object Operaciones: TOperaciones
  Left = 0
  Top = 0
  Caption = 'Operaciones'
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
  object Sumar: TButton
    Left = 16
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Sumar'
    TabOrder = 0
    OnClick = SumarClick
  end
  object Restar: TButton
    Left = 16
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Restar'
    TabOrder = 1
    OnClick = RestarClick
  end
  object Multiplicar: TButton
    Left = 542
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Multiplicar'
    TabOrder = 2
    OnClick = MultiplicarClick
  end
  object Dividir: TButton
    Left = 542
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Dividir'
    TabOrder = 3
    OnClick = DividirClick
  end
  object Potencia: TButton
    Left = 16
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Potencia'
    TabOrder = 4
    OnClick = PotenciaClick
  end
  object Comparar: TButton
    Left = 542
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Comparar'
    TabOrder = 5
    OnClick = CompararClick
  end
  object Edit1: TEdit
    Left = 136
    Top = 26
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Memo1: TMemo
    Left = 136
    Top = 112
    Width = 352
    Height = 179
    TabOrder = 7
  end
  object Edit2: TEdit
    Left = 136
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object Edit3: TEdit
    Left = 319
    Top = 26
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object Edit4: TEdit
    Left = 319
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 10
  end
end
