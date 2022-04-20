object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 343
  ClientWidth = 890
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 41
    Align = alTop
    Caption = 'Display Digital'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 47
    Width = 877
    Height = 282
    Caption = 'GroupBox1'
    Color = clSilver
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 168
      Top = 19
      Width = 697
      Height = 254
      Caption = 'Panel2'
      Color = clGray
      ParentBackground = False
      TabOrder = 0
      object Label3: TLabel
        Left = 264
        Top = 11
        Width = 88
        Height = 20
        Caption = 'Codigo 7-S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = 20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object GridCod7S: TStringGrid
        Left = 8
        Top = 39
        Width = 681
        Height = 210
        ColCount = 6
        RowCount = 8
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 16
      Top = 19
      Width = 146
      Height = 254
      Color = clGray
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 17
        Width = 46
        Height = 13
        Caption = 'Numero 1'
      end
      object Label2: TLabel
        Left = 16
        Top = 62
        Width = 43
        Height = 13
        Caption = 'Numero2'
      end
      object EditN1: TEdit
        Left = 72
        Top = 14
        Width = 65
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        Text = '0'
        OnChange = EditN1Change
      end
      object EditN2: TEdit
        Left = 72
        Top = 59
        Width = 65
        Height = 21
        NumbersOnly = True
        TabOrder = 1
        Text = '0'
        OnChange = EditN2Change
      end
      object ButtonCargar: TButton
        Left = 72
        Top = 128
        Width = 65
        Height = 33
        Caption = 'Cargar Numeros'
        Enabled = False
        TabOrder = 2
        WordWrap = True
        OnClick = ButtonCargarClick
      end
      object PanelValidacion: TPanel
        Left = 33
        Top = 135
        Width = 17
        Height = 17
        BorderStyle = bsSingle
        Color = clRed
        ParentBackground = False
        TabOrder = 3
      end
    end
  end
end
