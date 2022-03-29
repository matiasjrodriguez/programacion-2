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
  object Label1: TLabel
    Left = 168
    Top = 53
    Width = 63
    Height = 16
    Caption = '_________'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 367
    Top = 53
    Width = 56
    Height = 16
    Caption = '________'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 192
    Top = 7
    Width = 23
    Height = 13
    Caption = 'NR 1'
  end
  object Label4: TLabel
    Left = 384
    Top = 7
    Width = 23
    Height = 13
    Caption = 'NR 2'
  end
  object Sumar: TButton
    Left = 36
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Sumar'
    TabOrder = 0
    OnClick = SumarClick
  end
  object Restar: TButton
    Left = 36
    Top = 79
    Width = 75
    Height = 25
    Caption = 'Restar'
    TabOrder = 1
    OnClick = RestarClick
  end
  object Multiplicar: TButton
    Left = 526
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Multiplicar'
    TabOrder = 2
    OnClick = MultiplicarClick
  end
  object Dividir: TButton
    Left = 526
    Top = 79
    Width = 75
    Height = 25
    Caption = 'Dividir'
    TabOrder = 3
    OnClick = DividirClick
  end
  object Potencia: TButton
    Left = 22
    Top = 192
    Width = 89
    Height = 25
    Caption = 'Potencia a NR1'
    TabOrder = 4
    OnClick = PotenciaClick
  end
  object Comparar: TButton
    Left = 526
    Top = 160
    Width = 75
    Height = 41
    Caption = 'Comparar'
    TabOrder = 5
    OnClick = CompararClick
  end
  object Edit1: TEdit
    Left = 160
    Top = 26
    Width = 81
    Height = 21
    Alignment = taCenter
    TabOrder = 6
  end
  object Memo1: TMemo
    Left = 136
    Top = 120
    Width = 352
    Height = 171
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object Edit2: TEdit
    Left = 160
    Top = 81
    Width = 81
    Height = 21
    Alignment = taCenter
    TabOrder = 8
  end
  object Edit3: TEdit
    Left = 359
    Top = 26
    Width = 74
    Height = 21
    Alignment = taCenter
    TabOrder = 9
  end
  object Edit4: TEdit
    Left = 359
    Top = 85
    Width = 74
    Height = 21
    Alignment = taCenter
    TabOrder = 10
  end
  object Edit5: TEdit
    Left = 40
    Top = 170
    Width = 57
    Height = 21
    Alignment = taCenter
    TabOrder = 11
  end
end
