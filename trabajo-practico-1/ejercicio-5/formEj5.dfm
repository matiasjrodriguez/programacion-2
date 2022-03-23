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
  object labelDiagonal1: TLabel
    Left = 39
    Top = 9
    Width = 9
    Height = 18
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labelDiagonal2: TLabel
    Left = 85
    Top = 9
    Width = 9
    Height = 18
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object label2Diagonal1: TLabel
    Left = 39
    Top = 57
    Width = 9
    Height = 18
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object label2Diagonal2: TLabel
    Left = 85
    Top = 57
    Width = 9
    Height = 18
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object editDia: TEdit
    Left = 8
    Top = 8
    Width = 25
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object editMes: TEdit
    Left = 54
    Top = 8
    Width = 25
    Height = 21
    TabOrder = 1
  end
  object editAño: TEdit
    Left = 100
    Top = 8
    Width = 57
    Height = 21
    TabOrder = 2
  end
  object btnCargarFecha: TButton
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Cargar fecha'
    TabOrder = 3
    OnClick = btnCargarFechaClick
  end
  object Memo1: TMemo
    Left = 288
    Top = 10
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object edit2Dia: TEdit
    Left = 8
    Top = 56
    Width = 25
    Height = 21
    NumbersOnly = True
    TabOrder = 5
  end
  object edit2Mes: TEdit
    Left = 54
    Top = 56
    Width = 25
    Height = 21
    TabOrder = 6
  end
  object edit2Año: TEdit
    Left = 100
    Top = 56
    Width = 57
    Height = 21
    TabOrder = 7
  end
  object btnSumarFecha: TButton
    Left = 100
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btnSumarFecha'
    TabOrder = 8
  end
  object btnRestarFecha: TButton
    Left = 192
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btnRestarFecha'
    TabOrder = 9
  end
  object btnCalcularDiferencia: TButton
    Left = 288
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btnCalcularDiferencia'
    TabOrder = 10
  end
  object btnCompararFechas: TButton
    Left = 376
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btnCompararFechas'
    TabOrder = 11
    OnClick = btnCompararFechasClick
  end
end
