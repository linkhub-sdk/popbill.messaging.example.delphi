object frmExample: TfrmExample
  Left = 336
  Top = 142
  Caption = #54045#48716' '#47928#51088' API SDK Delphi Example'
  ClientHeight = 829
  ClientWidth = 1387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 24
    Top = 20
    Width = 111
    Height = 13
    Caption = #54045#48716#54924#50896' '#49324#50629#51088#48264#54840' : '
  end
  object Label4: TLabel
    Left = 312
    Top = 20
    Width = 64
    Height = 13
    Caption = #54045#48716#50500#51060#46356' : '
  end
  object Label6: TLabel
    Left = 960
    Top = 20
    Width = 31
    Height = 13
    BiDiMode = bdRightToLeft
    Caption = 'URL : '
    ParentBiDiMode = False
  end
  object Label11: TLabel
    Left = 13
    Top = 20
    Width = 53
    Height = 13
    Caption = #51217#49688#48264#54840' : '
  end
  object GroupBox8: TGroupBox
    Left = 16
    Top = 48
    Width = 1361
    Height = 193
    Caption = #54045#48716' '#44592#48376' API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 161
      Height = 129
      Caption = #54924#50896' '#51221#48372
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = #50672#46041#54924#50896' '#49888#44508#44032#51077
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = #50500#51060#46356' '#51473#48373' '#54869#51064
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = #44032#51077#50668#48512' '#54869#51064
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 185
      Top = 24
      Width = 312
      Height = 129
      Caption = #54252#51064#53944' '#44288#47144
      TabOrder = 1
      object btnGetUnitCost_SMS: TButton
        Left = 160
        Top = 24
        Width = 144
        Height = 25
        Caption = 'SMS '#51204#49569#45800#44032' '#54869#51064
        TabOrder = 0
        OnClick = btnGetUnitCost_SMSClick
      end
      object btnGetUnitCost_LMS: TButton
        Left = 160
        Top = 56
        Width = 144
        Height = 25
        Caption = 'LMS '#51204#49569#45800#44032' '#54869#51064
        TabOrder = 1
        OnClick = btnGetUnitCost_LMSClick
      end
      object btnGetUnitCost_MMS: TButton
        Left = 160
        Top = 88
        Width = 144
        Height = 25
        Caption = 'MMS '#51204#49569#45800#44032' '#54869#51064
        TabOrder = 2
        OnClick = btnGetUnitCost_MMSClick
      end
      object btnGetChargeInfo_SMS: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = 'SMS '#44284#44552#51221#48372' '#54869#51064
        TabOrder = 3
        OnClick = btnGetChargeInfo_SMSClick
      end
      object btnGetChargeInfo_LMS: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = 'LMS '#44284#44552#51221#48372' '#54869#51064
        TabOrder = 4
        OnClick = btnGetChargeInfo_LMSClick
      end
      object btnGetChargeInfo_MMS: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = 'MMS '#44284#44552#51221#48372' '#54869#51064
        TabOrder = 5
        OnClick = btnGetChargeInfo_MMSClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 844
      Top = 24
      Width = 161
      Height = 129
      Caption = #54045#48716' '#44592#48376' URL'
      TabOrder = 2
      object btnGetAccessURL: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = #54045#48716' '#47196#44536#51064' URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 1013
      Top = 24
      Width = 161
      Height = 153
      Caption = #45812#45817#51088' '#44288#47144
      TabOrder = 3
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = #45812#45817#51088' '#52628#44032
        TabOrder = 0
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = #45812#45817#51088' '#47785#47197' '#51312#54924
        TabOrder = 1
        OnClick = btnListContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
        Width = 144
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#49688#51221
        TabOrder = 2
        OnClick = btnUpdateContactClick
      end
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#54869#51064
        TabOrder = 3
        OnClick = btnGetContactInfoClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 1182
      Top = 24
      Width = 161
      Height = 129
      Caption = #54924#49324#51221#48372' '#44288#47144
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = #54924#49324#51221#48372' '#51312#54924
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = #54924#49324#51221#48372' '#49688#51221
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox14: TGroupBox
      Left = 506
      Top = 24
      Width = 161
      Height = 153
      Caption = #50672#46041#44284#44552' '#54252#51064#53944
      TabOrder = 5
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = #51092#50668#54252#51064#53944' '#54869#51064
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = #54252#51064#53944' '#52649#51204' URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = #54252#51064#53944' '#44208#51228#45236#50669' URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 120
        Width = 144
        Height = 25
        Caption = #54252#51064#53944' '#49324#50857#45236#50669' URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
    object GroupBox15: TGroupBox
      Left = 675
      Top = 24
      Width = 161
      Height = 130
      Caption = #54028#53944#45320#44284#44552' '#54252#51064#53944
      TabOrder = 6
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = #54028#53944#45320#54252#51064#53944' '#54869#51064
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = #54252#51064#53944' '#52649#51204' URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
    end
  end
  object txtCorpNum: TEdit
    Left = 152
    Top = 16
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 0
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 384
    Top = 16
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = 'testkorea'
  end
  object GroupBox5: TGroupBox
    Left = 16
    Top = 240
    Width = 1361
    Height = 577
    Caption = #54045#48716' '#47700#49884#51669' '#44288#47144' '#44592#45733
    TabOrder = 3
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 151
      Height = 13
      Caption = #50696#50557#49884#44036'(yyyyMMddHHmmss) : '
    end
    object GroupBox10: TGroupBox
      Left = 1005
      Top = 24
      Width = 172
      Height = 161
      Caption = #48512#44032#44592#45733
      TabOrder = 6
      object btnGetSentListURL: TButton
        Left = 8
        Top = 24
        Width = 153
        Height = 25
        Caption = #51204#49569#45236#50669#51312#54924' '#54045#50629' URL'
        TabOrder = 0
        OnClick = btnGetSentListURLClick
      end
      object btnSearchMessages: TButton
        Left = 8
        Top = 88
        Width = 153
        Height = 25
        Caption = #51204#49569#45236#50669' '#47785#47197' '#51312#54924
        TabOrder = 1
        OnClick = btnSearchMessagesClick
      end
      object btnGetAutoDenyList: TButton
        Left = 8
        Top = 56
        Width = 153
        Height = 25
        Caption = '080 '#49688#49888#44144#48512#47785#47197' '#51312#54924
        TabOrder = 2
        OnClick = btnGetAutoDenyListClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 64
      Width = 417
      Height = 65
      Caption = 'SMS '#44288#47144#44592#45733
      TabOrder = 0
      object btnSendSMS_Single: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1'#44148' '#51204#49569
        TabOrder = 0
        OnClick = btnSendSMS_SingleClick
      end
      object btnSendThousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = #45824#47049' 1000'#44148' '#51204#49569
        TabOrder = 1
        OnClick = btnSendThousandClick
      end
      object btnSendThousandSame: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = #46041#48372' 1000'#44148' '#51204#49569
        TabOrder = 2
        OnClick = btnSendThousandSameClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 441
      Top = 64
      Width = 417
      Height = 65
      Caption = 'LMS '#44288#47144#44592#45733
      TabOrder = 1
      object btnSendLMS: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1'#44148' '#51204#49569
        TabOrder = 0
        OnClick = btnSendLMSClick
      end
      object btnSendLMSThousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = #45824#47049' 1000'#44148' '#51204#49569
        TabOrder = 1
        OnClick = btnSendLMSThousandClick
      end
      object btnSendLMSThousand_Same: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = #46041#48372' 1000'#44148' '#51204#49569
        TabOrder = 2
        OnClick = btnSendLMSThousand_SameClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 144
      Width = 417
      Height = 65
      Caption = 'XMS '#44288#47144#44592#45733
      TabOrder = 2
      object btnSendXMS: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1'#44148' '#51204#49569
        TabOrder = 0
        OnClick = btnSendXMSClick
      end
      object btnSendXMSThousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = #45824#47049' 1000'#44148' '#51204#49569
        TabOrder = 1
        OnClick = btnSendXMSThousandClick
      end
      object btnSendXMSThousand_Same: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = #46041#48372' 1000'#44148' '#51204#49569
        TabOrder = 2
        OnClick = btnSendXMSThousand_SameClick
      end
    end
    object StringGrid1: TStringGrid
      Left = 16
      Top = 344
      Width = 1329
      Height = 225
      ColCount = 17
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 3
      ColWidths = (
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64)
    end
    object txtReserveDT: TEdit
      Left = 184
      Top = 30
      Width = 297
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 4
    end
    object GroupBox6: TGroupBox
      Left = 441
      Top = 144
      Width = 417
      Height = 65
      Caption = 'MMS '#44288#47144#44592#45733
      TabOrder = 5
      object btnSendMMS: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1'#44148' '#51204#49569
        TabOrder = 0
        OnClick = btnSendMMSClick
      end
      object btnSendMMSThousand_Same: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = #46041#48372' 1000'#44148' '#51204#49569
        TabOrder = 1
        OnClick = btnSendMMSThousand_SameClick
      end
      object btnSendMMS_Thousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = #45824#47049' 1000'#44148' '#51204#49569
        TabOrder = 2
        OnClick = btnSendMMS_ThousandClick
      end
    end
    object GroupBox13: TGroupBox
      Left = 1182
      Top = 24
      Width = 161
      Height = 161
      Caption = #48156#49888#48264#54840' '#44288#47532' '
      TabOrder = 7
      object btnGetSenderNumberMgtURL: TButton
        Left = 8
        Top = 87
        Width = 144
        Height = 25
        Caption = #48156#49888#48264#54840' '#44288#47532' '#54045#50629
        TabOrder = 0
        OnClick = btnGetSenderNumberMgtURLClick
      end
      object btnGetSenderNumberList: TButton
        Left = 8
        Top = 55
        Width = 144
        Height = 25
        Caption = #48156#49888#48264#54840' '#47785#47197' '#54869#51064
        TabOrder = 1
        OnClick = btnGetSenderNumberListClick
      end
      object Button1: TButton
        Left = 8
        Top = 24
        Width = 145
        Height = 25
        Caption = #48156#49888#48264#54840' '#46321#47197' '#50668#48512
        TabOrder = 2
        OnClick = btnCheckSenderNumberClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 16
      Top = 224
      Width = 320
      Height = 105
      Caption = #51217#49688#48264#54840' '#44288#47144' '#44592#45733' ('#50836#52397#48264#54840' '#48120#54624#45817')'
      TabOrder = 8
      object Label1: TLabel
        Left = 13
        Top = 28
        Width = 53
        Height = 13
        Caption = #51217#49688#48264#54840' : '
      end
      object txtReceiptNum: TEdit
        Left = 80
        Top = 24
        Width = 222
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 0
      end
      object btnGetMessage: TButton
        Left = 8
        Top = 64
        Width = 144
        Height = 25
        Caption = #51204#49569#45236#50669' '#54869#51064
        TabOrder = 1
        OnClick = btnGetMessageClick
      end
      object btnCancelReserve: TButton
        Left = 157
        Top = 64
        Width = 144
        Height = 25
        Caption = #50696#50557#51204#49569' '#52712#49548
        TabOrder = 2
        OnClick = btnCancelReserveClick
      end
    end
    object GroupBox17: TGroupBox
      Left = 337
      Top = 224
      Width = 320
      Height = 105
      Caption = #50836#52397#48264#54840' '#54624#45817' '#51204#49569#44148' '#52376#47532
      TabOrder = 9
      object Label5: TLabel
        Left = 13
        Top = 28
        Width = 53
        Height = 13
        Caption = #50836#52397#48264#54840' : '
      end
      object txtRequestNum: TEdit
        Left = 80
        Top = 24
        Width = 222
        Height = 21
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 0
      end
      object btnGetMessageRN: TButton
        Left = 8
        Top = 64
        Width = 144
        Height = 25
        Caption = #51204#49569#45236#50669' '#54869#51064
        TabOrder = 1
        OnClick = btnGetMessageRNClick
      end
      object btnCancelReserveRN: TButton
        Left = 157
        Top = 64
        Width = 144
        Height = 25
        Caption = #50696#50557#51204#49569' '#52712#49548
        TabOrder = 2
        OnClick = btnCancelReserveRNClick
      end
    end
    object GroupBox18: TGroupBox
      Left = 1017
      Top = 224
      Width = 320
      Height = 105
      Caption = #50836#52397#48264#54840' '#54624#45817' '#51204#49569#44148' '#52376#47532' ('#49688#49888#48264#54840')'
      TabOrder = 10
      object Label7: TLabel
        Left = 13
        Top = 20
        Width = 53
        Height = 13
        Caption = #50836#52397#48264#54840' : '
      end
      object Label9: TLabel
        Left = 13
        Top = 44
        Width = 53
        Height = 13
        Caption = #49688#49888#48264#54840' : '
      end
      object txtRequestNumbyRCV: TEdit
        Left = 80
        Top = 16
        Width = 222
        Height = 21
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 0
      end
      object btnCancelReserveRNbyRCV: TButton
        Left = 165
        Top = 64
        Width = 144
        Height = 25
        Caption = #50696#50557#51204#49569' '#52712#49548
        TabOrder = 1
        OnClick = btnCancelReserveRNbyRCVClick
      end
      object txtReceiveNumRNbyRCV: TEdit
        Left = 80
        Top = 40
        Width = 222
        Height = 21
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 2
      end
    end
    object GroupBox19: TGroupBox
      Left = 688
      Top = 224
      Width = 320
      Height = 105
      Caption = #51217#49688#48264#54840' '#44288#47144' '#44592#45733' ('#50836#52397#48264#54840' '#48120#54624#45817', '#49688#49888#48264#54840')'
      TabOrder = 11
      object Label8: TLabel
        Left = 13
        Top = 20
        Width = 53
        Height = 13
        Caption = #51217#49688#48264#54840' : '
      end
      object Label10: TLabel
        Left = 13
        Top = 44
        Width = 53
        Height = 13
        Caption = #49688#49888#48264#54840' : '
      end
      object txtReceiptNumbyRCV: TEdit
        Left = 80
        Top = 16
        Width = 222
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 0
      end
      object btnCancelReservebyRCV: TButton
        Left = 157
        Top = 64
        Width = 144
        Height = 25
        Caption = #50696#50557#51204#49569' '#52712#49548
        TabOrder = 1
        OnClick = btnCancelReservebyRCVClick
      end
      object txtRecieveNumbyRCV: TEdit
        Left = 80
        Top = 40
        Width = 222
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 2
      end
    end
  end
  object txtURL: TEdit
    Left = 1000
    Top = 16
    Width = 377
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 528
    Top = 8
  end
end
