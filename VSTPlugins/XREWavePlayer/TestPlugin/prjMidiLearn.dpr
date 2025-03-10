program prjMidiLearn;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {Form1},
  UMidiPorts in '..\..\Common\UMidiPorts.pas',
  MidiBase in '..\..\Common\MidiBase.pas',
  UMidiNrpn in '..\..\Common\UMidiNrpn.pas',
  UMidiEvent in '..\..\Common\UMidiEvent.pas',
  MidiBaseComm in '..\..\Common\MidiBaseComm.pas',
  UAckedSerial in '..\..\..\Common\UAckedSerial.pas',
  UAckedSerialRMSProtocol in '..\..\..\Common\UAckedSerialRMSProtocol.pas',
  URMSProtocol in '..\..\..\Common\URMSProtocol.pas',
  UAckedSerialRMSProtocolMidi in '..\..\Common\UAckedSerialRMSProtocolMidi.pas',
  URegVeryEasy in '..\..\..\Common\URegVeryEasy.pas',
  UTickCount in '..\..\..\Common\UTickCount.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
