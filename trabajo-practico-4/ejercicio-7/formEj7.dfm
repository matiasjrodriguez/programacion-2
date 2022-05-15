object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 7'
  ClientHeight = 151
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 137
    Caption = 'Expresi'#243'n matem'#225'tica'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 53
      Top = 98
      Width = 3
      Height = 13
      Alignment = taCenter
    end
    object btnValidarExp: TButton
      Left = 16
      Top = 59
      Width = 249
      Height = 25
      Caption = 'Validar expresi'#243'n'
      TabOrder = 0
      OnClick = btnValidarExpClick
    end
    object editExpresion: TEdit
      Left = 16
      Top = 24
      Width = 249
      Height = 21
      TabOrder = 1
    end
  end
end
