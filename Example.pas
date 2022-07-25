{******************************************************************************}
{ �˺� ���� API Delphi SDK Example
{
{ - ������Ʈ ���� : 2022-07-25
{ - ���� ������� ����ó : 1600-9854
{ - ���� ������� �̸��� : code@linkhubcorp.com
{ - SDK Ʃ�丮�� : https://docs.popbill.com/message/tutorial/delphi
{
{ <�׽�Ʈ �������� �غ����>
{ (1)33, 36�� ���ο� ����� ��ũ���̵�(LinkID)�� ���Ű(SecretKey)��
{    ��ũ��� ���Խ� ���Ϸ� �߱޹��� ���������� ����
{ (2)�߽Ź�ȣ ��������� �մϴ�.(��Ϲ���� ����Ʈ/API �ΰ��� ����� �ֽ��ϴ�.
{    1.�˺� ����Ʈ �α��� [����/�ѽ�] > [����] > [�߽Ź�ȣ �������] ���� ���
{    2.getSenderNumberMgtURL API�� ���� ��ȯ�� URL�� �̿��Ͽ� �߽Ź�ȣ ���    
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, Popbill, PopbillMessaging, ExtCtrls, Grids;

const
        {**********************************************************************}
        { - ��������(��ũ���̵�, ���Ű)�� ��Ʈ���� ����ȸ���� �ĺ��ϴ�        }
        {   ������ ���ǹǷ� ������� �ʵ��� �����Ͻñ� �ٶ��ϴ�              }
        { - ����� ��ȯ���Ŀ��� ���������� ������� �ʽ��ϴ�.                  }
        {**********************************************************************}

        // ��ũ���̵�
        LinkID = 'TESTER';

        // ���Ű, ���⿡ ����
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost_SMS: TButton;
    GroupBox12: TGroupBox;
    btnGetAccessURL: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    txtUserID: TEdit;
    btnGetUnitCost_LMS: TButton;
    GroupBox5: TGroupBox;
    GroupBox1: TGroupBox;
    btnSendSMS_Single: TButton;
    btnSendThousand: TButton;
    btnSendThousandSame: TButton;
    GroupBox2: TGroupBox;
    btnSendLMS: TButton;
    btnSendLMSThousand: TButton;
    btnSendLMSThousand_Same: TButton;
    GroupBox3: TGroupBox;
    btnSendXMS: TButton;
    btnSendXMSThousand: TButton;
    StringGrid1: TStringGrid;
    btnSendXMSThousand_Same: TButton;
    Label2: TLabel;
    txtReserveDT: TEdit;
    btnGetUnitCost_MMS: TButton;
    GroupBox6: TGroupBox;
    btnSendMMS: TButton;
    OpenDialog1: TOpenDialog;
    btnSendMMSThousand_Same: TButton;
    btnSendMMS_Thousand: TButton;
    btnCheckID: TButton;
    btnCheckIsMember: TButton;
    GroupBox7: TGroupBox;
    btnRegistContact: TButton;
    btnListContact: TButton;
    btnUpdateContact: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    GroupBox10: TGroupBox;
    btnGetChargeInfo_SMS: TButton;
    btnGetChargeInfo_LMS: TButton;
    btnGetChargeInfo_MMS: TButton;
    GroupBox13: TGroupBox;
    btnGetSenderNumberMgtURL: TButton;
    btnGetSenderNumberList: TButton;
    GroupBox16: TGroupBox;
    Label1: TLabel;
    txtReceiptNum: TEdit;
    btnGetMessage: TButton;
    btnCancelReserve: TButton;
    GroupBox17: TGroupBox;
    Label5: TLabel;
    txtRequestNum: TEdit;
    btnGetMessageRN: TButton;
    btnCancelReserveRN: TButton;
    GroupBox14: TGroupBox;
    btnGetBalance: TButton;
    btnGetChargeURL: TButton;
    GroupBox15: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnGetPartnerURL_CHRG: TButton;
    btnGetSentListURL: TButton;
    btnSearchMessages: TButton;
    btnGetAutoDenyList: TButton;
    btnGetStates: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    Button1: TButton;
    txtURL: TEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCost_SMSClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnGetUnitCost_LMSClick(Sender: TObject);
    procedure btnSendSMS_SingleClick(Sender: TObject);
    procedure btnSendThousandClick(Sender: TObject);
    procedure btnSendThousandSameClick(Sender: TObject);
    procedure btnSendLMSClick(Sender: TObject);
    procedure btnGetMessageClick(Sender: TObject);
    procedure btnSendLMSThousand_SameClick(Sender: TObject);
    procedure btnSendLMSThousandClick(Sender: TObject);
    procedure btnSendXMSClick(Sender: TObject);
    procedure btnSendXMSThousand_SameClick(Sender: TObject);
    procedure btnSendXMSThousandClick(Sender: TObject);
    procedure btnCancelReserveClick(Sender: TObject);
    procedure btnGetSentListURLClick(Sender: TObject);
    procedure btnGetUnitCost_MMSClick(Sender: TObject);
    procedure btnSendMMSClick(Sender: TObject);
    procedure btnSendMMSThousand_SameClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnSearchMessagesClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnGetAutoDenyListClick(Sender: TObject);
    procedure btnGetChargeInfo_SMSClick(Sender: TObject);
    procedure btnGetChargeInfo_LMSClick(Sender: TObject);
    procedure btnGetChargeInfo_MMSClick(Sender: TObject);
    procedure btnGetSenderNumberMgtURLClick(Sender: TObject);
    procedure btnGetSenderNumberListClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnGetMessageRNClick(Sender: TObject);
    procedure btnCancelReserveRNClick(Sender: TObject);
    procedure btnSendMMS_ThousandClick(Sender: TObject);
    procedure btnGetStatesClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
    procedure btnCheckSenderNumberClick(Sender: TObject);
  private
    messagingService : TMessagingService;
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;
implementation

{$R *.DFM}

procedure TfrmExample.FormCreate(Sender: TObject);
begin
        // ���� api ��� �ʱ�ȭ.
        messagingService := TMessagingService.Create(LinkID,SecretKey);

        // ����ȯ�� ����, true-���߿�, false-�����
        messagingService.IsTest := true;

        // Exception ó�� ����, true-���, false-�̻��, �⺻��(true)
        messagingService.IsThrowException := true;

        // ������ū IP���ѱ�� ��뿩��, true-���, false-�̻��, �⺻��(true)
        messagingService.IPRestrictOnOff := true;

        //���ýý��� �ð� ��뿩��, true-���, false-�̻��, �⺻��(true)
        messagingService.UseLocalTimeYN := false;

        //�׸��� �ʱ�ȭ
        stringgrid1.Cells[0,0]   := 'subject';
        stringgrid1.Cells[1,0]   := 'content';
        stringgrid1.ColWidths[1] := 150;
        stringgrid1.Cells[2,0]   := 'sendNum';
        stringgrid1.Cells[3,0]   := 'senderName';
        stringgrid1.Cells[4,0]   := 'receiveNum';
        stringgrid1.Cells[5,0]   := 'receiveName';
        stringgrid1.Cells[6,0]   := 'receiptDT';
        stringgrid1.Cells[7,0]   := 'sendDT';
        stringgrid1.Cells[8,0]   := 'resultDT';
        stringgrid1.Cells[9,0]   := 'reserveDT';
        stringgrid1.Cells[10,0]  := 'state';
        stringgrid1.Cells[11,0]  := 'result';
        stringgrid1.Cells[12,0]  := 'type';
        stringgrid1.Cells[13,0]  := 'tranNet';
        stringgrid1.Cells[14,0]  := 'receiptNum';
        stringgrid1.Cells[15,0]  := 'requestNum';
        stringgrid1.Cells[16,0]  := 'interOPRefKey';
end;

procedure TfrmExample.FormClose(Sender:TObject; var Action:TCloseAction);
begin
	messagingService.free;
	Action := caFree;
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
        if condition then result := trueVal else result := falseVal;
end;

function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �˺� ����Ʈ�� �α��� ���·� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.           
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetAccessURL
        {**********************************************************************}

        try
                resultURL := messagingService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin      
        {**********************************************************************}
        { ����ڸ� ����ȸ������ ����ó���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#JoinMember
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '4364364364';

        // ��ǥ�ڼ���, �ִ� 100��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 200��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 100��
        joinInfo.BizType := '����';

        // ����, �ִ� 100��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 50�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // ����ڸ�, �ִ� 100��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� ����, �ִ� 100��
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := messagingService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetBalance
        {**********************************************************************}

        try
                balance := messagingService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
        end;
        
end;

procedure TfrmExample.btnGetUnitCost_SMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { ����(SMS) ���۽� ���ݵǴ� ����Ʈ �ܰ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetUnitCost
        {**********************************************************************}
        
        try
                unitcost := messagingService.GetUnitCost(txtCorpNum.text, SMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('SMS ���۴ܰ� : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetUnitCost_LMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { ����(LMS) ���۽� ���ݵǴ� ����Ʈ �ܰ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetUnitCost
        {**********************************************************************}
        
        try
                unitcost := messagingService.GetUnitCost(txtCorpNum.text, LMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('LMS ���۴ܰ� : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetUnitCost_MMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { ����(MMS) ���۽� ���ݵǴ� ����Ʈ �ܰ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetUnitCost
        {**********************************************************************}

        try
                unitcost := messagingService.GetUnitCost(txtCorpNum.text, MMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('MMS ���۴ܰ� : '+ FloatToStr(unitcost));
        end;
end;
    
procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := messagingService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnSendSMS_SingleClick(Sender: TObject);
var
        receiptNum : String;
        sendNum : String;
        sendName : String;
        receiver : String;
        receiverName : String;
        contents : String;
        adsYN : Boolean;
        requestNum : String;
begin
        {***************************************************************************}
        { �ִ� 90byte�� �ܹ�(SMS) �޽��� 1�� ������ �˺��� �����մϴ�.
        { - https://docs.popbill.com/message/delphi/api#SendSMS
        {***************************************************************************}

        try
                // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
                sendNum := '07043042991';

                // �߽��ڸ�
                sendName := '�߽��ڸ�';

                // ���Ź�ȣ
                receiver := '010-1234-4567';

                // �����ڸ�
                receiverName := '�����ڸ�';

                //�޽��� ���� (90Byte �ʰ��� ������ �����Ǿ� ���۵�)
                contents := '�ܹ��޽��� �Դϴ�.';

                // ���ۿ�û��ȣ
                // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
                // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
                requestNum := txtRequestNum.text;

                // ������ ���ۿ���
                adsYN := false;

                receiptNum := messagingService.SendSMS(txtCorpNum.Text, sendNum,
                                                       sendName, receiver,
                                                       receiverName, contents,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text ,requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnSendThousandClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum, requestNum : String;
        i : Integer;
        Tinit,Tpost,Ttotal :TDateTime;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { �ִ� 90byte�� �ܹ�(SMS) �޽��� �ټ��� ������ �˺��� �����մϴ�. (�ִ� 1,000��)
        { - �����ڸ��� ���� ������ ������ �� �ֽ��ϴ�(�뷮����).
        { - https://docs.popbill.com/message/delphi/api#SendSMS_Multi
        {***************************************************************************}

        //���� ���� �迭, �ִ� 1000��
        SetLength(Messages, 5);

        for i := 0 to Length(Messages) - 1 do begin
            Messages[i] := TSendMessage.create;

            // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
            Messages[i].sender := '070-4304-2991';

            // �߽��ڸ�
            Messages[i].senderName := '�߽��ڸ�' + InttoStr(i);

            // ���Ź�ȣ
            Messages[i].receiver := '010111222';

            // �޽��� ���� (90Byte �ʰ��� ������ �����Ǿ� ���۵�)
            Messages[i].content := '���볻��_' + IntToStr(i);

            // ��Ʈ�� ����Ű
            Messages[i].interOPRefKey := 'TEST' + IntToStr(i);
        end;

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        adsYN := false;

        try
                receiptNum := messagingService.SendSMS(txtCorpNum.Text, Messages,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnSendThousandSameClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum : String;
        sendNum : String;
        sendName : String;
        contents : String;
        i : Integer;
        Tinit,Tpost :TDateTime;
        adsYN : Boolean;
        requestNum : String;
begin
        {***************************************************************************}
        { �ִ� 90byte�� �ܹ�(SMS) �޽��� �ټ��� ������ �˺��� �����մϴ�. (�ִ� 1,000��)
        { - ��� �����ڿ��� ������ ������ ������ �� �ֽ��ϴ�.(��������).
        { - https://docs.popbill.com/message/delphi/api#SendSMS_Multi
        {***************************************************************************}

        //���� ���� �迭, �ִ� 1000��
        SetLength(Messages, 5);

        for i := 0 to Length(Messages) -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';    // ���Ź�ȣ
            Messages[i].receiverName := '�����ڸ�';   // �����ڸ�
            MEssages[i].interOPRefKey := 'TEST' + IntToStr(i);    // ��Ʈ�� ���� Ű
        end;

        // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
        sendNum := '070-4304-2991';

        // �߽��ڸ�
        sendName := '�߽��ڸ�_SMS';

        // (����) �޽��� ���� (90Byte �ʰ��� ������ �����Ǿ� ���۵�)
        contents := '�������� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        adsYN := false;

        try
                receiptNum := messagingService.SendSMS(txtCorpNum.Text, sendNum,
                                                       sendName, contents,
                                                       Messages, txtReserveDT.Text,
                                                       adsYN, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnSendLMSClick(Sender: TObject);
var
        receiptNum : String;
        sendNum : String;
        sendName : String;
        receiver : String;
        receiverName : String;
        subject : String;
        contents : String;
        adsYN : Boolean;
        requestNum : String;
begin
        {***************************************************************************}
        { �ִ� 2,000byte�� �幮(LMS) �޽��� 1�� ������ �˺��� �����մϴ�.
        { - https://docs.popbill.com/message/delphi/api#SendLMS
        {***************************************************************************}

        // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
        sendNum := '070-4304-2991';

        // �߽��ڸ�
        sendName := '�߽��ڸ�';

        // ���Ź�ȣ
        receiver := '010-222-333';

        // �����ڸ�
        receiverName := '�����ڸ�';

        // �޽��� ����
        subject := '�޽��� ����';

        // �޽��� ���� (2000Byte �ʰ��� ������ �����Ǿ� ���۵�)
        contents := '�幮 ���� ���ڸ޽��� �����Դϴ�';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        adsYN := false;

        try
                receiptNum := messagingService.SendLMS(txtCorpNum.Text, sendNum,
                                                       sendName, receiver,
                                                       receiverName, subject,
                                                       contents, txtReserveDT.Text,
                                                       adsYN, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnGetMessageClick(Sender: TObject);
var
        Messages : TSentMessageList;
        i :integer;
begin
        {**********************************************************************}
        { �˺����� ��ȯ���� ������ȣ�� ���� ���� ���ۻ��� �� ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetMessages
        {**********************************************************************}

        try
                Messages := messagingService.GetMessages(txtCorpNum.Text, txtReceiptNum.Text)
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                stringgrid1.RowCount := Length(Messages) + 1;

                for i:= 0 to Length(Messages) -1 do begin

                       // �޽��� ����
                       stringgrid1.Cells[0,i+1] := Messages[i].subject;

                       // �޽��� ����
                       stringgrid1.Cells[1,i+1] := Messages[i].content;

                       // �߽Ź�ȣ
                       stringgrid1.Cells[2,i+1] := Messages[i].sendNum;

                       // �߽��ڸ�
                       stringgrid1.Cells[3,i+1] := Messages[i].senderName;

                       // ���Ź�ȣ
                       stringgrid1.Cells[4,i+1] := Messages[i].receiveNum;

                       // �����ڸ�
                       stringgrid1.Cells[5,i+1] := Messages[i].receiveName;

                       // �����Ͻ�
                       stringgrid1.Cells[6,i+1] := Messages[i].receiptDT;

                       // �����Ͻ�
                       stringgrid1.Cells[7,i+1] := Messages[i].sendDT;

                       // ���۰�� �Ͻ�
                       stringgrid1.Cells[8,i+1] := Messages[i].resultDT;

                       // �����Ͻ�
                       stringgrid1.Cells[9,i+1] := Messages[i].reserveDT;

                       // ���ۻ��� �ڵ�
                       stringgrid1.Cells[10,i+1] := IntToStr(Messages[i].state);

                       // ���۰�� �ڵ�
                       stringgrid1.Cells[11,i+1] := IntToStr(Messages[i].result);

                       // �޽��� Ÿ��
                       stringgrid1.Cells[12,i+1] := GetEnumName(TypeInfo(EnumMessageType),integer(Messages[i].messageType));

                       // ����ó�� �̵���Ż��
                       stringgrid1.Cells[13,i+1] := Messages[i].tranNet;

                       // ������ȣ
                       stringgrid1.Cells[14,i+1] := Messages[i].receiptNum;

                       // ��û��ȣ
                       stringgrid1.Cells[15,i+1] := Messages[i].requestNum;

                       // ��Ʈ�� ���� Ű
                       stringgrid1.Cells[16,i+1] := Messages[i].interOPRefKey;
                end;
        end;
end;

procedure TfrmExample.btnSendLMSThousand_SameClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum : String;
        sendNum : String;
        senderName : String;
        subject : String;
        contents : String;
        i : Integer;
        Tinit,Tpost :TDateTime;
        adsYN : Boolean;
        requestNum : String;
begin
        {***************************************************************************}
        { �ִ� 2,000byte�� �幮(LMS) �޽��� �ټ��� ������ �˺��� �����մϴ�. (�ִ� 1,000��)
        { - ��� �����ڿ��� ������ ������ �����ϰų�(��������).
        { - https://docs.popbill.com/message/delphi/api#SendLMS_Multi
        {***************************************************************************}

        //���� ���� �迭, �ִ� 1000��
        SetLength(Messages,5);

        for i := 0 to Length(Messages) -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';    // ���Ź�ȣ
            Messages[i].receiverName := '�����ڸ�';   // �����ڸ�
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);  // ��Ʈ�� ����Ű
        end;

        // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
        sendNum := '070-4304-2991';

        // �߽��ڸ�
        senderName := '�߽��ڸ�';

        // (����) �޽��� ����
        subject := '�뷮���� ����';

        // (����) �޽��� ���� (2000Byte �ʰ��� ������ �����Ǿ� ���۵�)
        contents := '�������� �޽��� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        adsYN := False;

        try
                receiptNum := messagingService.SendLMS(txtCorpNum.Text, sendNum,
                                                       senderName, subject,
                                                       contents, Messages,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnSendLMSThousandClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum, requestNum : String;
        i : Integer;
        Tinit,Tpost,Ttotal :TDateTime;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { �ִ� 2,000byte�� �幮(LMS) �޽��� �ټ��� ������ �˺��� �����մϴ�. (�ִ� 1,000��)
        { - �����ڸ��� ���� ������ ������ �� �ֽ��ϴ�(�뷮����).
        { - https://docs.popbill.com/message/delphi/api#SendLMS_Multi
        {***************************************************************************}

        // �������� �迭, �ִ� 1000��
        SetLength(Messages,5);

        for i := 0 to Length(Messages) -1 do begin
            Messages[i] := TSendMessage.create;
                                      
            // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
            Messages[i].sender := '070-4304-2991';

            // �߽��ڸ�
            Messages[i].senderName := '�߽��ڸ�' +IntToStr(i);

            // ���Ź�ȣ
            Messages[i].receiver := '010111222';

            // �޽��� ����
            Messages[i].subject := '�幮����';

            // �޽��� ���� (2000Byte �ʰ��� ������ �����Ǿ� ���۵�)
            Messages[i].content := '�幮 ���� �޽����� ������ �����մϴ�. - ' + IntToStr(i);

            // ��Ʈ�� ���� Ű
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);
        end;

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        adsYN := False;

        try
                receiptNum := messagingService.SendLMS(txtCorpNum.Text, Messages,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnSendXMSClick(Sender: TObject);
var
        receiptNum, sendNum, sendName, receiver, receiverName, subject, contents, requestNum: String;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { �޽��� ����(90byte)�� ���� �ܹ�/�幮(SMS/LMS)�� �ڵ����� �ν��Ͽ� 1���� �޽����� ������ �˺��� �����մϴ�.
        { - https://docs.popbill.com/message/delphi/api#SendXMS
        {***************************************************************************}

        // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
        sendNum := '070-4304-2991';

        // �߽��ڸ�
        sendName := '�߽��ڸ�';

        // ���Ź�ȣ
        receiver := '010-111-222';

        // �����ڸ�
        receiverName := '�����ڸ�';

        // �޽��� ����
        subject := '�޽��� ����';

        // 90Byte�� �������� �ܹ�(SMS)/�幮(LMS) �ڵ� �νĵǾ� ���۵˴ϴ�.
        // �޽��� ���� (2000Byte �ʰ��� ������ �����Ǿ� ���۵�)
        contents := 'XMS��. 90byte�� �������� SMS/LMS�� ���� ���۵˴ϴ�. 2000byte �ʰ��� ������ �����Ǿ� ���۵˴ϴ�.';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        adsYN := false;

        try
                receiptNum := messagingService.SendXMS(txtCorpNum.Text, sendNum,
                                                       sendName, receiver,
                                                       receiverName, subject,
                                                       contents, txtReserveDT.Text,
                                                       adsYN, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;


procedure TfrmExample.btnSendXMSThousand_SameClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum, sendNum, sendName, subject, contents, requestNum : String;
        i : Integer;
        Tinit,Tpost :TDateTime;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { �޽��� ����(90byte)�� ���� �ܹ�/�幮(SMS/LMS)�� �ڵ����� �ν��Ͽ� 1���� �޽����� ������ �˺��� �����մϴ�. (�ִ� 1,000��)
        { - ��� �����ڿ��� ������ ������ �����ϰų�(��������).
        { - https://docs.popbill.com/message/delphi/api#SendXMS_Multi
        {***************************************************************************}

        //���� ���� �迭, �ִ� 1000��
        SetLength(Messages, 5);

        for i := 0 to Length(Messages) - 1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';    // ���Ź�ȣ
            Messages[i].receiverName := '�����ڸ�';   // �����ڸ�
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);  // ��Ʈ�� ����Ű
        end;

        // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
        sendNum  := '070-4304-2991';

        // �߽��ڸ�
        sendName := '�߽��ڸ�';

        // (����) �޽��� ����
        subject := '�޽��� ����';

        // (����)�޽��� ����
        // 90Byte�� �������� �ܹ�(SMS)/�幮(LMS) �ڵ� �νĵǾ� ���۵˴ϴ�.
        // �޽��� ���� (2000Byte �ʰ��� ������ �����Ǿ� ���۵�)
        contents := '���� �޼��� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        adsYN := false;

        try
                Tinit := NOW;

                receiptNum := messagingService.SendXMS(txtCorpNum.Text, sendNum,
                                                       sendName, subject,
                                                       contents, Messages,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
                Tpost := NOW;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnSendXMSThousandClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum, requestNum : String;
        i : Integer;
        Tinit,Tpost,Ttotal :TDateTime;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { �޽��� ����(90byte)�� ���� �ܹ�/�幮(SMS/LMS)�� �ڵ����� �ν��Ͽ� 1���� �޽����� ������ �˺��� �����մϴ�. (�ִ� 1,000��)
        { - �����ڸ��� ���� ������ ������ �� �ֽ��ϴ�(�뷮����).
        { - https://docs.popbill.com/message/delphi/api#SendXMS_Multi
        {***************************************************************************}

        //�������� �迭 �ִ� 1000��
        SetLength(Messages,10);

        for i := 0 to Length(Messages) -1  do begin
            Messages[i] := TSendMessage.create;

            // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
            Messages[i].sender := '070-4304-2991';

            // �߽��ڸ�
            Messages[i].senderName := '�߽��ڸ�' + IntToStr(i);

            // ���Ź�ȣ
            Messages[i].receiver := '010-111-222';

            // �޽��� ����
            Messages[i].subject := '�޽��� ����';

            // �޽��� ����
            // 90Byte�� �������� �ܹ�(SMS)/�幮(LMS) �ڵ� �νĵǾ� ���۵˴ϴ�.
            // �޽��� ���� (2000Byte �ʰ��� ������ �����Ǿ� ���۵�)
            Messages[i].content := '���ڳ��� ���̿� ���� �ڵ��ν� ���� ' + IntToStr(i);

            // ��Ʈ�� ����Ű
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);
        end;

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        adsYN := false;

        try
                receiptNum := messagingService.SendXMS(txtCorpNum.Text, Messages,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnCancelReserveClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �˺����� ��ȯ���� ������ȣ�� ���� ���������� ���� �޽��� ������ ����մϴ�. (����ð� 10�� ������ ����)
        { - https://docs.popbill.com/message/delphi/api#CancelReserve
        {**********************************************************************}

        try
                response := messagingService.CancelReserve(txtCorpNum.Text, txtReceiptNum.Text)
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetSentListURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���� ���۳��� Ȯ�� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetSentListURL
        {**********************************************************************}

        try
                resultURL := messagingService.getSentListURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnSendMMSClick(Sender: TObject);
var
        filePath, receiptNum, sendNum, sendName, receiver, receiverName, subject, contents, requestNum : string;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { �ִ� 2,000byte�� �޽����� �̹����� ������ ���乮��(MMS) 1�� ������ �˺��� �����մϴ�.
        { - �̹��� ���� ����/�԰� : �ִ� 300Kbyte(JPEG, JPG), ����/���� 1,000px ���� ����
        { - https://docs.popbill.com/message/delphi/api#SendMMS
        {***************************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
        sendNum := '070-4304-2991';

        // �߽��ڸ�
        sendName := '�߽��ڸ�';

        // ���Ź�ȣ
        receiver := '010-111-222';

        // �����ڸ�
        receiverName := '�����ڸ�';

        // �޽��� ����
        subject := '���� �޽��� ����';

        // �޽��� ���� (2000Byte �ʰ��� ������ �����Ǿ� ���۵�)
        contents := '���� �޽��� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        // [����] ������ ǥ�� �ǹ� �� ���۹�� �ȳ� - http://blog.linkhub.co.kr/2642
        adsYN := false;

        try
                receiptNum := messagingService.SendMMS(txtCorpNum.Text, sendNum,
                                                       sendName, receiver,
                                                       receiverName, subject,
                                                       contents, filePath,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnSendMMSThousand_SameClick(Sender: TObject);
var
        Messages : TSendMessageList;
        filePath, receiptNum, sendNum, sendname, subject, contents, requestNum : string;
        i : Integer;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { �ִ� 2,000byte�� �޽����� �̹����� ������ ���乮��(MMS) �ټ��� ������ �˺��� �����մϴ�. (�ִ� 1,000��)
        { - ��� �����ڿ��� ������ ������ �����ϰų�(��������).
        { - �̹��� ���� ����/�԰� : �ִ� 300Kbyte(JPEG), ����/���� 1,000px ���� ����
        { - https://docs.popbill.com/message/delphi/api#SendMMS_Multi
        {***************************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        //�������� �迭, �ִ� 1000��
        SetLength(Messages, 10);

        for i := 0 to Length(Messages) -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';    // ���Ź�ȣ
            Messages[i].receiverName := '�����ڸ�';   // �����ڸ�
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);  // ��Ʈ�� ����Ű
        end;

        // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
        sendNum := '070-4304-2991';

        // �߽��ڸ�
        sendName := '�߽��ڸ�';

        // (����) �޽��� ����
        subject := '���� �޽��� ����';

        // (����) �޽��� ���� (2000Byte �ʰ��� ������ �����Ǿ� ���۵�)
        contents := '���� �޽��� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        adsYN := false;

        try
                receiptNum := messagingService.SendMMS(txtCorpNum.Text, sendNum,
                                                       subject, contents,
                                                       Messages, filePath,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ����ϰ��� �ϴ� ���̵��� �ߺ����θ� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#CheckID
        {**********************************************************************}

        try
                response := messagingService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;

end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� �����(�˺� �α��� ����)�� �߰��մϴ�.
        { - https://docs.popbill.com/message/delphi/api#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'testkorea0222_01';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := messagingService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := messagingService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'id(���̵�) | email(�̸���) | personName(����) | searchRole(����� ����) | ';
                tmp := tmp + 'tel(����ó) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].id + ' | ';
                    tmp := tmp + InfoList[i].email + ' | ';
                    tmp := tmp + InfoList[i].personName + ' | ';
                    tmp := tmp + InfoList[i].searchRole + ' | ';
                    tmp := tmp + InfoList[i].tel + ' | ';
                    tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
                    tmp := tmp + InfoList[i].regDT + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ������ �����մϴ�.
        { - https://docs.popbill.com/message/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := 'delphi �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        contactInfo.searchRole := '3';

        try
                response := messagingService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetCorpInfo
        {**********************************************************************}
               
        try
                corpInfo := messagingService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'CorpName (��ȣ) : ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (��ǥ�ڼ���) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://docs.popbill.com/message/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 100��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 200��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 100��
        corpInfo.bizType := '����';

        // ����, �ִ� 100��
        corpInfo.bizClass := '����';

        // �ּ�, �ִ� 300��
        corpInfo.addr := '����Ư���� ������ ������� 517';

        try
                response := messagingService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnSearchMessagesClick(Sender: TObject);
var
        SDate, EDate, tmp, Order, QString : String;
        Page, PerPage : Integer;
        State, Item : Array Of String;
        ReserveYN, SenderYN : boolean;
        Messages : TSearchList;
        i : integer;
begin
        {**********************************************************************}
        { �˻����ǿ� �ش��ϴ� ���� ���۳����� ��ȸ�մϴ�. (��ȸ�Ⱓ ���� : �ִ� 2����)
        { - ���� �����Ͻ÷κ��� 6���� �̳� �����Ǹ� ��ȸ�� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetMessages
        {**********************************************************************}

        // �˻��Ⱓ ��������, ��¥���� yyyyMMdd
        SDate := '20220725';

        // �˻��Ⱓ ��������, ��¥���� yyyyMMdd
        EDate := '20220725';

        //���ڸ޽��� ���ۻ��°� �迭, 1:���, 2:����, 3:����, 4:���
        SetLength(State, 4);
        State[0] := '1';
        State[1] := '2';
        State[2] := '3';
        State[3] := '4';

        // �˻���� �迭, SMS, LMS, MMS ex) Item = SMS, LMS, MMS
        SetLength(Item, 3);
        Item[0] := 'SMS';
        Item[1] := 'LMS';
        Item[2] := 'MMS';

        // �������� �˻�����, true(�������� �˻�), false(������� �˻�)
        ReserveYN := false;

        // ������ȸ����, true(������ȸ), false(��ü��ȸ).
        SenderYN := false;

        // ������ ��ȣ, �⺻�� 1
        Page := 1;

        // �������� �˻�����, �⺻�� 500
        PerPage := 5;

        // ���Ĺ���, D-�������� , A-��������
        Order := 'D';

        // ��ȸ �˻���, �߽��ڸ� �Ǵ� �����ڸ� ����
        QString := '';

        try
                Messages := messagingService.search(txtCorpNum.text, SDate, EDate, State,
                                                        Item, ReserveYN, SenderYN, Page, PerPage, Order);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'code (�����ڵ�) : '+IntToStr(Messages.code) + #13;
                tmp := tmp + 'total (�� �˻���� �Ǽ�) : '+ IntToStr(Messages.total) + #13;
                tmp := tmp + 'perPage (�������� �˻�����) : '+ IntToStr(Messages.perPage) + #13;
                tmp := tmp + 'pageNum (������ ��ȣ) : '+ IntToStr(Messages.pageNum) + #13;
                tmp := tmp + 'pageCount (������ ����) : '+ IntToStr(Messages.pageCount) + #13;
                tmp := tmp + 'message (����޽���) : '+ Messages.message + #13;

                stringgrid1.RowCount := Length(Messages.list) + 1;

                for i:= 0 to Length(Messages.list) -1 do begin
                        // �޽��� ����
                        stringgrid1.Cells[0,i+1] := Messages.list[i].subject;

                        // �޽��� ����
                        stringgrid1.Cells[1,i+1] := Messages.list[i].content;

                        // �߽Ź�ȣ
                        stringgrid1.Cells[2,i+1] := Messages.list[i].sendNum;

                        // �߽��ڸ�
                        stringgrid1.Cells[3,i+1] := Messages.list[i].senderName;

                        // ���Ź�ȣ
                        stringgrid1.Cells[4,i+1] := Messages.list[i].receiveNum;

                        // �����ڸ�
                        stringgrid1.Cells[5,i+1] := Messages.list[i].receiveName;

                        // �����Ͻ�
                        stringgrid1.Cells[6,i+1] := Messages.list[i].receiptDT;

                        // �����Ͻ�
                        stringgrid1.Cells[7,i+1] := Messages.list[i].sendDT;

                        // ���۰�� �����Ͻ�
                        stringgrid1.Cells[8,i+1] := Messages.list[i].resultDT;

                        // �����Ͻ�
                        stringgrid1.Cells[9,i+1] := Messages.list[i].reserveDT;

                        // ���ۻ��� �ڵ�
                        stringgrid1.Cells[10,i+1] := IntToStr(Messages.list[i].state);

                        // ���۰�� �ڵ�
                        stringgrid1.Cells[11,i+1] := IntToStr(Messages.list[i].result);

                        // �޽��� ����
                        stringgrid1.Cells[12,i+1] := GetEnumName(TypeInfo(EnumMessageType),integer(Messages.list[i].messageType));

                        // ���� �̵���Ż��
                        stringgrid1.Cells[13,i+1] := Messages.list[i].tranNet;

                        // ������ȣ
                        stringgrid1.Cells[14,i+1] := Messages.list[i].receiptNum;

                        // ��û��ȣ
                        stringgrid1.Cells[15,i+1] := Messages.list[i].requestNum;

                        // ��Ʈ�� ���� Ű
                        stringgrid1.Cells[16,i+1] := Messages.list[i].interOPRefKey;
                end;
                Messages.Free;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ����ڹ�ȣ�� ��ȸ�Ͽ� ����ȸ�� ���Կ��θ� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#CheckIsMember
        {**********************************************************************}

        try
                response := messagingService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ������ ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := messagingService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetAutoDenyListClick(Sender: TObject);
var
        AutoDenyList : TAutoDenyList;
        tmp : String;
        i : Integer;
begin
        {**********************************************************************}
        { ���� 080 ��ȣ�� ��ϵ� ���Űź� ����� ��ȯ�մϴ�.                                    
        { - https://docs.popbill.com/message/delphi/api#GetAutoDenyList
        {**********************************************************************}

        try
             AutoDenyList := messagingService.getAutoDenyList(txtCorpNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;


        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'number(���Űźι�ȣ) | regDT(����Ͻ�) ' + #13;

                for i := 0 to Length(AutoDenyList) -1 do
                begin
                        tmp:= tmp + AutoDenyList[i].number + '  |  '
                                + AutoDenyList[i].regDT + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetChargeInfo_SMSClick(Sender: TObject);
var
        chargeInfo : TMessageChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { �˺� ����(SMS) API ���� ���������� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetChargeInfo
        {**********************************************************************}
        
        try
                chargeInfo := messagingService.GetChargeInfo(txtCorpNum.text, SMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;

                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetChargeInfo_LMSClick(Sender: TObject);
var
        chargeInfo : TMessageChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { �˺� ����(LMS) API ���� ���������� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := messagingService.GetChargeInfo(txtCorpNum.text, LMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;

                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetChargeInfo_MMSClick(Sender: TObject);
var
        chargeInfo : TMessageChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { �˺� ����(MMS) API ���� ���������� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := messagingService.GetChargeInfo(txtCorpNum.text, MMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;

                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnCheckSenderNumberClick(Sender: TObject);
var
        response : TResponse;
        senderNumber : String;
begin
        {**********************************************************************}
        { ���� �߽Ź�ȣ ��Ͽ��θ� Ȯ���մϴ�.
        { - �߽Ź�ȣ ���°� '����'�� ��쿡�� ���ϰ� 'TResponse'�� ���� 'code'�� 1�� ��ȯ�˴ϴ�.
        { - https://docs.popbill.com/message/delphi/api#CheckSenderNumber
        {**********************************************************************}

        //Ȯ���� �߽Ź�ȣ
        senderNumber := '07079987110';

        try
                response := messagingService.CheckSenderNumber(txtCorpNum.Text, senderNumber);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '��������� : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetSenderNumberMgtURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { �߽Ź�ȣ�� ����ϰ� ������ Ȯ���ϴ� ���� �߽Ź�ȣ ���� ������ �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetSenderNumberMgtURL   
        {**********************************************************************}

        try
                resultURL := messagingService.getSenderNumberMgtURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;        
end;

procedure TfrmExample.btnGetSenderNumberListClick(Sender: TObject);
var
        SenderNumberList : TMSGSenderNumberList;
        tmp : String;
        i : Integer;
begin
        {**********************************************************************}
        { �˺��� ����� ����ȸ���� ���� �߽Ź�ȣ ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetSenderNumberList
        {**********************************************************************}

        try
             SenderNumberList := messagingService.getSenderNumberList(txtCorpNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                for i := 0 to Length(SenderNumberList) -1 do
                begin
                        tmp := tmp + '******** ���� �߽Ź�ȣ ��� ['+ IntToStr(i+1) + '] ********' + #13;
                        tmp := tmp + 'number(�߽Ź�ȣ) : ' + SenderNumberList[i].number + #13;
                        tmp := tmp + 'state(��ϻ���) : ' + IntToStr(SenderNumberList[i].state) + #13;
                        tmp := tmp + 'representYN(��ǥ��ȣ ��������) : ' + BoolToStr(SenderNumberList[i].representYN) + #13;
                        tmp := tmp + 'memo(�޸�) : ' + SenderNumberList[i].memo + #13 + #13;
                end;
                ShowMessage(tmp);
        end;


end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ������ ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetPartnerURL
        {**********************************************************************}

        try
                resultURL := messagingService.getPartnerURL(txtCorpNum.Text, 'CHRG');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetMessageRNClick(Sender: TObject);
var
        Messages : TSentMessageList;
        i :integer;
begin
        {*******************************************************************************}
        { ��Ʈ�ʰ� �Ҵ��� ���ۿ�û ��ȣ�� ���� ���� ���ۻ��� �� ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetMessagesRN
        {*******************************************************************************}

        try
                Messages := messagingService.GetMessagesRN(txtCorpNum.Text, txtRequestNum.Text)
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
        stringgrid1.RowCount := Length(Messages) + 1;

        for i:= 0 to Length(Messages) -1 do begin

               // �޽��� ����
               stringgrid1.Cells[0,i+1] := Messages[i].subject;

               // �޽��� ����
               stringgrid1.Cells[1,i+1] := Messages[i].content;

               // �߽Ź�ȣ
               stringgrid1.Cells[2,i+1] := Messages[i].sendNum;

               // �߽��ڸ�
               stringgrid1.Cells[3,i+1] := Messages[i].senderName;

               // ���Ź�ȣ
               stringgrid1.Cells[4,i+1] := Messages[i].receiveNum;

               // �����ڸ�
               stringgrid1.Cells[5,i+1] := Messages[i].receiveName;

               // �����Ͻ�
               stringgrid1.Cells[6,i+1] := Messages[i].receiptDT;

               // �����Ͻ�
               stringgrid1.Cells[7,i+1] := Messages[i].sendDT;

               // ���۰�� �Ͻ�
               stringgrid1.Cells[8,i+1] := Messages[i].resultDT;

               // �����Ͻ�
               stringgrid1.Cells[9,i+1] := Messages[i].reserveDT;

               // ���ۻ��� �ڵ�
               stringgrid1.Cells[10,i+1] := IntToStr(Messages[i].state);

               // ���۰�� �ڵ�
               stringgrid1.Cells[11,i+1] := IntToStr(Messages[i].result);

               // �޽��� Ÿ��
               stringgrid1.Cells[12,i+1] := GetEnumName(TypeInfo(EnumMessageType),integer(Messages[i].messageType));

               // ����ó�� �̵���Ż��
               stringgrid1.Cells[13,i+1] := Messages[i].tranNet;

               // ������ȣ
               stringgrid1.Cells[14,i+1] := Messages[i].receiptNum;

               // ��û��ȣ
               stringgrid1.Cells[15,i+1] := Messages[i].requestNum;

               // ��Ʈ�� ���� Ű
               stringgrid1.Cells[16,i+1] := Messages[i].interOPRefKey;
        end;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ��Ʈ�ʰ� �Ҵ��� ���ۿ�û ��ȣ�� ���� ���������� ���� ������ ����մϴ�. (����ð� 10�� ������ ����)
        { - https://docs.popbill.com/message/delphi/api#CancelReserveRN
        {**********************************************************************}

        try
                response := messagingService.CancelReserveRN(txtCorpNum.Text, txtRequestNum.Text)
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnSendMMS_ThousandClick(Sender: TObject);
var
        Messages : TSendMessageList;
        filePath, receiptNum, sendNum, subject, contents, requestNum : string;
        i : Integer;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { �ִ� 2,000byte�� �޽����� �̹����� ������ ���乮��(MMS) �ټ��� ������ �˺��� �����մϴ�. (�ִ� 1,000��)
        { - �����ڸ��� ���� ������ ������ �� �ֽ��ϴ�(�뷮����).
        { - �̹��� ���� ����/�԰� : �ִ� 300Kbyte(JPEG), ����/���� 1,000px ���� ����
        { - https://docs.popbill.com/message/delphi/api#SendMMS_Multi
        {***************************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        //�������� �迭, �ִ� 1000��
        SetLength(Messages, 5);

        for i := 0 to Length(Messages) -1 do begin
                Messages[i] := TSendMessage.create;
                Messages[i].sender := '07043042991';       //�߽Ź�ȣ
                Messages[i].senderName := '�߽��ڸ�';      //�߽��ڸ�
                Messages[i].receiver := '010111222';       //���Ź�ȣ
                Messages[i].receiverName :='�����ڸ�';     //�����ڸ�
                Messages[i].interOPRefKey := 'TEST' + IntToStr(i);   // ��Ʈ�� ���� Ű
        end;

        // �߽Ź�ȣ (�˺��� ��ϵ� �߽Ź�ȣ)
        sendNum := '070-4304-2991';

        // �޽��� ����
        subject := '���� �뷮���� �޽��� ����';

        // �޽��� ���� (2000Byte �ʰ��� ������ �����Ǿ� ���۵�)
        contents := '���� �޽��� ����';

        // ���ۿ�û��ȣ
        // ��Ʈ�ʰ� ���� �ǿ� ���� ������ȣ�� �����Ͽ� �����ϴ� ��� ���.
        // 1~36�ڸ��� ����. ����, ����, ������(-), �����(_)�� �����Ͽ� �˺� ȸ������ �ߺ����� �ʵ��� �Ҵ�.
        requestNum := txtRequestNum.text;

        // ������ ���ۿ���
        // [����] ������ ǥ�� �ǹ� �� ���۹�� �ȳ� - http://blog.linkhub.co.kr/2642
        adsYN := false;

        try
                receiptNum := messagingService.SendMMS(txtCorpNum.Text, sendNum,
                                                       subject, contents,
                                                       Messages, filePath,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('������ȣ (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnGetStatesClick(Sender: TObject);
var
        NumList : Array of String;
        InfoList : TSentMessageSummaryInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { �ٷ��� ���� ���۳��� ��������� Ȯ���մϴ�. (�ִ� 1000��)            
        {**********************************************************************}

        // ���� ������ȣ �迭 (�ִ� 1000��)
        SetLength(NumList,2);
        NumList[0] := '018061815000000041';
        NumList[1] := '018061815000000042';

        try
                InfoList := messagingService.GetStates(txtCorpNum.text, NumList);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+  messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'rNum(������ȣ) | sn(�Ϸù�ȣ) | stat(���� �����ڵ�) | rlt(���� ����ڵ�) | sDT(�����Ͻ�) |';
                tmp := tmp + 'rDT(���۰�� �����Ͻ�) | net(���� �̵���Ż��) | srt (�� ���� ����ڵ�)' + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].rNum + ' | '
                       + InfoList[i].sn   + ' | '
                       + InfoList[i].stat + ' | '
                       + InfoList[i].rlt  + ' | '
                       + InfoList[i].sDT  + ' | '
                       + InfoList[i].rDT  + ' | '
                       + InfoList[i].net  + ' | '
                       + InfoList[i].srt  + #13;
                end;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ �������� Ȯ���� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := messagingService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ��볻�� Ȯ���� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := messagingService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ������ Ȯ���մϴ�.
        { - https://docs.popbill.com/message/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := messagingService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'����޽��� : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (���̵�) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (����� ����) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (����� ����ó(��ȭ��ȣ)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.



