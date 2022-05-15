object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 327
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
    Left = 336
    Top = 21
    Width = 21
    Height = 13
    Caption = 'Cola'
  end
  object Label2: TLabel
    Left = 432
    Top = 21
    Width = 16
    Height = 13
    Caption = 'Pila'
  end
  object Label3: TLabel
    Left = 520
    Top = 14
    Width = 73
    Height = 13
    Caption = 'Lista Resultado'
  end
  object Label4: TLabel
    Left = 286
    Top = 45
    Width = 32
    Height = 13
    Caption = 'Frente'
  end
  object Label5: TLabel
    Left = 386
    Top = 45
    Width = 24
    Height = 13
    Caption = 'Tope'
  end
  object Label6: TLabel
    Left = 504
    Top = 306
    Width = 104
    Height = 13
    Caption = '(Nro:PosPila:PosCola)'
  end
  object Memo1: TMemo
    Left = 324
    Top = 40
    Width = 45
    Height = 267
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 96
    Top = 76
    Width = 121
    Height = 49
    Caption = 'Generar y mostrar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 416
    Top = 40
    Width = 49
    Height = 267
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object Memo3: TMemo
    Left = 520
    Top = 33
    Width = 73
    Height = 267
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object Button2: TButton
    Left = 96
    Top = 160
    Width = 121
    Height = 65
    Caption = 'Mostrar Comunes'
    Enabled = False
    TabOrder = 4
    OnClick = Button2Click
  end
end
