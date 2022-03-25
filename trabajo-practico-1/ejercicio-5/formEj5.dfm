object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 283
  ClientWidth = 668
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
    Width = 270
    Height = 245
    ReadOnly = True
    TabOrder = 0
  end
  object btnCalcularDiferencia: TButton
    Left = 140
    Top = 231
    Width = 107
    Height = 30
    Caption = 'Calcular diferencia'
    TabOrder = 1
    OnClick = btnCalcularDiferenciaClick
  end
  object btnCompararFechas: TButton
    Left = 255
    Top = 231
    Width = 107
    Height = 30
    Caption = 'Comparar fechas'
    TabOrder = 2
    WordWrap = True
    OnClick = btnCompararFechasClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 209
    Caption = 'Fecha 1'
    TabOrder = 3
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
      Top = 163
      Width = 149
      Height = 30
      Caption = #191'Es a'#241'o bisiesto?'
      TabOrder = 3
      OnClick = btnBisiestoClick
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 60
      Width = 149
      Height = 97
      Caption = 'Modificar cantidad de d'#237'as'
      TabOrder = 4
      object editModDias: TEdit
        Left = 38
        Top = 21
        Width = 71
        Height = 21
        TabOrder = 0
      end
      object btnRestarFecha: TButton
        Left = 78
        Top = 53
        Width = 63
        Height = 30
        Caption = 'Restar d'#237'as'
        TabOrder = 1
      end
      object btnSumarFecha: TButton
        Left = 8
        Top = 53
        Width = 63
        Height = 30
        Caption = 'Sumar d'#237'as'
        TabOrder = 2
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 199
    Top = 8
    Width = 185
    Height = 209
    Caption = 'Fecha 2'
    TabOrder = 4
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
      Top = 163
      Width = 152
      Height = 30
      Caption = #191'Es a'#241'o bisiesto?'
      TabOrder = 3
      OnClick = btn2BisiestoClick
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 60
      Width = 149
      Height = 97
      Caption = 'Modificar cantidad de d'#237'as'
      TabOrder = 4
      object edit2ModDias: TEdit
        Left = 38
        Top = 21
        Width = 71
        Height = 21
        TabOrder = 0
      end
      object btn2RestarFecha: TButton
        Left = 78
        Top = 53
        Width = 63
        Height = 30
        Caption = 'Restar d'#237'as'
        TabOrder = 1
      end
      object btn2SumarFecha: TButton
        Left = 8
        Top = 53
        Width = 63
        Height = 30
        Caption = 'Sumar d'#237'as'
        TabOrder = 2
      end
    end
  end
  object btnCargarFecha: TButton
    Left = 24
    Top = 231
    Width = 107
    Height = 30
    Caption = 'Cargar fechas'
    TabOrder = 5
    WordWrap = True
    OnClick = btnCargarFechaClick
  end
end
