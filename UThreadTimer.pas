unit UThreadTimer;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.dialogs;

const
  CM_MY_THREAD1 = WM_USER + 100;


type
  TThreadTimer = class(TThread)
  private
    FInterval: Cardinal; // Interval in milliseconds
    FOnTimer: TNotifyEvent; // Event handler for the timer
    FCounter: Integer;
    FThreadID: DWORD;
    FWndHandle: THandle;
  protected
    procedure Execute; override;
    procedure DoTimerEvent; // Method to trigger the timer event
    procedure WndProc(var Msg: TMessage); virtual;
  public
    constructor Create(AInterval: Cardinal; AOnTimer: TNotifyEvent);
    procedure Start;
    procedure Stop;
    property ThreadID: DWORD read FThreadID;
    property WndHandle: THandle read FWndHandle;
  end;

implementation

constructor TThreadTimer.Create(AInterval: Cardinal; AOnTimer: TNotifyEvent);
begin
  inherited Create(True); // Create the thread suspended
  FInterval := AInterval;
  FOnTimer := AOnTimer;
  FreeOnTerminate := True; // Automatically free when the thread terminates
  FThreadID := GetCurrentThreadId;
  FWndHandle := AllocateHWnd(WndProc);
end;

procedure TThreadTimer.Start;
begin
  Resume; // Start the thread
end;

procedure TThreadTimer.Stop;
begin
  Terminate; // Signal the thread to terminate
end;

procedure TThreadTimer.Execute;
var
  Msg: TMsg;
begin
  while not Terminated do
  begin
    Sleep(FInterval); // Wait for the specified interval
    if not Terminated then
      Synchronize(DoTimerEvent); // Synchronize with the main thread to call the event
  end;
end;

procedure TThreadTimer.DoTimerEvent;
begin
  if Assigned(FOnTimer) then
    FOnTimer(Self); // Trigger the event handler
end;

procedure TThreadTimer.WndProc(var Msg: TMessage);
begin

  case Msg.Msg of
    CM_MY_THREAD1:
      begin

        Msg.Result := DefWindowProc(FWndHandle, Msg.Msg, Msg.wParam, Msg.lParam);
        OutputDebugString('Received Message at child thread');
        OutputDebugString(PChar('Msg.wParam='+ Msg.WParam.ToString()));

        Stop;
        //WE CAN ADD OTHER LOGIC When Message is Received
      end;
    else
      // mandatory call to default message handler
      Msg.Result := DefWindowProc(FWndHandle, Msg.Msg, Msg.wParam, Msg.lParam);
  end;
end;


end.
