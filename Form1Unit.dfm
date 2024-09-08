object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 481
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 18
    Width = 50
    Height = 15
    Caption = 'Thread -1'
  end
  object Label2: TLabel
    Left = 309
    Top = 18
    Width = 50
    Height = 15
    Caption = 'Thread -2'
  end
  object Label3: TLabel
    Left = 8
    Top = 260
    Width = 69
    Height = 15
    Caption = 'Main Thread:'
  end
  object Button1: TButton
    Left = 198
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 515
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 6
    Top = 39
    Width = 267
    Height = 209
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 309
    Top = 39
    Width = 281
    Height = 209
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Button3: TButton
    Left = 184
    Top = 432
    Width = 193
    Height = 25
    Caption = 'Send Messsage to Main'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Memo3: TMemo
    Left = 8
    Top = 281
    Width = 582
    Height = 121
    Lines.Strings = (
      'Memo3')
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object txtMessage: TEdit
    Left = 8
    Top = 433
    Width = 145
    Height = 23
    TabOrder = 6
  end
  object Button4: TButton
    Left = 400
    Top = 432
    Width = 190
    Height = 25
    Caption = 'Send Messsage to Thread'
    TabOrder = 7
    OnClick = Button4Click
  end
end
