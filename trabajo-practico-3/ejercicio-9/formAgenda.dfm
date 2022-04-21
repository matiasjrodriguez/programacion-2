object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Agenda'
  ClientHeight = 576
  ClientWidth = 892
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
    Left = 8
    Top = 8
    Width = 417
    Height = 186
    Caption = 'Listado de Tiempos'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 37
      Width = 44
      Height = 13
      Caption = 'Actividad'
    end
    object Label2: TLabel
      Left = 16
      Top = 94
      Width = 157
      Height = 13
      Caption = 'Tiempo de dedicacion en minutos'
    end
    object eActividad: TEdit
      Left = 16
      Top = 56
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object btCargarTiempos: TButton
      Left = 248
      Top = 41
      Width = 105
      Height = 51
      Caption = 'Cargar 1'#186
      TabOrder = 1
      OnClick = btCargarTiemposClick
    end
    object eTiempo: TEdit
      Left = 16
      Top = 113
      Width = 44
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 2
      Text = '0'
    end
    object UpDown1: TUpDown
      Left = 60
      Top = 113
      Width = 16
      Height = 21
      Associate = eTiempo
      Max = 500
      Increment = 10
      TabOrder = 3
    end
    object btMostrarTiempos: TButton
      Left = 248
      Top = 113
      Width = 105
      Height = 45
      Caption = 'Mostrar'
      TabOrder = 4
      OnClick = btMostrarTiemposClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 200
    Width = 417
    Height = 177
    Caption = 'Insertar actividades en la Agenda'
    TabOrder = 1
    object Label3: TLabel
      Left = 24
      Top = 93
      Width = 97
      Height = 13
      Caption = 'Horario de comienzo'
    end
    object Label4: TLabel
      Left = 24
      Top = 37
      Width = 97
      Height = 13
      Caption = 'Seleccione Actividad'
    end
    object cbActividades: TComboBox
      Left = 24
      Top = 56
      Width = 145
      Height = 21
      TabOrder = 0
      Text = '...'
    end
    object TimePicker1: TTimePicker
      Left = 24
      Top = 112
      Width = 65
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MinuteIncrement = 5
      TabOrder = 1
      Time = 0.291666666666666700
      TimeFormat = 'h:mm'
    end
    object btCargarActividad: TButton
      Left = 221
      Top = 64
      Width = 145
      Height = 57
      Caption = 'Agregar Actividad '
      TabOrder = 2
      OnClick = btCargarActividadClick
    end
    object btTerminar: TButton
      Left = 328
      Top = 149
      Width = 86
      Height = 25
      Caption = 'Terminar Dia 1'
      TabOrder = 3
      OnClick = btTerminarClick
    end
  end
  object Memo1: TMemo
    Left = 432
    Top = 240
    Width = 449
    Height = 328
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 383
    Width = 414
    Height = 186
    Caption = 'Agregar Actividad a un Dia especifico'
    TabOrder = 3
    object Label5: TLabel
      Left = 24
      Top = 68
      Width = 97
      Height = 13
      Caption = 'Seleccione Actividad'
    end
    object Label6: TLabel
      Left = 24
      Top = 122
      Width = 97
      Height = 13
      Caption = 'Horario de comienzo'
    end
    object Label7: TLabel
      Left = 24
      Top = 29
      Width = 15
      Height = 13
      Caption = 'Dia'
    end
    object btAgregar: TButton
      Left = 240
      Top = 59
      Width = 113
      Height = 69
      Caption = 'Agregar'
      TabOrder = 0
      OnClick = btAgregarClick
    end
    object cbActividades2: TComboBox
      Left = 24
      Top = 87
      Width = 145
      Height = 21
      TabOrder = 1
      Text = '...'
    end
    object eDia: TEdit
      Left = 56
      Top = 26
      Width = 28
      Height = 21
      Alignment = taCenter
      TabOrder = 2
      Text = '0'
    end
    object UpDown2: TUpDown
      Left = 84
      Top = 26
      Width = 16
      Height = 21
      Associate = eDia
      Max = 0
      TabOrder = 3
    end
    object TimePicker2: TTimePicker
      Left = 24
      Top = 141
      Width = 65
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MinuteIncrement = 5
      TabOrder = 4
      Time = 0.291666666666666700
      TimeFormat = 'h:mm'
    end
  end
  object btMostrarAgenda: TButton
    Left = 551
    Top = 200
    Width = 219
    Height = 34
    Caption = 'Mostrar Agenda'
    TabOrder = 4
    OnClick = btMostrarAgendaClick
  end
  object GroupBox4: TGroupBox
    Left = 431
    Top = 8
    Width = 450
    Height = 186
    Caption = 'Consultas'
    TabOrder = 5
    object GroupBox5: TGroupBox
      Left = 16
      Top = 26
      Width = 209
      Height = 140
      Caption = 'Actividad actual del ejecutivo'
      TabOrder = 0
      object Label8: TLabel
        Left = 16
        Top = 19
        Width = 15
        Height = 13
        Caption = 'Dia'
      end
      object Label9: TLabel
        Left = 16
        Top = 65
        Width = 23
        Height = 24
        Caption = 'Hora'
      end
      object TimePicker3: TTimePicker
        Left = 13
        Top = 84
        Width = 65
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MinuteIncrement = 5
        TabOrder = 0
        Time = 0.291666666666666700
        TimeFormat = 'h:mm'
      end
      object eDia2: TEdit
        Left = 13
        Top = 38
        Width = 28
        Height = 21
        Alignment = taCenter
        TabOrder = 1
        Text = '0'
      end
      object UpDown3: TUpDown
        Left = 37
        Top = 38
        Width = 16
        Height = 21
        Associate = eDia2
        Max = 0
        TabOrder = 2
      end
      object btConsultar: TButton
        Left = 104
        Top = 54
        Width = 75
        Height = 37
        Caption = 'Consultar'
        TabOrder = 3
        OnClick = btConsultarClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 240
      Top = 26
      Width = 193
      Height = 140
      Caption = 'Porcentaje de ocupacion'
      TabOrder = 1
      object Label10: TLabel
        Left = 16
        Top = 41
        Width = 15
        Height = 13
        Caption = 'Dia'
      end
      object eDia3: TEdit
        Left = 13
        Top = 60
        Width = 28
        Height = 21
        Alignment = taCenter
        TabOrder = 0
        Text = '0'
      end
      object UpDown4: TUpDown
        Left = 37
        Top = 60
        Width = 16
        Height = 21
        Associate = eDia3
        Max = 0
        TabOrder = 1
      end
      object btPorcentaje: TButton
        Left = 88
        Top = 53
        Width = 75
        Height = 36
        Caption = 'Consultar'
        TabOrder = 2
        OnClick = btPorcentajeClick
      end
    end
  end
end
