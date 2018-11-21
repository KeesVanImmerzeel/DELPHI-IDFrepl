object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 216
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object SingleESRIgrid1: TSingleESRIgrid
    Left = 40
    Top = 24
  end
  object SingleESRIgrid2: TSingleESRIgrid
    Left = 136
    Top = 24
  end
  object SingleESRIgrid3: TSingleESRIgrid
    Left = 208
    Top = 24
  end
end
