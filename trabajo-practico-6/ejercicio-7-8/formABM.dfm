object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 405
  ClientWidth = 783
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
  object Label7: TLabel
    Left = 183
    Top = 8
    Width = 141
    Height = 13
    Caption = 'No se modificar'#225' ning'#250'n CUIT'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 27
    Width = 316
    Height = 233
    Caption = 'Cargar Registro'
    TabOrder = 0
    object Label1: TLabel
      Left = 58
      Top = 35
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object Label2: TLabel
      Left = 24
      Top = 67
      Width = 60
      Height = 13
      Caption = 'Razon Social'
    end
    object Label3: TLabel
      Left = 42
      Top = 128
      Width = 42
      Height = 13
      Caption = 'Telefono'
    end
    object Label4: TLabel
      Left = 42
      Top = 98
      Width = 40
      Height = 13
      Caption = 'Domicilio'
    end
    object Label5: TLabel
      Left = 51
      Top = 155
      Width = 33
      Height = 13
      Caption = 'Celular'
    end
    object eCUIT: TEdit
      Left = 104
      Top = 37
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object eRazonSocial: TEdit
      Left = 104
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object eDomicilio: TEdit
      Left = 104
      Top = 95
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object eTelefono: TEdit
      Left = 104
      Top = 125
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object eCelular: TEdit
      Left = 104
      Top = 152
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object btCargar: TButton
      Left = 72
      Top = 192
      Width = 73
      Height = 30
      Caption = 'Alta'
      TabOrder = 5
      OnClick = btCargarClick
    end
    object btBuscar: TButton
      Left = 231
      Top = 33
      Width = 58
      Height = 25
      Caption = 'Buscar'
      TabOrder = 6
      OnClick = btBuscarClick
    end
    object btModificar: TButton
      Left = 175
      Top = 192
      Width = 75
      Height = 30
      Caption = 'Modificar'
      TabOrder = 7
      OnClick = btModificarClick
    end
    object Button2: TButton
      Left = 231
      Top = 150
      Width = 58
      Height = 25
      Caption = 'Buscar'
      TabOrder = 8
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 231
      Top = 64
      Width = 58
      Height = 25
      Caption = 'Buscar'
      TabOrder = 9
      OnClick = Button4Click
    end
  end
  object Memo1: TMemo
    Left = 344
    Top = 8
    Width = 431
    Height = 356
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button1: TButton
    Left = 344
    Top = 370
    Width = 209
    Height = 25
    Caption = 'Mostrar por CUIT'
    TabOrder = 2
    OnClick = Button1Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 274
    Width = 316
    Height = 98
    Caption = 'Dar de baja'
    TabOrder = 3
    object Label6: TLabel
      Left = 58
      Top = 27
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object eCUIT2: TEdit
      Left = 104
      Top = 24
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object btBaja: TButton
      Left = 120
      Top = 57
      Width = 75
      Height = 24
      Caption = 'Baja'
      TabOrder = 1
      OnClick = btBajaClick
    end
  end
  object Button3: TButton
    Left = 568
    Top = 370
    Width = 207
    Height = 25
    Caption = 'Mostrar por Celular'
    TabOrder = 4
    OnClick = Button3Click
  end
end
