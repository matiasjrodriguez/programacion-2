object Form1: TForm1
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Form1'
  ClientHeight = 576
  ClientWidth = 490
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
    Left = 0
    Top = 0
    Width = 490
    Height = 41
    Align = alTop
    Caption = 'Negocio'
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = 8
    ExplicitWidth = 617
  end
  object Panel2: TPanel
    Left = 0
    Top = 47
    Width = 490
    Height = 529
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 279
      Top = 8
      Width = 202
      Height = 505
      ColCount = 3
      FixedCols = 0
      RowCount = 21
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 0
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
        24
        24
        24
        24
        24
        24
        24
        24)
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 257
      Height = 194
      Caption = 'Agregar Cliente'
      Color = clSilver
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      object Colas: TPanel
        Left = 16
        Top = 40
        Width = 89
        Height = 65
        Caption = 'Cola'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        VerticalAlignment = taAlignTop
        object EditNumCola: TEdit
          Left = 8
          Top = 32
          Width = 49
          Height = 23
          ReadOnly = True
          TabOrder = 0
          Text = '1'
        end
        object UpDown1: TUpDown
          Left = 63
          Top = 32
          Width = 16
          Height = 23
          Associate = EditNumCola
          Min = 1
          Max = 3
          Position = 1
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 111
        Top = 40
        Width = 130
        Height = 65
        Caption = 'Tiempo Requerido'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        VerticalAlignment = taAlignTop
        object EditRequerido: TEdit
          Left = 34
          Top = 32
          Width = 49
          Height = 23
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 0
          Text = '5'
        end
        object UpDown2: TUpDown
          Left = 89
          Top = 32
          Width = 16
          Height = 23
          Associate = EditRequerido
          Min = 5
          Max = 60
          Increment = 5
          Position = 5
          TabOrder = 1
        end
      end
      object BotonAgregar: TButton
        Left = 73
        Top = 120
        Width = 121
        Height = 41
        Caption = 'Agregar a Cola'
        TabOrder = 2
        OnClick = BotonAgregarClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 208
      Width = 257
      Height = 305
      Caption = 'Atencion Al Cliente'
      Color = clSilver
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      object MemoResultado: TMemo
        Left = 16
        Top = 159
        Width = 225
        Height = 130
        Lines.Strings = (
          'MemoResultado')
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 64
        Top = 40
        Width = 130
        Height = 65
        Caption = 'Tiempo de Atencion'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        VerticalAlignment = taAlignTop
        object EditAtencion: TEdit
          Left = 34
          Top = 32
          Width = 49
          Height = 23
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 0
          Text = '5'
        end
        object UpDown3: TUpDown
          Left = 83
          Top = 32
          Width = 16
          Height = 23
          Associate = EditAtencion
          Min = 5
          Max = 60
          Increment = 5
          Position = 5
          TabOrder = 1
        end
      end
      object BotonAtender: TButton
        Left = 64
        Top = 120
        Width = 130
        Height = 33
        Caption = 'Atender Clientes'
        TabOrder = 2
        OnClick = BotonAtenderClick
      end
    end
  end
end
