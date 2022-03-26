object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Tarjeta de Credito'
  ClientHeight = 367
  ClientWidth = 880
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
    Left = 17
    Top = 25
    Width = 90
    Height = 13
    Caption = 'N'#250'mero de Tarjeta'
  end
  object Label8: TLabel
    Left = 206
    Top = 73
    Width = 5
    Height = 16
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 17
    Top = 74
    Width = 147
    Height = 13
    Caption = 'Fecha de Vencimiento (mm/aa)'
  end
  object Label11: TLabel
    Left = 644
    Top = 20
    Width = 110
    Height = 19
    Caption = 'Fecha Actual:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lFecha: TLabel
    Left = 760
    Top = 20
    Width = 63
    Height = 19
    Caption = 'Caption'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 440
    Top = 61
    Width = 432
    Height = 285
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object eNumero: TEdit
    Left = 127
    Top = 22
    Width = 125
    Height = 21
    MaxLength = 16
    NumbersOnly = True
    TabOrder = 1
    OnChange = eNumeroChange
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 112
    Width = 401
    Height = 163
    Caption = 'L'#237'mite de Cr'#233'dito'
    TabOrder = 5
    object Label3: TLabel
      Left = 16
      Top = 34
      Width = 53
      Height = 13
      Caption = 'Una cuota:'
    end
    object Label4: TLabel
      Left = 16
      Top = 73
      Width = 88
      Height = 13
      Caption = 'Dos o m'#225's cuotas:'
    end
    object Label5: TLabel
      Left = 196
      Top = 32
      Width = 6
      Height = 13
      Caption = '$'
    end
    object Label6: TLabel
      Left = 196
      Top = 72
      Width = 6
      Height = 13
      Caption = '$'
    end
    object eUnaCuota: TEdit
      Left = 208
      Top = 29
      Width = 126
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnChange = eUnaCuotaChange
    end
    object eVariasCuotas: TEdit
      Left = 208
      Top = 70
      Width = 126
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      OnChange = eUnaCuotaChange
    end
    object btLimites: TButton
      Left = 112
      Top = 120
      Width = 176
      Height = 31
      Caption = 'Mostrar Limites'
      TabOrder = 2
      OnClick = btLimitesClick
    end
  end
  object btValidar: TButton
    Left = 292
    Top = 38
    Width = 117
    Height = 49
    Caption = 'Validar Tarjeta'
    TabOrder = 4
    OnClick = btValidarClick
  end
  object eMes: TEdit
    Left = 170
    Top = 71
    Width = 28
    Height = 21
    Alignment = taCenter
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 2
    OnChange = eNumeroChange
  end
  object eAño: TEdit
    Left = 217
    Top = 71
    Width = 28
    Height = 21
    Alignment = taCenter
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 3
    OnChange = eNumeroChange
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 281
    Width = 401
    Height = 78
    TabOrder = 6
    object Label2: TLabel
      Left = 30
      Top = 14
      Width = 73
      Height = 13
      Caption = 'Monto a cobrar'
    end
    object Label7: TLabel
      Left = 20
      Top = 33
      Width = 6
      Height = 13
      Caption = '$'
    end
    object Label10: TLabel
      Left = 149
      Top = 14
      Width = 95
      Height = 13
      Caption = 'Cantidad de Cuotas'
    end
    object eMonto: TEdit
      Left = 32
      Top = 33
      Width = 72
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 0
      OnChange = eUnaCuotaChange
    end
    object eCuotas: TEdit
      Left = 176
      Top = 33
      Width = 35
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 1
      Text = '0'
      OnChange = eUnaCuotaChange
    end
    object btPagar: TButton
      Left = 284
      Top = 16
      Width = 101
      Height = 49
      Caption = 'Pagar'
      TabOrder = 2
      OnClick = btPagarClick
    end
    object UpDown1: TUpDown
      Left = 211
      Top = 33
      Width = 16
      Height = 21
      Associate = eCuotas
      TabOrder = 3
    end
  end
end
