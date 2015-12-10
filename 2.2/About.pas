(* Квадрат полибия v2.4
 * Просто помни, сука, что программу накодил Серенков Валерий,
 * E-Mail: <webmaster@anime.net.kg>
 * Сайт: http://anime.net.kg/

 *)
unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, ComCtrls, GIFImage, ExtCtrls, StdCtrls, Buttons;

type
  TAboutForm = class(TForm)
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
		procedure FormCreate(Sender: TObject);
	private
    gif : TGIFImage;
	public
		
	end;
var
	AboutForm: TAboutForm;
implementation

uses Unit38;

{$R *.dfm}

procedure TAboutForm.FormCreate(Sender: TObject);
var Stream: TResourceStream;
begin
if application.Terminated then
 EXIT;
	gif := TGIFImage.Create;
	gif.DrawOptions := [goAnimate,goLoop,goAsync,goDirectDraw];
	gif.AnimationSpeed := 1000;
	Stream := TResourceStream.Create(hInstance, 'logo', 'GIF');
	try
		gif.LoadFromStream(stream);
	finally
		stream.Free;
	end;
	image1.Picture.Assign(gif);
end;

procedure TAboutForm.Image1Click(Sender: TObject);
begin
Close;
end;

end.
