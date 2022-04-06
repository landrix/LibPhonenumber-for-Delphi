object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'LibPhonenumber'
  ClientHeight = 210
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 32
    Width = 104
    Height = 13
    Caption = 'Enter a phonenumber'
  end
  object Label2: TLabel
    Left = 304
    Top = 32
    Width = 62
    Height = 13
    Caption = 'Countrycode'
  end
  object Label3: TLabel
    Left = 16
    Top = 59
    Width = 34
    Height = 13
    Caption = 'Output'
  end
  object Label4: TLabel
    Left = 16
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Parse number'
  end
  object Label5: TLabel
    Left = 16
    Top = 136
    Width = 104
    Height = 13
    Caption = 'Enter a phonenumber'
  end
  object Label6: TLabel
    Left = 304
    Top = 136
    Width = 62
    Height = 13
    Caption = 'Countrycode'
  end
  object Label7: TLabel
    Left = 16
    Top = 112
    Width = 77
    Height = 13
    Caption = 'Validate number'
  end
  object Label8: TLabel
    Left = 16
    Top = 163
    Width = 34
    Height = 13
    Caption = 'Output'
  end
  object Label9: TLabel
    Left = 136
    Top = 163
    Width = 12
    Height = 13
    Caption = 'no'
  end
  object Edit1: TEdit
    Left = 136
    Top = 28
    Width = 153
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 372
    Top = 28
    Width = 73
    Height = 21
    TabOrder = 1
    Text = 'DE'
  end
  object Edit3: TEdit
    Left = 136
    Top = 55
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 136
    Top = 132
    Width = 153
    Height = 21
    TabOrder = 3
    OnChange = Edit4Change
  end
  object Edit5: TEdit
    Left = 372
    Top = 132
    Width = 73
    Height = 21
    TabOrder = 4
    Text = 'DE'
  end
end
