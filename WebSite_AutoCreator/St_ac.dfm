object Form1: TForm1
  Left = 217
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'WebSite AutoCreator v1.2'
  ClientHeight = 687
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 120
  TextHeight = 16
  object Label11: TLabel
    Left = 8
    Top = 656
    Width = 265
    Height = 16
    Caption = #1055#1088#1086#1075#1088#1077#1089#1089' '#1075#1077#1085#1077#1088#1072#1094#1080#1080': '#1089#1076#1077#1083#1072#1085#1086' '#1089#1090#1088#1072#1085#1080#1094' ...'
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 678
    Width = 824
    Height = 9
    Align = alBottom
    Max = 100000
    Step = 1
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 16
    Width = 809
    Height = 633
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = ' '#1057#1077#1082#1094#1080#1103' "Head" '
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 196
        Height = 16
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1075#1083#1072#1074#1085#1086#1081' '#1089#1090#1088#1072#1085#1080#1094#1099':'
      end
      object Label4: TLabel
        Left = 8
        Top = 88
        Width = 157
        Height = 16
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1074#1089#1077#1093' '#1089#1090#1088#1072#1085#1080#1094':'
      end
      object Label5: TLabel
        Left = 8
        Top = 120
        Width = 43
        Height = 16
        Caption = #1040#1074#1090#1086#1088':'
      end
      object Label6: TLabel
        Left = 8
        Top = 152
        Width = 66
        Height = 16
        Caption = #1050#1086#1087#1080#1088#1072#1081#1090':'
      end
      object Label12: TLabel
        Left = 8
        Top = 16
        Width = 218
        Height = 16
        Caption = #1053#1077#1074#1080#1076#1080#1084#1072#1103' '#1095#1072#1089#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 8
        Top = 216
        Width = 785
        Height = 9
        Shape = bsTopLine
      end
      object Label29: TLabel
        Left = 8
        Top = 184
        Width = 495
        Height = 16
        Caption = 
          #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072', '#1082#1086#1090#1086#1088#1099#1077' '#1073#1091#1076#1091#1090' '#1085#1072' '#1082#1072#1078#1076#1086#1081' '#1089#1090#1088#1072#1085#1080#1094#1077' ('#1073#1077#1079' '#1079#1072#1087#1103#1090#1086#1081' '#1074' ' +
          #1082#1086#1085#1094#1077'):'
      end
      object ComboBox1: TComboBox
        Left = 224
        Top = 48
        Width = 569
        Height = 24
        ItemHeight = 16
        PopupMenu = PopupMenu1
        TabOrder = 0
      end
      object ComboBox2: TComboBox
        Left = 184
        Top = 80
        Width = 609
        Height = 24
        ItemHeight = 16
        TabOrder = 2
      end
      object ComboBox3: TComboBox
        Left = 64
        Top = 112
        Width = 729
        Height = 24
        ItemHeight = 16
        TabOrder = 3
        Text = 'NoName User'
      end
      object ComboBox4: TComboBox
        Left = 88
        Top = 144
        Width = 705
        Height = 24
        ItemHeight = 16
        TabOrder = 4
        Text = #169' 2005-2011 xXx Soft, Page created by [ WebSite AutoCreator ]'
      end
      object RichEdit1: TRichEdit
        Left = 648
        Top = 64
        Width = 105
        Height = 89
        Lines.Strings = (
          'HTML')
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 1
        Visible = False
        WordWrap = False
      end
      object Edit1: TEdit
        Left = 536
        Top = 176
        Width = 257
        Height = 24
        TabOrder = 5
        Text = 'web, reclama'
      end
    end
    object TabSheet2: TTabSheet
      Caption = ' '#1057#1077#1082#1094#1080#1103' "Body": 1 '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Label7: TLabel
        Left = 8
        Top = 50
        Width = 317
        Height = 16
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' ('#1096#1072#1087#1082#1072') '#1075#1083#1072#1074#1085#1086#1081' '#1089#1090#1088#1072#1085#1080#1094#1099' (index.html):'
      end
      object Label1: TLabel
        Left = 8
        Top = 122
        Width = 164
        Height = 16
        Caption = 'E-mail ('#1076#1083#1103' '#1074#1089#1077#1093' '#1089#1090#1088#1072#1085#1080#1094'):'
      end
      object Label15: TLabel
        Left = 8
        Top = 154
        Width = 145
        Height = 16
        Caption = #1053#1072' '#1075#1083#1072#1074#1085#1091#1102' '#1089#1090#1088#1072#1085#1080#1094#1091':'
      end
      object Label9: TLabel
        Left = 8
        Top = 218
        Width = 173
        Height = 16
        Caption = #1053#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1091#1102' '#1089#1090#1088#1072#1085#1080#1094#1091':'
      end
      object Label10: TLabel
        Left = 8
        Top = 186
        Width = 165
        Height = 16
        Caption = #1053#1072' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1089#1090#1088#1072#1085#1080#1094#1091':'
      end
      object Label17: TLabel
        Left = 8
        Top = 250
        Width = 161
        Height = 16
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1074#1089#1077#1093' '#1089#1090#1088#1072#1085#1080#1094': '
      end
      object Label26: TLabel
        Left = 8
        Top = 322
        Width = 231
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1083#1086#1074' '#1074' '#1090#1077#1082#1089#1090#1077', '#1085#1077' '#1084#1085#1077#1077':'
      end
      object Label3: TLabel
        Left = 8
        Top = 280
        Width = 319
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1089#1099#1083#1086#1082' '#1085#1072' '#1089#1072#1081#1090#1099' '#1074' '#1090#1077#1082#1089#1090#1077' (random 3): '
      end
      object Label25: TLabel
        Left = 8
        Top = 16
        Width = 207
        Height = 16
        Caption = ' '#1042#1080#1076#1080#1084#1072#1103' '#1095#1072#1089#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Image1: TImage
        Left = 408
        Top = 8
        Width = 385
        Height = 17
        Visible = False
      end
      object Label24: TLabel
        Left = 8
        Top = 352
        Width = 332
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1083#1102#1095#1077#1074#1099#1093' '#1089#1083#1086#1074' '#1085#1072' '#1089#1090#1088#1072#1085#1080#1094#1077', '#1085#1077' '#1084#1077#1085#1077#1077':'
      end
      object Label33: TLabel
        Left = 8
        Top = 80
        Width = 300
        Height = 16
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1076#1083#1103' '#1074#1089#1077#1093' '#1086#1089#1090#1072#1083#1100#1085#1099#1093' '#1089#1090#1088#1072#1085#1080#1094' '#1089#1072#1081#1090#1072':'
      end
      object Edit2: TEdit
        Left = 184
        Top = 242
        Width = 225
        Height = 24
        TabOrder = 0
        Text = 'page'
      end
      object SpinEdit4: TSpinEdit
        Left = 264
        Top = 312
        Width = 65
        Height = 26
        MaxValue = 5000
        MinValue = 1
        TabOrder = 1
        Value = 100
      end
      object SpinEdit6: TSpinEdit
        Left = 352
        Top = 272
        Width = 57
        Height = 26
        MaxValue = 10
        MinValue = 1
        TabOrder = 2
        Value = 2
      end
      object GroupBox1: TGroupBox
        Left = 424
        Top = 112
        Width = 369
        Height = 185
        Caption = ' '#1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100#1085#1086#1081' '#1083#1080#1085#1080#1080' '
        TabOrder = 3
        object Label16: TLabel
          Left = 16
          Top = 41
          Width = 78
          Height = 16
          Caption = #1062#1074#1077#1090' '#1083#1080#1085#1080#1080':'
        end
        object Label19: TLabel
          Left = 17
          Top = 73
          Width = 115
          Height = 16
          Caption = #1044#1083#1080#1085#1072' '#1083#1080#1085#1080#1080' (pix):'
        end
        object Label18: TLabel
          Left = 17
          Top = 105
          Width = 122
          Height = 16
          Caption = #1042#1099#1089#1086#1090#1072' '#1083#1080#1085#1080#1080' (pix):'
        end
        object Label28: TLabel
          Left = 224
          Top = 40
          Width = 73
          Height = 16
          Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072':'
        end
        object Button3: TButton
          Left = 16
          Top = 144
          Width = 337
          Height = 25
          Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100#1085#1091#1102' '#1083#1080#1085#1080#1102
          TabOrder = 0
          OnClick = Button3Click
        end
        object Panel3: TPanel
          Left = 112
          Top = 32
          Width = 25
          Height = 25
          BevelInner = bvLowered
          Color = clNavy
          TabOrder = 1
          OnMouseDown = Panel3MouseDown
        end
        object SpinEdit3: TSpinEdit
          Left = 152
          Top = 63
          Width = 73
          Height = 26
          MaxValue = 100000
          MinValue = 1
          TabOrder = 2
          Value = 650
        end
        object SpinEdit2: TSpinEdit
          Left = 160
          Top = 95
          Width = 65
          Height = 26
          MaxValue = 100000
          MinValue = 1
          TabOrder = 3
          Value = 2
        end
        object Panel6: TPanel
          Left = 320
          Top = 32
          Width = 25
          Height = 25
          BevelInner = bvLowered
          Color = 10733496
          TabOrder = 4
          OnClick = Panel6Click
          OnMouseDown = Panel6MouseDown
        end
      end
      object CheckBox2: TCheckBox
        Left = 8
        Top = 384
        Width = 785
        Height = 17
        Caption = 
          #1043#1080#1087#1077#1088#1089#1089#1099#1083#1082#1080' '#1074' '#1090#1077#1082#1089#1090#1077' '#1089#1090#1072#1074#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1072' '#1089#1090#1088#1072#1085#1080#1094#1099' '#1075#1077#1085#1077#1088#1080#1088#1091#1077#1084#1086#1075#1086' '#1089#1072 +
          #1081#1090#1072' ('#1080#1085#1072#1095#1077' '#1080' '#1085#1072' '#1076#1088#1091#1075#1080#1077' '#1089#1072#1081#1090#1099' '#1080#1079' '#1089#1087#1080#1089#1082#1072')'
        TabOrder = 4
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 416
        Width = 785
        Height = 169
        Caption = ' '#1055#1088#1086#1089#1084#1086#1090#1088' '#1080' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '
        TabOrder = 5
        object Button6: TButton
          Left = 16
          Top = 32
          Width = 281
          Height = 25
          Caption = 'C'#1090#1080#1083#1100' (CSS) '#1075#1077#1085#1077#1088#1080#1088#1091#1077#1084#1099#1093' '#1089#1090#1088#1072#1085#1080#1094
          TabOrder = 0
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 16
          Top = 96
          Width = 457
          Height = 25
          Caption = 'C'#1087#1080#1089#1086#1082' '#1089#1089#1099#1083#1086#1082' '#1085#1072' '#1089#1072#1081#1090#1099' ('#1089#1089#1099#1083#1082#1072#1084#1080' '#1103#1074#1083#1103#1102#1090#1089#1103' '#1089#1083#1086#1074#1072' '#1080#1079' '#1090#1077#1082#1089#1090#1072')'
          TabOrder = 1
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 16
          Top = 64
          Width = 425
          Height = 25
          Caption = 'C'#1087#1080#1089#1086#1082' '#1073#1072#1085#1077#1088#1086#1074' '#1089' '#1086#1087#1080#1089#1072#1085#1080#1077#1084' '#1080' '#1089#1089#1099#1083#1082#1072#1084#1080' ('#1087#1088#1103#1084#1099#1077' '#1089#1089#1099#1083#1082#1080')'
          TabOrder = 2
          OnClick = Button8Click
        end
        object Button9: TButton
          Left = 16
          Top = 128
          Width = 497
          Height = 25
          Caption = #1057#1082#1088#1080#1087#1090' '#1075#1077#1085#1077#1088#1072#1094#1080#1080' '#1073#1072#1085#1085#1077#1088#1086#1074' ('#1073#1072#1085#1085#1077#1088' '#1084#1077#1085#1103#1077#1090#1089#1103' '#1089#1083#1091#1095#1072#1081#1085#1099#1084' '#1086#1073#1088#1072#1079#1086#1084')'
          TabOrder = 3
          OnClick = Button9Click
        end
      end
      object ComboBox5: TComboBox
        Left = 352
        Top = 40
        Width = 441
        Height = 24
        ItemHeight = 16
        TabOrder = 6
      end
      object ComboBox6: TComboBox
        Left = 192
        Top = 112
        Width = 217
        Height = 24
        ItemHeight = 16
        TabOrder = 7
        Text = 'wsac@front.ru'
        Items.Strings = (
          'wsac@front.ru'
          'web-reclama@nm.ru'
          'website-autocreator@nm.ru')
      end
      object ComboBox7: TComboBox
        Left = 176
        Top = 144
        Width = 233
        Height = 24
        ItemHeight = 16
        TabOrder = 8
        Text = #1053#1072' '#1043#1083#1072#1074#1085#1091#1102
        Items.Strings = (
          #1053#1072' '#1043#1083#1072#1074#1085#1091#1102
          'To First page')
      end
      object ComboBox8: TComboBox
        Left = 192
        Top = 176
        Width = 217
        Height = 24
        ItemHeight = 16
        TabOrder = 9
        Text = #1044#1072#1083#1077#1077
        Items.Strings = (
          #1044#1072#1083#1077#1077
          #1042#1087#1077#1088#1077#1076
          #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
          'Next')
      end
      object ComboBox9: TComboBox
        Left = 200
        Top = 208
        Width = 209
        Height = 24
        ItemHeight = 16
        TabOrder = 10
        Text = #1053#1072#1079#1072#1076
        Items.Strings = (
          #1053#1072#1079#1072#1076
          #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
          'Back')
      end
      object SpinEdit5: TSpinEdit
        Left = 360
        Top = 344
        Width = 65
        Height = 26
        MaxValue = 50
        MinValue = 1
        TabOrder = 11
        Value = 20
      end
      object ComboBox12: TComboBox
        Left = 336
        Top = 72
        Width = 457
        Height = 24
        ItemHeight = 16
        Sorted = True
        TabOrder = 12
        OnChange = ComboBox12Change
      end
    end
    object TabSheet4: TTabSheet
      Caption = ' '#1057#1077#1082#1094#1080#1103' "Body": 2 '
      ImageIndex = 4
      object Label20: TLabel
        Left = 8
        Top = 538
        Width = 91
        Height = 16
        Caption = #1042#1077#1088#1089#1080#1103' '#1089#1072#1081#1090#1072':'
      end
      object Label27: TLabel
        Left = 8
        Top = 568
        Width = 214
        Height = 16
        Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1089#1072#1081#1090' ('#1074#1085#1080#1079#1091' '#1089#1090#1088#1072#1085#1080#1094'): '
      end
      object Bevel4: TBevel
        Left = 8
        Top = 480
        Width = 785
        Height = 10
        Shape = bsTopLine
      end
      object Label31: TLabel
        Left = 16
        Top = 192
        Width = 246
        Height = 16
        Caption = #1055#1091#1090#1100' '#1076#1086' '#1073#1072#1079#1099' '#1089' '#1079#1072#1075#1086#1083#1086#1074#1082#1072#1084#1080' '#1089#1090#1088#1072#1085#1080#1094':'
      end
      object Bevel5: TBevel
        Left = 8
        Top = 168
        Width = 785
        Height = 9
        Shape = bsTopLine
      end
      object Label32: TLabel
        Left = 16
        Top = 224
        Width = 239
        Height = 16
        Caption = #1055#1091#1090#1100' '#1076#1086' '#1073#1072#1079#1099' '#1089' '#1090#1077#1082#1089#1090#1086#1084' '#1076#1083#1103' '#1089#1090#1088#1072#1085#1080#1094':'
      end
      object Label30: TLabel
        Left = 8
        Top = 504
        Width = 353
        Height = 16
        Caption = #1040#1076#1088#1077#1089' '#1076#1083#1103' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1080#1085#1076#1077#1082#1089#1072' '#1094#1080#1090#1080#1088#1086#1074#1072#1085#1080#1103' "'#1071#1085#1076#1077#1082#1089'": '
      end
      object Edit11: TEdit
        Left = 120
        Top = 528
        Width = 673
        Height = 24
        Enabled = False
        TabOrder = 0
        Text = 'Site Version 1.1, Powered by ...'
      end
      object ComboBox10: TComboBox
        Left = 240
        Top = 560
        Width = 377
        Height = 24
        Hint = #1042#1074#1086#1076#1080#1090#1100' '#1072#1076#1088#1077#1089#1072' '#1089#1072#1081#1090#1086#1074' '#1073#1077#1079' "http://www." ('#1087#1088#1080#1084#1077#1088': '#1080#1084#1103'-'#1089#1072#1081#1090#1072'.ru)'
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 1
        Items.Strings = (
          '')
      end
      object GroupBox3: TGroupBox
        Left = 16
        Top = 16
        Width = 769
        Height = 105
        Caption = ' '#1057#1089#1099#1083#1082#1080' '#1085#1072' '#1089#1072#1081#1090#1099' ('#1073#1072#1085#1085#1077#1088#1099') '
        TabOrder = 2
        object RadioButton1: TRadioButton
          Left = 24
          Top = 24
          Width = 121
          Height = 17
          Caption = #1053#1077#1090' '#1073#1072#1085#1085#1077#1088#1086#1074
          TabOrder = 0
        end
        object RadioButton2: TRadioButton
          Left = 24
          Top = 48
          Width = 201
          Height = 17
          Caption = #1055#1088#1103#1084#1099#1077' '#1089#1089#1099#1083#1082#1080' '#1085#1072' '#1089#1072#1081#1090#1099
          TabOrder = 1
        end
        object RadioButton3: TRadioButton
          Left = 24
          Top = 72
          Width = 721
          Height = 17
          Caption = 
            #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1089' '#1087#1086#1084#1086#1097#1100#1102' JavaScript ('#1087#1088#1080' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1080' '#1089#1090#1088#1072#1085#1080#1094#1099' '#1073#1072#1085#1077#1088 +
            ' '#1084#1077#1085#1103#1077#1090#1089#1103' '#1089#1083#1091#1095#1072#1081#1085#1099#1084' '#1086#1073#1088#1072#1079#1086#1084')'
          Checked = True
          TabOrder = 2
          TabStop = True
        end
      end
      object CheckBox3: TCheckBox
        Left = 16
        Top = 136
        Width = 561
        Height = 17
        Caption = 
          #1042#1085#1080#1079#1091' '#1089#1090#1088#1072#1085#1080#1094' '#1089#1090#1072#1074#1080#1090#1100' '#1089#1089#1099#1083#1082#1080' '#1085#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1077' '#1080' '#1089#1083#1077#1076#1091#1102#1097#1080#1077' 5 '#1089#1090#1088#1072#1085#1080#1094 +
          ' '#1089#1072#1081#1090#1072
        Enabled = False
        TabOrder = 3
      end
      object Edit3: TEdit
        Left = 288
        Top = 184
        Width = 385
        Height = 24
        TabOrder = 4
      end
      object Edit4: TEdit
        Left = 280
        Top = 216
        Width = 393
        Height = 24
        TabOrder = 5
      end
      object Button10: TButton
        Left = 680
        Top = 184
        Width = 105
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
        TabOrder = 6
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 680
        Top = 216
        Width = 105
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
        TabOrder = 7
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 624
        Top = 560
        Width = 169
        Height = 25
        Caption = #1055#1077#1088#1077#1081#1090#1080' ...'
        TabOrder = 8
        OnClick = Button12Click
      end
      object ComboBox11: TComboBox
        Left = 384
        Top = 496
        Width = 233
        Height = 24
        Hint = #1042#1074#1086#1076#1080#1090#1100' '#1072#1076#1088#1077#1089#1072' '#1089#1072#1081#1090#1086#1074' '#1073#1077#1079' "http://www." ('#1087#1088#1080#1084#1077#1088': '#1080#1084#1103'-'#1089#1072#1081#1090#1072'.ru)'
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 9
      end
      object Button13: TButton
        Left = 624
        Top = 496
        Width = 169
        Height = 25
        Caption = #1055#1077#1088#1077#1081#1090#1080' ...'
        TabOrder = 10
        OnClick = Button13Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = ' '#1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1089#1072#1081#1090#1072' '
      ImageIndex = 2
      object Label8: TLabel
        Left = 8
        Top = 16
        Width = 179
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1072#1085#1080#1094' '#1089#1072#1081#1090#1072':'
      end
      object Label13: TLabel
        Left = 8
        Top = 56
        Width = 130
        Height = 16
        Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072' '#1089#1090#1088#1072#1085#1080#1094':'
      end
      object Label14: TLabel
        Left = 512
        Top = 56
        Width = 82
        Height = 16
        Caption = #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072':'
      end
      object Label22: TLabel
        Left = 672
        Top = 56
        Width = 84
        Height = 16
        Caption = #1062#1074#1077#1090' '#1089#1089#1099#1083#1086#1082':'
      end
      object Bevel1: TBevel
        Left = 8
        Top = 88
        Width = 785
        Height = 9
        Shape = bsTopLine
      end
      object Label21: TLabel
        Left = 8
        Top = 106
        Width = 170
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1075#1077#1085#1077#1088#1072#1094#1080#1080' '#1089#1072#1081#1090#1072': ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel2: TBevel
        Left = 8
        Top = 512
        Width = 785
        Height = 9
        Shape = bsTopLine
      end
      object Label23: TLabel
        Left = 224
        Top = 56
        Width = 198
        Height = 16
        Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072' '#1086#1089#1085#1086#1074#1085#1086#1081' '#1090#1072#1073#1083#1080#1094#1099':'
      end
      object Button2: TButton
        Left = 488
        Top = 529
        Width = 305
        Height = 25
        Caption = #1055#1088#1077#1076#1087#1088#1086#1089#1084#1086#1090#1088' '#1075#1077#1085#1077#1088#1080#1088#1091#1077#1084#1099#1093' '#1089#1090#1088#1072#1085#1080#1094
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button1: TButton
        Left = 8
        Top = 561
        Width = 345
        Height = 25
        Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1089#1072#1081#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button5: TButton
        Left = 360
        Top = 561
        Width = 121
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        Enabled = False
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button4: TButton
        Left = 488
        Top = 561
        Width = 305
        Height = 25
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1089#1072#1081#1090#1072
        TabOrder = 3
        OnClick = Button4Click
      end
      object SpinEdit1: TSpinEdit
        Left = 208
        Top = 8
        Width = 81
        Height = 26
        MaxValue = 100000
        MinValue = 5
        TabOrder = 4
        Value = 5
      end
      object Panel1: TPanel
        Left = 152
        Top = 48
        Width = 25
        Height = 25
        BevelInner = bvLowered
        Color = 12901329
        TabOrder = 5
        OnClick = Panel1Click
        OnMouseDown = Panel1MouseDown
      end
      object Panel2: TPanel
        Left = 608
        Top = 48
        Width = 25
        Height = 25
        BevelInner = bvLowered
        Color = clBlack
        TabOrder = 6
        OnMouseDown = Panel2MouseDown
      end
      object Panel4: TPanel
        Left = 768
        Top = 48
        Width = 25
        Height = 25
        BevelInner = bvLowered
        Color = clBlack
        TabOrder = 7
        OnMouseDown = Panel4MouseDown
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 536
        Width = 473
        Height = 17
        Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1089#1072#1081#1090#1072' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' '#1087#1086#1089#1083#1077' '#1075#1077#1085#1077#1088#1072#1094#1080#1080' '#1089#1090#1088#1072#1085#1080#1094
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object Panel5: TPanel
        Left = 440
        Top = 48
        Width = 25
        Height = 25
        BevelInner = bvLowered
        Color = 10733496
        TabOrder = 9
        OnClick = Panel5Click
        OnMouseDown = Panel5MouseDown
      end
    end
  end
  object ColorDialog1: TColorDialog
    Left = 752
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 712
    Top = 8
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102'...'
    end
    object N3: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1087#1086#1079#1080#1094#1080#1102'...'
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1087#1086#1079#1080#1094#1080#1102
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofHideReadOnly]
    Left = 728
    Top = 240
  end
end
