object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
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
  object Edit1: TEdit
    Left = 392
    Top = 50
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 56
    Top = 48
    Width = 75
    Height = 25
    Caption = 'SUMAR'
    TabOrder = 1
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 48
    Width = 75
    Height = 25
    Caption = 'RESTAR'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 86
    Width = 75
    Height = 25
    Caption = 'CONVERTIR'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OR'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 104
    Top = 128
    Width = 75
    Height = 25
    Caption = 'AND'
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 200
    Top = 128
    Width = 75
    Height = 25
    Caption = 'XOR'
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object Edit2: TEdit
    Left = 392
    Top = 130
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 392
    Top = 192
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '0'
  end
end
