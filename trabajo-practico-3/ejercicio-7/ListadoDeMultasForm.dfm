object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form1'
  ClientHeight = 433
  ClientWidth = 484
  Color = clSilver
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
    Left = 8
    Top = 47
    Width = 313
    Height = 209
    Caption = 'Vehiculo'
    Color = clGray
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object EditPatente: TEdit
      Left = 24
      Top = 32
      Width = 105
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 7
      ParentFont = False
      TabOrder = 0
      Text = 'AB123CD'
      OnChange = EditPatenteChange
    end
    object PatenteValida: TPanel
      Left = 135
      Top = 32
      Width = 25
      Height = 24
      BorderStyle = bsSingle
      Color = clGreen
      ParentBackground = False
      TabOrder = 1
    end
    object botonMultar: TButton
      Left = 166
      Top = 32
      Width = 130
      Height = 24
      Caption = 'Multar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = botonMultarClick
    end
    object BotonCargar: TButton
      Left = 24
      Top = 74
      Width = 136
      Height = 39
      Caption = 'Cargar Vehiculo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BotonCargarClick
    end
    object BotonConsultar: TButton
      Left = 166
      Top = 74
      Width = 130
      Height = 39
      Caption = 'Consultar Datos Vehiculo'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      WordWrap = True
      OnClick = BotonConsultarClick
    end
    object consulta: TMemo
      Left = 24
      Top = 119
      Width = 272
      Height = 74
      Lines.Strings = (
        'consulta')
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 262
    Width = 313
    Height = 171
    Caption = 'Panel1'
    Color = clGray
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 88
      Top = 16
      Width = 134
      Height = 20
      Caption = 'Datos Generales'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = 20
      Font.Name = 'Tahoma'
      Font.Pitch = fpFixed
      Font.Style = [fsBold]
      Font.Quality = fqClearType
      ParentFont = False
    end
    object StringGrid1: TStringGrid
      Left = 24
      Top = 51
      Width = 272
      Height = 102
      ColCount = 2
      DefaultColWidth = 135
      RowCount = 4
      ScrollBars = ssNone
      TabOrder = 0
      RowHeights = (
        24
        24
        24
        23)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 41
    Align = alTop
    Caption = 'Ejercicio 7'
    Color = clGray
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 584
    ExplicitTop = 392
    ExplicitWidth = 185
  end
  object Panel3: TPanel
    Left = 327
    Top = 47
    Width = 153
    Height = 386
    Color = clGray
    ParentBackground = False
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 0
      Width = 92
      Height = 13
      Caption = 'Patentes Cargadas'
    end
    object ListPatentes: TListBox
      Left = 8
      Top = 19
      Width = 137
      Height = 349
      ItemHeight = 13
      TabOrder = 0
    end
  end
end
