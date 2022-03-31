object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 246
  ClientWidth = 573
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
    Left = 80
    Top = 169
    Width = 41
    Height = 13
    Caption = 'Binario 1'
  end
  object Label2: TLabel
    Left = 261
    Top = 169
    Width = 38
    Height = 13
    Caption = 'Binario2'
  end
  object Label3: TLabel
    Left = 441
    Top = 169
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object Edit1: TEdit
    Left = 40
    Top = 188
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 104
    Top = 50
    Width = 75
    Height = 25
    Caption = 'SUMAR'
    TabOrder = 1
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 50
    Width = 75
    Height = 25
    Caption = 'RESTAR'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 344
    Top = 50
    Width = 75
    Height = 25
    Caption = 'CONVERTIR'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 104
    Top = 106
    Width = 75
    Height = 25
    Caption = 'OR'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 224
    Top = 106
    Width = 75
    Height = 25
    Caption = 'AND'
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 344
    Top = 106
    Width = 75
    Height = 25
    Caption = 'XOR'
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object Edit2: TEdit
    Left = 224
    Top = 188
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '0'
    OnChange = Edit2Change
  end
  object Edit3: TEdit
    Left = 408
    Top = 188
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '0'
  end
end
