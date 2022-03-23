object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Caja Registradora'
  ClientHeight = 586
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
  object Label12: TLabel
    Left = 882
    Top = 27
    Width = 75
    Height = 33
    Caption = 'Vuelto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 456
    Top = 27
    Width = 211
    Height = 33
    Caption = 'Caja Registradora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 201
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
      Left = 156
      Top = 32
      Width = 16
      Height = 21
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
      Left = 156
      Top = 80
      Width = 16
      Height = 21
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
      Left = 156
      Top = 128
      Width = 16
      Height = 21
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
      Left = 156
      Top = 173
      Width = 16
      Height = 21
      Associate = eMonedasDe10
      Max = 10000
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 218
    Width = 201
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
      Top = 276
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
      Top = 271
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
      Height = 21
      Associate = eBilletesDe10
      Max = 10000
      TabOrder = 7
    end
    object UpDown6: TUpDown
      Left = 156
      Top = 72
      Width = 16
      Height = 21
      Associate = eBilletesde20
      Max = 10000
      TabOrder = 8
    end
    object UpDown7: TUpDown
      Left = 156
      Top = 193
      Width = 16
      Height = 21
      Associate = eBilletesDe200
      Max = 10000
      TabOrder = 9
    end
    object UpDown8: TUpDown
      Left = 156
      Top = 271
      Width = 16
      Height = 21
      Associate = eBilletesDe1000
      Max = 10000
      TabOrder = 10
    end
    object UpDown9: TUpDown
      Left = 156
      Top = 235
      Width = 16
      Height = 21
      Associate = eBilletesDe500
      Max = 10000
      TabOrder = 11
    end
    object UpDown10: TUpDown
      Left = 156
      Top = 113
      Width = 16
      Height = 21
      Associate = eBilletesDe50
      Max = 10000
      TabOrder = 12
    end
    object UpDown11: TUpDown
      Left = 156
      Top = 153
      Width = 16
      Height = 21
      Associate = eBilletesDe100
      Max = 10000
      TabOrder = 13
    end
  end
  object sgCaja: TStringGrid
    Left = 420
    Top = 66
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
    Left = 240
    Top = 91
    Width = 141
    Height = 37
    Caption = 'Cargar a la caja'
    TabOrder = 3
    OnClick = btCargarClick
  end
  object sgVuelto: TStringGrid
    Left = 772
    Top = 66
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
    TabOrder = 4
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
  object GroupBox3: TGroupBox
    Left = 240
    Top = 163
    Width = 141
    Height = 87
    TabOrder = 5
    object Label14: TLabel
      Left = 24
      Top = 3
      Width = 97
      Height = 13
      Caption = 'Monto a cobrar en $'
    end
    object btCobrar: TButton
      Left = 37
      Top = 49
      Width = 68
      Height = 31
      Caption = 'Cobrar'
      TabOrder = 0
      OnClick = btCobrarClick
    end
    object eCantidadACobrar: TEdit
      Left = 38
      Top = 22
      Width = 65
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 1
    end
  end
  object Memo1: TMemo
    Left = 264
    Top = 429
    Width = 829
    Height = 111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object btSaldo: TButton
    Left = 420
    Top = 389
    Width = 305
    Height = 25
    Caption = 'MostrarSaldo'
    TabOrder = 7
    OnClick = btSaldoClick
  end
  object btCerrarCaja: TButton
    Left = 172
    Top = 553
    Width = 773
    Height = 25
    Caption = 'CerrarCaja'
    TabOrder = 8
    OnClick = btCerrarCajaClick
  end
end
