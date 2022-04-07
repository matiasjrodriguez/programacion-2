object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 470
  ClientWidth = 861
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
    Left = 120
    Top = 317
    Width = 61
    Height = 13
    Caption = 'RECORRIDO'
  end
  object Label2: TLabel
    Left = 120
    Top = 357
    Width = 51
    Height = 13
    Caption = 'LONGITUD'
  end
  object StringGrid1: TStringGrid
    Left = 120
    Top = 8
    Width = 353
    Height = 289
    ColCount = 11
    DefaultColWidth = 30
    RowCount = 11
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 120
    Top = 336
    Width = 577
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 479
    Top = 272
    Width = 201
    Height = 25
    Caption = 'CALCULAR RECORRIDO Y LONGITUD'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Edit2: TEdit
    Left = 120
    Top = 376
    Width = 121
    Height = 21
    TabOrder = 3
  end
end
