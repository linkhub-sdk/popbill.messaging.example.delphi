unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillMessaging, ExtCtrls, Grids;

const
        //��Ʈ�� ID.
        PartnerID = 'INNOPOST';
        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
        SecretKey = 'VGBaxxHL7T4o4LrwDRcALHo0j8LgAxsLGhKqjuCwlX8=';

type
  TfrmExample = class(TForm)
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost_SMS: TButton;
    GroupBox12: TGroupBox;
    btnGetPopBillURL: TButton;
    cbTOGO: TComboBox;
    txtCorpNum: TEdit;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    btnGetPartnerBalance: TButton;
    Label4: TLabel;
    txtUserID: TEdit;
    btnGetUnitCost_LMS: TButton;
    btnGetBalance: TButton;
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
    procedure btnGetPopBillURLClick(Sender: TObject);
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
        //���ݰ�꼭 ��� �ʱ�ȭ.
        messagingService := TMessagingService.Create(PartnerID,SecretKey);
        messagingService.IsTest := true;

        //�׸��� �ʱ�ȭ


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
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

procedure TfrmExample.btnGetPopBillURLClick(Sender: TObject);
var
  resultURL : String;
  TOGO : String;
begin
        TOGO := cbTOGO.Text;

        if Pos(' : ',TOGO) = 0 then begin
                ShowMessage('URL �ڵ带 �����ϼ���.');
                Exit;
        end;
        
        Delete(TOGO, Pos(' : ',TOGO), Length(TOGO) - Pos(' : ',TOGO) + 1);

        try
                resultURL := messagingService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,TOGO);
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
        joinInfo.PartnerID := PartnerID; //��Ʈ�� ���̵�
        joinInfo.CorpNum := '1231212312'; //����ڹ�ȣ '-' ����.
        joinInfo.CEOName := '��ǥ�ڼ���';
        joinInfo.CorpName := '��ȣ';
        joinInfo.Addr := '�ּ�';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '����';
        joinInfo.BizClass := '����';
        joinInfo.ID     := 'userid';  //6�� �̻� 20�� �̸�.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6�� �̻� 20�� �̸�.
        joinInfo.ContactName := '����ڸ�';
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

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

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

        ShowMessage('SMS ���۴ܰ� : '+ FloatToStr(unitcost));
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

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

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

        ShowMessage('SMS ���۴ܰ� : '+ FloatToStr(unitcost));

end;

procedure TfrmExample.btnSendSMS_SingleClick(Sender: TObject);
var
        receiptNum : String;
begin
        try
                receiptNum := messagingService.SendSMS(txtCorpNum.Text,'010-1111-2222','010-1111-2222','������','�ܹ� �޽��� �����Դϴ�.',txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ: '+ receiptNum);

end;

procedure TfrmExample.btnSendThousandClick(Sender: TObject);
var
        Messages : TMessageList;
        receiptNum : String;
        i : Integer;
        Tinit,Tpost,Ttotal :TDateTime;

begin
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TMessage.create;
            Messages[i].sender := '123123123';
            Messages[i].receiver := '12313433563';
            Messages[i].content := '���볻��' + IntToStr(i);

        end;

        try
                Tinit := NOW;
                receiptNum := messagingService.SendSMS(txtCorpNum.Text,Messages,txtReserveDT.Text,txtUserID.Text);
                Tpost := NOW;
                TTotal := TPost - Tinit;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TTotal));
end;

procedure TfrmExample.btnSendThousandSameClick(Sender: TObject);
var
        Messages : TMessageList;
        receiptNum : String;
        i : Integer;
        Tinit,Tpost :TDateTime;

begin
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TMessage.create;
            Messages[i].receiver := '12313433563';
        end;

        try
                Tinit := NOW;
                receiptNum := messagingService.SendSMS(txtCorpNum.Text,'010-1234-1234','�������۳���', Messages,txtReserveDT.Text,txtUserID.Text);
                Tpost := NOW;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message );
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TPost - Tinit));
end;

procedure TfrmExample.btnSendLMSClick(Sender: TObject);
var
        receiptNum : String;
begin
        try
                receiptNum := messagingService.SendLMS(txtCorpNum.Text,'010-1111-2222','010-1111-2222','������','�����Դϴ�.','�幮 ���� ���ڸ޽��� �����Դϴ�.�幮 ���� ���ڸ޽��� �����Դϴ�.�幮 ���� ���ڸ޽��� �����Դϴ�.�幮 ���� ���ڸ޽��� �����Դϴ�.�幮 ���� ���ڸ޽��� �����Դϴ�.�幮 ���� ���ڸ޽��� �����Դϴ�.' +
                '�幮 ���� ���ڸ޽��� �����Դϴ�.�幮 ���� ���ڸ޽��� �����Դϴ�.�幮 ���� ���ڸ޽��� �����Դϴ�.',txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ: '+ receiptNum);

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

        end;
end;

procedure TfrmExample.btnSendLMSThousand_SameClick(Sender: TObject);
var
        Messages : TMessageList;
        receiptNum : String;
        i : Integer;
        Tinit,Tpost :TDateTime;

begin
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TMessage.create;
            Messages[i].receiver := '12313433563';
        end;

        try
                Tinit := NOW;
                receiptNum := messagingService.SendLMS(txtCorpNum.Text,'010-1234-1234','�������� ����','�������۳���', Messages,txtReserveDT.Text,txtUserID.Text);
                Tpost := NOW;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message );
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TPost - Tinit));
end;

procedure TfrmExample.btnSendLMSThousandClick(Sender: TObject);
var
        Messages : TMessageList;
        receiptNum : String;
        i : Integer;
        Tinit,Tpost,Ttotal :TDateTime;

begin
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TMessage.create;
            Messages[i].sender := '123123123';
            Messages[i].receiver := '12313433563';
            Messages[i].content := '�幮�����幮�����幮����. - ' + IntToStr(i);
            Messages[i].subject := '�幮����';
        end;

        try
                Tinit := NOW;
                receiptNum := messagingService.SendLMS(txtCorpNum.Text,Messages,txtReserveDT.Text,txtUserID.Text);
                Tpost := NOW;
                TTotal := TPost - Tinit;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TTotal));
end;

procedure TfrmExample.btnSendXMSClick(Sender: TObject);
var
        receiptNum : String;
begin
        try
                receiptNum := messagingService.SendXMS(txtCorpNum.Text,'010-1111-2222','010-1111-2222','������','�޽��� ����','XMS��. 90byte�� �������� SMS/LMS�� ���� ���۵˴ϴ�. �幮�� 2000byte ���� �ڵ������߸��ϴ�.',txtReserveDT.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ: '+ receiptNum);

end;


procedure TfrmExample.btnSendXMSThousand_SameClick(Sender: TObject);
var
        Messages : TMessageList;
        receiptNum : String;
        i : Integer;
        Tinit,Tpost :TDateTime;

begin
        SetLength(Messages,1000);

        for i := 0 to 1000 -1 do begin
            Messages[i] := TMessage.create;
            Messages[i].receiver := '12313433563';
        end;

        try
                Tinit := NOW;
                receiptNum := messagingService.SendXMS(txtCorpNum.Text,'010-1234-1234','������������','�������۳���', Messages,txtReserveDT.Text,txtUserID.Text);
                Tpost := NOW;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message );
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TPost - Tinit));
end;

procedure TfrmExample.btnSendXMSThousandClick(Sender: TObject);
var
        Messages : TMessageList;
        receiptNum : String;
        i : Integer;
        Tinit,Tpost,Ttotal :TDateTime;

begin
        SetLength(Messages,1000);

        for i := 0 to 500 -1 do begin
            Messages[i] := TMessage.create;
            Messages[i].sender := '123123123';
            Messages[i].receiver := '12313433563';
            Messages[i].content := '���볻�볻�볻�볻�볻��' + IntToStr(i);
        end;

        for i := 500 to 1000 -1 do begin
            Messages[i] := TMessage.create;
            Messages[i].sender := '123123123';
            Messages[i].receiver := '12313433563';
            Messages[i].content := 'XMS��. 90byte�� �������� SMS/LMS�� ���� ���۵˴ϴ�. �幮�� 2000byte ���� �ڵ����� �߸��ϴ�.' + IntToStr(i);
            Messages[i].subject := '��������';
        end;

        try
                Tinit := NOW;
                receiptNum := messagingService.SendXMS(txtCorpNum.Text,Messages,txtReserveDT.Text,txtUserID.Text);
                Tpost := NOW;
                TTotal := TPost - Tinit;
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        txtReceiptNum.Text := receiptNum;

        ShowMessage('������ȣ: '+ receiptNum + ' | ' + FormatDateTime('s.zzz', TTotal));
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
        ShowMessage('ó����� : ' + IntToStr(response.code) + ' | ' +  response.Message);

end;

end.
