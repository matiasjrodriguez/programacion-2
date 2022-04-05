object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Carbonos'
  ClientHeight = 337
  ClientWidth = 553
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
  object sg: TStringGrid
    Left = -40
    Top = -25
    Width = 593
    Height = 210
    ColCount = 14
    DefaultColWidth = 40
    DefaultColAlignment = taCenter
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    GridLineWidth = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 88
    Top = 208
    Width = 193
    Height = 33
    Caption = 'Mostrar cadena mas larga (C)'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 56
    Top = 264
    Width = 449
    Height = 65
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object Button2: TButton
    Left = 320
    Top = 208
    Width = 145
    Height = 33
    Caption = 'Limpiar Grilla'
    TabOrder = 3
    OnClick = Button2Click
  end
end
