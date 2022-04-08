object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Campo Minado'
  ClientHeight = 385
  ClientWidth = 748
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
    Left = 448
    Top = 29
    Width = 111
    Height = 13
    Caption = 'Camino m'#225's seguro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 604
    Top = 29
    Width = 118
    Height = 13
    Caption = 'Posicion de las Minas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sg: TStringGrid
    Left = 40
    Top = 57
    Width = 353
    Height = 193
    Color = clMenu
    ColCount = 10
    DefaultColWidth = 32
    DefaultColAlignment = taCenter
    FixedColor = clMoneyGreen
    FixedCols = 0
    RowCount = 7
    FixedRows = 0
    GradientEndColor = clWhite
    GridLineWidth = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object btBuscar: TButton
    Left = 144
    Top = 280
    Width = 153
    Height = 57
    Caption = 'Buscar camino mas seguro'
    TabOrder = 1
    OnClick = btBuscarClick
  end
  object memo1: TMemo
    Left = 448
    Top = 48
    Width = 113
    Height = 305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'memo1')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 604
    Top = 48
    Width = 111
    Height = 305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'memo1')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object btLimpiar: TButton
    Left = 318
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Limpiar'
    TabOrder = 4
    OnClick = btLimpiarClick
  end
end
