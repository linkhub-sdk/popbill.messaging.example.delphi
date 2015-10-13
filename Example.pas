unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillMessaging, ExtCtrls, Grids;

const
        //링크아이디.
        LinkID = 'TESTER';
        //비밀키. 유출 주의.
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
    procedure btnGetPopBillURL_LOGINClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCost_SMSClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

        //그리드 초기화
        stringgrid1.Cells[0,0] := 'state';
        stringgrid1.Cells[1,0] := 'type';
        stringgrid1.Cells[2,0] := 'subject';
        stringgrid1.Cells[3,0] := 'content';
        stringgrid1.ColWidths[3] := 100;
        stringgrid1.Cells[4,0] := 'sendnum';
        stringgrid1.Cells[5,0] := 'receiveNum';
        stringgrid1.Cells[6,0] := 'receiveName';
        stringgrid1.Cells[7,0] := 'reserveDT';
        stringgrid1.Cells[8,0] := 'sendDT';
        stringgrid1.Cells[9,0] := 'resultDT';
        stringgrid1.Cells[10,0] := 'sendResult';
        stringgrid1.Cells[11,0] := 'tranNet';        
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
        joinInfo.LinkID := LinkID;          //링크아이디
        joinInfo.CorpNum := '1231212312';   //사업자번호 '-' 제외.
        joinInfo.CEOName := '대표자성명';
        joinInfo.CorpName := '상호';
        joinInfo.Addr := '주소';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '업태';
        joinInfo.BizClass := '업종';
        joinInfo.ID     := 'userid';        //6자 이상 20자 미만.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6자 이상 20자 미만.
        joinInfo.ContactName := '담당자명';
        joinInfo.ContactTEL :='02-999-9999';
        joinInfo.ContactHP := '010-1234-5678';
        joinInfo.ContactFAX := '02-999-9998';
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
        receiver : String;
        receiverName : String;
        contents : String;
        adsYN : Boolean;
begin
        try
                sendNum := '070-7510-3710';             //발신번호
                receiver := '010-1111-2222';             //수신번호
                receiverName := '수신자명';            //수신자명
                contents := '안녕하세요. ';  //메시지 내용이 90byte를 초과하는 경우 메시지 내용이 조정되어 전송됨.
                adsYN := false;                        //광고문자 전송여부
                 
                receiptNum := messagingService.SendSMS(txtCorpNum.Text,sendNum,receiver,receiverName,contents,txtReserveDT.Text,adsYN,txtUserID.Text);
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
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].sender := '123123123';          // 발신번호
            Messages[i].receiver := '12313433563';      // 수신번호
            Messages[i].content := '내용내용' + IntToStr(i);        // 메시지 내용

        end;

        try
                Tinit := NOW;
                adsYN := true;             //광고문자 전송여부

                receiptNum := messagingService.SendSMS(txtCorpNum.Text,Messages,txtReserveDT.Text,adsYN,txtUserID.Text);
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
        contents : String;
        i : Integer;
        Tinit,Tpost :TDateTime;
        adsYN : Boolean;
begin
        //수신 정보 배열, 최대 1000건
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';           // 수신번호
        end;

        try
                Tinit := NOW;
                sendNum := '070-7510-3710';       // 대량전송 발신번호
                contents := '대량전송 내용';     // 대량전송 메시지 내용
                adsYN := false;                  // 광고문자 전송여부
                
                receiptNum := messagingService.SendSMS(txtCorpNum.Text,sendNum,contents,Messages,txtReserveDT.Text,adsYN,txtUserID.Text);
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
        receiver : String;
        receiverName : String;
        subject : String;
        contents : String;
        adsYN : Boolean;
begin
        try
                sendNum := '070-7510-3710';                // 발신번호
                receiver := '010-222-333';               // 수신번호
                receiverName := '수신자명';              // 수신자명
                subject := '메시지 제목';                // 메시지 제목
                contents := '장문 문자 문자메시지 내용입니다';     // 메시지 내용
                adsYN := false;                           // 광고문자 전송여부
                
                receiptNum := messagingService.SendLMS(txtCorpNum.Text,sendNum,receiver,receiverName,subject,contents,txtReserveDT.Text,adsYN,txtUserID.Text);
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
               stringgrid1.Cells[1,i+1] := GetEnumName(TypeInfo(EnumMessageType),integer(Messages[i].messageType));
               stringgrid1.Cells[2,i+1] := Messages[i].subject;
               stringgrid1.Cells[3,i+1] := Messages[i].content;
               stringgrid1.Cells[4,i+1] := Messages[i].sendNum;
               stringgrid1.Cells[5,i+1] := Messages[i].receiveNum;
               stringgrid1.Cells[6,i+1] := Messages[i].receiveName;
               stringgrid1.Cells[7,i+1] := Messages[i].reserveDT;
               stringgrid1.Cells[8,i+1] := Messages[i].sendDT;
               stringgrid1.Cells[9,i+1] := Messages[i].resultDT;
               stringgrid1.Cells[10,i+1] := Messages[i].sendResult;
               stringgrid1.Cells[11,i+1] := Messages[i].tranNet;
        end;
end;

procedure TfrmExample.btnSendLMSThousand_SameClick(Sender: TObject);
var
        Messages : TSendMessageList;
        receiptNum : String;
        sendNum : String;
        subject : String;
        contents : String;
        i : Integer;
        Tinit,Tpost :TDateTime;
        adsYN : Boolean;
begin
        //수신 정보 배열, 최대 1000건
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '010-111-222';       // 수신번호
        end;

        try
                Tinit := NOW;
                sendNum := '070-7510-3710';             // 대량전송 발신번호
                subject := '대량전송 제목';             // 메시지 제목
                contents := '대량전송 메시지 내용';     // 메시지 내용
                adsYN := true;                          // 광고문자 전송여부
                receiptNum := messagingService.SendLMS(txtCorpNum.Text,sendNum,subject,contents, Messages,txtReserveDT.Text,adsYN,txtUserID.Text);
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
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].sender := '123123123';                  // 발신번호
            Messages[i].receiver := '12313433563';              // 수신번호
            Messages[i].subject := '장문제목';                  // 장문메시지 제목
            Messages[i].content := '장문내용장문내용장문내용. - ' + IntToStr(i);        // 장문메시지 내용
        end;

        try
                Tinit := NOW;
                adsYN := true;          //광고문자 전송여부 
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
        receiptNum, sendNum, receiver, receiverName, subject, contents: String;
        adsYN : Boolean;
begin
        try
                sendNum := '070-7510-3710';     // 발신번호
                receiver := '010-222-333';      // 수신번호
                receiverName := '수신자명';     // 수신자명
                subject := '메시지 제목';       // 메시지 제목
                contents := 'XMS란. 90byte를 기준으로 SMS/LMS가 선택 전송됩니다. 장문은 2000byte 에서 자동으로잘립니다.';
                adsYN := false;  // 광고문자 전송여부
                
                receiptNum := messagingService.SendXMS(txtCorpNum.Text,sendNum,receiver,receiverName,subject,contents,txtReserveDT.Text,adsYN,txtUserID.Text);
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
        receiptNum, sendNum, subject, contents : String;
        i : Integer;
        Tinit,Tpost :TDateTime;
        adsYN : Boolean;

begin
        //수신 정보 배열, 최대 1000건
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].receiver := '12313433563';
        end;

        try
                Tinit := NOW;
                sendNum  := '070-7510-3710';              //발신번호
                subject := '대량 메시지 제목';           //메시지 제목
                contents := '대량 전송 내용';
                adsYN := false;                          // 광고문자 전송여부 

                receiptNum := messagingService.SendXMS(txtCorpNum.Text,sendNum,subject,contents,Messages,txtReserveDT.Text,adsYN,txtUserID.Text);
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
        SetLength(Messages,1000);

        for i := 0 to 500 -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].sender := '123123123';                  // 발신번호
            Messages[i].receiver := '12313433563';              // 수신번호
            Messages[i].content := '문자내용 길이에 대한 자동인식 전송 ' + IntToStr(i);    // 메시지 내용
        end;

        for i := 500 to 1000 -1 do begin
            Messages[i] := TSendMessage.create;
            Messages[i].sender := '123123123';                  // 발신번호
            Messages[i].receiver := '12313433563';              // 수신번호
             Messages[i].subject := '제목제목';                  //메시지 제목
            Messages[i].content := 'XMS란. 90byte를 기준으로 SMS/LMS가 선택 전송됩니다. 장문은 2000byte 에서 자동으로 잘립니다.' + IntToStr(i);
        end;

        try
                Tinit := NOW;
                adsYN := false;          // 광고문자 전송여부 
                receiptNum := messagingService.SendXMS(txtCorpNum.Text,Messages,txtReserveDT.Text,adsYN,txtUserID.Text);
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
        filePath, receiptNum, sendNum, receiver, receiverName, subject, contents : string;
        adsYN : Boolean;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        try
                sendNum := '070-7510-3710';       //발신번호
                receiver := '010-111-222';        //수신번호
                receiverName := '수신자명';
                subject := '포토 메시지 제목';
                contents := '포토 메시지 내용'; 
                adsYN := false;                  //광고문자 전송여부

                receiptNum := messagingService.SendMMS(txtCorpNum.Text,sendNum,receiver,receiverName,subject,contents,filePath, txtReserveDT.Text,adsYN,txtUserID.Text);
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
        SetLength(Messages,1000);

        for i := 0 to 999 do begin
                Messages[i] := TSendMessage.create;
                Messages[i].receiver := '010111222';       //수신번호
                Messages[i].receiverName :='수신자명';     //수신자명
        end;

        try
                sendNum := '070-7510-3710';                  //대량전송 발신번호
                subject := '포토 대량전송 메시지 제목';
                contents := '포토 메시지 내용';
                adsYN := false;                             //광고문자 전송여부
                
                receiptNum := messagingService.SendMMS(txtCorpNum.Text, sendNum, subject, contents, Messages, filePath, txtReserveDT.Text, adsYN, txtUserID.Text);
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
        joinInfo.id := 'test_201509173';                // [필수] 아이디 (6자 이상 20자 미만)
        joinInfo.pwd := 'thisispassword';               // [필수] 비밀번호 (6자 이상 20자 미만)
        joinInfo.personName := '담당자성명';            // [필수] 담당자명(한글이나 영문 30자 이내)
        joinInfo.tel := '070-7510-3710';                // [필수] 연락처
        joinInfo.hp := '010-1111-2222';                 // 휴대폰번호
        joinInfo.fax := '02-6442-9700';                 // 팩스번호
        joinInfo.email := 'test@test.com';              // [필수] 이메일
        joinInfo.searchAllAllowYN := false;             // 조회권한(true 회사조회/ false 개인조회)
        joinInfo.mgrYN     := false;                    // 관리자 권한여부 

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
        contactInfo := TContactInfo.Create;

        contactInfo.personName := '테스트 담당자';      // 담당자명
        contactInfo.tel := '070-7510-3710';             // 연락처
        contactInfo.hp := '010-4324-1111';              // 휴대폰번호
        contactInfo.email := 'test@test.com';           // 이메일 주소
        contactInfo.fax := '02-6442-9799';              // 팩스번호
        contactInfo.searchAllAllowYN := true;           // 회사조회 권한여부
        contactInfo.mgrYN := false;                     // 관리자 전환 여부 

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
        try
                corpInfo := messagingService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        corpInfo := TCorpInfo.Create;

        corpInfo.ceoname := '대표자명';         //대표자명
        corpInfo.corpName := '팝빌';    // 회사명
        corpInfo.bizType := '업태_수정';             // 업태
        corpInfo.bizClass := '업종';            // 업종
        corpInfo.addr := '서울특별시 강남구 영동대로 517';  // 주소
        
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
        State, Item : Array Of String;
        ReserveYN, SenderYN : boolean;
        Messages : TSearchList;
        i : integer;
begin

        SDate := '20151001';    // 검색기간 시작일자
        EDate := '20151013';    // 검색기간 종료일자

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

        ReserveYN := false;   // 예약전송 검색여부, true(예약전송건만 검색), false(전체검색)
        SenderYN := false;    // 개인조회여부, true(개인조회), false(회사조회).
        Page := 1;            // 페이지 번호, 기본값 1
        PerPage := 1001;       // 페이지당 검색갯수, 기본값 500

        try
                Messages := messagingService.search(txtCorpNum.text,SDate,EDate,State,Item,ReserveYN,SenderYN,Page,PerPage,txtUserID.text);
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
               stringgrid1.Cells[5,i+1] := Messages.list[i].receiveNum;
               stringgrid1.Cells[6,i+1] := Messages.list[i].receiveName;
               stringgrid1.Cells[7,i+1] := Messages.list[i].reserveDT;
               stringgrid1.Cells[8,i+1] := Messages.list[i].sendDT;
               stringgrid1.Cells[9,i+1] := Messages.list[i].resultDT;
               stringgrid1.Cells[10,i+1] := Messages.list[i].sendResult;
               stringgrid1.Cells[11,i+1] := Messages.list[i].tranNet;               
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
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

end.



