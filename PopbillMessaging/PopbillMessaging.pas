(*
*=================================================================================
* Unit for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub module
* to accomplish authentication APIs.
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
* Written : 2014-03-22

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
        EnumMessageType = (SMS,LMS,MMS);
        TMessagingService = class(TPopbillBaseService)
        private

        public
                constructor Create(PartnerID : String; SecretKey : String);

                //회원별 전송 단가 확인.
                function GetUnitCost(CorpNum : String; MsgType:EnumMessageType) : Single;
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
end.
