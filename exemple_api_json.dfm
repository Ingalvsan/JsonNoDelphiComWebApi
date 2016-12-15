object Form1: TForm1
  Left = 529
  Top = 262
  Width = 661
  Height = 370
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Teste manipula'#231#227'o'
    TabOrder = 0
    OnClick = Button1Click
  end
  object memoJson: TMemo
    Left = 8
    Top = 40
    Width = 625
    Height = 281
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 128
    Top = 8
    Width = 177
    Height = 25
    Caption = 'Retornar configura'#231#245'es - Json fixo'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 8
    Width = 209
    Height = 25
    Caption = 'Retornar configura'#231#245'es - Json Class'
    TabOrder = 3
    OnClick = Button3Click
  end
end
