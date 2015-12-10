unit thread;

interface

uses
  Classes;

type
  newThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure DoWork;
  end;

implementation

uses Unit38;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Thread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Thread }

procedure newThread.Execute;
begin
     Synchronize(DoWork);
end;

procedure newThread.doWork;
Begin
form38.Caption:='Updated in a thread';
end;

end.
