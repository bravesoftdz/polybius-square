object generator_settings: Tgenerator_settings
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
  ClientHeight = 170
  ClientWidth = 309
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmExplicit
  PopupParent = Form38.Owner
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 139
    Top = 49
    Width = 39
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088':'
    Enabled = False
  end
  object Label3: TLabel
    Left = 179
    Top = 97
    Width = 35
    Height = 13
    Caption = #1057#1076#1074#1080#1075':'
    Visible = False
  end
  object Label4: TLabel
    Left = 179
    Top = 119
    Width = 35
    Height = 13
    Caption = #1051#1080#1084#1080#1090':'
    Visible = False
  end
  object Edit1: TEdit
    Left = 184
    Top = 8
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'nipaa123456789'
  end
  object Edit2: TEdit
    Left = 184
    Top = 45
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = '256'
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 1
    Width = 105
    Height = 60
    ItemIndex = 0
    Items.Strings = (
      #1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1081
      '2-'#1084#1077#1088#1085#1099#1081)
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object Button1: TButton
    Left = 108
    Top = 138
    Width = 75
    Height = 25
    Caption = 'ok'
    Default = True
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 189
    Top = 140
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1086#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 94
    Width = 165
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = #1089#1083#1091#1095#1072#1081#1085#1099#1081'...'
    OnChange = ComboBox1Change
    Items.Strings = (
      #1089#1083#1091#1095#1072#1081#1085#1099#1081'...'
      'ROT13'
      'ROT47'
      #1040#1090#1073#1072#1096
      #1062#1077#1079#1072#1088#1100
      #1048#1085#1074#1077#1088#1089#1080#1103' '#1073#1072#1081#1090
      'qwerty<->'#1081#1094#1091#1082#1077#1085
      'qwerty<->dworak (en)'
      #1089#1090#1072#1088#1099#1081' '#1089#1090#1072#1085#1076#1072#1088#1090#1085#1099#1081'(<v1.2)'
      #1044#1080#1085#1072#1084#1080#1095#1077#1089#1082#1080#1081' '#1089#1076#1074#1080#1075)
  end
  object useSeed: TCheckBox
    Left = 127
    Top = 10
    Width = 51
    Height = 17
    Caption = ' Seed:'
    TabOrder = 6
    OnClick = useSeedClick
  end
  object TextSafe: TCheckBox
    Left = 8
    Top = 68
    Width = 170
    Height = 17
    Hint = #1048#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1076#1083#1103' '#1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1088#1077#1078#1080#1084#1072
    Caption = #1058#1086#1083#1100#1082#1086' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object MaskEdit1: TEdit
    Left = 220
    Top = 92
    Width = 37
    Height = 21
    TabOrder = 8
    Text = '+1'
    Visible = False
  end
  object MaskEdit2: TEdit
    Left = 220
    Top = 116
    Width = 37
    Height = 21
    TabOrder = 9
    Text = '256'
    Visible = False
  end
end
