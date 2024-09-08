program Threading1;

uses
  Vcl.Forms,
  Form1Unit in 'Form1Unit.pas' {Form1},
  UThreadTimer in 'UThreadTimer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
