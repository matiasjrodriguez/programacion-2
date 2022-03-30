object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Caja Registradora'
  ClientHeight = 652
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
    Top = 8
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
    Left = 464
    Top = 8
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
  object Label15: TLabel
    Left = 230
    Top = 16
    Width = 123
    Height = 13
    Caption = '1'#186' Cargar dinero a la caja'
  end
  object Label16: TLabel
    Left = 230
    Top = 35
    Width = 155
    Height = 13
    Caption = '2'#186' Ingresar billetes o monedas a'
  end
  object Label17: TLabel
    Left = 230
    Top = 54
    Width = 138
    Height = 13
    Caption = 'utilizar para efectuar el pago'
  end
  object Label18: TLabel
    Left = 230
    Top = 73
    Width = 142
    Height = 13
    Caption = '3'#186' Ingresar el monto a cobrar'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 201
    Height = 281
    Caption = 'Monedas'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 107
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
      Top = 155
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
      Top = 203
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
      Top = 248
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
    object Label19: TLabel
      Left = 16
      Top = 65
      Width = 102
      Height = 13
      Caption = 'Monedas de $0.50'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 16
      Top = 27
      Width = 102
      Height = 13
      Caption = 'Monedas de $0.25'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eMonedasDe1: TEdit
      Left = 123
      Top = 104
      Width = 33
      Height = 21
      Alignment = taCenter
      AutoSelect = False
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
    object UpDown1: TUpDown
      Left = 156
      Top = 104
      Width = 16
      Height = 21
      Associate = eMonedasDe1
      Max = 10000
      TabOrder = 0
    end
    object eMonedasDe2: TEdit
      Left = 123
      Top = 152
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 4
      Text = '0'
    end
    object UpDown2: TUpDown
      Left = 156
      Top = 152
      Width = 16
      Height = 21
      Associate = eMonedasDe2
      Max = 10000
      TabOrder = 1
    end
    object eMonedasDe5: TEdit
      Left = 123
      Top = 200
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 5
      Text = '0'
    end
    object UpDown3: TUpDown
      Left = 156
      Top = 200
      Width = 16
      Height = 21
      Associate = eMonedasDe5
      Max = 10000
      TabOrder = 2
    end
    object eMonedasDe10: TEdit
      Left = 123
      Top = 245
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 6
      Text = '0'
    end
    object UpDown4: TUpDown
      Left = 156
      Top = 245
      Width = 16
      Height = 21
      Associate = eMonedasDe10
      Max = 10000
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 295
    Width = 201
    Height = 322
    Caption = 'Billetes'
    TabOrder = 3
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
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object eBilletesDe100: TEdit
      Left = 123
      Top = 153
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 7
      Text = '0'
    end
    object eBilletesDe1000: TEdit
      Left = 124
      Top = 270
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object eBilletesde20: TEdit
      Left = 123
      Top = 72
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      ReadOnly = True
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
      ReadOnly = True
      TabOrder = 9
      Text = '0'
    end
    object eBilletesDe50: TEdit
      Left = 123
      Top = 113
      Width = 33
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      ReadOnly = True
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
      ReadOnly = True
      TabOrder = 12
      Text = '0'
    end
    object UpDown5: TUpDown
      Left = 156
      Top = 28
      Width = 16
      Height = 21
      Associate = eBilletesDe10
      Max = 10000
      TabOrder = 2
    end
    object UpDown6: TUpDown
      Left = 156
      Top = 72
      Width = 16
      Height = 21
      Associate = eBilletesde20
      Max = 10000
      TabOrder = 4
    end
    object UpDown7: TUpDown
      Left = 156
      Top = 193
      Width = 16
      Height = 21
      Associate = eBilletesDe200
      Max = 10000
      TabOrder = 6
    end
    object UpDown8: TUpDown
      Left = 156
      Top = 271
      Width = 16
      Height = 21
      Associate = eBilletesDe1000
      Max = 10000
      TabOrder = 8
    end
    object UpDown9: TUpDown
      Left = 156
      Top = 235
      Width = 16
      Height = 21
      Associate = eBilletesDe500
      Max = 10000
      TabOrder = 10
    end
    object UpDown10: TUpDown
      Left = 156
      Top = 113
      Width = 16
      Height = 21
      Associate = eBilletesDe50
      Max = 10000
      TabOrder = 11
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
    Top = 47
    Width = 305
    Height = 380
    ColCount = 2
    DefaultColWidth = 150
    DefaultColAlignment = taCenter
    FixedColor = clMedGray
    RowCount = 14
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
      24
      24
      24)
  end
  object btCargar: TButton
    Left = 248
    Top = 161
    Width = 141
    Height = 61
    Caption = 'Cargar a la caja'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btCargarClick
  end
  object sgVuelto: TStringGrid
    Left = 771
    Top = 47
    Width = 305
    Height = 380
    ColCount = 2
    DefaultColWidth = 150
    DefaultColAlignment = taCenter
    FixedColor = clMedGray
    RowCount = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLineWidth = 3
    ParentFont = False
    TabOrder = 6
  end
  object GroupBox3: TGroupBox
    Left = 248
    Top = 246
    Width = 141
    Height = 88
    TabOrder = 7
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
      TabOrder = 1
      OnChange = eCantidadACobrarChange
    end
  end
  object Memo1: TMemo
    Left = 230
    Top = 479
    Width = 853
    Height = 113
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 8
  end
  object btSaldo: TButton
    Left = 420
    Top = 433
    Width = 305
    Height = 25
    Caption = 'MostrarSaldo'
    TabOrder = 9
    OnClick = btSaldoClick
  end
  object btCerrarCaja: TButton
    Left = 285
    Top = 611
    Width = 738
    Height = 25
    Caption = 'Cerrar Caja'
    TabOrder = 10
    OnClick = btCerrarCajaClick
  end
  object eMonedasDe050: TEdit
    Left = 132
    Top = 70
    Width = 33
    Height = 21
    Alignment = taCenter
    AutoSelect = False
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 2
    Text = '0'
  end
  object UpDown12: TUpDown
    Left = 165
    Top = 70
    Width = 16
    Height = 21
    Associate = eMonedasDe050
    Max = 10000
    TabOrder = 11
  end
  object eMonedasDe025: TEdit
    Left = 132
    Top = 32
    Width = 33
    Height = 21
    Alignment = taCenter
    AutoSelect = False
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 1
    Text = '0'
  end
  object UpDown13: TUpDown
    Left = 165
    Top = 32
    Width = 16
    Height = 21
    Associate = eMonedasDe025
    Max = 10000
    TabOrder = 12
  end
end
