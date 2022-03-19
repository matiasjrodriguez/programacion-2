object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Operaciones con Matrices'
  ClientHeight = 371
  ClientWidth = 906
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
  object Label1: TLabel
    Left = 632
    Top = 86
    Width = 29
    Height = 48
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 80
    Width = 52
    Height = 16
    Caption = 'Tama'#241'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 208
    Top = 18
    Width = 17
    Height = 16
    Caption = 'M1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 496
    Top = 18
    Width = 17
    Height = 16
    Caption = 'M2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SGMatriz1: TStringGrid
    AlignWithMargins = True
    Left = 128
    Top = 40
    Width = 177
    Height = 137
    DefaultColWidth = 32
    DefaultColAlignment = taCenter
    FixedCols = 0
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ParentFont = False
    TabOrder = 0
  end
  object SGMatriz2: TStringGrid
    Left = 416
    Top = 40
    Width = 177
    Height = 137
    DefaultColWidth = 32
    DefaultColAlignment = taCenter
    FixedCols = 0
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ParentFont = False
    TabOrder = 1
  end
  object rbSumar: TRadioButton
    Left = 335
    Top = 68
    Width = 73
    Height = 49
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object rbMultiplicar: TRadioButton
    Left = 335
    Top = 112
    Width = 58
    Height = 49
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object SGMatrizResultado: TStringGrid
    Left = 704
    Top = 40
    Width = 177
    Height = 137
    DefaultColWidth = 32
    DefaultColAlignment = taCenter
    FixedCols = 0
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ParentFont = False
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 193
    Top = 256
    Width = 705
    Height = 107
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 5
  end
  object eTamaño: TEdit
    Left = 47
    Top = 112
    Width = 22
    Height = 21
    HelpContext = 2
    Alignment = taCenter
    MaxLength = 20
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 7
    Text = '5'
    OnChange = eTamañoChange
  end
  object UpDown1: TUpDown
    Left = 69
    Top = 112
    Width = 14
    Height = 21
    Associate = eTamaño
    Min = 2
    Max = 20
    Position = 5
    TabOrder = 6
  end
  object btResultado: TButton
    Left = 616
    Top = 135
    Width = 66
    Height = 25
    Caption = 'Calcular'
    TabOrder = 8
    OnClick = btResultadoClick
  end
  object btMaxFila: TButton
    Left = 128
    Top = 176
    Width = 177
    Height = 25
    Caption = 'Maxima Fila y Maxima Columna'
    TabOrder = 9
    OnClick = btMaxFilaClick
  end
  object eEscalar: TEdit
    Left = 24
    Top = 278
    Width = 35
    Height = 21
    Alignment = taCenter
    MaxLength = 100
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 10
    Text = '0'
  end
  object btEscalar: TButton
    Left = 87
    Top = 276
    Width = 84
    Height = 25
    Caption = 'Escalar a M1'
    TabOrder = 11
    OnClick = btEscalarClick
  end
  object UpDown2: TUpDown
    Left = 59
    Top = 278
    Width = 16
    Height = 21
    Associate = eEscalar
    Min = -100
    TabOrder = 12
  end
  object btBuscar: TButton
    Left = 87
    Top = 326
    Width = 84
    Height = 25
    Caption = 'Buscar en M1'
    TabOrder = 13
    OnClick = btBuscarClick
  end
  object eBuscar: TEdit
    Left = 24
    Top = 328
    Width = 57
    Height = 21
    Alignment = taCenter
    TabOrder = 14
  end
  object btDiagonales: TButton
    Left = 128
    Top = 200
    Width = 177
    Height = 25
    Caption = 'Diagonal Principal y Opuesta'
    TabOrder = 15
  end
end
