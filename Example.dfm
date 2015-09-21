object frmExample: TfrmExample
  Left = 586
  Top = 84
  Width = 954
  Height = 839
  Caption = '팝빌 메시징 SDK Examples'
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
    Left = 16
    Top = 12
    Width = 69
    Height = 13
    Caption = '사업자번호 : '
  end
  object Label4: TLabel
    Left = 232
    Top = 12
    Width = 69
    Height = 13
    Caption = '팝빌아이디 : '
  end
  object GroupBox8: TGroupBox
    Left = 16
    Top = 40
    Width = 905
    Height = 169
    Caption = '팝빌 기본 API'
    TabOrder = 0
    object GroupBox9: TGroupBox
      Left = 8
      Top = 24
      Width = 137
      Height = 129
      Caption = '회원 정보'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = '회원 가입'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 120
        Height = 25
        Caption = 'ID 중복 확인'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = '가입여부 확인'
        TabOrder = 2
      end
    end
    object GroupBox11: TGroupBox
      Left = 152
      Top = 24
      Width = 289
      Height = 129
      Caption = '포인트 관련'
      TabOrder = 1
      object btnGetUnitCost_SMS: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = 'SMS 단가 확인'
        TabOrder = 0
        OnClick = btnGetUnitCost_SMSClick
      end
      object btnGetUnitCost_LMS: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = 'LMS 단가 확인'
        TabOrder = 1
        OnClick = btnGetUnitCost_LMSClick
      end
      object btnGetUnitCost_MMS: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = 'MMS 단가 확인'
        TabOrder = 2
        OnClick = btnGetUnitCost_MMSClick
      end
      object btnGetBalance: TButton
        Left = 152
        Top = 24
        Width = 129
        Height = 25
        Caption = '잔여포인트 확인'
        TabOrder = 3
        OnClick = btnGetBalanceClick
      end
      object btnGetPartnerBalance: TButton
        Left = 152
        Top = 56
        Width = 129
        Height = 25
        Caption = '파트너포인트 확인'
        TabOrder = 4
        OnClick = btnGetPartnerBalanceClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 448
      Top = 24
      Width = 137
      Height = 129
      Caption = '팝빌 기본 URL'
      TabOrder = 2
      object btnGetPopBillURL_LOGIN: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '팝빌 로그인 URL'
        TabOrder = 0
        OnClick = btnGetPopBillURL_LOGINClick
      end
      object Button1: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '포인트 충전 URL'
        TabOrder = 1
        OnClick = btnGetPopBillURL_LOGINClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 592
      Top = 24
      Width = 145
      Height = 129
      Caption = '담당자 관련'
      TabOrder = 3
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '담당자 추가'
        TabOrder = 0
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = '담당자 목록 조회'
        TabOrder = 1
        OnClick = btnListContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 128
        Height = 25
        Caption = '담당자 정보 수정'
        TabOrder = 2
        OnClick = btnUpdateContactClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 744
      Top = 24
      Width = 145
      Height = 129
      Caption = '회사정보 관련'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '회사정보 조회'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = '회사정보 수정'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
  end
  object txtCorpNum: TEdit
    Left = 88
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 1
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 304
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = 'testkorea'
  end
  object GroupBox5: TGroupBox
    Left = 16
    Top = 216
    Width = 905
    Height = 561
    Caption = '팝빌 메시징 관련 기능'
    TabOrder = 3
    object Label1: TLabel
      Left = 69
      Top = 230
      Width = 60
      Height = 13
      Caption = '접수 번호 : '
    end
    object Label2: TLabel
      Left = 80
      Top = 24
      Width = 155
      Height = 13
      Caption = '예약시간(yyyyMMddHHmmss) : '
    end
    object GroupBox1: TGroupBox
      Left = 64
      Top = 56
      Width = 377
      Height = 73
      Caption = 'SMS 관련기능'
      TabOrder = 0
      object btnSendSMS_Single: TButton
        Left = 16
        Top = 24
        Width = 81
        Height = 33
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendSMS_SingleClick
      end
      object btnSendThousand: TButton
        Left = 232
        Top = 24
        Width = 129
        Height = 33
        Caption = '개별 1000건 전송'
        TabOrder = 1
        OnClick = btnSendThousandClick
      end
      object btnSendThousandSame: TButton
        Left = 104
        Top = 24
        Width = 121
        Height = 33
        Caption = '동보 1000건 전송'
        TabOrder = 2
        OnClick = btnSendThousandSameClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 456
      Top = 56
      Width = 377
      Height = 73
      Caption = 'LMS 관련기능'
      TabOrder = 1
      object btnSendLMS: TButton
        Left = 16
        Top = 24
        Width = 81
        Height = 33
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendLMSClick
      end
      object btnSendLMSThousand: TButton
        Left = 232
        Top = 24
        Width = 129
        Height = 33
        Caption = '개별 1000건 전송'
        TabOrder = 1
        OnClick = btnSendLMSThousandClick
      end
      object btnSendLMSThousand_Same: TButton
        Left = 104
        Top = 24
        Width = 121
        Height = 33
        Caption = '동보 1000건 전송'
        TabOrder = 2
        OnClick = btnSendLMSThousand_SameClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 64
      Top = 136
      Width = 377
      Height = 73
      Caption = 'XMS 관련기능'
      TabOrder = 2
      object btnSendXMS: TButton
        Left = 16
        Top = 24
        Width = 81
        Height = 33
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendXMSClick
      end
      object btnSendXMSThousand: TButton
        Left = 232
        Top = 24
        Width = 129
        Height = 33
        Caption = '개별 1000건 전송'
        TabOrder = 1
        OnClick = btnSendXMSThousandClick
      end
      object btnSendXMSThousand_Same: TButton
        Left = 104
        Top = 24
        Width = 121
        Height = 33
        Caption = '동보 1000건 전송'
        TabOrder = 2
        OnClick = btnSendXMSThousand_SameClick
      end
    end
    object txtReceiptNum: TEdit
      Left = 133
      Top = 226
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 3
    end
    object btnGetMessage: TButton
      Left = 381
      Top = 224
      Width = 97
      Height = 25
      Caption = '전송상태확인'
      TabOrder = 4
      OnClick = btnGetMessageClick
    end
    object StringGrid1: TStringGrid
      Left = 64
      Top = 264
      Width = 761
      Height = 257
      ColCount = 11
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 5
    end
    object btnCancelReserve: TButton
      Left = 493
      Top = 224
      Width = 97
      Height = 25
      Caption = '예약전송취소'
      TabOrder = 6
      OnClick = btnCancelReserveClick
    end
    object txtReserveDT: TEdit
      Left = 240
      Top = 22
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 7
    end
    object btnSMSPopUp: TButton
      Left = 672
      Top = 16
      Width = 137
      Height = 33
      Caption = '전송내역조회 팝업'
      TabOrder = 8
      OnClick = btnSMSPopUpClick
    end
    object GroupBox6: TGroupBox
      Left = 456
      Top = 136
      Width = 377
      Height = 73
      Caption = 'MMS 관련기능'
      TabOrder = 9
      object btnSendMMS: TButton
        Left = 16
        Top = 21
        Width = 82
        Height = 34
        Caption = '1건 전송'
        TabOrder = 0
        OnClick = btnSendMMSClick
      end
      object btnSendMMSThousand_Same: TButton
        Left = 105
        Top = 19
        Width = 121
        Height = 35
        Caption = '동보 1000건 전송'
        TabOrder = 1
        OnClick = btnSendMMSThousand_SameClick
      end
      object btnSendMMS_Thousand: TButton
        Left = 233
        Top = 19
        Width = 121
        Height = 35
        Caption = '개별 1000건 전송'
        TabOrder = 2
        OnClick = btnSendMMSThousand_SameClick
      end
    end
    object btnSearchMessages: TButton
      Left = 694
      Top = 224
      Width = 131
      Height = 25
      Caption = '전송내역 상세검색'
      TabOrder = 10
      OnClick = btnSearchMessagesClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 664
    Top = 8
  end
end
