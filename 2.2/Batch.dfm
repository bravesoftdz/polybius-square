object BatchForm: TBatchForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Batch Processor'
  ClientHeight = 485
  ClientWidth = 492
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmExplicit
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 492
    Height = 409
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1055#1072#1082#1077#1090#1085#1072#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1072
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 484
        Height = 381
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        object TabSheet2: TTabSheet
          Caption = #1054#1089#1085#1086#1074#1085#1099#1077
          object GroupBox1: TGroupBox
            Left = 3
            Top = 3
            Width = 462
            Height = 206
            Caption = #1042#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
            Color = clBtnFace
            ParentColor = False
            TabOrder = 0
            object ListBox1: TListBox
              Left = 10
              Top = 17
              Width = 440
              Height = 97
              ItemHeight = 13
              MultiSelect = True
              Sorted = True
              TabOrder = 0
            end
            object Button1: TButton
              Left = 10
              Top = 120
              Width = 111
              Height = 25
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              TabOrder = 1
              OnClick = Button1Click
            end
            object Button3: TButton
              Left = 344
              Top = 120
              Width = 106
              Height = 25
              Caption = #1059#1076#1072#1083#1080#1090#1100
              TabOrder = 2
              OnClick = Button3Click
            end
            object Button4: TButton
              Left = 344
              Top = 151
              Width = 106
              Height = 25
              Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
              TabOrder = 3
              OnClick = Button4Click
            end
          end
          object Button2: TButton
            Left = 13
            Top = 154
            Width = 111
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1087#1082#1091
            TabOrder = 1
            OnClick = Button2Click
          end
          object GroupBox2: TGroupBox
            Left = 3
            Top = 215
            Width = 462
            Height = 130
            Caption = #1042#1099#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
            Color = clBtnFace
            ParentColor = False
            TabOrder = 2
            object Label1: TLabel
              Left = 10
              Top = 24
              Width = 31
              Height = 13
              Caption = #1055#1072#1087#1082#1072
            end
            object Label2: TLabel
              Left = 10
              Top = 56
              Width = 59
              Height = 13
              Caption = #1055#1077#1088#1077#1079#1072#1087#1080#1089#1100
            end
            object Edit1: TEdit
              Left = 78
              Top = 21
              Width = 323
              Height = 21
              TabOrder = 0
            end
            object Button5: TButton
              Left = 407
              Top = 21
              Width = 25
              Height = 20
              Caption = '...'
              TabOrder = 1
              OnClick = Button5Click
            end
            object CheckBox1: TCheckBox
              Left = 232
              Top = 48
              Width = 145
              Height = 17
              Caption = #1059#1076#1072#1083#1103#1090#1100' '#1080#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083
              Color = clBtnFace
              ParentColor = False
              TabOrder = 2
            end
            object CheckBox2: TCheckBox
              Left = 232
              Top = 67
              Width = 153
              Height = 17
              Caption = #1057#1082#1088#1099#1074#1072#1090#1100' '#1086#1096#1080#1073#1082#1080' '#1095#1090#1077#1085#1080#1103
              Color = clBtnFace
              ParentColor = False
              TabOrder = 3
            end
            object CheckBox3: TCheckBox
              Left = 232
              Top = 86
              Width = 200
              Height = 17
              Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1080#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1090#1091'/'#1074#1088#1077#1084#1103
              Color = clBtnFace
              ParentColor = False
              TabOrder = 4
            end
            object CheckBox4: TCheckBox
              Left = 10
              Top = 99
              Width = 191
              Height = 17
              Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1089#1090#1088#1091#1082#1090#1091#1088#1091' '#1087#1086#1076#1087#1072#1087#1086#1082
              Color = clBtnFace
              ParentColor = False
              TabOrder = 5
            end
            object CheckBox5: TCheckBox
              Left = 10
              Top = 80
              Width = 180
              Height = 17
              Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1080#1089#1093#1086#1076#1085#1099#1081' '#1087#1091#1090#1100
              Color = clBtnFace
              ParentColor = False
              TabOrder = 6
              OnClick = CheckBox5Click
            end
          end
          object ComboBox1: TComboBox
            Left = 81
            Top = 268
            Width = 112
            Height = 21
            ItemHeight = 13
            ItemIndex = 1
            TabOrder = 3
            Text = #1047#1072#1087#1088#1086#1089
            Items.Strings = (
              #1047#1072#1084#1077#1085#1080#1090#1100
              #1047#1072#1087#1088#1086#1089
              #1055#1088#1086#1087#1091#1089#1090#1080#1090#1100
              #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100)
          end
        end
        object TabSheet5: TTabSheet
          Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
          ImageIndex = 1
          object GroupBox4: TGroupBox
            Left = 3
            Top = 3
            Width = 180
            Height = 101
            Caption = #1054#1087#1077#1088#1072#1094#1080#1103
            TabOrder = 0
            object ListBox2: TListBox
              Left = 5
              Top = 16
              Width = 166
              Height = 78
              ItemHeight = 13
              Items.Strings = (
                #1064#1080#1092#1088#1086#1074#1072#1090#1100
                #1044#1077#1096#1080#1092#1088#1086#1074#1072#1090#1100
                #1044#1074#1091#1084#1077#1088#1085#1086#1077' '#1064#1080#1092#1088#1086#1074#1072#1085#1080#1077
                #1044#1074#1091#1084#1077#1088#1085#1086#1077' '#1044#1077#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
                #1063#1072#1089#1090#1086#1090#1085#1099#1081' '#1040#1085#1072#1083#1080#1079)
              TabOrder = 0
              OnClick = ListBox2Click
            end
          end
          object GroupBox5: TGroupBox
            Left = 190
            Top = 3
            Width = 268
            Height = 182
            Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
            TabOrder = 1
            object CheckBox7: TCheckBox
              Left = 9
              Top = 23
              Width = 121
              Height = 17
              Caption = #1053#1091#1084#1077#1088#1072#1090#1086#1088' '#1089#1090#1088#1086#1082
              Color = clBtnFace
              ParentColor = False
              TabOrder = 0
              Visible = False
            end
            object CheckBox11: TCheckBox
              Left = 9
              Top = 24
              Width = 152
              Height = 17
              Caption = #1044#1080#1085#1072#1084#1080#1095#1077#1089#1082#1072#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1072
              TabOrder = 1
              Visible = False
              OnClick = CheckBox11Click
            end
            object Button10: TButton
              Left = 32
              Top = 47
              Width = 75
              Height = 20
              Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100'...'
              Enabled = False
              TabOrder = 2
              Visible = False
              OnClick = Button10Click
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1073#1086#1083#1100#1096#1080#1093' '#1092#1072#1081#1083#1086#1074
      ImageIndex = 1
      object Label3: TLabel
        Left = 3
        Top = 19
        Width = 80
        Height = 13
        Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083
      end
      object Label4: TLabel
        Left = 3
        Top = 75
        Width = 80
        Height = 13
        Caption = #1050#1086#1085#1077#1095#1085#1099#1081' '#1092#1072#1081#1083
      end
      object Edit2: TEdit
        Left = 89
        Top = 16
        Width = 344
        Height = 21
        TabOrder = 0
      end
      object Button8: TButton
        Left = 439
        Top = 16
        Width = 31
        Height = 21
        Caption = '...'
        TabOrder = 1
        OnClick = Button8Click
      end
      object Edit3: TEdit
        Left = 89
        Top = 72
        Width = 344
        Height = 21
        TabOrder = 2
      end
      object Button9: TButton
        Left = 439
        Top = 72
        Width = 31
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = Button9Click
      end
      object CheckBox8: TCheckBox
        Left = 311
        Top = 158
        Width = 121
        Height = 17
        Caption = #1053#1091#1084#1077#1088#1072#1090#1086#1088' '#1089#1090#1088#1086#1082
        TabOrder = 4
        Visible = False
      end
      object ListBox3: TListBox
        Left = 139
        Top = 99
        Width = 166
        Height = 78
        ItemHeight = 13
        Items.Strings = (
          #1064#1080#1092#1088#1086#1074#1072#1090#1100
          #1044#1077#1096#1080#1092#1088#1086#1074#1072#1090#1100
          #1044#1074#1091#1084#1077#1088#1085#1086#1077' '#1064#1080#1092#1088#1086#1074#1072#1085#1080#1077
          #1044#1074#1091#1084#1077#1088#1085#1086#1077' '#1044#1077#1096#1080#1092#1088#1086#1074#1072#1085#1080#1077
          #1063#1072#1089#1090#1086#1090#1085#1099#1081' '#1040#1085#1072#1083#1080#1079)
        TabOrder = 5
        OnClick = ListBox3Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      ImageIndex = 2
      object ListBox4: TListBox
        Left = 3
        Top = 9
        Width = 209
        Height = 113
        ItemHeight = 13
        Items.Strings = (
          #1064#1080#1092#1088#1086#1074#1072#1090#1100' '#1084#1085#1086#1078#1077#1089#1090#1074#1086#1084' '#1082#1083#1102#1095#1077#1081
          'Warp Analyze'
          #1048#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1082#1083#1102#1095
          #1057#1090#1077#1075#1072#1085#1086#1075#1088#1072#1092#1080#1103)
        TabOrder = 0
        OnClick = ListBox4Click
      end
      object GroupBox3: TGroupBox
        Left = 218
        Top = 3
        Width = 251
        Height = 86
        Caption = #1048#1085#1092#1086
        TabOrder = 1
        object Label5: TLabel
          Left = 8
          Top = 21
          Width = 234
          Height = 54
          Margins.Left = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alCustom
          AutoSize = False
          WordWrap = True
        end
      end
      object GroupBox6: TGroupBox
        Left = 218
        Top = 95
        Width = 263
        Height = 170
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
        TabOrder = 2
        object CheckBox10: TCheckBox
          Left = 12
          Top = 70
          Width = 134
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1082#1088#1072#1090#1085#1099#1077' 2^n'
          TabOrder = 0
          Visible = False
        end
        object CheckBox9: TCheckBox
          Left = 12
          Top = 47
          Width = 97
          Height = 17
          Caption = #1044#1077#1096#1080#1092#1088#1086#1074#1072#1090#1100
          TabOrder = 1
          Visible = False
        end
        object Button11: TButton
          Left = 164
          Top = 20
          Width = 82
          Height = 21
          Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100'...'
          Enabled = False
          TabOrder = 2
          Visible = False
          OnClick = Button11Click
        end
        object CheckBox12: TCheckBox
          Left = 12
          Top = 24
          Width = 149
          Height = 17
          Caption = #1044#1080#1085#1072#1084#1080#1095#1077#1089#1082#1072#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1072
          TabOrder = 3
          Visible = False
          OnClick = CheckBox12Click
        end
      end
    end
  end
  object CheckBox6: TCheckBox
    Left = 8
    Top = 422
    Width = 222
    Height = 17
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1076#1080#1072#1083#1086#1075' '#1087#1086#1089#1083#1077' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
    TabOrder = 1
  end
  object ComboBox2: TComboBox
    Left = 328
    Top = 420
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1076#1077#1083#1072#1090#1100
    Items.Strings = (
      #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1076#1077#1083#1072#1090#1100
      #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091' '#1074' Windows')
  end
  object Button6: TButton
    Left = 8
    Top = 452
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 398
    Top = 452
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button7Click
  end
  object OpenDialog1: TOpenDialog
    FilterIndex = 0
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
    Left = 104
    Top = 448
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing, ofDontAddToRecent]
    Left = 144
    Top = 448
  end
end
