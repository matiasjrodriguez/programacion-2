object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pacman'
  ClientHeight = 285
  ClientWidth = 298
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
    Width = 143
    Height = 180
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
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
    Left = 9
    Top = 194
    Width = 281
    Height = 39
    Caption = 'Verificar recorrido'
    TabOrder = 7
    OnClick = btnRecorridoClick
  end
  object btnEliminar: TButton
    Left = 152
    Top = 239
    Width = 138
    Height = 39
    Caption = 'Eliminar '#250'ltimo elemento'
    TabOrder = 8
    OnClick = btnEliminarClick
  end
  object btnVaciar: TButton
    Left = 8
    Top = 239
    Width = 138
    Height = 39
    Caption = 'Vaciar lista'
    TabOrder = 9
    OnClick = btnVaciarClick
  end
end
