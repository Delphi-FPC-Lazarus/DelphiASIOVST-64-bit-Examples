unit URMCRomplerView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,URMCEmptyPanel,URMCVSTView,
  URMCControls,Vcl.StdCtrls,URMCRomplerFrame,URMCEffects;
type
  TRMCRomplerView = class (TRMCVSTView)
  private
    frame:TRMCRomplerFrame;
    FPerfPanel:TRMCEffects;
    procedure UIChanged(Sender: TObject; Index, Value: Integer);
  protected
  public
    procedure ChangePCC(pcc,Value: Integer);override;
   constructor create(aowner: TComponent);override;
    procedure Centre(w, h: integer);
    procedure Load(aBasePanel:TCustomPanel);
 end;

implementation

uses System.Types;

constructor TRMCRomplerView.Create(aowner: TComponent);
begin
  DebugName:='TRomplerView';
  inherited ;
  Scalable:=false;
  frame:=TRMCRomplerFrame.Create(self);
  frame.Name:='Fietbel'+inttostr(GetTickCount);
  parent:=TWinControl(aowner);
  frame.parent:=self;
  frame.Visible:=true;
  Width:=frame.Width;
  Height:=frame.Height;

  Load(frame.RMCEmptyPanel1);
  OnPCCChanged:=NIL;
end;

procedure TRMCRomplerView.Centre(w, h: integer);
begin
  frame.align:=alNone;
  frame.left:=(w-frame.width) DIV 2;
  frame.top:=(h-frame.height) DIV 2;
  Width:=w;
  Height:=h;
end;


procedure TRMCRomplerView.Load(aBasePanel:TCustomPanel);
begin
  inherited Load(aBasePanel);
  setDefaultOnChangeHandler;
  OnChanged:=UIChanged;
  FPerfPanel:=TRMCEffects.Create(self);
  FPerfPanel.Parent:=self;
  FPerfPanel.Left:=420 ;
  FPerfPanel.Top :=45;
  FPerfPanel.OnUIChanged:=UIChanged;
end;

procedure TRMCRomplerView.UIChanged(Sender: TObject; Index,Value: Integer);
begin
  if assigned(OnPCCChanged) then OnPCCChanged(self,index,value);
end;

procedure TRMCRomplerView.ChangePCC(pcc,Value: Integer);
begin
  FPerfPanel.ChangePCC(pcc,value);
  SetValue(pcc,value);
end;

end.
