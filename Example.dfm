object frmExample: TfrmExample
  Left = 318
  Top = 122
  Width = 1309
  Height = 851
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
    Left = 16
    Top = 20
    Width = 120
    Height = 13
    Caption = '�˺�ȸ�� ����ڹ�ȣ : '
  end
  object Label4: TLabel
    Left = 288
    Top = 20
    Width = 69
    Height = 13
    Caption = '�˺����̵� : '
  end
  object GroupBox8: TGroupBox
    Left = 16
    Top = 48
    Width = 1257
    Height = 169
    Caption = '�˺� �⺻ API'
    TabOrder = 0
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 137
      Height = 129
      Caption = 'ȸ�� ����'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = 'ȸ�� ����'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 120
        Height = 25
        Caption = 'ID �ߺ� Ȯ��'
        TabOrder = 1
        OnClick = btnCheckIDClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = '���Կ��� Ȯ��'
        TabOrder = 2
        OnClick = btnCheckIsMemberClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 168
      Top = 24
      Width = 297
      Height = 129
      Caption = '����Ʈ ����'
      TabOrder = 1
      object btnGetUnitCost_SMS: TButton
        Left = 152
        Top = 24
        Width = 129
        Height = 25
        Caption = 'SMS �ܰ� Ȯ��'
        TabOrder = 0
        OnClick = btnGetUnitCost_SMSClick
      end
      object btnGetUnitCost_LMS: TButton
        Left = 152
        Top = 56
        Width = 129
        Height = 25
        Caption = 'LMS �ܰ� Ȯ��'
        TabOrder = 1
        OnClick = btnGetUnitCost_LMSClick
      end
      object btnGetUnitCost_MMS: TButton
        Left = 152
        Top = 88
        Width = 129
        Height = 25
        Caption = 'MMS �ܰ� Ȯ��'
        TabOrder = 2
        OnClick = btnGetUnitCost_MMSClick
      end
      object btnGetChargeInfo_SMS: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = 'SMS �������� Ȯ��'
        TabOrder = 3
        OnClick = btnGetChargeInfo_SMSClick
      end
      object btnGetChargeInfo_LMS: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = 'LMS �������� Ȯ��'
        TabOrder = 4
        OnClick = btnGetChargeInfo_LMSClick
      end
      object btnGetChargeInfo_MMS: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = 'MMS �������� Ȯ��'
        TabOrder = 5
        OnClick = btnGetChargeInfo_MMSClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 784
      Top = 24
      Width = 137
      Height = 129
      Caption = '�˺� �⺻ URL'
      TabOrder = 2
      object btnGetPopBillURL_LOGIN: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '�˺� �α��� URL'
        TabOrder = 0
        OnClick = btnGetPopBillURL_LOGINClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 936
      Top = 24
      Width = 145
      Height = 129
      Caption = '����� ����'
      TabOrder = 3
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = '����� �߰�'
        TabOrder = 0
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = '����� ��� ��ȸ'
        TabOrder = 1
        OnClick = btnListContactClick
      end
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 128
        Height = 25
        Caption = '����� ���� ����'
        TabOrder = 2
        OnClick = btnUpdateContactClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 1096
      Top = 24
      Width = 145
      Height = 129
      Caption = 'ȸ������ ����'
      TabOrder = 4
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = 'ȸ������ ��ȸ'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = 'ȸ������ ����'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
  end
  object txtCorpNum: TEdit
    Left = 144
    Top = 16
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 1
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 360
    Top = 16
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = 'testkorea'
  end
  object GroupBox5: TGroupBox
    Left = 16
    Top = 224
    Width = 1105
    Height = 561
    Caption = '�˺� �޽�¡ ���� ���'
    TabOrder = 3
    object Label1: TLabel
      Left = 37
      Top = 230
      Width = 60
      Height = 13
      Caption = '���� ��ȣ : '
    end
    object Label2: TLabel
      Left = 32
      Top = 24
      Width = 155
      Height = 13
      Caption = '����ð�(yyyyMMddHHmmss) : '
    end
    object GroupBox10: TGroupBox
      Left = 728
      Top = 56
      Width = 172
      Height = 153
      Caption = '�ΰ����'
      TabOrder = 12
    end
    object GroupBox1: TGroupBox
      Left = 32
      Top = 56
      Width = 329
      Height = 73
      Caption = 'SMS ���ñ��'
      TabOrder = 0
      object btnSendSMS_Single: TButton
        Left = 8
        Top = 24
        Width = 73
        Height = 33
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendSMS_SingleClick
      end
      object btnSendThousand: TButton
        Left = 200
        Top = 24
        Width = 113
        Height = 33
        Caption = '���� 1000�� ����'
        TabOrder = 1
        OnClick = btnSendThousandClick
      end
      object btnSendThousandSame: TButton
        Left = 88
        Top = 24
        Width = 105
        Height = 33
        Caption = '�뷮 1000�� ����'
        TabOrder = 2
        OnClick = btnSendThousandSameClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 376
      Top = 56
      Width = 337
      Height = 73
      Caption = 'LMS ���ñ��'
      TabOrder = 1
      object btnSendLMS: TButton
        Left = 8
        Top = 24
        Width = 73
        Height = 33
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendLMSClick
      end
      object btnSendLMSThousand: TButton
        Left = 208
        Top = 24
        Width = 113
        Height = 33
        Caption = '���� 1000�� ����'
        TabOrder = 1
        OnClick = btnSendLMSThousandClick
      end
      object btnSendLMSThousand_Same: TButton
        Left = 88
        Top = 24
        Width = 113
        Height = 33
        Caption = '�뷮 1000�� ����'
        TabOrder = 2
        OnClick = btnSendLMSThousand_SameClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 32
      Top = 136
      Width = 329
      Height = 73
      Caption = 'XMS ���ñ��'
      TabOrder = 2
      object btnSendXMS: TButton
        Left = 8
        Top = 24
        Width = 73
        Height = 33
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendXMSClick
      end
      object btnSendXMSThousand: TButton
        Left = 200
        Top = 24
        Width = 113
        Height = 33
        Caption = '���� 1000�� ����'
        TabOrder = 1
        OnClick = btnSendXMSThousandClick
      end
      object btnSendXMSThousand_Same: TButton
        Left = 88
        Top = 24
        Width = 105
        Height = 33
        Caption = '�뷮 1000�� ����'
        TabOrder = 2
        OnClick = btnSendXMSThousand_SameClick
      end
    end
    object txtReceiptNum: TEdit
      Left = 101
      Top = 226
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 3
    end
    object btnGetMessage: TButton
      Left = 349
      Top = 216
      Width = 100
      Height = 33
      Caption = '���ۻ���Ȯ��'
      TabOrder = 4
      OnClick = btnGetMessageClick
    end
    object StringGrid1: TStringGrid
      Left = 32
      Top = 256
      Width = 1049
      Height = 289
      ColCount = 14
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 5
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
        64)
    end
    object btnCancelReserve: TButton
      Left = 461
      Top = 216
      Width = 100
      Height = 33
      Caption = '�����������'
      TabOrder = 6
      OnClick = btnCancelReserveClick
    end
    object txtReserveDT: TEdit
      Left = 192
      Top = 22
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 7
    end
    object btnSMSPopUp: TButton
      Left = 744
      Top = 80
      Width = 140
      Height = 33
      Caption = '���۳�����ȸ �˾�'
      TabOrder = 8
      OnClick = btnSMSPopUpClick
    end
    object GroupBox6: TGroupBox
      Left = 376
      Top = 136
      Width = 337
      Height = 73
      Caption = 'MMS ���ñ��'
      TabOrder = 9
      object btnSendMMS: TButton
        Left = 8
        Top = 21
        Width = 73
        Height = 34
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendMMSClick
      end
      object btnSendMMSThousand_Same: TButton
        Left = 89
        Top = 19
        Width = 112
        Height = 35
        Caption = '�뷮 1000�� ����'
        TabOrder = 1
        OnClick = btnSendMMSThousand_SameClick
      end
      object btnSendMMS_Thousand: TButton
        Left = 209
        Top = 19
        Width = 112
        Height = 35
        Caption = '���� 1000�� ����'
        TabOrder = 2
        OnClick = btnSendMMSThousand_SameClick
      end
    end
    object btnSearchMessages: TButton
      Left = 744
      Top = 120
      Width = 140
      Height = 33
      Caption = '���۳��� �����ȸ'
      TabOrder = 10
      OnClick = btnSearchMessagesClick
    end
    object btnGetAutoDenyList: TButton
      Left = 744
      Top = 160
      Width = 140
      Height = 33
      Caption = '080���Űźθ�� ��ȸ'
      TabOrder = 11
      OnClick = btnGetAutoDenyListClick
    end
    object GroupBox13: TGroupBox
      Left = 912
      Top = 56
      Width = 156
      Height = 113
      Caption = '�߽Ź�ȣ ���� '
      TabOrder = 13
      object btnGetURL_SENDER: TButton
        Left = 8
        Top = 64
        Width = 137
        Height = 33
        Caption = '�߽Ź�ȣ ���� �˾�'
        TabOrder = 0
        OnClick = btnGetURL_SENDERClick
      end
      object btnGetSenderNumberList: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 33
        Caption = '�߽Ź�ȣ ��� ��ȸ'
        TabOrder = 1
        OnClick = btnGetSenderNumberListClick
      end
    end
  end
  object GroupBox14: TGroupBox
    Left = 488
    Top = 73
    Width = 148
    Height = 130
    Caption = '�������� ����Ʈ'
    TabOrder = 4
    object btnGetBalance: TButton
      Left = 9
      Top = 24
      Width = 129
      Height = 25
      Caption = '�ܿ�����Ʈ Ȯ��'
      TabOrder = 0
      OnClick = btnGetBalanceClick
    end
    object btnGetPopbillURL_CHRG: TButton
      Left = 8
      Top = 56
      Width = 130
      Height = 25
      Caption = '����Ʈ ���� URL'
      TabOrder = 1
      OnClick = btnGetPopbillURL_CHRGClick
    end
  end
  object GroupBox15: TGroupBox
    Left = 640
    Top = 73
    Width = 149
    Height = 130
    Caption = '��Ʈ�ʰ��� ����Ʈ'
    TabOrder = 5
    object btnGetPartnerBalance: TButton
      Left = 9
      Top = 24
      Width = 129
      Height = 25
      Caption = '��Ʈ������Ʈ Ȯ��'
      TabOrder = 0
      OnClick = btnGetPartnerBalanceClick
    end
    object btnGetPartnerURL_CHRG: TButton
      Left = 8
      Top = 56
      Width = 129
      Height = 25
      Caption = '����Ʈ ���� URL'
      TabOrder = 1
      OnClick = btnGetPartnerURL_CHRGClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 664
    Top = 16
  end
end
