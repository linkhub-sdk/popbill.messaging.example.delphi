{******************************************************************************}
{ 팝빌 문자 API Delphi SDK Example
{
{ - 업데이트 일자 : 2022-07-25
{ - 연동 기술지원 연락처 : 1600-9854
{ - 연동 기술지원 이메일 : code@linkhubcorp.com
{ - SDK 튜토리얼 : https://docs.popbill.com/message/tutorial/delphi
{
{ <테스트 연동개발 준비사항>
{ (1)33, 36번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를
{    링크허브 가입시 메일로 발급받은 인증정보로 수정
{ (2)발신번호 사전등록을 합니다.(등록방법은 사이트/API 두가지 방식이 있습니다.
{    1.팝빌 사이트 로그인 [문자/팩스] > [문자] > [발신번호 사전등록] 에서 등록
{    2.getSenderNumberMgtURL API를 통해 반환된 URL을 이용하여 발신번호 등록    
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, Popbill, PopbillMessaging, ExtCtrls, Grids;

const
        {**********************************************************************}
        { - 인증정보(링크아이디, 비밀키)는 파트너의 연동회원을 식별하는        }
        {   인증에 사용되므로 유출되지 않도록 주의하시기 바랍니다              }
        { - 상업용 전환이후에도 인증정보는 변경되지 않습니다.                  }
        {**********************************************************************}

        // 링크아이디
        LinkID = 'TESTER';

        // 비밀키, 유출에 주의
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
        // 문자 api 모듈 초기화.
        messagingService := TMessagingService.Create(LinkID,SecretKey);

        // 연동환경 설정, true-개발용, false-상업용
        messagingService.IsTest := true;

        // Exception 처리 설정, true-사용, false-미사용, 기본값(true)
        messagingService.IsThrowException := true;

        // 인증토큰 IP제한기능 사용여부, true-사용, false-미사용, 기본값(true)
        messagingService.IPRestrictOnOff := true;

        //로컬시스템 시간 사용여부, true-사용, false-미사용, 기본값(true)
        messagingService.UseLocalTimeYN := false;

        //그리드 초기화
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
        { 팝빌 사이트에 로그인 상태로 접근할 수 있는 페이지의 팝업 URL을 반환합니다.           
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://docs.popbill.com/message/delphi/api#GetAccessURL
        {**********************************************************************}

        try
                resultURL := messagingService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
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
        { 사용자를 연동회원으로 가입처리합니다.
        { - https://docs.popbill.com/message/delphi/api#JoinMember
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '4364364364';

        // 대표자성명, 최대 100자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 200자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 100자
        joinInfo.BizType := '업태';

        // 종목, 최대 100자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 50자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // 담당자명, 최대 100자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 메일, 최대 100자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := messagingService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetBalance
        {**********************************************************************}

        try
                balance := messagingService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end;
        
end;

procedure TfrmExample.btnGetUnitCost_SMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 문자(SMS) 전송시 과금되는 포인트 단가를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetUnitCost
        {**********************************************************************}
        
        try
                unitcost := messagingService.GetUnitCost(txtCorpNum.text, SMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('SMS 전송단가 : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetUnitCost_LMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 문자(LMS) 전송시 과금되는 포인트 단가를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetUnitCost
        {**********************************************************************}
        
        try
                unitcost := messagingService.GetUnitCost(txtCorpNum.text, LMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('LMS 전송단가 : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetUnitCost_MMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 문자(MMS) 전송시 과금되는 포인트 단가를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetUnitCost
        {**********************************************************************}

        try
                unitcost := messagingService.GetUnitCost(txtCorpNum.text, MMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('MMS 전송단가 : '+ FloatToStr(unitcost));
        end;
end;
    
procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := messagingService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
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
        { 최대 90byte의 단문(SMS) 메시지 1건 전송을 팝빌에 접수합니다.
        { - https://docs.popbill.com/message/delphi/api#SendSMS
        {***************************************************************************}

        try
                // 발신번호 (팝빌에 등록된 발신번호)
                sendNum := '07043042991';

                // 발신자명
                sendName := '발신자명';

                // 수신번호
                receiver := '010-1234-4567';

                // 수신자명
                receiverName := '수신자명';

                //메시지 내용 (90Byte 초과된 내용은 삭제되어 전송됨)
                contents := '단문메시지 입니다.';

                // 전송요청번호
                // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
                // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
                requestNum := txtRequestNum.text;

                // 광고문자 전송여부
                adsYN := false;

                receiptNum := messagingService.SendSMS(txtCorpNum.Text, sendNum,
                                                       sendName, receiver,
                                                       receiverName, contents,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text ,requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
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
        { 최대 90byte의 단문(SMS) 메시지 다수건 전송을 팝빌에 접수합니다. (최대 1,000건)
        { - 수신자마다 개별 내용을 전송할 수 있습니다(대량전송).
        { - https://docs.popbill.com/message/delphi/api#SendSMS_Multi
        {***************************************************************************}

        //수신 정보 배열, 최대 1000건
        SetLength(Messages, 5);

        for i := 0 to Length(Messages) - 1 do begin
            Messages[i] := TSendMessage.create;

            // 발신번호 (팝빌에 등록된 발신번호)
            Messages[i].sender := '070-4304-2991';

            // 발신자명
            Messages[i].senderName := '발신자명' + InttoStr(i);

            // 수신번호
            Messages[i].receiver := '010111222';

            // 메시지 내용 (90Byte 초과된 내용은 삭제되어 전송됨)
            Messages[i].content := '내용내용_' + IntToStr(i);

            // 파트너 지정키
            Messages[i].interOPRefKey := 'TEST' + IntToStr(i);
        end;

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        adsYN := false;

        try
                receiptNum := messagingService.SendSMS(txtCorpNum.Text, Messages,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
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
        { 최대 90byte의 단문(SMS) 메시지 다수건 전송을 팝빌에 접수합니다. (최대 1,000건)
        { - 모든 수신자에게 동일한 내용을 전송할 수 있습니다.(동보전송).
        { - https://docs.popbill.com/message/delphi/api#SendSMS_Multi
        {***************************************************************************}

        //수신 정보 배열, 최대 1000건
        SetLength(Messages, 5);

        for i := 0 to Length(Messages) -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';    // 수신번호
            Messages[i].receiverName := '수신자명';   // 수신자명
            MEssages[i].interOPRefKey := 'TEST' + IntToStr(i);    // 파트너 지정 키
        end;

        // 발신번호 (팝빌에 등록된 발신번호)
        sendNum := '070-4304-2991';

        // 발신자명
        sendName := '발신자명_SMS';

        // (동보) 메시지 내용 (90Byte 초과된 내용은 삭제되어 전송됨)
        contents := '동보전송 내용';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        adsYN := false;

        try
                receiptNum := messagingService.SendSMS(txtCorpNum.Text, sendNum,
                                                       sendName, contents,
                                                       Messages, txtReserveDT.Text,
                                                       adsYN, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
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
        { 최대 2,000byte의 장문(LMS) 메시지 1건 전송을 팝빌에 접수합니다.
        { - https://docs.popbill.com/message/delphi/api#SendLMS
        {***************************************************************************}

        // 발신번호 (팝빌에 등록된 발신번호)
        sendNum := '070-4304-2991';

        // 발신자명
        sendName := '발신자명';

        // 수신번호
        receiver := '010-222-333';

        // 수신자명
        receiverName := '수신자명';

        // 메시지 제목
        subject := '메시지 제목';

        // 메시지 내용 (2000Byte 초과된 내용은 삭제되어 전송됨)
        contents := '장문 문자 문자메시지 내용입니다';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        adsYN := false;

        try
                receiptNum := messagingService.SendLMS(txtCorpNum.Text, sendNum,
                                                       sendName, receiver,
                                                       receiverName, subject,
                                                       contents, txtReserveDT.Text,
                                                       adsYN, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnGetMessageClick(Sender: TObject);
var
        Messages : TSentMessageList;
        i :integer;
begin
        {**********************************************************************}
        { 팝빌에서 반환받은 접수번호를 통해 문자 전송상태 및 결과를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetMessages
        {**********************************************************************}

        try
                Messages := messagingService.GetMessages(txtCorpNum.Text, txtReceiptNum.Text)
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                stringgrid1.RowCount := Length(Messages) + 1;

                for i:= 0 to Length(Messages) -1 do begin

                       // 메시지 제목
                       stringgrid1.Cells[0,i+1] := Messages[i].subject;

                       // 메시지 내용
                       stringgrid1.Cells[1,i+1] := Messages[i].content;

                       // 발신번호
                       stringgrid1.Cells[2,i+1] := Messages[i].sendNum;

                       // 발신자명
                       stringgrid1.Cells[3,i+1] := Messages[i].senderName;

                       // 수신번호
                       stringgrid1.Cells[4,i+1] := Messages[i].receiveNum;

                       // 수신자명
                       stringgrid1.Cells[5,i+1] := Messages[i].receiveName;

                       // 접수일시
                       stringgrid1.Cells[6,i+1] := Messages[i].receiptDT;

                       // 전송일시
                       stringgrid1.Cells[7,i+1] := Messages[i].sendDT;

                       // 전송결과 일시
                       stringgrid1.Cells[8,i+1] := Messages[i].resultDT;

                       // 예약일시
                       stringgrid1.Cells[9,i+1] := Messages[i].reserveDT;

                       // 전송상태 코드
                       stringgrid1.Cells[10,i+1] := IntToStr(Messages[i].state);

                       // 전송결과 코드
                       stringgrid1.Cells[11,i+1] := IntToStr(Messages[i].result);

                       // 메시지 타입
                       stringgrid1.Cells[12,i+1] := GetEnumName(TypeInfo(EnumMessageType),integer(Messages[i].messageType));

                       // 전송처리 이동통신사명
                       stringgrid1.Cells[13,i+1] := Messages[i].tranNet;

                       // 접수번호
                       stringgrid1.Cells[14,i+1] := Messages[i].receiptNum;

                       // 요청번호
                       stringgrid1.Cells[15,i+1] := Messages[i].requestNum;

                       // 파트너 지정 키
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
        { 최대 2,000byte의 장문(LMS) 메시지 다수건 전송을 팝빌에 접수합니다. (최대 1,000건)
        { - 모든 수신자에게 동일한 내용을 전송하거나(동보전송).
        { - https://docs.popbill.com/message/delphi/api#SendLMS_Multi
        {***************************************************************************}

        //수신 정보 배열, 최대 1000건
        SetLength(Messages,5);

        for i := 0 to Length(Messages) -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';    // 수신번호
            Messages[i].receiverName := '수신자명';   // 수신자명
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);  // 파트너 지정키
        end;

        // 발신번호 (팝빌에 등록된 발신번호)
        sendNum := '070-4304-2991';

        // 발신자명
        senderName := '발신자명';

        // (동보) 메시지 제목
        subject := '대량전송 제목';

        // (동보) 메시지 내용 (2000Byte 초과된 내용은 삭제되어 전송됨)
        contents := '동보전송 메시지 내용';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        adsYN := False;

        try
                receiptNum := messagingService.SendLMS(txtCorpNum.Text, sendNum,
                                                       senderName, subject,
                                                       contents, Messages,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
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
        { 최대 2,000byte의 장문(LMS) 메시지 다수건 전송을 팝빌에 접수합니다. (최대 1,000건)
        { - 수신자마다 개별 내용을 전송할 수 있습니다(대량전송).
        { - https://docs.popbill.com/message/delphi/api#SendLMS_Multi
        {***************************************************************************}

        // 전송정보 배열, 최대 1000건
        SetLength(Messages,5);

        for i := 0 to Length(Messages) -1 do begin
            Messages[i] := TSendMessage.create;
                                      
            // 발신번호 (팝빌에 등록된 발신번호)
            Messages[i].sender := '070-4304-2991';

            // 발신자명
            Messages[i].senderName := '발신자명' +IntToStr(i);

            // 수신번호
            Messages[i].receiver := '010111222';

            // 메시지 제목
            Messages[i].subject := '장문제목';

            // 메시지 내용 (2000Byte 초과된 내용은 삭제되어 전송됨)
            Messages[i].content := '장문 문자 메시지의 내용을 기재합니다. - ' + IntToStr(i);

            // 파트너 지정 키
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);
        end;

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        adsYN := False;

        try
                receiptNum := messagingService.SendLMS(txtCorpNum.Text, Messages,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnSendXMSClick(Sender: TObject);
var
        receiptNum, sendNum, sendName, receiver, receiverName, subject, contents, requestNum: String;
        adsYN : Boolean;
begin
        {***************************************************************************}
        { 메시지 길이(90byte)에 따라 단문/장문(SMS/LMS)을 자동으로 인식하여 1건의 메시지를 전송을 팝빌에 접수합니다.
        { - https://docs.popbill.com/message/delphi/api#SendXMS
        {***************************************************************************}

        // 발신번호 (팝빌에 등록된 발신번호)
        sendNum := '070-4304-2991';

        // 발신자명
        sendName := '발신자명';

        // 수신번호
        receiver := '010-111-222';

        // 수신자명
        receiverName := '수신자명';

        // 메시지 제목
        subject := '메시지 제목';

        // 90Byte를 기준으로 단문(SMS)/장문(LMS) 자동 인식되어 전송됩니다.
        // 메시지 내용 (2000Byte 초과된 내용은 삭제되어 전송됨)
        contents := 'XMS란. 90byte를 기준으로 SMS/LMS가 선택 전송됩니다. 2000byte 초과한 내용은 삭제되어 전송됩니다.';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        adsYN := false;

        try
                receiptNum := messagingService.SendXMS(txtCorpNum.Text, sendNum,
                                                       sendName, receiver,
                                                       receiverName, subject,
                                                       contents, txtReserveDT.Text,
                                                       adsYN, txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
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
        { 메시지 길이(90byte)에 따라 단문/장문(SMS/LMS)을 자동으로 인식하여 1건의 메시지를 전송을 팝빌에 접수합니다. (최대 1,000건)
        { - 모든 수신자에게 동일한 내용을 전송하거나(동보전송).
        { - https://docs.popbill.com/message/delphi/api#SendXMS_Multi
        {***************************************************************************}

        //수신 정보 배열, 최대 1000건
        SetLength(Messages, 5);

        for i := 0 to Length(Messages) - 1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';    // 수신번호
            Messages[i].receiverName := '수신자명';   // 수신자명
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);  // 파트너 지정키
        end;

        // 발신번호 (팝빌에 등록된 발신번호)
        sendNum  := '070-4304-2991';

        // 발신자명
        sendName := '발신자명';

        // (동보) 메시지 제목
        subject := '메시지 제목';

        // (동보)메시지 내용
        // 90Byte를 기준으로 단문(SMS)/장문(LMS) 자동 인식되어 전송됩니다.
        // 메시지 내용 (2000Byte 초과된 내용은 삭제되어 전송됨)
        contents := '동보 메세지 내용';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
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
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
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
        { 메시지 길이(90byte)에 따라 단문/장문(SMS/LMS)을 자동으로 인식하여 1건의 메시지를 전송을 팝빌에 접수합니다. (최대 1,000건)
        { - 수신자마다 개별 내용을 전송할 수 있습니다(대량전송).
        { - https://docs.popbill.com/message/delphi/api#SendXMS_Multi
        {***************************************************************************}

        //전송정보 배열 최대 1000건
        SetLength(Messages,10);

        for i := 0 to Length(Messages) -1  do begin
            Messages[i] := TSendMessage.create;

            // 발신번호 (팝빌에 등록된 발신번호)
            Messages[i].sender := '070-4304-2991';

            // 발신자명
            Messages[i].senderName := '발신자명' + IntToStr(i);

            // 수신번호
            Messages[i].receiver := '010-111-222';

            // 메시지 제목
            Messages[i].subject := '메시지 제목';

            // 메시지 내용
            // 90Byte를 기준으로 단문(SMS)/장문(LMS) 자동 인식되어 전송됩니다.
            // 메시지 내용 (2000Byte 초과된 내용은 삭제되어 전송됨)
            Messages[i].content := '문자내용 길이에 대한 자동인식 전송 ' + IntToStr(i);

            // 파트너 지정키
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);
        end;

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        adsYN := false;

        try
                receiptNum := messagingService.SendXMS(txtCorpNum.Text, Messages,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnCancelReserveClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팝빌에서 반환받은 접수번호를 통해 예약접수된 문자 메시지 전송을 취소합니다. (예약시간 10분 전까지 가능)
        { - https://docs.popbill.com/message/delphi/api#CancelReserve
        {**********************************************************************}

        try
                response := messagingService.CancelReserve(txtCorpNum.Text, txtReceiptNum.Text)
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetSentListURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 문자 전송내역 확인 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://docs.popbill.com/message/delphi/api#GetSentListURL
        {**********************************************************************}

        try
                resultURL := messagingService.getSentListURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
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
        { 최대 2,000byte의 메시지와 이미지로 구성된 포토문자(MMS) 1건 전송을 팝빌에 접수합니다.
        { - 이미지 파일 포맷/규격 : 최대 300Kbyte(JPEG, JPG), 가로/세로 1,000px 이하 권장
        { - https://docs.popbill.com/message/delphi/api#SendMMS
        {***************************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        // 발신번호 (팝빌에 등록된 발신번호)
        sendNum := '070-4304-2991';

        // 발신자명
        sendName := '발신자명';

        // 수신번호
        receiver := '010-111-222';

        // 수신자명
        receiverName := '수신자명';

        // 메시지 제목
        subject := '포토 메시지 제목';

        // 메시지 내용 (2000Byte 초과된 내용은 삭제되어 전송됨)
        contents := '포토 메시지 내용';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
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
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
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
        { 최대 2,000byte의 메시지와 이미지로 구성된 포토문자(MMS) 다수건 전송을 팝빌에 접수합니다. (최대 1,000건)
        { - 모든 수신자에게 동일한 내용을 전송하거나(동보전송).
        { - 이미지 파일 포맷/규격 : 최대 300Kbyte(JPEG), 가로/세로 1,000px 이하 권장
        { - https://docs.popbill.com/message/delphi/api#SendMMS_Multi
        {***************************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        //전송정보 배열, 최대 1000건
        SetLength(Messages, 10);

        for i := 0 to Length(Messages) -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';    // 수신번호
            Messages[i].receiverName := '수신자명';   // 수신자명
            Messages[i].interOPRefKey := 'TEST' + IntToSTr(i);  // 파트너 지정키
        end;

        // 발신번호 (팝빌에 등록된 발신번호)
        sendNum := '070-4304-2991';

        // 발신자명
        sendName := '발신자명';

        // (동보) 메시지 제목
        subject := '포토 메시지 제목';

        // (동보) 메시지 내용 (2000Byte 초과된 내용은 삭제되어 전송됨)
        contents := '포토 메시지 내용';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        adsYN := false;

        try
                receiptNum := messagingService.SendMMS(txtCorpNum.Text, sendNum,
                                                       subject, contents,
                                                       Messages, filePath,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
        end;
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 사용하고자 하는 아이디의 중복여부를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#CheckID
        {**********************************************************************}

        try
                response := messagingService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 담당자(팝빌 로그인 계정)를 추가합니다.
        { - https://docs.popbill.com/message/delphi/api#RegistContact
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'testkorea0222_01';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // [필수] 담당자명(한글이나 영문 100자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // [필수] 이메일 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        joinInfo.searchRole := '3';

        try
                response := messagingService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 목록을 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := messagingService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'id(아이디) | email(이메일) | personName(성명) | searchRole(담당자 권한) | ';
                tmp := tmp + 'tel(연락처) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

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
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 수정합니다.
        { - https://docs.popbill.com/message/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := 'delphi 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        contactInfo.searchRole := '3';

        try
                response := messagingService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetCorpInfo
        {**********************************************************************}
               
        try
                corpInfo := messagingService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (대표자성명) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.
        { - https://docs.popbill.com/message/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 100자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 200자
        corpInfo.corpName := '상호';

        // 업태, 최대 100자
        corpInfo.bizType := '업태';

        // 종목, 최대 100자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';

        try
                response := messagingService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
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
        { 검색조건에 해당하는 문자 전송내역을 조회합니다. (조회기간 단위 : 최대 2개월)
        { - 문자 접수일시로부터 6개월 이내 접수건만 조회할 수 있습니다.
        { - https://docs.popbill.com/message/delphi/api#GetMessages
        {**********************************************************************}

        // 검색기간 시작일자, 날짜형식 yyyyMMdd
        SDate := '20220725';

        // 검색기간 종료일자, 날짜형식 yyyyMMdd
        EDate := '20220725';

        //문자메시지 전송상태값 배열, 1:대기, 2:성공, 3:실패, 4:취소
        SetLength(State, 4);
        State[0] := '1';
        State[1] := '2';
        State[2] := '3';
        State[3] := '4';

        // 검색대상 배열, SMS, LMS, MMS ex) Item = SMS, LMS, MMS
        SetLength(Item, 3);
        Item[0] := 'SMS';
        Item[1] := 'LMS';
        Item[2] := 'MMS';

        // 예약전송 검색여부, true(예약전송 검색), false(즉시전송 검색)
        ReserveYN := false;

        // 개인조회여부, true(개인조회), false(전체조회).
        SenderYN := false;

        // 페이지 번호, 기본값 1
        Page := 1;

        // 페이지당 검색갯수, 기본값 500
        PerPage := 5;

        // 정렬방향, D-내림차순 , A-오름차순
        Order := 'D';

        // 조회 검색어, 발신자명 또는 수신자명 기재
        QString := '';

        try
                Messages := messagingService.search(txtCorpNum.text, SDate, EDate, State,
                                                        Item, ReserveYN, SenderYN, Page, PerPage, Order);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'code (응답코드) : '+IntToStr(Messages.code) + #13;
                tmp := tmp + 'total (총 검색결과 건수) : '+ IntToStr(Messages.total) + #13;
                tmp := tmp + 'perPage (페이지당 검색개수) : '+ IntToStr(Messages.perPage) + #13;
                tmp := tmp + 'pageNum (페이지 번호) : '+ IntToStr(Messages.pageNum) + #13;
                tmp := tmp + 'pageCount (페이지 개수) : '+ IntToStr(Messages.pageCount) + #13;
                tmp := tmp + 'message (응답메시지) : '+ Messages.message + #13;

                stringgrid1.RowCount := Length(Messages.list) + 1;

                for i:= 0 to Length(Messages.list) -1 do begin
                        // 메시지 제목
                        stringgrid1.Cells[0,i+1] := Messages.list[i].subject;

                        // 메시지 내용
                        stringgrid1.Cells[1,i+1] := Messages.list[i].content;

                        // 발신번호
                        stringgrid1.Cells[2,i+1] := Messages.list[i].sendNum;

                        // 발신자명
                        stringgrid1.Cells[3,i+1] := Messages.list[i].senderName;

                        // 수신번호
                        stringgrid1.Cells[4,i+1] := Messages.list[i].receiveNum;

                        // 수신자명
                        stringgrid1.Cells[5,i+1] := Messages.list[i].receiveName;

                        // 접수일시
                        stringgrid1.Cells[6,i+1] := Messages.list[i].receiptDT;

                        // 전송일시
                        stringgrid1.Cells[7,i+1] := Messages.list[i].sendDT;

                        // 전송결과 수신일시
                        stringgrid1.Cells[8,i+1] := Messages.list[i].resultDT;

                        // 예약일시
                        stringgrid1.Cells[9,i+1] := Messages.list[i].reserveDT;

                        // 전송상태 코드
                        stringgrid1.Cells[10,i+1] := IntToStr(Messages.list[i].state);

                        // 전송결과 코드
                        stringgrid1.Cells[11,i+1] := IntToStr(Messages.list[i].result);

                        // 메시지 유형
                        stringgrid1.Cells[12,i+1] := GetEnumName(TypeInfo(EnumMessageType),integer(Messages.list[i].messageType));

                        // 전송 이동통신사명
                        stringgrid1.Cells[13,i+1] := Messages.list[i].tranNet;

                        // 접수번호
                        stringgrid1.Cells[14,i+1] := Messages.list[i].receiptNum;

                        // 요청번호
                        stringgrid1.Cells[15,i+1] := Messages.list[i].requestNum;

                        // 파트너 지정 키
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
        { 사업자번호를 조회하여 연동회원 가입여부를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#CheckIsMember
        {**********************************************************************}

        try
                response := messagingService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://docs.popbill.com/message/delphi/api#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := messagingService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
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
        { 전용 080 번호에 등록된 수신거부 목록을 반환합니다.                                    
        { - https://docs.popbill.com/message/delphi/api#GetAutoDenyList
        {**********************************************************************}

        try
             AutoDenyList := messagingService.getAutoDenyList(txtCorpNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;


        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'number(수신거부번호) | regDT(등록일시) ' + #13;

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
        { 팝빌 문자(SMS) API 서비스 과금정보를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetChargeInfo
        {**********************************************************************}
        
        try
                chargeInfo := messagingService.GetChargeInfo(txtCorpNum.text, SMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;

                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetChargeInfo_LMSClick(Sender: TObject);
var
        chargeInfo : TMessageChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 문자(LMS) API 서비스 과금정보를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := messagingService.GetChargeInfo(txtCorpNum.text, LMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;

                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetChargeInfo_MMSClick(Sender: TObject);
var
        chargeInfo : TMessageChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 문자(MMS) API 서비스 과금정보를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := messagingService.GetChargeInfo(txtCorpNum.text, MMS);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;

                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnCheckSenderNumberClick(Sender: TObject);
var
        response : TResponse;
        senderNumber : String;
begin
        {**********************************************************************}
        { 문자 발신번호 등록여부를 확인합니다.
        { - 발신번호 상태가 '승인'인 경우에만 리턴값 'TResponse'의 변수 'code'가 1로 반환됩니다.
        { - https://docs.popbill.com/message/delphi/api#CheckSenderNumber
        {**********************************************************************}

        //확인할 발신번호
        senderNumber := '07079987110';

        try
                response := messagingService.CheckSenderNumber(txtCorpNum.Text, senderNumber);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메지시 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnGetSenderNumberMgtURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 발신번호를 등록하고 내역을 확인하는 문자 발신번호 관리 페이지 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://docs.popbill.com/message/delphi/api#GetSenderNumberMgtURL   
        {**********************************************************************}

        try
                resultURL := messagingService.getSenderNumberMgtURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
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
        { 팝빌에 등록한 연동회원의 문자 발신번호 목록을 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetSenderNumberList
        {**********************************************************************}

        try
             SenderNumberList := messagingService.getSenderNumberList(txtCorpNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                for i := 0 to Length(SenderNumberList) -1 do
                begin
                        tmp := tmp + '******** 문자 발신번호 목록 ['+ IntToStr(i+1) + '] ********' + #13;
                        tmp := tmp + 'number(발신번호) : ' + SenderNumberList[i].number + #13;
                        tmp := tmp + 'state(등록상태) : ' + IntToStr(SenderNumberList[i].state) + #13;
                        tmp := tmp + 'representYN(대표번호 지정여부) : ' + BoolToStr(SenderNumberList[i].representYN) + #13;
                        tmp := tmp + 'memo(메모) : ' + SenderNumberList[i].memo + #13 + #13;
                end;
                ShowMessage(tmp);
        end;


end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 파트너 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://docs.popbill.com/message/delphi/api#GetPartnerURL
        {**********************************************************************}

        try
                resultURL := messagingService.getPartnerURL(txtCorpNum.Text, 'CHRG');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
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
        { 파트너가 할당한 전송요청 번호를 통해 문자 전송상태 및 결과를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetMessagesRN
        {*******************************************************************************}

        try
                Messages := messagingService.GetMessagesRN(txtCorpNum.Text, txtRequestNum.Text)
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
        stringgrid1.RowCount := Length(Messages) + 1;

        for i:= 0 to Length(Messages) -1 do begin

               // 메시지 제목
               stringgrid1.Cells[0,i+1] := Messages[i].subject;

               // 메시지 내용
               stringgrid1.Cells[1,i+1] := Messages[i].content;

               // 발신번호
               stringgrid1.Cells[2,i+1] := Messages[i].sendNum;

               // 발신자명
               stringgrid1.Cells[3,i+1] := Messages[i].senderName;

               // 수신번호
               stringgrid1.Cells[4,i+1] := Messages[i].receiveNum;

               // 수신자명
               stringgrid1.Cells[5,i+1] := Messages[i].receiveName;

               // 접수일시
               stringgrid1.Cells[6,i+1] := Messages[i].receiptDT;

               // 전송일시
               stringgrid1.Cells[7,i+1] := Messages[i].sendDT;

               // 전송결과 일시
               stringgrid1.Cells[8,i+1] := Messages[i].resultDT;

               // 예약일시
               stringgrid1.Cells[9,i+1] := Messages[i].reserveDT;

               // 전송상태 코드
               stringgrid1.Cells[10,i+1] := IntToStr(Messages[i].state);

               // 전송결과 코드
               stringgrid1.Cells[11,i+1] := IntToStr(Messages[i].result);

               // 메시지 타입
               stringgrid1.Cells[12,i+1] := GetEnumName(TypeInfo(EnumMessageType),integer(Messages[i].messageType));

               // 전송처리 이동통신사명
               stringgrid1.Cells[13,i+1] := Messages[i].tranNet;

               // 접수번호
               stringgrid1.Cells[14,i+1] := Messages[i].receiptNum;

               // 요청번호
               stringgrid1.Cells[15,i+1] := Messages[i].requestNum;

               // 파트너 지정 키
               stringgrid1.Cells[16,i+1] := Messages[i].interOPRefKey;
        end;
        end;
end;

procedure TfrmExample.btnCancelReserveRNClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 파트너가 할당한 전송요청 번호를 통해 예약접수된 문자 전송을 취소합니다. (예약시간 10분 전까지 가능)
        { - https://docs.popbill.com/message/delphi/api#CancelReserveRN
        {**********************************************************************}

        try
                response := messagingService.CancelReserveRN(txtCorpNum.Text, txtRequestNum.Text)
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
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
        { 최대 2,000byte의 메시지와 이미지로 구성된 포토문자(MMS) 다수건 전송을 팝빌에 접수합니다. (최대 1,000건)
        { - 수신자마다 개별 내용을 전송할 수 있습니다(대량전송).
        { - 이미지 파일 포맷/규격 : 최대 300Kbyte(JPEG), 가로/세로 1,000px 이하 권장
        { - https://docs.popbill.com/message/delphi/api#SendMMS_Multi
        {***************************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        //전송정보 배열, 최대 1000건
        SetLength(Messages, 5);

        for i := 0 to Length(Messages) -1 do begin
                Messages[i] := TSendMessage.create;
                Messages[i].sender := '07043042991';       //발신번호
                Messages[i].senderName := '발신자명';      //발신자명
                Messages[i].receiver := '010111222';       //수신번호
                Messages[i].receiverName :='수신자명';     //수신자명
                Messages[i].interOPRefKey := 'TEST' + IntToStr(i);   // 파트너 지정 키
        end;

        // 발신번호 (팝빌에 등록된 발신번호)
        sendNum := '070-4304-2991';

        // 메시지 제목
        subject := '포토 대량전송 메시지 제목';

        // 메시지 내용 (2000Byte 초과된 내용은 삭제되어 전송됨)
        contents := '포토 메시지 내용';

        // 전송요청번호
        // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
        // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
        requestNum := txtRequestNum.text;

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        adsYN := false;

        try
                receiptNum := messagingService.SendMMS(txtCorpNum.Text, sendNum,
                                                       subject, contents,
                                                       Messages, filePath,
                                                       txtReserveDT.Text, adsYN,
                                                       txtUserID.text, requestNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                txtReceiptNum.Text := receiptNum;
                ShowMessage('접수번호 (receiptNum) : '+ receiptNum);
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
        { 다량의 문자 전송내역 요약정보를 확인합니다. (최대 1000건)            
        {**********************************************************************}

        // 문자 접수번호 배열 (최대 1000건)
        SetLength(NumList,2);
        NumList[0] := '018061815000000041';
        NumList[1] := '018061815000000042';

        try
                InfoList := messagingService.GetStates(txtCorpNum.text, NumList);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+  messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'rNum(접수번호) | sn(일련번호) | stat(전송 상태코드) | rlt(전송 결과코드) | sDT(전송일시) |';
                tmp := tmp + 'rDT(전송결과 수신일시) | net(전송 이동통신사명) | srt (구 전송 결과코드)' + #13;

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
        { 연동회원 포인트 결제내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://docs.popbill.com/message/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := messagingService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
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
        { 연동회원 포인트 사용내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://docs.popbill.com/message/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := messagingService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
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
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 확인합니다.
        { - https://docs.popbill.com/message/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := messagingService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if messagingService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(messagingService.LastErrCode) + #10#13 +'응답메시지 : '+ messagingService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (아이디) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (담당자 성명) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (담당자 연락처(전화번호)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'email (담당자 이메일) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (등록 일시) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (담당자 권한) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (관리자 여부) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (계정상태) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.



