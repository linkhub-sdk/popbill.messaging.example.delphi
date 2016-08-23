unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillMessaging, ExtCtrls, Grids;

const

        // 링크허브 파트너 가입시 메일로 발급받은 인증정보(링크아이디, 비밀키) 입력하시기 바랍니다.
        // [참고] 팝빌 서비스 API 이용절차 안내 - http://blog.linkhub.co.kr/105/
        
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
    btnGetPopBillURL_LOGIN: TButton;
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
    Label1: TLabel;
    txtReceiptNum: TEdit;
    btnGetMessage: TButton;
    StringGrid1: TStringGrid;
    btnSendXMSThousand_Same: TButton;
    btnCancelReserve: TButton;
    Label2: TLabel;
    txtReserveDT: TEdit;
    btnSMSPopUp: TButton;
    btnGetUnitCost_MMS: TButton;
    GroupBox6: TGroupBox;
    btnSendMMS: TButton;
    OpenDialog1: TOpenDialog;
    btnSendMMSThousand_Same: TButton;
    btnSendMMS_Thousand: TButton;
    btnGetBalance: TButton;
    btnGetPartnerBalance: TButton;
    btnCheckID: TButton;
    btnCheckIsMember: TButton;
    GroupBox7: TGroupBox;
    btnRegistContact: TButton;
    btnListContact: TButton;
    btnUpdateContact: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    btnSearchMessages: TButton;
    btnGetPopbillURL_CHRG: TButton;
    btnGetAutoDenyList: TButton;
    GroupBox10: TGroupBox;
    btnGetChargeInfo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnGetPopBillURL_LOGINClick(Sender: TObject);
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
    procedure btnSMSPopUpClick(Sender: TObject);
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
    procedure btnGetPopbillURL_CHRGClick(Sender: TObject);
    procedure btnGetAutoDenyListClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
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
        //문자 api 모듈 초기화.
        messagingService := TMessagingService.Create(LinkID,SecretKey);
        
        //연동환경 설정값, 테스트용(true), 상업용(false)
        messagingService.IsTest := true;

        //Exception 처리 설정값, 기본값(true)
        messagingService.IsThrowException := true;

        //그리드 초기화
        stringgrid1.Cells[0,0] := 'state';
        stringgrid1.Cells[1,0] := 'type';
        stringgrid1.Cells[2,0] := 'subject';
        stringgrid1.Cells[3,0] := 'content';
        stringgrid1.ColWidths[3] := 100;
        stringgrid1.Cells[4,0] := 'sendNum';
        stringgrid1.Cells[5,0] := 'senderName';
        stringgrid1.Cells[6,0] := 'receiveNum';
        stringgrid1.Cells[7,0] := 'receiveName';
        stringgrid1.Cells[8,0] := 'reserveDT';
        stringgrid1.Cells[9,0] := 'receiptDT';
        stringgrid1.Cells[10,0] := 'sendDT';
        stringgrid1.Cells[11,0] := 'resultDT';
        stringgrid1.Cells[12,0] := 'sendResult';
        stringgrid1.Cells[13,0] := 'tranNet';
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

procedure TfrmExample.btnGetPopBillURL_LOGINClick(Sender: TObject);
var
        resultURL : String;
begin
        // 연동회원의 팝빌 로그인 URL을 반환합니다.
          
        try
                resultURL := messagingService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'LOGIN');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;



procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        // 파트너의 연동회원으로 신규가입을 신청합니다.
        
        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외.
        joinInfo.CorpNum := '1231212312';

        // 대표자 성명
        joinInfo.CEOName := '대표자성명';

        // 상호
        joinInfo.CorpName := '상호';
        
        // 주소 
        joinInfo.Addr := '주소';

        // 업태 
        joinInfo.BizType := '업태';

        // 종목
        joinInfo.BizClass := '업종';

        // 아이디, 6자 이상 20자 미만.
        joinInfo.ID     := 'userid';

        // 비밀번호, 6자 이상 20자 미만.
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // 담당자 성명
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처 
        joinInfo.ContactTEL :='02-999-9999';

        // 담당자 휴대폰 번호 
        joinInfo.ContactHP := '010-1234-5678';

        // 담당자 팩스번호 
        joinInfo.ContactFAX := '02-999-9998';

        // 담당자 이메일 주소
        joinInfo.ContactEmail := 'test@test.com';

        try
                response := messagingService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        // 연동 과금시, 연동회원의 잔여포인트를 확인합니다.
        
        try
                balance := messagingService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetUnitCost_SMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        // SMS(단문)의 전송단가를 확인합니다.
        
        try
                unitcost := messagingService.GetUnitCost(txtCorpNum.text,SMS);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('SMS 전송단가 : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetUnitCost_LMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        // LMS(장문)의 전송단가를 확인합니다.
        
        try
                unitcost := messagingService.GetUnitCost(txtCorpNum.text,LMS);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('LMS 전송단가 : '+ FloatToStr(unitcost));

end;

procedure TfrmExample.btnGetUnitCost_MMSClick(Sender: TObject);
var
        unitcost : Single;
begin
        // MMS(포토)의 전송단가를 확인합니다.
        
        try
                unitcost := messagingService.GetUnitCost(txtCorpNum.text,MMS);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('MMS 전송단가 : '+ FloatToStr(unitcost));
end;
    
procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        // 파트너 과금시, 잔여 파트너 포인트를 확인합니다.
        
        try
                balance := messagingService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

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
begin
        try
                // 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
                sendNum := '070-7510-3710';

                // 발신자명
                sendName := '발신자명';

                // 수신번호
                receiver := '010-111-222';

                // 수신자명
                receiverName := '수신자명';

                //메시지 내용이 90byte를 초과하는 경우 메시지 내용이 조정되어 전송됨.
                contents := '안녕하세요. ';
                
                // 광고문자 전송여부
                // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
                // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
                adsYN := false;
                 
                receiptNum := messagingService.SendSMS ( txtCorpNum.Text, sendNum, sendName, receiver,
                                                        receiverName, contents, txtReserveDT.Text, adsYN, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum);

end;

procedure TfrmExample.btnSendThousandClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum : String;
        i : Integer;
        Tinit,Tpost,Ttotal :TDateTime;
        adsYN : Boolean;
begin
        //수신 정보 배열, 최대 1000건
        SetLength(Messages,100);

        for i := 0 to 100 -1 do begin
            Messages[i] := TSendMessage.create;

            // 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
            Messages[i].sender := '010-111-222';

            // 발신자명
            Messages[i].senderName := '발신자명' + InttoStr(i);

            // 수신번호
            Messages[i].receiver := '010111222';

            // 메시지 내용, 90byte 초과된 내용은 삭제되어 전송됨
            Messages[i].content := '내용내용' + IntToStr(i);
        end;

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := false;
        
        try
                Tinit := NOW;

                receiptNum := messagingService.SendSMS(txtCorpNum.Text, Messages,
                                                        txtReserveDT.Text, adsYN, txtUserID.Text);
                
                Tpost := NOW;
                TTotal := TPost - Tinit;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TTotal));
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
begin
        //수신 정보 배열, 최대 1000건
        SetLength(Messages,100);

        for i := 0 to 100 -1 do begin
            Messages[i] := TSendMessage.create;

            // 수신번호
            Messages[i].receiver := '010-111-222';
        end;


        // 대량전송 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
        sendNum := '070-7510-3710';

        // 대량전송 발신자명
        sendName := '발신자명_SMS';

        // 대량전송 메시지 내용, 90byte 초과된 내용은 삭제되어 전송됨.
        contents := '대량전송 내용';

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := false;

        try
                Tinit := NOW;

                receiptNum := messagingService.SendSMS(txtCorpNum.Text, sendNum, sendName, contents,
                                                        Messages, txtReserveDT.Text, adsYN, txtUserID.Text);
                Tpost := NOW;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message );
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TPost - Tinit));
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
begin

        // 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
        sendNum := '070-7510-3710';

        // 발신자명
        sendName := '발신자명';

        // 수신번호
        receiver := '010-222-333';

        // 수신자명
        receiverName := '수신자명';

        // 메시지 제목
        subject := '메시지 제목';

        // 메시지 내용, 2000byte 초과된 내용은 삭제되어 전송
        contents := '장문 문자 문자메시지 내용입니다';

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := false;
        
        try
                receiptNum := messagingService.SendLMS(txtCorpNum.Text, sendNum, sendName, receiver, receiverName,
                                                        subject, contents, txtReserveDT.Text, adsYN, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum);

end;

procedure TfrmExample.btnGetMessageClick(Sender: TObject);
var
        Messages : TSentMessageList;
        i :integer;
begin
        // 문자전송요청시 발급받은 접수번호(receiptNum)으로 문자전송상태를 확인합니다
        
        try
                Messages := messagingService.GetMessages(txtCorpNum.Text,txtReceiptNum.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        
        stringgrid1.RowCount := Length(Messages) + 1;

        for i:= 0 to Length(Messages) -1 do begin
               stringgrid1.Cells[0,i+1] := IntToStr(Messages[i].state);
               
               // 메시지 유형 
               stringgrid1.Cells[1,i+1] := GetEnumName(TypeInfo(EnumMessageType),integer(Messages[i].messageType));

               // 제목 
               stringgrid1.Cells[2,i+1] := Messages[i].subject;

               // 내용 
               stringgrid1.Cells[3,i+1] := Messages[i].content;

               // 발신번호 
               stringgrid1.Cells[4,i+1] := Messages[i].sendNum;

               // 발신자명 
               stringgrid1.Cells[5,i+1] := Messages[i].senderName;

               // 수신번호 
               stringgrid1.Cells[6,i+1] := Messages[i].receiveNum;

               // 수신자명 
               stringgrid1.Cells[7,i+1] := Messages[i].receiveName;

               // 예약일시 
               stringgrid1.Cells[8,i+1] := Messages[i].reserveDT;

               // 접수일시 
               stringgrid1.Cells[9,i+1] := Messages[i].receiptDT;

               // 전송일시 
               stringgrid1.Cells[10,i+1] := Messages[i].sendDT;

               // 전송결과 일시 
               stringgrid1.Cells[11,i+1] := Messages[i].resultDT;

               // 이동통신사 전송결과 
               stringgrid1.Cells[12,i+1] := Messages[i].sendResult;

               // 전송 통신사명
               stringgrid1.Cells[13,i+1] := Messages[i].tranNet;
               
        end;
end;

procedure TfrmExample.btnSendLMSThousand_SameClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum : String;
        sendNum : String;
        sendName : String;
        subject : String;
        contents : String;
        i : Integer;
        Tinit,Tpost :TDateTime;
        adsYN : Boolean;
begin
        //수신 정보 배열, 최대 1000건
        SetLength(Messages,100);

        for i := 0 to 100 -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';      // 수신번호
        end;
        
        // 대량전송 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
        sendNum := '070-7510-3710';

        // 발신자명
        sendName := '발신자명';
        
        // 메시지 제목
        subject := '대량전송 제목';

        // 메시지 내용
        contents := '대량전송 메시지 내용';

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := true;
        
        try
                Tinit := NOW;
                
                receiptNum := messagingService.SendLMS(txtCorpNum.Text, sendNum, sendName, subject, contents,
                                                        Messages, txtReserveDT.Text, adsYN, txtUserID.Text);
                
                Tpost := NOW;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message );
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TPost - Tinit));
end;

procedure TfrmExample.btnSendLMSThousandClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum : String;
        i : Integer;
        Tinit,Tpost,Ttotal :TDateTime;
        adsYN : Boolean;

begin
        // 전송정보 배열, 최대 1000건
        SetLength(Messages,100);

        for i := 0 to 100 -1 do begin
            Messages[i] := TSendMessage.create;

            // 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
            Messages[i].sender := '010-111-222';

            // 발신자명
            Messages[i].senderName := '발신자명' +IntToStr(i);

            // 수신번호
            Messages[i].receiver := '010111222';
            
            // 장문메시지 제목
            Messages[i].subject := '장문제목';

            // 장문메시지 내용, 2000byte 초과시
            Messages[i].content := '장문내용장문내용장문내용. - ' + IntToStr(i);        
        end;


        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := true;

        try
                Tinit := NOW;

                receiptNum := messagingService.SendLMS(txtCorpNum.Text,Messages,txtReserveDT.Text,adsYN,txtUserID.Text);
                Tpost := NOW;
                TTotal := TPost - Tinit;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TTotal));
end;

procedure TfrmExample.btnSendXMSClick(Sender: TObject);
var
        receiptNum, sendNum, sendName, receiver, receiverName, subject, contents: String;
        adsYN : Boolean;
begin

        // 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
        sendNum := '070-7510-3710';

        // 발신자명
        sendName := '발신자명';
        
        // 수신번호
        receiver := '010-222-333';

        // 수신자명
        receiverName := '수신자명';

        // 메시지 제목
        subject := '메시지 제목';

        // 90Byte를 기준으로 단문(SMS)/장문(LMS) 자동 인식되어 전송됩니다.
        // 메시지 내용, 2000byte를 초과하는 내용은 삭제되어 전송됩니다.
        contents := 'XMS란. 90byte를 기준으로 SMS/LMS가 선택 전송됩니다. 장문은 2000byte 에서 자동으로잘립니다.';

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := false;
        
        try
                receiptNum := messagingService.SendXMS(txtCorpNum.Text, sendNum, sendName, receiver,receiverName,subject,contents,txtReserveDT.Text,adsYN,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum);

end;


procedure TfrmExample.btnSendXMSThousand_SameClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum, sendNum, sendName, subject, contents : String;
        i : Integer;
        Tinit,Tpost :TDateTime;
        adsYN : Boolean;

begin
        //수신 정보 배열, 최대 1000건
        SetLength(Messages,100);

        for i := 0 to 100 -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';
        end;
        
        // 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
        sendNum  := '070-7510-3710';
        
        // 발신자명
        sendName := '발신자명';
        
        // 메시지 제목
        subject := '대량 메시지 제목';

        // 메시지 내용        
        contents := '대량 전송 내용';

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := false;
        
        try
                Tinit := NOW;

                receiptNum := messagingService.SendXMS(txtCorpNum.Text,sendNum, sendName, subject,contents,Messages,txtReserveDT.Text,adsYN,txtUserID.Text);
                
                Tpost := NOW;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message );
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TPost - Tinit));
end;

procedure TfrmExample.btnSendXMSThousandClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum : String;
        i : Integer;
        Tinit,Tpost,Ttotal :TDateTime;
        adsYN : Boolean;
begin
        //전송정보 배열 최대 1000건
        SetLength(Messages,100);

        for i := 0 to 50 -1 do begin
            Messages[i] := TSendMessage.create;
            
            // 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
            Messages[i].sender := '010-111-222';
            
            // 발신자명
            Messages[i].senderName := '발신자명' + IntToStr(i);

            // 수신번호
            Messages[i].receiver := '010-111-222';

            // 메시지 내용 
            Messages[i].content := '문자내용 길이에 대한 자동인식 전송 ' + IntToStr(i);    // 메시지 내용
        end;

        for i := 50 to 100 -1 do begin
            Messages[i] := TSendMessage.create;

            // 발신번호
            Messages[i].sender := '010-111-222';
            
            // 발신번호
            Messages[i].senderName := '발신자명' + IntToStr(i);

            // 수신번호
            Messages[i].receiver := '010-111-222';
            
            // 메시지 제목
            Messages[i].subject := '제목제목';

            // 메시지 내용
            Messages[i].content := 'XMS란. 90byte를 기준으로 SMS/LMS가 선택 전송됩니다. 장문은 2000byte 에서 자동으로 잘립니다.' + IntToStr(i);
        end;

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := false;       

        try
                Tinit := NOW;

                receiptNum := messagingService.SendXMS(txtCorpNum.Text, Messages, txtReserveDT.Text, adsYN, txtUserID.Text);

                Tpost := NOW;
                TTotal := TPost - Tinit;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TTotal));
end;

procedure TfrmExample.btnCancelReserveClick(Sender: TObject);
var
        response : TResponse;
begin
        // 예약문자 전송을 취소합니다.

        try
                response := messagingService.CancelReserve(txtCorpNum.Text,txtReceiptNum.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('처리결과 : ' + IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnSMSPopUpClick(Sender: TObject);
var
  resultURL : String;
begin
        // 전송내역 조회 URL을 반환합니다.

        try
                resultURL := messagingService.getURL(txtCorpNum.Text,txtUserID.Text,'BOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;



procedure TfrmExample.btnSendMMSClick(Sender: TObject);
var
        filePath, receiptNum, sendNum, sendName, receiver, receiverName, subject, contents : string;
        adsYN : Boolean;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        // 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
        sendNum := '070-7510-3710';

        // 발신자명
        sendName := '발신자명';

        // 수신번호
        receiver := '010-111-222';

        // 수신자명 
        receiverName := '수신자명';

        // 메시지 제목 
        subject := '포토 메시지 제목';

        // 메시지 길이, 2000byte 초과된 내용은 삭제되어 전송
        contents := '포토 메시지 내용';

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := false;

        try

                receiptNum := messagingService.SendMMS(txtCorpNum.Text, sendNum, sendName, receiver,
                                receiverName, subject, contents, filePath, txtReserveDT.Text, adsYN, txtUserID.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum);
end;

procedure TfrmExample.btnSendMMSThousand_SameClick(Sender: TObject);
var
        Messages : TSendMessageList;
        filePath, receiptNum, sendNum, subject, contents : string;
        i : Integer;
        adsYN : Boolean;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        //전송정보 배열, 최대 1000건
        SetLength(Messages,100);

        for i := 0 to 99 do begin
                Messages[i] := TSendMessage.create;
                Messages[i].sender := '07075103710';       //발신번호
                Messages[i].senderName := '발신자명';      //발신자명
                Messages[i].receiver := '010111222';       //수신번호
                Messages[i].receiverName :='수신자명';     //수신자명
        end;

        //대량전송 발신번호, [참고] 발신번호 세칙 안내 - http://blog.linkhub.co.kr/3064/
        sendNum := '070-7510-3710';

        // 메시지 제목
        subject := '포토 대량전송 메시지 제목';

        // 메시지 내용, 2000byte 초과된 내용은 삭제되어 전송
        contents := '포토 메시지 내용';

        // 광고문자 전송여부
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        adsYN := false;

        try
                receiptNum := messagingService.SendMMS(txtCorpNum.Text, sendNum, subject,
                                                contents, Messages, filePath, txtReserveDT.Text, adsYN, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('접수번호: '+ receiptNum);
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        // 팝빌회원 아이디의 중복을 체크합니다.
        
        try
                response := messagingService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        // 담당자를 추가합니다. 

        // [필수] 아이디 (6자 이상 20자 미만)
        joinInfo.id := 'test_201509173';
        
        // [필수] 비밀번호 (6자 이상 20자 미만)
        joinInfo.pwd := 'thisispassword';

        // [필수] 담당자명(한글이나 영문 30자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처
        joinInfo.tel := '070-7510-3710';

        // 휴대폰번호
        joinInfo.hp := '010-1111-2222';

        // 팩스번호
        joinInfo.fax := '02-6442-9700';

        // [필수] 이메일
        joinInfo.email := 'test@test.com';

        // 조회권한(true 회사조회/ false 개인조회)
        joinInfo.searchAllAllowYN := false;

        // 관리자 권한여부
        joinInfo.mgrYN     := false;

        try
                response := messagingService.RegistContact(txtCorpNum.text,joinInfo,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        // 팝빌 연동회원의 담당자 목록을 확인합니다.

        try
                InfoList := messagingService.ListContact(txtCorpNum.text,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        tmp := 'id | email | hp | personName | searchAllAlloyYN | tel | fax | mgrYN | regDT' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + #13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        // 담당자의 정보를 수정합니다.

        
        contactInfo := TContactInfo.Create;

        // 담당자명
        contactInfo.personName := '테스트 담당자';

        // 연락처
        contactInfo.tel := '070-7510-3710';
        
        // 휴대폰번호
        contactInfo.hp := '010-111-222';

        // 이메일 주소
        contactInfo.email := 'test@test.com';
        
        // 팩스번호
        contactInfo.fax := '02-6442-9799';

        // 회사조회 권한여부
        contactInfo.searchAllAllowYN := true;

        // 관리자 권한 여부
        contactInfo.mgrYN := false;

        try
                response := messagingService.UpdateContact(txtCorpNum.text,contactInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        // 팝빌 연동회원의 회사정보를 확인합니다.
        
        try
                corpInfo := messagingService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (대표자성명) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        // 연동회원의 회사정보를 수정합니다.

        corpInfo := TCorpInfo.Create;

        //대표자명
        corpInfo.ceoname := '대표자명';
        
        // 회사명
        corpInfo.corpName := '팝빌';
        
        // 업태
        corpInfo.bizType := '업태_수정';
        
        // 종목
        corpInfo.bizClass := '종목';
        
        // 주소
        corpInfo.addr := '서울특별시 강남구 영동대로 517';
        
        try
                response := messagingService.UpdateCorpInfo(txtCorpNum.text,corpInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnSearchMessagesClick(Sender: TObject);
var
        SDate, EDate, tmp: String;
        Page, PerPage : Integer;
        Order : String;
        State, Item : Array Of String;
        ReserveYN, SenderYN : boolean;
        Messages : TSearchList;
        i : integer;
begin
        // 검색조건에 따라 문자전송 내역을 조회합니다.

        // 검색기간 시작일자, 날짜형식 yyyyMMdd
        SDate := '20160701';
        
        // 검색기간 종료일자, 날짜형식 yyyyMMdd
        EDate := '20160901';

        //문자메시지 전송상태값 배열, 1:대기, 2:성공, 3:실패, 4:취소 ex) State=1,2,4
        SetLength(State, 4);
        State[0] := '1';
        State[1] := '2';
        State[2] := '3';

        // 검색대상 배열, SMS, LMS, MMS ex) Item=SMS,MMS
        SetLength(Item, 3);
        Item[0] := 'LMS';
        Item[1] := 'SMS';
        Item[2] := 'MMS';

        // 예약전송 검색여부, true(예약전송건 검색), false(즉시전송건 검색)
        ReserveYN := false;

        // 개인조회여부, true(개인조회), false(회사조회).
        SenderYN := false;
        
        // 페이지 번호, 기본값 1
        Page := 1;

        // 페이지당 검색갯수, 기본값 500
        PerPage := 30;

        // 정렬방향, 'D' : 내림차순 , 'A' : 오름차순
        Order := 'D';

        try
                Messages := messagingService.search(txtCorpNum.text, SDate, EDate, State,
                                                        Item, ReserveYN, SenderYN, Page, PerPage,
                                                        Order, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'code : '+IntToStr(Messages.code) + #13;
        tmp := tmp + 'total : '+ IntToStr(Messages.total) + #13;
        tmp := tmp + 'perPage : '+ IntToStr(Messages.perPage) + #13;
        tmp := tmp + 'pageNum : '+ IntToStr(Messages.pageNum) + #13;
        tmp := tmp + 'pageCount : '+ IntToStr(Messages.pageCount) + #13;
        tmp := tmp + 'message : '+ Messages.message + #13;

        stringgrid1.RowCount := Length(Messages.list) + 1;
        for i:= 0 to Length(Messages.list) -1 do begin
               stringgrid1.Cells[0,i+1] := IntToStr(Messages.list[i].state);
               stringgrid1.Cells[1,i+1] := GetEnumName(TypeInfo(EnumMessageType),integer(Messages.list[i].messageType));
               stringgrid1.Cells[2,i+1] := Messages.list[i].subject;
               stringgrid1.Cells[3,i+1] := Messages.list[i].content;
               stringgrid1.Cells[4,i+1] := Messages.list[i].sendNum;
               stringgrid1.Cells[5,i+1] := Messages.list[i].senderName;
               stringgrid1.Cells[6,i+1] := Messages.list[i].receiveNum;
               stringgrid1.Cells[7,i+1] := Messages.list[i].receiveName;
               stringgrid1.Cells[8,i+1] := Messages.list[i].reserveDT;
               stringgrid1.Cells[9,i+1] := Messages.list[i].receiptDT;
               stringgrid1.Cells[10,i+1] := Messages.list[i].sendDT;
               stringgrid1.Cells[11,i+1] := Messages.list[i].resultDT;
               stringgrid1.Cells[12,i+1] := Messages.list[i].sendResult;
               stringgrid1.Cells[13,i+1] := Messages.list[i].tranNet;
        end;
        Messages.Free;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        // 해당사업자가 파트너의 연동회원으로 가입되어 있는지 여부를 확인합니다.

        try
                response := messagingService.CheckIsMember(txtCorpNum.text,LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
        resultURL : String;
begin
        // 연동회원의 포인트를 결제하는 URL을 반환합니다.
        
        try
                resultURL := messagingService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetAutoDenyListClick(Sender: TObject);
var
        AutoDenyList : TAutoDenyList;
        tmp : String;
        i : Integer;
begin
        // 080 수신거부 목록을 확인합니다.
        // [참고] 080 수신거부 서비스 신청 안내 - http://blog.linkhub.co.kr/1770
        // [참고] 광고문자 표기 의무 및 전송방법 안내 - http://blog.linkhub.co.kr/2642

        try
             AutoDenyList := messagingService.getAutoDenyList(txtCorpNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' + le.Message);
                        Exit;
                end;
        end;

        tmp := '수신거부번호 (number) | 등록일시 (regDT)' + #13;
        
        for i := 0 to Length(AutoDenyList) -1 do
        begin
                tmp:= tmp + AutoDenyList[i].number + '  |  '
                        + AutoDenyList[i].regDT + #13;
        end;

        ShowMessage(tmp);
end;


procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TMessageChargeInfo;
        tmp : String;
begin
        // 서비스의 과금정보를 확인합니다.
        
        try
                chargeInfo := messagingService.GetChargeInfo(txtCorpNum.text,SMS);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;

        ShowMessage(tmp);


end;

end.



