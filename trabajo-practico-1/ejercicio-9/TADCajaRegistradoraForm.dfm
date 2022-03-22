object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Caja Registradora'
  ClientHeight = 548
  ClientWidth = 1110
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
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 598
    Height = 204
    Caption = 'Monedas'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 35
      Width = 85
      Height = 13
      Caption = 'Monedas de $1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 83
      Width = 85
      Height = 13
      Caption = 'Monedas de $2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 131
      Width = 85
      Height = 13
      Caption = 'Monedas de $5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 176
      Width = 92
      Height = 13
      Caption = 'Monedas de $10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eMonedasDe1: TEdit
      Left = 123
      Top = 32
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 0
      Text = '0'
    end
    object UpDown1: TUpDown
      Left = 154
      Top = 32
      Width = 16
      Height = 20
      Associate = eMonedasDe1
      Max = 10000
      TabOrder = 1
    end
    object eMonedasDe2: TEdit
      Left = 123
      Top = 80
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 2
      Text = '0'
    end
    object UpDown2: TUpDown
      Left = 154
      Top = 80
      Width = 16
      Height = 20
      Associate = eMonedasDe2
      Max = 10000
      TabOrder = 3
    end
    object eMonedasDe5: TEdit
      Left = 123
      Top = 128
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 4
      Text = '0'
    end
    object UpDown3: TUpDown
      Left = 154
      Top = 128
      Width = 16
      Height = 20
      Associate = eMonedasDe5
      Max = 10000
      TabOrder = 5
    end
    object eMonedasDe10: TEdit
      Left = 123
      Top = 173
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 6
      Text = '0'
    end
    object UpDown4: TUpDown
      Left = 154
      Top = 173
      Width = 16
      Height = 20
      Associate = eMonedasDe10
      Max = 10000
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 218
    Width = 598
    Height = 322
    Caption = 'Billetes'
    TabOrder = 1
    object Label5: TLabel
      Left = 12
      Top = 31
      Width = 82
      Height = 13
      Caption = 'Billetes de $10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 12
      Top = 75
      Width = 82
      Height = 13
      Caption = 'Billetes de $20'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 116
      Width = 82
      Height = 13
      Caption = 'Billetes de $50'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 12
      Top = 156
      Width = 89
      Height = 13
      Caption = 'Billetes de $100'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 12
      Top = 192
      Width = 89
      Height = 13
      Caption = 'Billetes de $200'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 12
      Top = 235
      Width = 89
      Height = 13
      Caption = 'Billetes de $500'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 12
      Top = 284
      Width = 96
      Height = 13
      Caption = 'Billetes de $1000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eBilletesDe10: TEdit
      Left = 123
      Top = 28
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 0
      Text = '0'
    end
    object eBilletesDe100: TEdit
      Left = 123
      Top = 153
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 1
      Text = '0'
    end
    object eBilletesDe1000: TEdit
      Left = 123
      Top = 279
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 2
      Text = '0'
    end
    object eBilletesde20: TEdit
      Left = 123
      Top = 72
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 3
      Text = '0'
    end
    object eBilletesDe200: TEdit
      Left = 123
      Top = 193
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 4
      Text = '0'
    end
    object eBilletesDe50: TEdit
      Left = 123
      Top = 113
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 5
      Text = '0'
    end
    object eBilletesDe500: TEdit
      Left = 123
      Top = 235
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 6
      Text = '0'
    end
    object UpDown5: TUpDown
      Left = 156
      Top = 28
      Width = 16
      Height = 20
      Associate = eBilletesDe10
      Max = 10000
      TabOrder = 7
    end
    object UpDown6: TUpDown
      Left = 156
      Top = 72
      Width = 16
      Height = 20
      Associate = eBilletesde20
      Max = 10000
      TabOrder = 8
    end
    object UpDown7: TUpDown
      Left = 156
      Top = 193
      Width = 16
      Height = 20
      Associate = eBilletesDe200
      Max = 10000
      TabOrder = 9
    end
    object UpDown8: TUpDown
      Left = 154
      Top = 279
      Width = 16
      Height = 20
      Associate = eBilletesDe1000
      Max = 10000
      TabOrder = 10
    end
    object UpDown9: TUpDown
      Left = 154
      Top = 235
      Width = 16
      Height = 20
      Associate = eBilletesDe500
      Max = 10000
      TabOrder = 11
    end
    object UpDown10: TUpDown
      Left = 156
      Top = 113
      Width = 16
      Height = 20
      Associate = eBilletesDe50
      Max = 10000
      TabOrder = 12
    end
    object UpDown11: TUpDown
      Left = 156
      Top = 153
      Width = 16
      Height = 20
      Associate = eBilletesDe100
      Max = 10000
      TabOrder = 13
    end
  end
  object sgCaja: TStringGrid
    Left = 724
    Top = 27
    Width = 305
    Height = 325
    ColCount = 2
    DefaultColWidth = 150
    DefaultColAlignment = taCenter
    FixedColor = clMedGray
    RowCount = 12
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 3
    ParentFont = False
    TabOrder = 2
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object btCargar: TButton
    Left = 272
    Top = 432
    Width = 153
    Height = 57
    Caption = 'Cargar'
    TabOrder = 3
    OnClick = btCargarClick
  end
end
