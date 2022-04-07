object frmExample: TfrmExample
  Left = 336
  Top = 142
  Width = 1403
  Height = 868
  Caption = '팝빌 문자 API SDK Delphi Example'
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
    Width = 120
    Height = 13
    Caption = '팝빌회원 사업자번호 : '
  end
  object Label4: TLabel
    Left = 312
    Top = 20
    Width = 69
    Height = 13
    Caption = '팝빌아이디 : '
  end
  object GroupBox8: TGroupBox
    Left = 16
    Top = 48
    Width = 1361
    Height = 193
    Caption = '팝빌 기본 API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 161
      Height = 129
      Caption = '회원 정보'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = '연동회원 신규가입'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = '아이디 중복 확인'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '가입여부 확인'
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 185
      Top = 24
      Width = 312
      Height = 129
      Caption = '포인트 관련'
      TabOrder = 1
      object btnGetUnitCost_SMS: TButton
        Left = 160
        Top = 24
        Width = 144
        Height = 25
        Caption = 'SMS 전송단가 확인'
        TabOrder = 0
        OnClick = btnGetUnitCost_SMSClick
      end
      object btnGetUnitCost_LMS: TButton
        Left = 160
        Top = 56
        Width = 144
        Height = 25
        Caption = 'LMS 전송단가 확인'
        TabOrder = 1
        OnClick = btnGetUnitCost_LMSClick
      end
      object btnGetUnitCost_MMS: TButton
        Left = 160
        Top = 88
        Width = 144
        Height = 25
        Caption = 'MMS 전송단가 확인'
        TabOrder = 2
        OnClick = btnGetUnitCost_MMSClick
      end
      object btnGetChargeInfo_SMS: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = 'SMS 과금정보 확인'
        TabOrder = 3
        OnClick = btnGetChargeInfo_SMSClick
      end
      object btnGetChargeInfo_LMS: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = 'LMS 과금정보 확인'
        TabOrder = 4
        OnClick = btnGetChargeInfo_LMSClick
      end
      object btnGetChargeInfo_MMS: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = 'MMS 과금정보 확인'
        TabOrder = 5
        OnClick = btnGetChargeInfo_MMSClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 844
      Top = 24
      Width = 161
      Height = 129
      Caption = '팝빌 기본 URL'
      TabOrder = 2
      object btnGetAccessURL: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '팝빌 로그인 URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 1013
      Top = 24
      Width = 161
      Height = 153
      Caption = '담당자 관련'
      TabOrder = 3
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '담당자 추가'
        TabOrder = 0
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = '담당자 목록 조회'
        TabOrder = 1
        OnClick = btnListContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
        Width = 144
        Height = 25
        Caption = '담당자 정보 수정'
        TabOrder = 2
        OnClick = btnUpdateContactClick
      end
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = '담당자 정보 확인'
        TabOrder = 3
        OnClick = btnGetContactInfoClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 1182
      Top = 24
      Width = 161
      Height = 129
      Caption = '회사정보 관련'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '회사정보 조회'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = '회사정보 수정'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox14: TGroupBox
      Left = 506
      Top = 24
      Width = 161
      Height = 153
      Caption = '연동과금 포인트'
      TabOrder = 5
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '잔여포인트 확인'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = '포인트 충전 URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = '포인트 결제내역 URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 120
        Width = 144
        Height = 25
        Caption = '포인트 사용내역 URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
    object GroupBox15: TGroupBox
      Left = 675
      Top = 24
      Width = 161
      Height = 130
      Caption = '파트너과금 포인트'
      TabOrder = 6
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '파트너포인트 확인'
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = '포인트 충전 URL'
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
    Caption = '팝빌 메시징 관련 기능'
    TabOrder = 3
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 155
      Height = 13
      Caption = '예약시간(yyyyMMddHHmmss) : '
    end
    object GroupBox10: TGroupBox
      Left = 1005
      Top = 24
      Width = 172
      Height = 161
      Caption = '부가기능'
      TabOrder = 6
      object btnGetSentListURL: TButton
        Left = 8
        Top = 24
        Width = 153
        Height = 25
        Caption = '전송내역조회 팝업 URL'
        TabOrder = 0
        OnClick = btnGetSentListURLClick
      end
      object btnSearchMessages: TButton
        Left = 8
        Top = 88
        Width = 153
        Height = 25
        Caption = '전송내역 목록 조회'
        TabOrder = 1
        OnClick = btnSearchMessagesClick
      end
      object btnGetAutoDenyList: TButton
        Left = 8
        Top = 56
        Width = 153
        Height = 25
        Caption = '080 수신거부목록 조회'
        TabOrder = 2
        OnClick = btnGetAutoDenyListClick
      end
      object btnGetStates: TButton
        Left = 8
        Top = 120
        Width = 153
        Height = 25
        Caption = '전송내역 요약정보 확인'
        TabOrder = 3
        OnClick = btnGetStatesClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 64
      Width = 417
      Height = 65
      Caption = 'SMS 관련기능'
      TabOrder = 0
      object btnSendSMS_Single: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendSMS_SingleClick
      end
      object btnSendThousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = '대량 1000건 전송'
        TabOrder = 1
        OnClick = btnSendThousandClick
      end
      object btnSendThousandSame: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = '동보 1000건 전송'
        TabOrder = 2
        OnClick = btnSendThousandSameClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 441
      Top = 64
      Width = 417
      Height = 65
      Caption = 'LMS 관련기능'
      TabOrder = 1
      object btnSendLMS: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendLMSClick
      end
      object btnSendLMSThousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = '대량 1000건 전송'
        TabOrder = 1
        OnClick = btnSendLMSThousandClick
      end
      object btnSendLMSThousand_Same: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = '동보 1000건 전송'
        TabOrder = 2
        OnClick = btnSendLMSThousand_SameClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 144
      Width = 417
      Height = 65
      Caption = 'XMS 관련기능'
      TabOrder = 2
      object btnSendXMS: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendXMSClick
      end
      object btnSendXMSThousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = '대량 1000건 전송'
        TabOrder = 1
        OnClick = btnSendXMSThousandClick
      end
      object btnSendXMSThousand_Same: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = '동보 1000건 전송'
        TabOrder = 2
        OnClick = btnSendXMSThousand_SameClick
      end
    end
    object StringGrid1: TStringGrid
      Left = 16
      Top = 344
      Width = 1329
      Height = 225
      ColCount = 16
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
      Caption = 'MMS 관련기능'
      TabOrder = 5
      object btnSendMMS: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendMMSClick
      end
      object btnSendMMSThousand_Same: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = '동보 1000건 전송'
        TabOrder = 1
        OnClick = btnSendMMSThousand_SameClick
      end
      object btnSendMMS_Thousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = '대량 1000건 전송'
        TabOrder = 2
        OnClick = btnSendMMS_ThousandClick
      end
    end
    object GroupBox13: TGroupBox
      Left = 1182
      Top = 24
      Width = 161
      Height = 161
      Caption = '발신번호 관리 '
      TabOrder = 7
      object btnGetSenderNumberMgtURL: TButton
        Left = 8
        Top = 87
        Width = 144
        Height = 25
        Caption = '발신번호 관리 팝업'
        TabOrder = 0
        OnClick = btnGetSenderNumberMgtURLClick
      end
      object btnGetSenderNumberList: TButton
        Left = 8
        Top = 55
        Width = 144
        Height = 25
        Caption = '발신번호 목록 확인'
        TabOrder = 1
        OnClick = btnGetSenderNumberListClick
      end
      object Button1: TButton
        Left = 8
        Top = 24
        Width = 145
        Height = 25
        Caption = '발신번호 등록 여부'
        TabOrder = 2
        OnClick = btnCheckSenderNumberClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 16
      Top = 224
      Width = 417
      Height = 105
      Caption = '접수번호 관련 기능 (요청번호 미할당)'
      TabOrder = 8
      object Label1: TLabel
        Left = 13
        Top = 28
        Width = 57
        Height = 13
        Caption = '접수번호 : '
      end
      object txtReceiptNum: TEdit
        Left = 80
        Top = 24
        Width = 297
        Height = 21
        ImeName = 'Microsoft IME 2010'
        TabOrder = 0
      end
      object btnGetMessage: TButton
        Left = 80
        Top = 64
        Width = 144
        Height = 25
        Caption = '전송내역 확인'
        TabOrder = 1
        OnClick = btnGetMessageClick
      end
      object btnCancelReserve: TButton
        Left = 237
        Top = 64
        Width = 144
        Height = 25
        Caption = '예약전송 취소'
        TabOrder = 2
        OnClick = btnCancelReserveClick
      end
    end
    object GroupBox17: TGroupBox
      Left = 441
      Top = 224
      Width = 417
      Height = 105
      Caption = '요청번호 할당 전송건 처리'
      TabOrder = 9
      object Label5: TLabel
        Left = 13
        Top = 28
        Width = 57
        Height = 13
        Caption = '요청번호 : '
      end
      object txtRequestNum: TEdit
        Left = 80
        Top = 24
        Width = 297
        Height = 21
        ImeName = '한국어 입력 시스템 (IME 2000)'
        TabOrder = 0
      end
      object btnGetMessageRN: TButton
        Left = 80
        Top = 64
        Width = 144
        Height = 25
        Caption = '전송내역 확인'
        TabOrder = 1
        OnClick = btnGetMessageRNClick
      end
      object btnCancelReserveRN: TButton
        Left = 237
        Top = 64
        Width = 144
        Height = 25
        Caption = '예약전송 취소'
        TabOrder = 2
        OnClick = btnCancelReserveRNClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 528
    Top = 8
  end
end
