program prjMessagingExample;

uses
  Forms,
  Example in 'Example.pas' {frmExample},
  Linkhub in 'Linkhub\Linkhub.pas',
  Popbill in 'Popbill\Popbill.pas',
  PopbillMessaging in 'PopbillMessaging\PopbillMessaging.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmExample, frmExample);
  Application.Run;
end.
