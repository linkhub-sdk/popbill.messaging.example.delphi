object frmExample: TfrmExample
  Left = 578
  Top = 179
  Width = 770
  Height = 783
  Caption = '�˺� �޽�¡ SDK Examples'
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
    Caption = '����ڹ�ȣ : '
  end
  object Label4: TLabel
    Left = 232
    Top = 12
    Width = 69
    Height = 13
    Caption = '�˺����̵� : '
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 40
    Width = 745
    Height = 121
    Caption = '�˺� �⺻ API'
    TabOrder = 0
    object GroupBox9: TGroupBox
      Left = 8
      Top = 24
      Width = 137
      Height = 89
      Caption = 'ȸ�� ����'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = 'ȸ�� ����'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object btnGetBalance: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '�ܿ�����Ʈ Ȯ��'
        TabOrder = 1
        OnClick = btnGetBalanceClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 152
      Top = 24
      Width = 289
      Height = 89
      Caption = '����Ʈ ����'
      TabOrder = 1
      object btnGetUnitCost_SMS: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = 'SMS �ܰ� Ȯ��'
        TabOrder = 0
        OnClick = btnGetUnitCost_SMSClick
      end
      object btnGetUnitCost_LMS: TButton
        Left = 144
        Top = 24
        Width = 129
        Height = 25
        Caption = 'LMS �ܰ� Ȯ��'
        TabOrder = 1
        OnClick = btnGetUnitCost_LMSClick
      end
      object btnGetUnitCost_MMS: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = 'MMS �ܰ� Ȯ��'
        TabOrder = 2
        OnClick = btnGetUnitCost_MMSClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 448
      Top = 24
      Width = 137
      Height = 89
      Caption = '��Ÿ'
      TabOrder = 2
      object btnGetPopBillURL: TButton
        Left = 8
        Top = 48
        Width = 121
        Height = 25
        Caption = 'Popbill URL'
        TabOrder = 0
        OnClick = btnGetPopBillURLClick
      end
      object cbTOGO: TComboBox
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        ImeName = '�ѱ��� �Է� �ý��� (IME 2000)'
        ItemHeight = 13
        TabOrder = 1
        Text = '-- URL�ڵ� --'
        Items.Strings = (
          'LOGIN : SSO�α���'
          'CHRG : ����Ʈ ����'
          'CERT : ���������� ���'
          'SEAL : �ΰ� ���'
          'BLICENSE : ����ڵ���� ���'
          'BANKBOOK : ����纻 ���'
          '')
      end
    end
    object GroupBox4: TGroupBox
      Left = 592
      Top = 24
      Width = 145
      Height = 89
      Caption = '��Ʈ�� ����'
      TabOrder = 3
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '��Ʈ������Ʈ Ȯ��'
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
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
    Left = 8
    Top = 168
    Width = 745
    Height = 497
    Caption = '�˺� �޽�¡ ���� ���'
    TabOrder = 3
    object Label1: TLabel
      Left = 32
      Top = 260
      Width = 60
      Height = 13
      Caption = '���� ��ȣ : '
    end
    object Label2: TLabel
      Left = 24
      Top = 24
      Width = 155
      Height = 13
      Caption = '����ð�(yyyyMMddHHmmss) : '
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 48
      Width = 361
      Height = 65
      Caption = 'SMS ���ñ��'
      TabOrder = 0
      object btnSendSMS_Single: TButton
        Left = 8
        Top = 24
        Width = 81
        Height = 33
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendSMS_SingleClick
      end
      object btnSendThousand: TButton
        Left = 224
        Top = 24
        Width = 129
        Height = 33
        Caption = '���� 1000�� ����'
        TabOrder = 1
        OnClick = btnSendThousandClick
      end
      object btnSendThousandSame: TButton
        Left = 96
        Top = 24
        Width = 121
        Height = 33
        Caption = '���� 1000�� ����'
        TabOrder = 2
        OnClick = btnSendThousandSameClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 376
      Top = 48
      Width = 361
      Height = 65
      Caption = 'LMS ���ñ��'
      TabOrder = 1
      object btnSendLMS: TButton
        Left = 8
        Top = 24
        Width = 81
        Height = 33
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendLMSClick
      end
      object btnSendLMSThousand: TButton
        Left = 224
        Top = 24
        Width = 129
        Height = 33
        Caption = '���� 1000�� ����'
        TabOrder = 1
        OnClick = btnSendLMSThousandClick
      end
      object btnSendLMSThousand_Same: TButton
        Left = 96
        Top = 24
        Width = 121
        Height = 33
        Caption = '���� 1000�� ����'
        TabOrder = 2
        OnClick = btnSendLMSThousand_SameClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 120
      Width = 361
      Height = 65
      Caption = 'XMS ���ñ��'
      TabOrder = 2
      object btnSendXMS: TButton
        Left = 8
        Top = 24
        Width = 81
        Height = 33
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendXMSClick
      end
      object btnSendXMSThousand: TButton
        Left = 224
        Top = 24
        Width = 129
        Height = 33
        Caption = '���� 1000�� ����'
        TabOrder = 1
        OnClick = btnSendXMSThousandClick
      end
      object btnSendXMSThousand_Same: TButton
        Left = 96
        Top = 24
        Width = 121
        Height = 33
        Caption = '���� 1000�� ����'
        TabOrder = 2
        OnClick = btnSendXMSThousand_SameClick
      end
    end
    object txtReceiptNum: TEdit
      Left = 96
      Top = 256
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 3
    end
    object btnGetMessage: TButton
      Left = 344
      Top = 254
      Width = 97
      Height = 25
      Caption = '���ۻ���Ȯ��'
      TabOrder = 4
      OnClick = btnGetMessageClick
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 288
      Width = 729
      Height = 201
      ColCount = 11
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 5
    end
    object btnCancelReserve: TButton
      Left = 456
      Top = 254
      Width = 97
      Height = 25
      Caption = '�����������'
      TabOrder = 6
      OnClick = btnCancelReserveClick
    end
    object txtReserveDT: TEdit
      Left = 184
      Top = 22
      Width = 233
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 7
    end
    object btnSMSPopUp: TButton
      Left = 600
      Top = 16
      Width = 137
      Height = 33
      Caption = '���۳�����ȸ �˾�'
      TabOrder = 8
      OnClick = btnSMSPopUpClick
    end
    object GroupBox6: TGroupBox
      Left = 376
      Top = 120
      Width = 361
      Height = 65
      Caption = 'MMS ���ñ��'
      TabOrder = 9
      object btnSendMMS: TButton
        Left = 8
        Top = 21
        Width = 82
        Height = 34
        Caption = '1�� ����'
        TabOrder = 0
        OnClick = btnSendMMSClick
      end
      object btnSendMMSThousand_Same: TButton
        Left = 97
        Top = 19
        Width = 121
        Height = 35
        Caption = '���� 1000�� ����'
        TabOrder = 1
        OnClick = btnSendMMSThousand_SameClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 664
    Top = 8
  end
end
