object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 511
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IngresoAuto: TGroupBox
    Left = 8
    Top = 8
    Width = 377
    Height = 209
    Caption = 'Ingreso de auto'
    TabOrder = 0
    object HorarioIngreso: TGroupBox
      Left = 11
      Top = 24
      Width = 173
      Height = 65
      Caption = 'Horario de ingreso'
      TabOrder = 0
      object Label1: TLabel
        Left = 80
        Top = 21
        Width = 7
        Height = 23
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editHoraIngreso: TEdit
        Left = 49
        Top = 24
        Width = 25
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object editMinutoIngreso: TEdit
        Left = 93
        Top = 24
        Width = 25
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
    end
    object HorarioSalida: TGroupBox
      Left = 190
      Top = 24
      Width = 173
      Height = 65
      Caption = 'Horario de salida'
      TabOrder = 1
      object Label2: TLabel
        Left = 79
        Top = 21
        Width = 7
        Height = 23
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editHoraSalida: TEdit
        Left = 48
        Top = 24
        Width = 25
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object editMinutoSalida: TEdit
        Left = 92
        Top = 24
        Width = 25
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
    end
    object btnIngresar: TButton
      Left = 11
      Top = 175
      Width = 358
      Height = 25
      Caption = 'Ingresar auto'
      TabOrder = 2
      OnClick = btnIngresarClick
    end
    object FechaIngreso: TGroupBox
      Left = 11
      Top = 95
      Width = 173
      Height = 74
      Caption = 'Fecha de Ingreso'
      TabOrder = 3
      object Label6: TLabel
        Left = 45
        Top = 29
        Width = 11
        Height = 23
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 93
        Top = 29
        Width = 11
        Height = 23
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editDiaIngreso: TEdit
        Left = 14
        Top = 32
        Width = 25
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object editMesIngreso: TEdit
        Left = 62
        Top = 32
        Width = 25
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
      object editAñoIngreso: TEdit
        Left = 110
        Top = 32
        Width = 50
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
    end
    object FechaSalida: TGroupBox
      Left = 190
      Top = 95
      Width = 173
      Height = 74
      Caption = 'Fecha de salida'
      TabOrder = 4
      object Label8: TLabel
        Left = 45
        Top = 29
        Width = 11
        Height = 23
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 93
        Top = 29
        Width = 11
        Height = 23
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editDiaSalida: TEdit
        Left = 14
        Top = 32
        Width = 25
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object editMesSalida: TEdit
        Left = 62
        Top = 32
        Width = 25
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
      object editAñoSalida: TEdit
        Left = 110
        Top = 32
        Width = 50
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
    end
  end
  object Ajustes: TGroupBox
    Left = 69
    Top = 230
    Width = 246
    Height = 274
    Caption = 'Ajustes'
    TabOrder = 1
    object TarifaHora: TGroupBox
      Left = 27
      Top = 24
      Width = 188
      Height = 63
      Caption = 'Tarifa por hora'
      TabOrder = 0
      object Label3: TLabel
        Left = 47
        Top = 20
        Width = 12
        Height = 23
        Caption = '$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editTarifaHora: TEdit
        Left = 63
        Top = 24
        Width = 71
        Height = 21
        TabOrder = 0
      end
    end
    object MediaEstadia: TGroupBox
      Left = 27
      Top = 93
      Width = 188
      Height = 63
      Caption = 'Media estad'#237'a'
      TabOrder = 1
      object Label4: TLabel
        Left = 47
        Top = 20
        Width = 12
        Height = 23
        Caption = '$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editMediaEstadia: TEdit
        Left = 63
        Top = 24
        Width = 71
        Height = 21
        TabOrder = 0
      end
    end
    object EstadiaCompleta: TGroupBox
      Left = 27
      Top = 162
      Width = 188
      Height = 63
      Caption = 'Estad'#237'a completa'
      TabOrder = 2
      object Label5: TLabel
        Left = 47
        Top = 20
        Width = 12
        Height = 23
        Caption = '$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editEstadiaCompleta: TEdit
        Left = 63
        Top = 24
        Width = 71
        Height = 21
        TabOrder = 0
      end
    end
    object btnAplicar: TButton
      Left = 27
      Top = 231
      Width = 188
      Height = 25
      Caption = 'Aplicar'
      TabOrder = 3
      OnClick = btnAplicarClick
    end
  end
  object Memo1: TMemo
    Left = 391
    Top = 15
    Width = 353
    Height = 489
    Lines.Strings = (
      'Autos cargados: 0')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 334
    Top = 254
    Width = 37
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
  end
end
