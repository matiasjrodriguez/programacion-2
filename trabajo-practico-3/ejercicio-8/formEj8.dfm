object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 229
  ClientWidth = 353
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
  object Memo1: TMemo
    Left = 146
    Top = 8
    Width = 191
    Height = 180
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnPuntito: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Agregar puntito'
    TabOrder = 1
    OnClick = btnPuntitoClick
  end
  object btnFrutilla: TButton
    Left = 8
    Top = 39
    Width = 113
    Height = 25
    Caption = 'Agregar frutilla'
    TabOrder = 2
    OnClick = btnFrutillaClick
  end
  object btnBanana: TButton
    Left = 8
    Top = 70
    Width = 113
    Height = 25
    Caption = 'Agregar banana'
    TabOrder = 3
    OnClick = btnBananaClick
  end
  object btnCereza: TButton
    Left = 8
    Top = 101
    Width = 113
    Height = 25
    Caption = 'Agregar cereza'
    TabOrder = 4
    OnClick = btnCerezaClick
  end
  object btnFantasma: TButton
    Left = 8
    Top = 132
    Width = 113
    Height = 25
    Caption = 'Agregar fantasma'
    TabOrder = 5
    OnClick = btnFantasmaClick
  end
  object btnBonus: TButton
    Left = 8
    Top = 163
    Width = 113
    Height = 25
    Caption = 'Agregar bonus'
    TabOrder = 6
    OnClick = btnBonusClick
  end
  object btnRecorrido: TButton
    Left = 8
    Top = 196
    Width = 329
    Height = 25
    Caption = 'Verificar recorrido'
    TabOrder = 7
    OnClick = btnRecorridoClick
  end
end
