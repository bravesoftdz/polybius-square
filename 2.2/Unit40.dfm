object ProgressForm: TProgressForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'ProgressForm'
  ClientHeight = 133
  ClientWidth = 351
  Color = clSkyBlue
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PopupMode = pmExplicit
  PopupParent = Form38.Owner
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 351
    Height = 133
    Align = alClient
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Caption = 'Panel7'
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 21
      Width = 347
      Height = 110
      Align = alClient
      BevelInner = bvLowered
      BevelKind = bkFlat
      Color = 13809326
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 288
        Top = 36
        Width = 47
        Height = 13
        Caption = '100500%'
      end
      object Label2: TLabel
        Left = 18
        Top = 15
        Width = 123
        Height = 13
        Caption = 'Estimated time remaining:'
      end
      object Label3: TLabel
        Left = 18
        Top = 58
        Width = 70
        Height = 13
        Caption = '99999.9 bytes'
      end
      object Label4: TLabel
        Left = 119
        Top = 58
        Width = 4
        Height = 13
        Caption = '/'
      end
      object Label5: TLabel
        Left = 142
        Top = 59
        Width = 70
        Height = 13
        Caption = '99999.9 bytes'
      end
      object Panel4: TPanel
        Left = 176
        Top = 82
        Width = 153
        Height = 18
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = ' Working...'
        Color = 13809326
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 18
        Top = 82
        Width = 61
        Height = 18
        Caption = 'Cancel'
        Color = 11237482
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = Panel5Click
        OnMouseDown = Panel5MouseDown
        OnMouseEnter = Panel5MouseEnter
        OnMouseLeave = Panel5MouseLeave
        OnMouseUp = Panel5MouseUp
      end
      object Panel6: TPanel
        Left = 90
        Top = 82
        Width = 61
        Height = 18
        Caption = 'Pause'
        Color = 11237482
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = Panel6Click
        OnMouseDown = Panel6MouseDown
        OnMouseEnter = Panel6MouseEnter
        OnMouseLeave = Panel6MouseLeave
        OnMouseUp = Panel6MouseUp
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 347
      Height = 19
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'Panel1'
      Color = 13743257
      ParentBackground = False
      TabOrder = 2
      OnMouseDown = Panel1MouseDown
      OnMouseMove = Panel1MouseMove
      OnMouseUp = Panel1MouseUp
      object SpeedButton1: TSpeedButton
        Left = 327
        Top = 1
        Width = 16
        Height = 16
        Hint = #1057#1074#1077#1088#1085#1091#1090#1100
        Flat = True
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          0400000000005800000000000000000000001000000000000000F0F0F0000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          BF01000000000000BF01000000000000BF01000001000000BF01000011100000
          BF01000111110000BF01001111111000BF01000000000000BF01000000000000
          BF01000000000000BF01000000000000BF01}
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = SpeedButton1Click
      end
    end
    object Panel3: TPanel
      Left = 20
      Top = 57
      Width = 258
      Height = 17
      BevelOuter = bvLowered
      BorderWidth = 1
      BorderStyle = bsSingle
      Color = clActiveCaption
      ParentBackground = False
      TabOrder = 0
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 255
        Height = 13
      end
    end
  end
end
