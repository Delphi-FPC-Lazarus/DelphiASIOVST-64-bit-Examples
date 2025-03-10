unit URMCPatchView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,ExtCtrls,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,URMCEmptyPanel;

type
  TRMCPatchView =class;
  TOnPatchClicked = procedure (Sender:TRMCPatchView;index:integer) of object;
  TonPatchButtonClicked = procedure (Sender:TObject;index:integer) of object;
  TRMCPatchView = class(TFrame)
    Label1: TLabel;
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
    FBrowsed: boolean;
  protected
    procedure SetCaption(caption:string);
  public
    { Public declarations }
    procedure SetSelected(selected,browseditem:boolean);
    procedure SetTop(top:integer);
    procedure WM_NCPaint(var Msg: TWMNCPaint); message WM_NCPaint;
    property Caption: string write SetCaption;
    constructor Create(owner: TComponent); override;
  end;

procedure SetHeaderColors(_HeaderUnselected,_Headerselected,_HeaderUnselectedFont,_HeaderselectedFont:TColor);
procedure SetS52Panel(panel:TPanel;selected:boolean=false);overload;
procedure SetS52Panel(label1:TLabel;selected:boolean);overload;
procedure SetS52Panel(panel:TRMCEmptyPanel;selected:boolean=false);overload;

const HEADERSELECTION_NONE = 0;
      HEADERSELECTION_SELECTED = 1;

implementation

{$R *.dfm}

{ TRMCPatchView }

VAR HeaderUnselected,Headerselected,HeaderUnselectedFont,HeaderselectedFont:TColor;

procedure SetHeaderColors(_HeaderUnselected,_Headerselected,_HeaderUnselectedFont,_HeaderselectedFont:TColor);
begin
  HeaderUnselected     := _HeaderUnselected;
  HeaderSelected       := _Headerselected;
  HeaderSelectedFont   := _HeaderUnselectedFont;
  HeaderUnselectedFont :=_HeaderselectedFont;
end;


constructor TRMCPatchView.Create(owner: TComponent);
VAR done:boolean;
begin
  inherited;
  color:=HeaderUnselected;
  BorderWidth:=0;
  font.name:='Tahoma';
  font.size:=9;
  Font.Color:=HeaderUnselectedFont;
  repeat
  try
    done:=true;
    Name:='TRMCPatchView'+inttostr(GetTickCount64);
  except
    done:=false;
  end;
  until done;

end;

procedure TRMCPatchView.Label1Click(Sender: TObject);
begin
  Click;
end;

procedure TRMCPatchView.SetCaption(caption: string);
VAR p:integer;
  function Strip(s:string):string;
  begin
    while s<>'' do
    begin
      if s[1]=' ' then s:=Copy(s,2,length(s))
      else if s[length(s)]=' ' then s:=Copy(s,1,length(s)-1)
      else begin result:=s; exit; end;
    end;
  end;
begin

  p:=pos('-',caption);
  if p=0 then Label1.Caption:=caption
         else Label1.Caption:=Strip(Copy(caption,1,p-1))+#13#10+Strip(Copy(caption,p+1));
//  if Width>160 then font.Size:=9;
//  if Width>300 then font.Size:=9;
end;

procedure TRMCPatchView.SetSelected(selected, browseditem: boolean);
var Msg: TWMNCPaint;
begin
  if FBrowsed<>browseditem then
  begin
    FBrowsed:=browseditem;
    WM_NCPaint(Msg);
  end;
  if selected then   begin color:=HeaderSelected; Font.Color:=HeaderSelectedFont; end
              else   begin color:=HeaderUnselected; Font.Color:=HeaderUnselectedFont; end
end;

procedure TRMCPatchView.SetTop(top: integer);
begin
  label1.Margins.Top:=Top;
end;

procedure TRMCPatchView.WM_NCPaint(var Msg: TWMNCPaint);
var
  DC: HDC;
  OldBrush: HBRUSH;
  Pen,OldPen: HPEN;
begin
  DC := 0;
  OldBrush := 0;
  OldPen := 0;
  try
    {Must use a WindowDC or you can't draw outside the client area}
    DC := GetWindowDC(Handle);
    {Use a "clear" brush and an appropriately colored pen}
    OldBrush := SelectObject(DC, GetStockObject(NULL_BRUSH));
    if FBrowsed then
      Pen := CreatePen(PS_SOLID, 1, HeaderSelected)
    else
      Pen := CreatePen(PS_SOLID, 1, HeaderUnselected);
    OldPen := SelectObject(dc, Pen);
    {Draw the border}
    Rectangle(DC, 0, 0, Width, Height);
    {Tell Windows you did it}
    Msg.Result := 0;
  finally
    {Clean up the mess you made}
    if DC <> 0 then
    begin
      if OldPen <> 0 then
        SelectObject(DC, OldPen);
      DeleteObject(Pen);
      if OldBrush <> 0 then
        SelectObject(DC, OldBrush);
      ReleaseDC(Handle, DC);
    end;
  end;
end;

procedure SetS52Panel(panel:TPanel;selected:boolean);
begin
  if selected then
  begin
    panel.Color:=HeaderSelected;
    panel.Font.Color:=HeaderSelectedFont;
  end
  else
  begin
    panel.Color:=HeaderUnselected;
    panel.Font.Color:=HeaderUnselectedFont;
  end
end;

procedure SetS52Panel(panel:TRMCEmptyPanel;selected:boolean);
begin
  if selected then
  begin
    panel.Color:=HeaderSelected;
    panel.Font.Color:=HeaderSelectedFont;
  end
  else
  begin
    panel.Color:=HeaderUnselected;
    panel.Font.Color:=HeaderUnselectedFont;
  end
end;


procedure SetS52Panel(label1:TLabel;selected:boolean);
begin
  if selected then
  begin
    Label1.Color:=HeaderSelected;
    Label1.Font.Color:=HeaderSelectedFont;
  end
  else
  begin
     Label1.Color:=HeaderUnselected;
     Label1.Font.Color:=HeaderUnselectedFont;
  end;
end;


initialization
  SetHeaderColors($75520E,$BC9C5A,clWhite,$D2BD8A);
end.
