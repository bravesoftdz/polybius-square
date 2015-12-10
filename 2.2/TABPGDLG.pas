﻿(* Квадрат полибия v2.4
 * Просто помни, сука, что программу накодил Серенков Валерий,
 * E-Mail: <webmaster@anime.net.kg>
 * Сайт: http://anime.net.kg/
 *)
unit TABPGDLG;

interface

{#region Uses}                                   {$REGION}
uses   Windows, Messages, Mask, Dialogs, ImgList, Controls, StdCtrls, ExtCtrls,
	ComCtrls, Buttons, Classes, Forms, Inifiles, SysUtils, Graphics, FileCtrl;
																								 {$ENDREGION}

{#region Classes}                                {$REGION}
type
	TPagesDlg = class(TForm)
		Panel1: TPanel;
		Panel2: TPanel;
		OKBtn: TButton;
		OpenDialog1: TOpenDialog;
		ImageList1: TImageList;
		PageControl1: TPageControl;
		TabSheet1: TTabSheet;
		FontDialog1: TFontDialog;
		BitBtn1: TBitBtn;
		Label2: TLabel;
		BitBtn2: TBitBtn;
		StaticText1: TStaticText;
		ColorDialog1: TColorDialog;
		UpDown1: TUpDown;
		Edit1: TEdit;
		Label3: TLabel;
		Button1: TButton;
		wordwrap: TCheckBox;
		CheckBox1: TCheckBox;
		RadioGroup: TRadioGroup;
		Label4: TLabel;
		MaskEdit1: TMaskEdit;
		Edit2: TEdit;
		CheckBox4: TCheckBox;
		CheckBox5: TCheckBox;
		TabSheet2: TTabSheet;
		CheckBox6: TCheckBox;
		Edit3: TEdit;
		Button2: TButton;
		CheckBox7: TCheckBox;
		Edit4: TEdit;
		Button3: TButton;
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    procedure FormDestroy(Sender: TObject);
		procedure CheckBox7Click(Sender: TObject);
		procedure CheckBox6Click(Sender: TObject);
		procedure Button3Click(Sender: TObject);
		procedure Button2Click(Sender: TObject);
		procedure CheckBox4Click(Sender: TObject);
		procedure MaskEdit1Exit(Sender: TObject);
		procedure RadioGroupClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure CheckBox1Click(Sender: TObject);
		procedure FormActivate(Sender: TObject);
		procedure Button1Click(Sender: TObject);
		procedure OKBtnClick(Sender: TObject);
		procedure BitBtn2Click(Sender: TObject);
		procedure BitBtn1Click(Sender: TObject);
	private

	public
		form_activated : boolean;
	end;
																								 {$ENDREGION}
var
	PagesDlg: TPagesDlg;

implementation

uses Unit38, Unit39, Functions;

{$R *.dfm}

{#region Write Settings}                         {$REGION}
procedure TPagesDlg.Button1Click(Sender: TObject);
var inifile:Tinifile;
page_Size,I:integer;
s: string;
begin
try try
inifile:=tinifile.Create(ExtractFilePath(Application.ExeName)+'spo_settings.ini');
inifile.WriteInteger('Font',		'Charset',		FontDialog1.Font.Charset);
inifile.WriteInteger('Font',		'Color',			FontDialog1.Font.Color);
inifile.WriteInteger('Font',		'Height',			FontDialog1.Font.Height);
inifile.WriteString ('Font',		'Name',				FontDialog1.Font.Name);
inifile.WriteInteger('Font',		'Orientation',FontDialog1.Font.Orientation);
inifile.WriteInteger('Font',		'Size',				FontDialog1.Font.Size);
inifile.WriteInteger('Encoding','Grouping',		strtoint(edit1.Text));
s:=''; i:=1;
while i < length(edit2.Text)+1 do begin
  s:=s+garbage_collector(inttohex(ord(edit2.Text[i]),2));
  i:=i+1;
end;
inifile.WriteString ('Encoding',	'Separator',		s);
inifile.WriteInteger('Encoding',	'NeL',					radiogroup.ItemIndex);
inifile.WriteInteger('Font',			'BgColor',			colordialog1.Color);
inifile.WriteBool		('Interface',	'word_wrap',		wordwrap.checked);
inifile.WriteBool		('Interface',	'draw_graph',		checkbox1.Checked);
inifile.WriteBool		('Interface',	'def_dir',			checkbox6.Checked);
inifile.WriteBool		('Interface',	'def_key',			checkbox7.Checked);
inifile.WriteString	('Interface',	'def_dir_path',	Edit3.Text);
inifile.WriteString	('Interface',	'def_key_path',	Edit4.Text);
inifile.WriteBool		('Encoding',	'forced_text',	checkbox2.checked);
inifile.WriteBool		('Encoding',	'turbo_mode',		checkbox4.checked);
inifile.WriteBool		('Encoding',	'dontverify',	  checkbox5.checked);
inifile.WriteInteger('Interface',	'Page_Size',		strtoint(maskedit1.text));

finally
inifile.Free;
end;
except

end;

form38.RichEdit1.Font.Charset			:=	FontDialog1.Font.Charset;
form38.RichEdit1.Font.Color				:=	FontDialog1.Font.Color;
form38.RichEdit1.Font.Height			:=	FontDialog1.Font.Height;
form38.RichEdit1.Font.name				:=	FontDialog1.Font.Name;
form38.RichEdit1.Font.Orientation	:=	FontDialog1.Font.Orientation;
form38.RichEdit1.Font.Size				:=	FontDialog1.Font.Size;
form38.richedit1.Color						:=	colordialog1.Color;
form38.N29.Checked								:=	Checkbox2.Checked;
form38.N33.Checked								:=	Checkbox2.Checked;
if not binary_mode then begin
	form38.richedit1.WordWrap				:=	wordwrap.checked;
	if wordwrap.checked then
		form38.richedit1.ScrollBars		:=	ssVertical
	else form38.richedit1.ScrollBars:=	ssBoth end
  else with trackbar do begin
		page_Size											:=	strtoint(maskedit1.Text);
		max														:=	trunc(length(binary_data)/page_Size);
		position											:=	1;
    Perform(WM_KEYDOWN,VK_UP,0);
		Perform(WM_KEYUP,VK_UP,0);
		tickstyle											:=	tsNone;
		tickstyle											:=	tsManual;
    for I := 0 to max do
			 if (i mod trunc(1048576 / page_Size)) = 0 then
        settick(i);
	end;
form39.Image1.Enabled							:=	checkbox1.checked;
pagesdlg.Hide;
end;
																								 {$ENDREGION}

{#region Read Settings}                          {$REGION}
procedure TPagesDlg.FormActivate(Sender: TObject);
var inifile:tInifile;
s, s_dest: string;
i, j: integer;
begin
if not form_activated then begin
inifile:=tinifile.Create(ExtractFilePath(Application.ExeName)+'spo_settings.ini');
FontDialog1.Font.Charset		:=inifile.ReadInteger	('Font',			'Charset',		204);
FontDialog1.Font.Color			:=inifile.ReadInteger	('Font',			'Color',			65280);
FontDialog1.Font.Height			:=inifile.ReadInteger	('Font',			'Height',			-11);
FontDialog1.Font.Name				:=inifile.ReadString	('Font',			'Name',				'Courier New');
FontDialog1.Font.Orientation:=inifile.ReadInteger	('Font',			'Orientation',0);
FontDialog1.Font.Size				:=inifile.ReadInteger	('Font',			'Size',				8);
colordialog1.Color					:=inifile.ReadInteger	('Font',			'BgColor',		0);
wordwrap.Checked						:=inifile.ReadBool		('Interface',	'word_wrap',	false);
checkbox1.Checked						:=inifile.ReadBool		('Interface',	'draw_graph',	true);
checkbox2.Checked						:=inifile.ReadBool		('Encoding',	'forced_text',true);
checkbox4.Checked						:=inifile.ReadBool		('Encoding',	'turbo_mode',	true);
checkbox5.Checked			  		:=inifile.ReadBool		('Encoding',	'dontverify',	false);
checkbox6.Checked						:=inifile.ReadBool		('Interface',	'def_dir',		false);
checkbox7.Checked						:=inifile.ReadBool		('Interface',	'def_key',		false);
Edit1.text				 :=inttostr(inifile.ReadInteger	('Encoding',	'Grouping',		1));
Edit3.text									:=inifile.ReadString	('Interface',	'def_dir_path','');
Edit4.text									:=inifile.ReadString	('Interface',	'def_key_path','');
Radiogroup.ItemIndex				:=inifile.ReadInteger	('Encoding',	'NeL',0);
maskedit1.Text		 :=inttostr(inifile.ReadInteger	('Interface',	'Page_Size',	1924));
s														:=inifile.ReadString	('Encoding',	'Separator',	'20');
SetLength(s_dest, round(Length(s)/2));
i:=HexToBin(PAnsiChar(s), PAnsiChar(s_dest), Length(s_dest));
SetLength(s_dest, i);
Edit2.text:='';
for j:=1 to i do
	 Edit2.Text:=Edit2.Text+chr(Byte(s_dest[j]));


{wordwrap.Enabled:=not checkbox1.Checked;
edit1.Enabled:=   not checkbox1.Checked;
Label1.Enabled:=  not checkbox1.Checked;
Label3.Enabled:=  not checkbox1.Checked;}
inifile.Free;
form_activated:=true;
end;
end;                                             {$ENDREGION}

{#region VCL Events}                             {$REGION}
procedure TPagesDlg.BitBtn1Click(Sender: TObject);
begin
fontdialog1.Execute();
end;

procedure TPagesDlg.BitBtn2Click(Sender: TObject);
begin
colordialog1.Execute();
end;

procedure TPagesDlg.Button2Click(Sender: TObject);
var FDir: string;
begin
	if SelectDirectory(SSelectDirectory, ExtractFileDrive(FDir), FDir,
						 [sdNewUI]) then
		Edit3.text := FDir;
end;

procedure TPagesDlg.Button3Click(Sender: TObject);
begin
	if OpenDialog1.Execute then
		Edit4.Text := Opendialog1.FileName;
end;

procedure TPagesDlg.CheckBox1Click(Sender: TObject);
begin
{wordwrap.Enabled:=not checkbox1.Checked;
edit1.Enabled:=   not checkbox1.Checked;
Label1.Enabled:=  not checkbox1.Checked;
Label3.Enabled:=  not checkbox1.Checked;}
end;

procedure TPagesDlg.CheckBox4Click(Sender: TObject);
begin
with CheckBox4 do begin
if Checked then
	Font.Color := clred
else
	Font.Color := clwindowtext;
end;
end;

procedure TPagesDlg.CheckBox6Click(Sender: TObject);
begin
Edit3.Enabled 	:= CheckBox6.Checked;
Button2.Enabled := CheckBox6.Checked;
end;

procedure TPagesDlg.CheckBox7Click(Sender: TObject);
begin
Edit4.Enabled 	:= CheckBox7.Checked;
Button3.Enabled := CheckBox7.Checked;
end;

procedure TPagesDlg.FormCreate(Sender: TObject);
begin
form_activated:=false;
end;

procedure TPagesDlg.FormDestroy(Sender: TObject);
begin
button1.Click;
end;

procedure TPagesDlg.MaskEdit1Exit(Sender: TObject);
var i:smallint;
buf:string;
begin
buf:='';
for I := 1 to length(maskEdit1.Text) do
  case maskEdit1.Text[i] of
    '0'..'9':buf:=buf+maskEdit1.Text[i];
  end;
maskEdit1.Text:=buf;
if (maskEdit1.Text='') or (strtoint(maskedit1.Text)=0) then
  maskEdit1.Text:='1';
end;

procedure TPagesDlg.OKBtnClick(Sender: TObject);
begin
pagesdlg.Hide;
end;

procedure TPagesDlg.RadioGroupClick(Sender: TObject);
begin

end;

{$ENDREGION}
end.

