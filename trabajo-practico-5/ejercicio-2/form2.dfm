object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 429
  ClientWidth = 972
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
    Left = 96
    Top = 48
    Width = 13
    Height = 13
    Caption = 'C1'
  end
  object Label2: TLabel
    Left = 192
    Top = 48
    Width = 13
    Height = 13
    Caption = 'C2'
  end
  object StringGrid1: TStringGrid
    Left = 88
    Top = 80
    Width = 41
    Height = 257
    ColCount = 1
    DefaultColWidth = 32
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ScrollBars = ssNone
    TabOrder = 0
  end
  object StringGrid2: TStringGrid
    Left = 184
    Top = 80
    Width = 41
    Height = 257
    ColCount = 1
    DefaultColWidth = 32
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ScrollBars = ssNone
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 480
    Top = 16
    Width = 257
    Height = 393
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button1: TButton
    Left = 112
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
