object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 443
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 47
    Width = 441
    Height = 388
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 368
    Top = 8
    Width = 81
    Height = 33
    Caption = 'Calcular'
    TabOrder = 1
  end
  object LabeledEdit1: TLabeledEdit
    Left = 184
    Top = 20
    Width = 57
    Height = 21
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.Caption = 'Base'
    NumbersOnly = True
    TabOrder = 2
  end
  object LabeledEdit2: TLabeledEdit
    Left = 8
    Top = 20
    Width = 57
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero'
    NumbersOnly = True
    TabOrder = 3
  end
end
