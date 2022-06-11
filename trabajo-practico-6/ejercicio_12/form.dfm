object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 498
  ClientWidth = 610
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
  object Panel1: TPanel
    Left = 8
    Top = 48
    Width = 601
    Height = 449
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 464
      Top = 19
      Width = 102
      Height = 24
      Caption = 'Diccionario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveCaptionText
      Font.Height = -19
      Font.Name = 'Tempus Sans ITC'
      Font.Style = [fsBold, fsUnderline]
      Font.Quality = fqClearType
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 425
      Height = 177
      Caption = 'GroupBox1'
      Color = clGrayText
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 135
        Top = 132
        Width = 194
        Height = 26
        Caption = 'No podra mostrar este diccionario completo por su gran tama'#241'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object BotonP1: TButton
        Left = 16
        Top = 24
        Width = 75
        Height = 25
        TabOrder = 0
        OnClick = BotonP1Click
      end
      object BotonP2: TButton
        Left = 97
        Top = 24
        Width = 75
        Height = 25
        TabOrder = 1
        OnClick = BotonP2Click
      end
      object BotonP3: TButton
        Left = 178
        Top = 24
        Width = 75
        Height = 25
        TabOrder = 2
        OnClick = BotonP3Click
      end
      object BotonP4: TButton
        Left = 259
        Top = 24
        Width = 75
        Height = 25
        TabOrder = 3
        OnClick = BotonP4Click
      end
      object BotonP5: TButton
        Left = 340
        Top = 24
        Width = 75
        Height = 25
        TabOrder = 4
        OnClick = BotonP5Click
      end
      object EditEscribiendo: TEdit
        Left = 16
        Top = 55
        Width = 262
        Height = 21
        TabOrder = 5
        OnChange = EditEscribiendoChange
      end
      object BotonAddDic: TButton
        Left = 284
        Top = 55
        Width = 131
        Height = 29
        Caption = 'Enter'
        Enabled = False
        TabOrder = 6
        OnClick = BotonAddDicClick
      end
      object BotonMostrarDic: TButton
        Left = 16
        Top = 90
        Width = 113
        Height = 36
        Caption = 'Mostrar Diccionario'
        TabOrder = 7
        OnClick = BotonMostrarDicClick
      end
      object CargarDic: TButton
        Left = 135
        Top = 90
        Width = 165
        Height = 36
        Caption = 'Cargar Diccionario Desde Archivo'
        TabOrder = 8
        OnClick = CargarDicClick
      end
      object Button1: TButton
        Left = 306
        Top = 90
        Width = 111
        Height = 36
        Caption = 'Mostar palabras mas usadas'
        TabOrder = 9
        WordWrap = True
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 352
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Button2'
        TabOrder = 10
        OnClick = Button2Click
      end
    end
    object MemoTexto: TMemo
      Left = 8
      Top = 191
      Width = 425
      Height = 250
      Lines.Strings = (
        'MemoTexto')
      TabOrder = 1
    end
    object MemoDiccionario: TMemo
      Left = 439
      Top = 49
      Width = 154
      Height = 393
      Lines.Strings = (
        'Memo1')
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
end
