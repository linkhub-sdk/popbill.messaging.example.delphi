object frmExample: TfrmExample
  Left = 336
  Top = 142
  Width = 1403
  Height = 868
  Caption = '�˺� ���� API SDK Delphi Example'
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
    Caption = '�˺�ȸ�� ����ڹ�ȣ : '
  end
  object Label4: TLabel
    Left = 312
    Top = 20
    Width = 69
    Height = 13
    Caption = '�˺����̵� : '
  end
  object GroupBox8: TGroupBox
    Left = 16
    Top = 48
    Width = 1361
    Height = 193
    Caption = '�˺� �⺻ API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 161
      Height = 129
      Caption = 'ȸ�� ����'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = '����ȸ�� �ű԰���'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = '���̵� �ߺ� Ȯ��'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '���Կ��� Ȯ��'
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 185
      Top = 24
      Width = 312
      Height = 129
      Caption = '����Ʈ ����'
      TabOrder = 1
      object btnGetUnitCost_SMS: TButton
        Left = 160
        Top = 24
        Width = 144
        Height = 25
        Caption = 'SMS ���۴ܰ� Ȯ��'
        TabOrder = 0
        OnClick = btnGetUnitCost_SMSClick
      end
      object btnGetUnitCost_LMS: TButton
        Left = 160
        Top = 56
        Width = 144
        Height = 25
        Caption = 'LMS ���۴ܰ� Ȯ��'
        TabOrder = 1
        OnClick = btnGetUnitCost_LMSClick
      end
      object btnGetUnitCost_MMS: TButton
        Left = 160
        Top = 88
        Width = 144
        Height = 25
        Caption = 'MMS ���۴ܰ� Ȯ��'
        TabOrder = 2
        OnClick = btnGetUnitCost_MMSClick
      end
      object btnGetChargeInfo_SMS: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = 'SMS �������� Ȯ��'
        TabOrder = 3
        OnClick = btnGetChargeInfo_SMSClick
      end
      object btnGetChargeInfo_LMS: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = 'LMS �������� Ȯ��'
        TabOrder = 4
        OnClick = btnGetChargeInfo_LMSClick
      end
      object btnGetChargeInfo_MMS: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = 'MMS �������� Ȯ��'
        TabOrder = 5
        OnClick = btnGetChargeInfo_MMSClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 844
      Top = 24
      Width = 161
      Height = 129
      Caption = '�˺� �⺻ URL'
      TabOrder = 2
      object btnGetAccessURL: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '�˺� �α��� URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 1013
      Top = 24
      Width = 161
      Height = 153
      Caption = '����� ����'
      TabOrder = 3
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '����� �߰�'
        TabOrder = 0
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = '����� ��� ��ȸ'
        TabOrder = 1
        OnClick = btnListContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
        Width = 144
        Height = 25
        Caption = '����� ���� ����'
        TabOrder = 2
        OnClick = btnUpdateContactClick
      end
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = '����� ���� Ȯ��'
        TabOrder = 3
        OnClick = btnGetContactInfoClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 1182
      Top = 24
      Width = 161
      Height = 129
      Caption = 'ȸ������ ����'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = 'ȸ������ ��ȸ'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = 'ȸ������ ����'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox14: TGroupBox
      Left = 506
      Top = 24
      Width = 161
      Height = 153
      Caption = '�������� ����Ʈ'
      TabOrder = 5
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '�ܿ�����Ʈ Ȯ��'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = '����Ʈ ���� URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 88
        Width = 144
        Height = 25
        Caption = '����Ʈ �������� URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 120
        Width = 144
        Height = 25
        Caption = '����Ʈ ��볻�� URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
    object GroupBox15: TGroupBox
      Left = 675
      Top = 24
      Width = 161
      Height = 130
      Caption = '��Ʈ�ʰ��� ����Ʈ'
      TabOrder = 6
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 144
        Height = 25
        Caption = '��Ʈ������Ʈ Ȯ��'
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 144
        Height = 25
        Caption = '����Ʈ ���� URL'
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
    Caption = '�˺� �޽�¡ ���� ���'
    TabOrder = 3
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 155
      Height = 13
      Caption = '����ð�(yyyyMMddHHmmss) : '
    end
    object GroupBox10: TGroupBox
      Left = 1005
      Top = 24
      Width = 172
      Height = 161
      Caption = '�ΰ����'
      TabOrder = 6
      object btnGetSentListURL: TButton
        Left = 8
        Top = 24
        Width = 153
        Height = 25
        Caption = '���۳�����ȸ �˾� URL'
        TabOrder = 0
        OnClick = btnGetSentListURLClick
      end
      object btnSearchMessages: TButton
        Left = 8
        Top = 88
        Width = 153
        Height = 25
        Caption = '���۳��� ��� ��ȸ'
        TabOrder = 1
        OnClick = btnSearchMessagesClick
      end
      object btnGetAutoDenyList: TButton
        Left = 8
        Top = 56
        Width = 153
        Height = 25
        Caption = '080 ���Űźθ�� ��ȸ'
        TabOrder = 2
        OnClick = btnGetAutoDenyListClick
      end
      object btnGetStates: TButton
        Left = 8
        Top = 120
        Width = 153
        Height = 25
        Caption = '���۳��� ������� Ȯ��'
        TabOrder = 3
        OnClick = btnGetStatesClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 64
      Width = 417
      Height = 65
      Caption = 'SMS ���ñ��'
      TabOrder = 0
      object btnSendSMS_Single: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendSMS_SingleClick
      end
      object btnSendThousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = '�뷮 1000�� ����'
        TabOrder = 1
        OnClick = btnSendThousandClick
      end
      object btnSendThousandSame: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = '���� 1000�� ����'
        TabOrder = 2
        OnClick = btnSendThousandSameClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 441
      Top = 64
      Width = 417
      Height = 65
      Caption = 'LMS ���ñ��'
      TabOrder = 1
      object btnSendLMS: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendLMSClick
      end
      object btnSendLMSThousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = '�뷮 1000�� ����'
        TabOrder = 1
        OnClick = btnSendLMSThousandClick
      end
      object btnSendLMSThousand_Same: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = '���� 1000�� ����'
        TabOrder = 2
        OnClick = btnSendLMSThousand_SameClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 144
      Width = 417
      Height = 65
      Caption = 'XMS ���ñ��'
      TabOrder = 2
      object btnSendXMS: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendXMSClick
      end
      object btnSendXMSThousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = '�뷮 1000�� ����'
        TabOrder = 1
        OnClick = btnSendXMSThousandClick
      end
      object btnSendXMSThousand_Same: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = '���� 1000�� ����'
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
      Caption = 'MMS ���ñ��'
      TabOrder = 5
      object btnSendMMS: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendMMSClick
      end
      object btnSendMMSThousand_Same: TButton
        Left = 144
        Top = 24
        Width = 128
        Height = 25
        Caption = '���� 1000�� ����'
        TabOrder = 1
        OnClick = btnSendMMSThousand_SameClick
      end
      object btnSendMMS_Thousand: TButton
        Left = 280
        Top = 24
        Width = 128
        Height = 25
        Caption = '�뷮 1000�� ����'
        TabOrder = 2
        OnClick = btnSendMMS_ThousandClick
      end
    end
    object GroupBox13: TGroupBox
      Left = 1182
      Top = 24
      Width = 161
      Height = 161
      Caption = '�߽Ź�ȣ ���� '
      TabOrder = 7
      object btnGetSenderNumberMgtURL: TButton
        Left = 8
        Top = 87
        Width = 144
        Height = 25
        Caption = '�߽Ź�ȣ ���� �˾�'
        TabOrder = 0
        OnClick = btnGetSenderNumberMgtURLClick
      end
      object btnGetSenderNumberList: TButton
        Left = 8
        Top = 55
        Width = 144
        Height = 25
        Caption = '�߽Ź�ȣ ��� Ȯ��'
        TabOrder = 1
        OnClick = btnGetSenderNumberListClick
      end
      object Button1: TButton
        Left = 8
        Top = 24
        Width = 145
        Height = 25
        Caption = '�߽Ź�ȣ ��� ����'
        TabOrder = 2
        OnClick = btnCheckSenderNumberClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 16
      Top = 224
      Width = 417
      Height = 105
      Caption = '������ȣ ���� ��� (��û��ȣ ���Ҵ�)'
      TabOrder = 8
      object Label1: TLabel
        Left = 13
        Top = 28
        Width = 57
        Height = 13
        Caption = '������ȣ : '
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
        Caption = '���۳��� Ȯ��'
        TabOrder = 1
        OnClick = btnGetMessageClick
      end
      object btnCancelReserve: TButton
        Left = 237
        Top = 64
        Width = 144
        Height = 25
        Caption = '�������� ���'
        TabOrder = 2
        OnClick = btnCancelReserveClick
      end
    end
    object GroupBox17: TGroupBox
      Left = 441
      Top = 224
      Width = 417
      Height = 105
      Caption = '��û��ȣ �Ҵ� ���۰� ó��'
      TabOrder = 9
      object Label5: TLabel
        Left = 13
        Top = 28
        Width = 57
        Height = 13
        Caption = '��û��ȣ : '
      end
      object txtRequestNum: TEdit
        Left = 80
        Top = 24
        Width = 297
        Height = 21
        ImeName = '�ѱ��� �Է� �ý��� (IME 2000)'
        TabOrder = 0
      end
      object btnGetMessageRN: TButton
        Left = 80
        Top = 64
        Width = 144
        Height = 25
        Caption = '���۳��� Ȯ��'
        TabOrder = 1
        OnClick = btnGetMessageRNClick
      end
      object btnCancelReserveRN: TButton
        Left = 237
        Top = 64
        Width = 144
        Height = 25
        Caption = '�������� ���'
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
