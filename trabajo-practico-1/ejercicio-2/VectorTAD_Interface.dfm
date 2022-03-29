object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 366
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Inserte_un_vector_separado_por_espacios: TLabel
    Left = 248
    Top = 249
    Width = 210
    Height = 13
    Caption = 'Inserte_un_vector_separado_por_espacios'
  end
  object Label1: TLabel
    Left = 8
    Top = 249
    Width = 143
    Height = 13
    Caption = 'Inserte_el_separador_a_usar'
  end
  object Label2: TLabel
    Left = 48
    Top = 16
    Width = 220
    Height = 13
    Caption = 'Ingrese_NR_para_no_permitir_repeticiones'
  end
  object Sumatoria_del_Vector: TButton
    Left = 337
    Top = 174
    Width = 137
    Height = 25
    Caption = 'Sumatoria_del_Vector'
    TabOrder = 0
    OnClick = Sumatoria_del_VectorClick
  end
  object Promedio_del_Vector: TButton
    Left = 337
    Top = 134
    Width = 137
    Height = 25
    Caption = 'Promedio_del_Vector'
    TabOrder = 1
    OnClick = Promedio_del_VectorClick
  end
  object Maximo_del_Vector: TButton
    Left = 337
    Top = 54
    Width = 137
    Height = 25
    Caption = 'Maximo_del_Vector'
    TabOrder = 2
    OnClick = Maximo_del_VectorClick
  end
  object Minimo_del_Vector: TButton
    Left = 337
    Top = 8
    Width = 137
    Height = 25
    Caption = 'Minimo_del_Vector'
    TabOrder = 3
    OnClick = Minimo_del_VectorClick
  end
  object Devolucion_intercalada: TButton
    Left = 79
    Top = 295
    Width = 137
    Height = 25
    Caption = 'Devolucion_intercalada'
    TabOrder = 4
    OnClick = Devolucion_intercaladaClick
  end
  object Multiplicar_escalar: TButton
    Left = 337
    Top = 94
    Width = 137
    Height = 25
    Caption = 'Multiplicar_escalar'
    TabOrder = 5
    OnClick = Multiplicar_escalarClick
  end
  object Sumar_un_vector: TButton
    Left = 324
    Top = 295
    Width = 137
    Height = 25
    Caption = 'Sumar_un_vector'
    TabOrder = 6
    OnClick = Sumar_un_vectorClick
  end
  object Genere_Vector: TButton
    Left = 112
    Top = 65
    Width = 115
    Height = 25
    Caption = 'Genere_Vector'
    TabOrder = 7
    OnClick = Genere_VectorClick
  end
  object Edit2: TEdit
    Left = 59
    Top = 268
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object Edit1: TEdit
    Left = 304
    Top = 268
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object Memo1: TMemo
    Left = 8
    Top = 96
    Width = 321
    Height = 89
    TabOrder = 10
  end
  object Edit3: TEdit
    Left = 106
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 11
  end
end
