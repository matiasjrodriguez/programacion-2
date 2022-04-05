object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 385
  ClientWidth = 734
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
    Left = 96
    Top = 72
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
    Left = 208
    Top = 296
    Width = 129
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object memo1: TMemo
    Left = 528
    Top = 32
    Width = 169
    Height = 321
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
