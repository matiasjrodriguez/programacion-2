object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
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
    Left = 22
    Top = 31
    Width = 293
    Height = 13
    Caption = 'Ingrese los coeficientes del polinomio separados por espacios'
  end
  object Label2: TLabel
    Left = 22
    Top = 91
    Width = 17
    Height = 13
    Caption = 'X ='
  end
  object Edit1: TEdit
    Left = 22
    Top = 50
    Width = 220
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 248
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Cargar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 360
    Top = 8
    Width = 267
    Height = 283
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 45
    Top = 88
    Width = 36
    Height = 21
    Alignment = taCenter
    TabOrder = 3
  end
  object Button2: TButton
    Left = 87
    Top = 86
    Width = 81
    Height = 25
    Caption = 'Resolver en X'
    TabOrder = 4
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 128
    Width = 319
    Height = 163
    Caption = 'Calcular en un Rango'
    TabOrder = 5
    object Label3: TLabel
      Left = 70
      Top = 32
      Width = 48
      Height = 25
      Caption = '< X <'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 14
      Top = 88
      Width = 48
      Height = 13
      Caption = 'Intervalo:'
    end
    object Edit3: TEdit
      Left = 14
      Top = 32
      Width = 34
      Height = 21
      Alignment = taCenter
      TabOrder = 0
      Text = '0'
    end
    object UpDown1: TUpDown
      Left = 48
      Top = 32
      Width = 16
      Height = 21
      Associate = Edit3
      TabOrder = 1
    end
    object Edit4: TEdit
      Left = 118
      Top = 32
      Width = 36
      Height = 21
      Alignment = taCenter
      TabOrder = 2
      Text = '0'
    end
    object UpDown2: TUpDown
      Left = 152
      Top = 32
      Width = 16
      Height = 21
      Associate = Edit4
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 70
      Top = 88
      Width = 35
      Height = 21
      TabOrder = 4
    end
    object Button3: TButton
      Left = 168
      Top = 80
      Width = 75
      Height = 41
      Caption = 'Calcular'
      TabOrder = 5
      OnClick = Button3Click
    end
  end
end
