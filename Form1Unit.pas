unit Form1Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,  System.SyncObjs, UThreadTimer;

const
  WM_CUSTOM_MESSAGE = WM_USER + 1;


type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Button2: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Button3: TButton;
    Memo3: TMemo;
    Label3: TLabel;
    txtMessage: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    FTimerThread1, FTimerThread2: TThreadTimer;
    FReceiverThreadID1, FReceiverThreadID2: DWORD;
    FWndHandle: THandle;
    procedure TimerEvent(Sender: TObject);
    procedure TimerEvent2(Sender: TObject);
    procedure WndProc(var Msg: TMessage); override;

  public
    { Public declarations }
    procedure SendCustomMessage;
    property WndHandle: THandle read FWndHandle;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.WndProc(var Msg: TMessage);
begin
  inherited;

  case Msg.Msg of
    WM_CUSTOM_MESSAGE:
      begin

        ShowMessage('MESSAGE RECEIVED AT MAIN THREAD = '+ Msg.wParam.ToString());
        //WE CAN ADD OTHER LOGIC When Message is Received
        Memo3.Lines.Add(TimeToStr(Now) + ': MESSAGE RECEIVED AT MAIN THREAD = '+ Msg.wParam.ToString());
      end;
  else
      // mandatory call to default message handler
      Msg.Result := DefWindowProc(Handle, Msg.Msg, Msg.wParam, Msg.lParam);
  end;
end;

procedure TForm1.SendCustomMessage;
begin

  //PostMessage(Form1.Handle, WM_CUSTOM_MESSAGE, 0, 0);
  //PostMessage(Handle, CM_MY_THREAD1, 0, 0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  //Create Thread - 1
  FTimerThread1 := TThreadTimer.Create(1000, TimerEvent);  // 1-second interval
  FTimerThread1.Start;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin

  //Create Thread - 2
  FTimerThread2 := TThreadTimer.Create(1000, TimerEvent2);  // 1-second interval
  FTimerThread2.Start;


end;


procedure TForm1.Button3Click(Sender: TObject);
var aMessage: Byte;
begin

  //Send Message to Main Thread
  if txtMessage.Text = '' then txtMessage.Text := '11';
      aMessage := StrToInt(txtMessage.Text);

   PostMessage(Handle, WM_CUSTOM_MESSAGE, aMessage, 22);

end;

procedure TForm1.Button4Click(Sender: TObject);
var aMessage: Byte;
begin
  //Send Message to Child Thread
   if txtMessage.Text = '' then txtMessage.Text := '11';
      aMessage := StrToInt(txtMessage.Text);

  PostMessage(FTimerThread1.WndHandle, CM_MY_THREAD1, aMessage, 44);
  PostMessage(FTimerThread2.WndHandle, CM_MY_THREAD1, aMessage, 33);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//FormCreate
end;

procedure TForm1.TimerEvent(Sender: TObject);
begin
  Memo1.Lines.Add('Timer ticked: ' + TimeToStr(Now));  // Update UI safely
end;

procedure TForm1.TimerEvent2(Sender: TObject);
begin
  Memo2.Lines.Add('Timer ticked: ' + TimeToStr(Now));  // Update UI safely
end;



end.
