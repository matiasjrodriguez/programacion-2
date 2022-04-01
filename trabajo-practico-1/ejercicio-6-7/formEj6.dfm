object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Estacionamiento'
  ClientHeight = 511
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
  object IngresoAuto: TGroupBox
    Left = 8
    Top = 14
    Width = 377
    Height = 209
    Caption = 'Ingreso de auto'
    Enabled = False
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
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 0
        OnChange = editCargaOnChange
      end
      object editMinutoIngreso: TEdit
        Left = 93
        Top = 24
        Width = 25
        Height = 21
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 1
        OnChange = editCargaOnChange
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
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 0
        OnChange = editCargaOnChange
      end
      object editMinutoSalida: TEdit
        Left = 92
        Top = 24
        Width = 25
        Height = 21
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 1
        OnChange = editCargaOnChange
      end
    end
    object btnIngresar: TButton
      Left = 11
      Top = 175
      Width = 358
      Height = 25
      Caption = 'Ingresar auto'
      Enabled = False
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
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 0
        OnChange = editCargaOnChange
      end
      object editMesIngreso: TEdit
        Left = 62
        Top = 32
        Width = 25
        Height = 21
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 1
        OnChange = editCargaOnChange
      end
      object editAñoIngreso: TEdit
        Left = 110
        Top = 32
        Width = 50
        Height = 21
        Alignment = taCenter
        MaxLength = 4
        NumbersOnly = True
        TabOrder = 2
        OnChange = editCargaOnChange
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
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 0
        OnChange = editCargaOnChange
      end
      object editMesSalida: TEdit
        Left = 62
        Top = 32
        Width = 25
        Height = 21
        Alignment = taCenter
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 1
        OnChange = editCargaOnChange
      end
      object editAñoSalida: TEdit
        Left = 110
        Top = 32
        Width = 50
        Height = 21
        Alignment = taCenter
        MaxLength = 4
        NumbersOnly = True
        TabOrder = 2
        OnChange = editCargaOnChange
      end
    end
  end
  object Ajustes: TGroupBox
    Left = 8
    Top = 229
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
        Alignment = taCenter
        NumbersOnly = True
        TabOrder = 0
        OnChange = editPrecioOnChange
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
        Alignment = taCenter
        NumbersOnly = True
        TabOrder = 0
        OnChange = editPrecioOnChange
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
        Alignment = taCenter
        NumbersOnly = True
        TabOrder = 0
        OnChange = editPrecioOnChange
      end
    end
    object btnAplicar: TButton
      Left = 27
      Top = 237
      Width = 188
      Height = 25
      Caption = 'Aplicar'
      Enabled = False
      TabOrder = 3
      OnClick = btnAplicarClick
    end
  end
  object Memo1: TMemo
    Left = 529
    Top = 8
    Width = 353
    Height = 489
    Lines.Strings = (
      'Autos cargados: 0')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btnEscribirArchivo: TButton
    Left = 391
    Top = 24
    Width = 131
    Height = 25
    Caption = 'Generar archivo'
    Enabled = False
    TabOrder = 3
    OnClick = btnEscribirArchivoClick
  end
  object btnLeerArchivo: TButton
    Left = 391
    Top = 55
    Width = 131
    Height = 25
    Caption = 'Leer archivo'
    TabOrder = 4
    OnClick = btnLeerArchivoClick
  end
  object FechaDeterminada: TGroupBox
    Left = 260
    Top = 229
    Width = 245
    Height = 108
    Caption = 'Buscar fecha determinada'
    TabOrder = 5
    object Label10: TLabel
      Left = 43
      Top = 21
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
    object Label11: TLabel
      Left = 91
      Top = 21
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
    object editAñoBuscar: TEdit
      Left = 109
      Top = 23
      Width = 50
      Height = 21
      Alignment = taCenter
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 0
      OnChange = editDiaBuscarChange
    end
    object editDiaBuscar: TEdit
      Left = 13
      Top = 23
      Width = 25
      Height = 21
      Alignment = taCenter
      MaxLength = 2
      NumbersOnly = True
      TabOrder = 1
      OnChange = editDiaBuscarChange
    end
    object editMesBuscar: TEdit
      Left = 60
      Top = 23
      Width = 25
      Height = 21
      Alignment = taCenter
      MaxLength = 2
      NumbersOnly = True
      TabOrder = 2
      OnChange = editDiaBuscarChange
    end
    object btnBuscarEnArchivo: TButton
      Left = 29
      Top = 58
      Width = 116
      Height = 25
      Caption = 'Buscar en archivo'
      Enabled = False
      TabOrder = 3
      OnClick = btnBuscarEnArchivoClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 260
    Top = 343
    Width = 245
    Height = 160
    Caption = 'Buscar rango de fechas'
    TabOrder = 6
    object Label12: TLabel
      Left = 99
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
    object Label13: TLabel
      Left = 147
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
    object Label14: TLabel
      Left = 16
      Top = 32
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object Label15: TLabel
      Left = 16
      Top = 88
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label16: TLabel
      Left = 99
      Top = 85
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
    object Label17: TLabel
      Left = 147
      Top = 85
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
    object editDesdeDia: TEdit
      Left = 69
      Top = 31
      Width = 25
      Height = 21
      Alignment = taCenter
      MaxLength = 2
      NumbersOnly = True
      TabOrder = 0
      OnChange = editDesdeDiaChange
    end
    object editDesdeMes: TEdit
      Left = 117
      Top = 31
      Width = 25
      Height = 21
      Alignment = taCenter
      MaxLength = 2
      NumbersOnly = True
      TabOrder = 1
      OnChange = editDesdeDiaChange
    end
    object editDesdeAño: TEdit
      Left = 165
      Top = 31
      Width = 50
      Height = 21
      Alignment = taCenter
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 2
      OnChange = editDesdeDiaChange
    end
    object editHastaDia: TEdit
      Left = 69
      Top = 87
      Width = 25
      Height = 21
      Alignment = taCenter
      MaxLength = 2
      NumbersOnly = True
      TabOrder = 3
      OnChange = editDesdeDiaChange
    end
    object editHastaMes: TEdit
      Left = 117
      Top = 87
      Width = 25
      Height = 21
      Alignment = taCenter
      MaxLength = 2
      NumbersOnly = True
      TabOrder = 4
      OnChange = editDesdeDiaChange
    end
    object editHastaAño: TEdit
      Left = 165
      Top = 87
      Width = 50
      Height = 21
      Alignment = taCenter
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 5
      OnChange = editDesdeDiaChange
    end
    object btnBuscarRango: TButton
      Left = 53
      Top = 123
      Width = 137
      Height = 25
      Caption = 'Buscar rango de fechas'
      Enabled = False
      TabOrder = 6
      OnClick = btnBuscarRangoClick
    end
  end
end
