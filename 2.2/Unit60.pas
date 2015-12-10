(* Квадрат полибия v2.4
 * Просто помни, сука, что программу накодил Серенков Валерий,
 * E-Mail: <webmaster@anime.net.kg>
 * Сайт: http://anime.net.kg/
 *)
unit Unit60;

interface

uses
  Classes;

type
  Newthread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses Unit38;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure Newthread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ Newthread }

procedure Newthread.Execute;
var a:integer;
begin
while a<>0 do
a:=random(1000000);


end;


end.
