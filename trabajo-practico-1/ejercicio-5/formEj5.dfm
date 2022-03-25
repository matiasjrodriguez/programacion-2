object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 508
  ClientWidth = 647
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
    Left = 390
    Top = 16
    Width = 251
    Height = 225
    ReadOnly = True
    TabOrder = 0
  end
  object btnSumarFecha: TButton
    Left = 148
    Top = 440
    Width = 75
    Height = 25
    Caption = 'btnSumarFecha'
    TabOrder = 1
  end
  object btnRestarFecha: TButton
    Left = 240
    Top = 440
    Width = 75
    Height = 25
    Caption = 'btnRestarFecha'
    TabOrder = 2
  end
  object btnCalcularDiferencia: TButton
    Left = 336
    Top = 440
    Width = 75
    Height = 25
    Caption = 'btnCalcularDiferencia'
    TabOrder = 3
  end
  object btnCompararFechas: TButton
    Left = 137
    Top = 143
    Width = 107
    Height = 30
    Caption = 'Comparar fechas'
    TabOrder = 4
    WordWrap = True
    OnClick = btnCompararFechasClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 121
    Caption = 'Fecha 1'
    TabOrder = 5
    object labelDiagonal1: TLabel
      Left = 47
      Top = 25
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
      Left = 93
      Top = 25
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
    object editAño: TEdit
      Left = 108
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object editDia: TEdit
      Left = 16
      Top = 24
      Width = 25
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object editMes: TEdit
      Left = 62
      Top = 24
      Width = 25
      Height = 21
      TabOrder = 2
    end
    object btnBisiesto: TButton
      Left = 16
      Top = 59
      Width = 149
      Height = 30
      Caption = #191'Es a'#241'o bisiesto?'
      TabOrder = 3
      OnClick = btnBisiestoClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 199
    Top = 8
    Width = 185
    Height = 121
    Caption = 'Fecha 2'
    TabOrder = 6
    object label2Diagonal1: TLabel
      Left = 47
      Top = 25
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
      Left = 93
      Top = 25
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
    object edit2Año: TEdit
      Left = 108
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object edit2Dia: TEdit
      Left = 16
      Top = 24
      Width = 25
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object edit2Mes: TEdit
      Left = 62
      Top = 24
      Width = 25
      Height = 21
      TabOrder = 2
    end
    object btn2Bisiesto: TButton
      Left = 14
      Top = 59
      Width = 149
      Height = 30
      Caption = #191'Es a'#241'o bisiesto?'
      TabOrder = 3
      OnClick = btn2BisiestoClick
    end
  end
  object btnCargarFecha: TButton
    Left = 24
    Top = 143
    Width = 107
    Height = 30
    Caption = 'Cargar fechas'
    TabOrder = 7
    WordWrap = True
    OnClick = btnCargarFechaClick
  end
end
