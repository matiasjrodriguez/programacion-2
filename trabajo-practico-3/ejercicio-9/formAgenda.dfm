object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Agenda'
  ClientHeight = 580
  ClientWidth = 1114
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
    Width = 409
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
    Left = 16
    Top = 200
    Width = 409
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
      Left = 320
      Top = 149
      Width = 86
      Height = 25
      Caption = 'Terminar Dia 1'
      TabOrder = 3
      OnClick = btTerminarClick
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 383
    Width = 1090
    Height = 186
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object GroupBox3: TGroupBox
    Left = 439
    Top = 8
    Width = 338
    Height = 186
    Caption = 'Agregar Actividad a un Dia especifico'
    TabOrder = 3
    object Label5: TLabel
      Left = 24
      Top = 28
      Width = 97
      Height = 13
      Caption = 'Seleccione Actividad'
    end
    object Label6: TLabel
      Left = 24
      Top = 78
      Width = 97
      Height = 13
      Caption = 'Horario de comienzo'
    end
    object Label7: TLabel
      Left = 24
      Top = 140
      Width = 15
      Height = 13
      Caption = 'Dia'
    end
    object btAgregar: TButton
      Left = 216
      Top = 63
      Width = 89
      Height = 45
      Caption = 'Agregar'
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 24
      Top = 47
      Width = 145
      Height = 21
      TabOrder = 1
      Text = '...'
      OnChange = ComboBox1Change
    end
    object eDia: TEdit
      Left = 45
      Top = 137
      Width = 28
      Height = 21
      Alignment = taCenter
      TabOrder = 2
      Text = '0'
    end
    object UpDown2: TUpDown
      Left = 73
      Top = 137
      Width = 16
      Height = 21
      Associate = eDia
      TabOrder = 3
    end
  end
  object TimePicker2: TTimePicker
    Left = 463
    Top = 105
    Width = 65
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
    Time = 0.291666666666666700
    TimeFormat = 'h:mm'
  end
end
