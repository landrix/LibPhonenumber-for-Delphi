object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'LibPhonenumber v8.12.21'
  ClientHeight = 90
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 104
    Height = 13
    Caption = 'Enter a phonenumber'
  end
  object Label2: TLabel
    Left = 304
    Top = 24
    Width = 62
    Height = 13
    Caption = 'Countrycode'
  end
  object Label3: TLabel
    Left = 16
    Top = 51
    Width = 34
    Height = 13
    Caption = 'Output'
  end
  object Edit1: TEdit
    Left = 136
    Top = 20
    Width = 153
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 372
    Top = 20
    Width = 73
    Height = 21
    TabOrder = 1
    Text = 'DE'
  end
  object Edit3: TEdit
    Left = 136
    Top = 47
    Width = 153
    Height = 21
    TabOrder = 2
  end
end
