object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 413
  ClientWidth = 1109
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
    Left = 85
    Top = 40
    Width = 36
    Height = 13
    Caption = 'Pila 1'
  end
  object Label2: TLabel
    Left = 218
    Top = 40
    Width = 25
    Height = 13
    Caption = 'Pila 2'
  end
  object StringGrid1: TStringGrid
    Left = 85
    Top = 59
    Width = 36
    Height = 255
    ColCount = 1
    DefaultColWidth = 32
    DefaultColAlignment = taCenter
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ScrollBars = ssNone
    TabOrder = 0
  end
  object StringGrid2: TStringGrid
    Left = 213
    Top = 59
    Width = 36
    Height = 255
    ColCount = 1
    DefaultColWidth = 32
    DefaultColAlignment = taCenter
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ScrollBars = ssNone
    TabOrder = 1
  end
  object Button1: TButton
    Left = 136
    Top = 336
    Width = 75
    Height = 41
    Caption = 'Cargar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 608
    Top = 16
    Width = 493
    Height = 389
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Button2: TButton
    Left = 384
    Top = 72
    Width = 154
    Height = 25
    Caption = 'Iguales?'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 384
    Top = 120
    Width = 154
    Height = 25
    Caption = 'P1 Invertida'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 384
    Top = 170
    Width = 26
    Height = 21
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 6
    Text = '0'
  end
  object Button4: TButton
    Left = 416
    Top = 167
    Width = 122
    Height = 28
    Caption = 'Eliminar Ocurrencias P1'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Edit2: TEdit
    Left = 384
    Top = 226
    Width = 26
    Height = 21
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 8
    Text = '0'
  end
  object Edit3: TEdit
    Left = 512
    Top = 226
    Width = 26
    Height = 21
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 9
    Text = '0'
  end
  object Button5: TButton
    Left = 416
    Top = 224
    Width = 90
    Height = 25
    Caption = 'Insertar en Pos:'
    TabOrder = 10
    OnClick = Button5Click
  end
end
