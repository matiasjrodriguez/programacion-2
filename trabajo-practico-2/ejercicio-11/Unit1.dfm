object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 212
  ClientWidth = 459
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
    Left = 48
    Top = 48
    Width = 92
    Height = 13
    Caption = 'Ingrese el Numero:'
  end
  object Label2: TLabel
    Left = 48
    Top = 83
    Width = 87
    Height = 13
    Caption = 'Ingrese la Bomba:'
  end
  object Button1: TButton
    Left = 272
    Top = 48
    Width = 75
    Height = 55
    Caption = 'Explotar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 168
    Top = 45
    Width = 57
    Height = 21
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 1
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 168
    Top = 80
    Width = 57
    Height = 21
    Alignment = taCenter
    NumbersOnly = True
    TabOrder = 2
    OnChange = Edit1Change
  end
  object Memo1: TMemo
    Left = 29
    Top = 144
    Width = 401
    Height = 49
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
end
