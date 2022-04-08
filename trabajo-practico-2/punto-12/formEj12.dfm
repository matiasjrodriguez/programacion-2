object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
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
    Left = 484
    Top = 26
    Width = 46
    Height = 16
    Caption = 'Camino'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 596
    Top = 26
    Width = 135
    Height = 16
    Caption = 'Posicion de las Minas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
  object Button1: TButton
    Left = 144
    Top = 272
    Width = 153
    Height = 57
    Caption = 'Buscar camino mas seguro'
    TabOrder = 1
    OnClick = Button1Click
  end
  object memo1: TMemo
    Left = 448
    Top = 48
    Width = 113
    Height = 305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 616
    Top = 48
    Width = 99
    Height = 305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
