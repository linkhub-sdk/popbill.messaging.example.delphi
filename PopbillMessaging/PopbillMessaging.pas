(*
*=================================================================================
* Unit for base module for Popbill Messaging API SDK. Main functionality is to
* send Short Messaging To Cell phones. Also LMS and MMS.
*
* This module uses synapse library.( http://www.ararat.cz/synapse/doku.php/ )
* It's full open source library, free to use include commercial application.
* If you wish to donate that, visit their site.
* So, before using this module, you need to install synapse by user self.
* You can refer their site or detailed infomation about installation is available
* from below our site. We appreciate your visiting.
*
* For strongly secured communications, this module uses SSL/TLS with OpenSSL.
* So You need two dlls (libeay32.dll and ssleay32.dll) from OpenSSL. You can
* get it from Fulgan. ( http://indy.fulgan.com/SSL/ ) We recommend i386_win32 version.
* And also, dlls must be released with your executions. That's the drawback of this
* module, but we acommplished higher security level against that.
*
* http://www.popbill.com
* Author : Kim Seongjun (pallet027@gmail.com)
* Written : 2014-04-01

* Thanks for your interest. 
*=================================================================================
*)
unit PopbillMessaging;

interface
uses
        TypInfo,SysUtils,Classes,
        Popbill,
        Linkhub;
type
        EnumMessageType = (SMS,LMS,XMS,MMS);

        TMessage = class
        public
                sender          : string;
                receiver        : string;
                receiverName    : string;
                content         : string;
                subject         : string;
        end;

        TMessageList = Array Of TMessage;

        TSentMessage = class
        public
                state           : Integer;
                subject         : string;
                messageType     : EnumMessageType;
                content         : string;
                sendNum         : string;
                receiveNum      : string;
                receiveName     : string;
                sendDT          : string;
                resultDT        : string;
                sendResult      : string;
        end;

        TSentMessageList = Array of TSentMessage;

        TMessagingService = class(TPopbillBaseService)
        private
                function SendMessage(MessageType : EnumMessageType; CorpNum : String; sender : string; content : string; subject : string; Messages: TMessageList; reserveDT : String; UserID : String) : String;
        public
                constructor Create(PartnerID : String; SecretKey : String);

                //ȸ���� ���� �ܰ� Ȯ��.
                function GetUnitCost(CorpNum : String; MsgType:EnumMessageType) : Single;

                //SMS �����Լ�.
                function SendSMS(CorpNum : String; sender : string ; receiver : string; receiverName : String; content : String; reserveDT : String; UserID : String) : String; overload;
                function SendSMS(CorpNum : String; Messages : TMessageList; reserveDT : String; UserID : String) : String; overload;
                function SendSMS(CorpNum : String; sender : string; content : string; Messages: TMessageList; reserveDT : String; UserID : String) : String; overload;

                //LMS �����Լ�.
                function SendLMS(CorpNum : String; sender : string ; receiver : string; receiverName : String; subject : String; content : String; reserveDT : String; UserID : String) : String; overload;
                function SendLMS(CorpNum : String; Messages : TMessageList; reserveDT : String; UserID : String) : String; overload;
                function SendLMS(CorpNum : String; sender : String; subject : String; content : string; Messages: TMessageList; reserveDT : String; UserID : String) : String; overload;

                //XMS �����Լ�.
                function SendXMS(CorpNum : String; sender : string ; receiver : string; receiverName : String; subject : String; content : String; reserveDT : String; UserID : String) : String; overload;
                function SendXMS(CorpNum : String; Messages : TMessageList; reserveDT : String; UserID : String) : String; overload;
                function SendXMS(CorpNum : String; sender : String; subject : String; content : string; Messages: TMessageList; reserveDT : String; UserID : String) : String; overload;

                //�޽��� �󼼳��� �� ���ۻ��� Ȯ��.
                function GetMessages(CorpNum : String; receiptNum : string; UserID : String) :TSentMessageList;
        end;
implementation
constructor TMessagingService.Create(PartnerID : String; SecretKey : String);
begin
       inherited Create(PartnerID,SecretKey);
       AddScope('150');
       AddScope('151');
       AddScope('152');
end;

function TMessagingService.GetUnitCost(CorpNum : String; MsgType:EnumMessageType) : Single;
var
        responseJson : string;
begin
        responseJson := httpget('/Message/UnitCost?Type=' + GetEnumName(TypeInfo(EnumMessageType),integer(MsgType)),CorpNum,'');

        result := strToFloat(getJSonString( responseJson,'unitCost'));

end;

function TMessagingService.SendMessage(MessageType : EnumMessageType; CorpNum : String; sender : string; content : string; subject : string; Messages: TMessageList; reserveDT : String; UserID : String) : String;
var
        requestJson, responseJson : string;
        i : Integer;
begin

        if Length(Messages) = 0 then raise EPopbillException.Create(-99999999,'������ �޽����� �Էµ��� �ʾҽ��ϴ�.');

        requestJson := '{';

        if sender <> ''          then requestJson := requestJson + '"snd":"' + EscapeString(sender) + '",';
        if content <> ''         then requestJson := requestJson + '"content":"' + EscapeString(content) + '",';
        if subject <> ''         then requestJson := requestJson + '"subject":"' + EscapeString(subject) + '",';
        if reserveDT <> ''       then requestJson := requestJson + '"sndDT":"' + EscapeString(reserveDT) + '",';

        requestJson := requestJson + '"msgs":[';
        for i := 0 to Length(Messages) - 1 do begin
                requestJson := requestJson +
                        '{"snd":"'+EscapeString(Messages[i].sender)+'",'+
                        '"rcv":"'+EscapeString(Messages[i].receiver)+'",'+
                        '"rcvnm":"'+EscapeString(Messages[i].receiverName)+'",'+
                        '"msg":"'+EscapeString(Messages[i].content)+'",'+
                        '"sjt":"'+EscapeString(Messages[i].subject)+'"}';

                if i < Length(Messages) - 1 then requestJson := requestJson + ',';
        end;
        requestJson := requestJson + ']';

        requestJson := requestJson + '}';

        responseJson := httppost('/' + GetEnumName(TypeInfo(EnumMessageType),integer(MessageType)) ,CorpNum,UserID,requestJson);

        result := getJsonString(responseJson,'receiptNum');

end;

function TMessagingService.SendSMS(CorpNum : String; sender : string ; receiver : string; receiverName : String; content : String; reserveDT : String; UserID : String) : String;
var
        Messages : TMessageList;
begin

        SetLength(Messages,1);

        Messages[0] := TMessage.Create;

        Messages[0].sender := sender;
        Messages[0].receiver := receiver;
        Messages[0].receiverName := receiverName;
        Messages[0].content := content;

        result := SendSMS(CorpNum,Messages,reserveDT,UserID);

end;

function TMessagingService.SendSMS(CorpNum : String; Messages : TMessageList; reserveDT : String; UserID : String) : String;
begin
        result:= SendSMS(CorpNum,'','',Messages,reserveDT,UserID);

end;

function TMessagingService.SendSMS(CorpNum : String; sender : string; content : string; Messages: TMessageList; reserveDT : String; UserID : String) : String;
begin
        result := SendMessage(SMS,CorpNum,sender,content,'',Messages,reserveDT,UserID);
end;

function TMessagingService.SendLMS(CorpNum : String; sender : string ; receiver : string; receiverName : String; subject : String; content : String; reserveDT : String; UserID : String) : String;
var
        Messages : TMessageList;
begin

        SetLength(Messages,1);

        Messages[0] := TMessage.Create;

        Messages[0].sender := sender;
        Messages[0].receiver := receiver;
        Messages[0].receiverName := receiverName;
        Messages[0].content := content;
        Messages[0].subject := subject;

        result := SendLMS(CorpNum,Messages,reserveDT,UserID);

end;

function TMessagingService.SendLMS(CorpNum : String; Messages : TMessageList; reserveDT : String; UserID : String) : String;
begin
        result:= SendLMS(CorpNum,'','','',Messages,reserveDT,UserID);

end;

function TMessagingService.SendLMS(CorpNum : String; sender : string; subject : String; content : string; Messages: TMessageList; reserveDT : String; UserID : String) : String;
begin
        result := SendMessage(LMS,CorpNum,sender,content,subject,Messages,reserveDT,UserID);
end;

function TMessagingService.SendXMS(CorpNum : String; sender : string ; receiver : string; receiverName : String; subject : String; content : String; reserveDT : String; UserID : String) : String;
var
        Messages : TMessageList;
begin

        SetLength(Messages,1);

        Messages[0] := TMessage.Create;

        Messages[0].sender := sender;
        Messages[0].receiver := receiver;
        Messages[0].receiverName := receiverName;
        Messages[0].content := content;
        Messages[0].subject := subject;

        result := SendXMS(CorpNum,Messages,reserveDT,UserID);

end;

function TMessagingService.SendXMS(CorpNum : String; Messages : TMessageList; reserveDT : String; UserID : String) : String;
begin
        result:= SendXMS(CorpNum,'','','',Messages,reserveDT,UserID);

end;

function TMessagingService.SendXMS(CorpNum : String; sender : string; subject : String; content : string; Messages: TMessageList; reserveDT : String; UserID : String) : String;
begin
        result := SendMessage(XMS,CorpNum,sender,content,subject,Messages,reserveDT,UserID);
end;


function TMessagingService.GetMessages(CorpNum : String; receiptNum : string; UserID : String) :TSentMessageList;
var
        responseJson : String;
        jSons : ArrayOfString;
        i : Integer;
begin
        if receiptNum = '' then raise EPopbillException.Create(-99999999,'No ReceiptNum');

        responseJson := httpget('/Message/' + receiptNum,CorpNum,UserID);

        try
                jSons := ParseJsonList(responseJson);
                SetLength(result,Length(jSons));

                for i := 0 to Length(jSons)-1 do
                begin
                        result[i] := TSentMessage.Create;

                        result[i].state := getJSonInteger(jsons[i],'state');
                        result[i].subject := getJSonString(jsons[i],'subject');
                        result[i].messageType := EnumMessageTYpe(GetEnumValue(TypeInfo(EnumMessageTYpe),getJSonString(jsons[i],'type')));
                        result[i].content := getJSonString(jsons[i],'content');
                        result[i].sendNum := getJSonString(jsons[i],'sendNum');
                        result[i].receiveNum := getJSonString(jsons[i],'receiveNum');
                        result[i].receiveName := getJSonString(jsons[i],'receiveName');
                        result[i].sendDT := getJSonString(jsons[i],'sendDT');
                        result[i].resultDT := getJSonString(jsons[i],'resultDT');
                        result[i].sendResult := getJSonString(jsons[i],'sendResult');



                end;

        except on E:Exception do
                raise EPopbillException.Create(-99999999,'���ó�� ����.[Malformed Json]');
        end;

end;
//End of Unit;
end.
