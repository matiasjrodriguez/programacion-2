object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form1'
  ClientHeight = 312
  ClientWidth = 481
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 39
    Width = 481
    Height = 273
    Color = clGray
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object LNum1: TLabel
      Left = 24
      Top = 51
      Width = 59
      Height = 15
      Caption = 'Numero 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LNum2: TLabel
      Left = 24
      Top = 77
      Width = 59
      Height = 15
      Caption = 'Numero 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 112
      Width = 100
      Height = 15
      Caption = 'Numeros Validos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LHints: TLabel
      Left = 156
      Top = 113
      Width = 95
      Height = 40
      AutoSize = False
      WordWrap = True
    end
    object resultadoMCD: TMemo
      Left = 18
      Top = 206
      Width = 247
      Height = 54
      Lines.Strings = (
        'resultadoMCD')
      TabOrder = 0
    end
    object StringGrid1: TStringGrid
      Left = 271
      Top = 21
      Width = 202
      Height = 249
      ColCount = 1
      DefaultColWidth = 200
      DefaultColAlignment = taCenter
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object EditN1: TEdit
      Left = 96
      Top = 48
      Width = 161
      Height = 21
      MaxLength = 9
      NumbersOnly = True
      TabOrder = 2
      Text = '1'
      OnChange = EditN1Change
    end
    object EditN2: TEdit
      Left = 96
      Top = 75
      Width = 161
      Height = 21
      MaxLength = 9
      NumbersOnly = True
      TabOrder = 3
      Text = '1'
      OnChange = EditN2Change
    end
    object PanelValid: TPanel
      Left = 130
      Top = 110
      Width = 20
      Height = 20
      BorderStyle = bsSingle
      Caption = '?'
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnMouseLeave = HintsValidClear
      OnMouseMove = HintsValid
    end
    object BotonMCD: TButton
      Left = 96
      Top = 167
      Width = 97
      Height = 33
      Caption = 'Calcular MCD'
      TabOrder = 5
      OnClick = BotonMCDClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 41
    Align = alTop
    BorderWidth = 3
    Caption = 'Maximo Comun Divisor - Pilas'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    Font.Quality = fqClearTypeNatural
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
end
