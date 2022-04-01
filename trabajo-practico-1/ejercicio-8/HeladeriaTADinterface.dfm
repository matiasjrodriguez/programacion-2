object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 716
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 96
    Width = 588
    Height = 521
    TabOrder = 0
    object Label4: TLabel
      Left = 440
      Top = 238
      Width = 27
      Height = 13
      Caption = 'Limon'
    end
    object Label3: TLabel
      Left = 355
      Top = 238
      Width = 32
      Height = 13
      Caption = 'Frutilla'
    end
    object Label2: TLabel
      Left = 244
      Top = 238
      Width = 84
      Height = 13
      Caption = 'Crema Americana'
    end
    object Label1: TLabel
      Left = 166
      Top = 238
      Width = 48
      Height = 13
      Caption = 'Chocolate'
      Color = clHighlight
      ParentColor = False
    end
    object Label6: TLabel
      Left = 3
      Top = 258
      Width = 160
      Height = 13
      Caption = 'Seleccione los sabores deseados:'
    end
    object Label9: TLabel
      Left = 3
      Top = 439
      Width = 612
      Height = 13
      Caption = 
        '________________________________________________________________' +
        '______________________________________'
    end
    object CheckBox1: TCheckBox
      Left = 188
      Top = 257
      Width = 97
      Height = 17
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 274
      Top = 257
      Width = 97
      Height = 17
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 361
      Top = 257
      Width = 97
      Height = 17
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 449
      Top = 257
      Width = 97
      Height = 17
      TabOrder = 3
    end
    object GroupBox2: TGroupBox
      Left = 154
      Top = 32
      Width = 337
      Height = 200
      TabOrder = 4
      object Label5: TLabel
        Left = 144
        Top = 19
        Width = 55
        Height = 13
        Caption = 'Congelador'
      end
      object Memo1: TMemo
        Left = 12
        Top = 60
        Width = 53
        Height = 137
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
      object Memo2: TMemo
        Left = 103
        Top = 60
        Width = 53
        Height = 137
        Lines.Strings = (
          'Memo2')
        TabOrder = 1
      end
      object Memo3: TMemo
        Left = 190
        Top = 59
        Width = 53
        Height = 137
        Lines.Strings = (
          'Memo3')
        TabOrder = 2
      end
      object Memo4: TMemo
        Left = 273
        Top = 60
        Width = 53
        Height = 137
        Lines.Strings = (
          'Memo4')
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 177
      Top = 280
      Width = 303
      Height = 153
      TabOrder = 5
      object Button1: TButton
        Left = 14
        Top = 87
        Width = 275
        Height = 41
        Caption = 'Aumentar cantidad de helado seleccionado'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 14
        Top = 25
        Width = 275
        Height = 41
        Caption = 'Consultar disponibilidad de sabores de helado deseados'
        TabOrder = 1
        OnClick = Button3Click
      end
    end
    object Button2: TButton
      Left = 3
      Top = 472
      Width = 275
      Height = 41
      Caption = 'Consultar si alcanza para 2 o 3 sabores disponibles'
      TabOrder = 6
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 313
      Top = 472
      Width = 275
      Height = 41
      Caption = 'Consultar combinaciones disponibles'
      TabOrder = 7
      OnClick = Button4Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 1
    Width = 585
    Height = 89
    TabOrder = 1
    object Label7: TLabel
      Left = 3
      Top = 35
      Width = 201
      Height = 13
      Caption = 'Ingrese cuantas bochas de helado desea:'
    end
    object Label8: TLabel
      Left = 62
      Top = 59
      Width = 86
      Height = 13
      Caption = '(Opciones: 2 o 3) '
    end
    object Edit1: TEdit
      Left = 214
      Top = 35
      Width = 358
      Height = 21
      TabOrder = 0
    end
  end
  object Memo5: TMemo
    Left = 2
    Top = 607
    Width = 588
    Height = 74
    Lines.Strings = (
      'Memo5')
    TabOrder = 2
  end
end
