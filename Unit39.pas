unit Unit39;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, ExtCtrls, Mask, ComCtrls, Menus,inifiles,encoder;

type
  TForm39 = class(TForm)
    edit00: TEdit;
    edit10: TEdit;
    edit20: TEdit;
    edit30: TEdit;
    Edit40: TEdit;
    Edit50: TEdit;
    Edit60: TEdit;
    Edit70: TEdit;
    Edit80: TEdit;
    Edit90: TEdit;
    Edita0: TEdit;
    Editb0: TEdit;
    Editc0: TEdit;
    Editd0: TEdit;
    Edite0: TEdit;
    Editf0: TEdit;
    Edit01: TEdit;
    Edit11: TEdit;
    Edit21: TEdit;
    Edit31: TEdit;
    Edit41: TEdit;
    Edit51: TEdit;
    Edit61: TEdit;
    Edit71: TEdit;
    Edit81: TEdit;
    Edit91: TEdit;
    Edita1: TEdit;
    Editb1: TEdit;
    Editc1: TEdit;
    Editd1: TEdit;
    Edite1: TEdit;
    Editf1: TEdit;
    Edit02: TEdit;
    Edit12: TEdit;
    Edit22: TEdit;
    Edit32: TEdit;
    Edit42: TEdit;
    Edit52: TEdit;
    Edit62: TEdit;
    Edit72: TEdit;
    Edit82: TEdit;
    Edit92: TEdit;
    Edita2: TEdit;
    Editb2: TEdit;
    Editc2: TEdit;
    Editd2: TEdit;
    Edite2: TEdit;
    Editf2: TEdit;
    Edit03: TEdit;
    Edit13: TEdit;
    Edit23: TEdit;
    Edit33: TEdit;
    Edit43: TEdit;
    Edit53: TEdit;
    Edit63: TEdit;
    Edit73: TEdit;
    Edit83: TEdit;
    Edit93: TEdit;
    Edita3: TEdit;
    Editb3: TEdit;
    Editc3: TEdit;
    Editd3: TEdit;
    Edite3: TEdit;
    Editf3: TEdit;
    Edit04: TEdit;
    Edit14: TEdit;
    Edit24: TEdit;
    Edit34: TEdit;
    Edit44: TEdit;
    Edit54: TEdit;
    Edit64: TEdit;
    Edit74: TEdit;
    Edit84: TEdit;
    Edit94: TEdit;
    Edita4: TEdit;
    Editb4: TEdit;
    Editc4: TEdit;
    Editd4: TEdit;
    Edite4: TEdit;
    Editf4: TEdit;
    Edit05: TEdit;
    Edit15: TEdit;
    Edit25: TEdit;
    Edit35: TEdit;
    Edit45: TEdit;
    Edit55: TEdit;
    Edit65: TEdit;
    Edit75: TEdit;
    Edit85: TEdit;
    Edit95: TEdit;
    Edita5: TEdit;
    Editb5: TEdit;
    Editc5: TEdit;
    Editd5: TEdit;
    Edite5: TEdit;
    Editf5: TEdit;
    Edit06: TEdit;
    Edit16: TEdit;
    Edit26: TEdit;
    Edit36: TEdit;
    Edit46: TEdit;
    Edit56: TEdit;
    Edit66: TEdit;
    Edit76: TEdit;
    Edit86: TEdit;
    Edit96: TEdit;
    Edita6: TEdit;
    Editb6: TEdit;
    Editc6: TEdit;
    Editd6: TEdit;
    Edite6: TEdit;
    Editf6: TEdit;
    Edit07: TEdit;
    Edit17: TEdit;
    Edit27: TEdit;
    Edit37: TEdit;
    Edit47: TEdit;
    Edit57: TEdit;
    Edit67: TEdit;
    Edit77: TEdit;
    Edit87: TEdit;
    Edit97: TEdit;
    Edita7: TEdit;
    Editb7: TEdit;
    Editc7: TEdit;
    Editd7: TEdit;
    Edite7: TEdit;
    Editf7: TEdit;
    Edit08: TEdit;
    Edit18: TEdit;
    Edit28: TEdit;
    Edit38: TEdit;
    Edit48: TEdit;
    Edit58: TEdit;
    Edit68: TEdit;
    Edit78: TEdit;
    Edit88: TEdit;
    Edit98: TEdit;
    Edita8: TEdit;
    Editb8: TEdit;
    Editc8: TEdit;
    Editd8: TEdit;
    Edite8: TEdit;
    Editf8: TEdit;
    Edit09: TEdit;
    Edit19: TEdit;
    Edit29: TEdit;
    Edit39: TEdit;
    Edit49: TEdit;
    Edit59: TEdit;
    Edit69: TEdit;
    Edit79: TEdit;
    Edit89: TEdit;
    Edit99: TEdit;
    Edita9: TEdit;
    Editb9: TEdit;
    Editc9: TEdit;
    Editd9: TEdit;
    Edite9: TEdit;
    Editf9: TEdit;
    Edit0a: TEdit;
    Edit1a: TEdit;
    Edit2a: TEdit;
    Edit3a: TEdit;
    Edit4a: TEdit;
    Edit5a: TEdit;
    Edit6a: TEdit;
    Edit7a: TEdit;
    Edit8a: TEdit;
    Edit9a: TEdit;
    Editaa: TEdit;
    Editba: TEdit;
    Editca: TEdit;
    Editda: TEdit;
    Editea: TEdit;
    Editfa: TEdit;
    Edit0b: TEdit;
    Edit1b: TEdit;
    Edit2b: TEdit;
    Edit3b: TEdit;
    Edit4b: TEdit;
    Edit5b: TEdit;
    Edit6b: TEdit;
    Edit7b: TEdit;
    Edit8b: TEdit;
    Edit9b: TEdit;
    Editab: TEdit;
    Editbb: TEdit;
    Editcb: TEdit;
    Editdb: TEdit;
    Editeb: TEdit;
    Editfb: TEdit;
    Edit0c: TEdit;
    Edit1c: TEdit;
    Edit2c: TEdit;
    Edit3c: TEdit;
    Edit4c: TEdit;
    Edit5c: TEdit;
    Edit6c: TEdit;
    Edit7c: TEdit;
    Edit8c: TEdit;
    Edit9c: TEdit;
    Editac: TEdit;
    Editbc: TEdit;
    Editcc: TEdit;
    Editdc: TEdit;
    Editec: TEdit;
    Editfc: TEdit;
    Edit0d: TEdit;
    Edit1d: TEdit;
    Edit2d: TEdit;
    Edit3d: TEdit;
    Edit4d: TEdit;
    Edit5d: TEdit;
    Edit6d: TEdit;
    Edit7d: TEdit;
    Edit8d: TEdit;
    Edit9d: TEdit;
    Editad: TEdit;
    Editbd: TEdit;
    Editcd: TEdit;
    Editdd: TEdit;
    Edited: TEdit;
    Editfd: TEdit;
    Edit0e: TEdit;
    Edit1e: TEdit;
    Edit2e: TEdit;
    Edit3e: TEdit;
    Edit4e: TEdit;
    Edit5e: TEdit;
    Edit6e: TEdit;
    Edit7e: TEdit;
    Edit8e: TEdit;
    Edit9e: TEdit;
    Editae: TEdit;
    Editbe: TEdit;
    Editce: TEdit;
    Editde: TEdit;
    Editee: TEdit;
    Editfe: TEdit;
    Edit0f: TEdit;
    Edit1f: TEdit;
    Edit2f: TEdit;
    Edit3f: TEdit;
    Edit4f: TEdit;
    Edit5f: TEdit;
    Edit6f: TEdit;
    Edit7f: TEdit;
    Edit8f: TEdit;
    Edit9f: TEdit;
    Editaf: TEdit;
    Editbf: TEdit;
    Editcf: TEdit;
    Editdf: TEdit;
    Editef: TEdit;
    Editff: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    Save1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    TrackBar1: TTrackBar;
    MaskEdit1: TMaskEdit;
    Button6: TButton;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    procedure Label4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Label37MouseEnter(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EditsOnChange(Sender: TObject);
  private

    procedure WinProc1(var Msg: TMessage); message WM_SYSCOMMAND;
  public
    procedure lock;
    procedure unlock;
		procedure volidol;
		procedure draw_graph(data: TFrequency);
  end;

var
	Form39				: TForm39;
  form_activated: boolean;
	edits_array		: array[0..255] of TEdit;
implementation

uses Unit38, TABPGDLG, key_generator, Functions;

{$R *.dfm}

procedure TForm39.WinProc1(var Msg: TMessage);
begin
  if (Msg.wParam = SC_CLOSE) then
    form38.N25.Click
  else
    inherited;
end;

procedure TForm39.Button1Click(Sender: TObject);
var i:byte;
begin
form39.lock;

form39.Caption							:=	'';
form39.MaskEdit1.enabled		:=	false;
form39.MaskEdit1.Text				:=	'1';
setLength(table2,0);
form38.N21.enabled					:=	false;
form38.N22.enabled					:=	false;
for I := 0 to 255 do begin
	edits_array[i].Text  := chr(i);
	edits_array[i].color := clWindow;
	table[i]						 := i;
end;
form39.TrackBar1.enabled		:= 	false;
form39.TrackBar1.Position		:= 	1;

form39.unlock;
end;

procedure TForm39.Button2Click(Sender: TObject);
begin
form38.N3.Click;
end;

procedure TForm39.Button3Click(Sender: TObject);
begin
form38.N16.Click;
end;

procedure TForm39.Button4Click(Sender: TObject);
begin
generator_settings.ShowModal;
end;

procedure TForm39.Button6Click(Sender: TObject);
var
  Status: TMemoryStatus;
begin
  Status.dwLength := sizeof(TMemoryStatus);
  GlobalMemoryStatus(Status);
	showmessage(
		'Total Ram: ' 				 + IntToStr(Status.dwTotalPhys 		 div 1024417) + 'meg'+#$0d+#$0a+
		'Avaliable Phys: ' 		 + IntToStr(Status.dwAvailPhys 		 div 1024417) + 'meg'+#$0d+#$0a+
    'Avaliable PageFile: ' + IntToStr(Status.dwAvailPageFile div 1024417) + 'meg'+#$0d+#$0a);
 // messagebox(handle,PChar(

	//  PChar('MemInfo'),(MB_OK));
end;

procedure TForm39.FormActivate(Sender: TObject);
var i:byte;
    inifile:Tinifile;
begin
if not form_activated then begin
	inifile := tinifile.Create(ExtractFilePath(Application.ExeName)+'spo_settings.ini');
	image1.Enabled := not inifile.ReadBool('Interface','turbo_mode',false);
	inifile.free;
	for I := 0 to 255 do
		edits_array[i].Text := chr(i);
	form39.Image1.Canvas.Brush.Color := $FFB970;
	form39.Image1.Canvas.FillRect(rect(0,0,form39.Image1.width,form39.Image1.height));
	form_activated := true;
end;
end;

procedure TForm39.draw_graph(data: TFrequency);
var i			: byte;
		max		: int64;
		scale	: extended;
begin
max := 0;
for I := 0 to 255 do
	if max <  data[i] then max := data[i];
if max <= 0 then
 with form39.Image1 do begin
	Canvas.Brush.Color := 16759152;
	Canvas.FillRect(rect(0,0,width,height));
	exit;
end;
with form39.Image1 do begin
	Canvas.Brush.Color := 16759152;
	Canvas.FillRect(rect(0,0,width,height));
	Canvas.pen.Color 	 := 0;
	scale := Width / max;
	for I := 0 to 255 do begin
		Canvas.Pen.Mode := pmMerge;
		Canvas.LineTo(0,i);
		Canvas.Pen.Mode := pmcopy;
		Canvas.LineTo(round(data[i]*scale),i);
		if frequence[i]*scale-round(data[i]*scale) <> 0 then
			Canvas.Pixels[round(data[i]*scale),i] := 8355711;
	end;
end;
end;

procedure TForm39.FormCreate(Sender: TObject);
var i: byte;
begin
form_activated:=false;
edits_array[0  ]:=Edit00;
edits_array[1  ]:=Edit10;
edits_array[2  ]:=edit20;
edits_array[3  ]:=edit30;
edits_array[4  ]:=Edit40;
edits_array[5  ]:=Edit50;
edits_array[6  ]:=Edit60;
edits_array[7  ]:=Edit70;
edits_array[8  ]:=Edit80;
edits_array[9  ]:=Edit90;
edits_array[10 ]:=Edita0;
edits_array[11 ]:=Editb0;
edits_array[12 ]:=Editc0;
edits_array[13 ]:=Editd0;
edits_array[14 ]:=Edite0;
edits_array[15 ]:=Editf0;
edits_array[16 ]:=Edit01;
edits_array[17 ]:=Edit11;
edits_array[18 ]:=Edit21;
edits_array[19 ]:=Edit31;
edits_array[20 ]:=Edit41;
edits_array[21 ]:=Edit51;
edits_array[22 ]:=Edit61;
edits_array[23 ]:=Edit71;
edits_array[24 ]:=Edit81;
edits_array[25 ]:=Edit91;
edits_array[26 ]:=Edita1;
edits_array[27 ]:=Editb1;
edits_array[28 ]:=Editc1;
edits_array[29 ]:=Editd1;
edits_array[30 ]:=Edite1;
edits_array[31 ]:=Editf1;
edits_array[32 ]:=Edit02;
edits_array[33 ]:=Edit12;
edits_array[34 ]:=Edit22;
edits_array[35 ]:=Edit32;
edits_array[36 ]:=Edit42;
edits_array[37 ]:=Edit52;
edits_array[38 ]:=Edit62;
edits_array[39 ]:=Edit72;
edits_array[40 ]:=Edit82;
edits_array[41 ]:=Edit92;
edits_array[42 ]:=Edita2;
edits_array[43 ]:=Editb2;
edits_array[44 ]:=Editc2;
edits_array[45 ]:=Editd2;
edits_array[46 ]:=Edite2;
edits_array[47 ]:=Editf2;
edits_array[48 ]:=Edit03;
edits_array[49 ]:=Edit13;
edits_array[50 ]:=Edit23;
edits_array[51 ]:=Edit33;
edits_array[52 ]:=Edit43;
edits_array[53 ]:=Edit53;
edits_array[54 ]:=Edit63;
edits_array[55 ]:=Edit73;
edits_array[56 ]:=Edit83;
edits_array[57 ]:=Edit93;
edits_array[58 ]:=Edita3;
edits_array[59 ]:=Editb3;
edits_array[60 ]:=Editc3;
edits_array[61 ]:=Editd3;
edits_array[62 ]:=Edite3;
edits_array[63 ]:=Editf3;
edits_array[64 ]:=Edit04;
edits_array[65 ]:=Edit14;
edits_array[66 ]:=Edit24;
edits_array[67 ]:=Edit34;
edits_array[68 ]:=Edit44;
edits_array[69 ]:=Edit54;
edits_array[70 ]:=Edit64;
edits_array[71 ]:=Edit74;
edits_array[72 ]:=Edit84;
edits_array[73 ]:=Edit94;
edits_array[74 ]:=Edita4;
edits_array[75 ]:=Editb4;
edits_array[76 ]:=Editc4;
edits_array[77 ]:=Editd4;
edits_array[78 ]:=Edite4;
edits_array[79 ]:=Editf4;
edits_array[80 ]:=Edit05;
edits_array[81 ]:=Edit15;
edits_array[82 ]:=Edit25;
edits_array[83 ]:=Edit35;
edits_array[84 ]:=Edit45;
edits_array[85 ]:=Edit55;
edits_array[86 ]:=Edit65;
edits_array[87 ]:=Edit75;
edits_array[88 ]:=Edit85;
edits_array[89 ]:=Edit95;
edits_array[90 ]:=Edita5;
edits_array[91 ]:=Editb5;
edits_array[92 ]:=Editc5;
edits_array[93 ]:=Editd5;
edits_array[94 ]:=Edite5;
edits_array[95 ]:=Editf5;
edits_array[96 ]:=Edit06;
edits_array[97 ]:=Edit16;
edits_array[98 ]:=Edit26;
edits_array[99 ]:=Edit36;
edits_array[100]:=Edit46;
edits_array[101]:=Edit56;
edits_array[102]:=Edit66;
edits_array[103]:=Edit76;
edits_array[104]:=Edit86;
edits_array[105]:=Edit96;
edits_array[106]:=Edita6;
edits_array[107]:=Editb6;
edits_array[108]:=Editc6;
edits_array[109]:=Editd6;
edits_array[110]:=Edite6;
edits_array[111]:=Editf6;
edits_array[112]:=Edit07;
edits_array[113]:=Edit17;
edits_array[114]:=Edit27;
edits_array[115]:=Edit37;
edits_array[116]:=Edit47;
edits_array[117]:=Edit57;
edits_array[118]:=Edit67;
edits_array[119]:=Edit77;
edits_array[120]:=Edit87;
edits_array[121]:=Edit97;
edits_array[122]:=Edita7;
edits_array[123]:=Editb7;
edits_array[124]:=Editc7;
edits_array[125]:=Editd7;
edits_array[126]:=Edite7;
edits_array[127]:=Editf7;
edits_array[128]:=Edit08;
edits_array[129]:=Edit18;
edits_array[130]:=Edit28;
edits_array[131]:=Edit38;
edits_array[132]:=Edit48;
edits_array[133]:=Edit58;
edits_array[134]:=Edit68;
edits_array[135]:=Edit78;
edits_array[136]:=Edit88;
edits_array[137]:=Edit98;
edits_array[138]:=Edita8;
edits_array[139]:=Editb8;
edits_array[140]:=Editc8;
edits_array[141]:=Editd8;
edits_array[142]:=Edite8;
edits_array[143]:=Editf8;
edits_array[144]:=Edit09;
edits_array[145]:=Edit19;
edits_array[146]:=Edit29;
edits_array[147]:=Edit39;
edits_array[148]:=Edit49;
edits_array[149]:=Edit59;
edits_array[150]:=Edit69;
edits_array[151]:=Edit79;
edits_array[152]:=Edit89;
edits_array[153]:=Edit99;
edits_array[154]:=Edita9;
edits_array[155]:=Editb9;
edits_array[156]:=Editc9;
edits_array[157]:=Editd9;
edits_array[158]:=Edite9;
edits_array[159]:=Editf9;
edits_array[160]:=Edit0a;
edits_array[161]:=Edit1a;
edits_array[162]:=Edit2a;
edits_array[163]:=Edit3a;
edits_array[164]:=Edit4a;
edits_array[165]:=Edit5a;
edits_array[166]:=Edit6a;
edits_array[167]:=Edit7a;
edits_array[168]:=Edit8a;
edits_array[169]:=Edit9a;
edits_array[170]:=Editaa;
edits_array[171]:=Editba;
edits_array[172]:=Editca;
edits_array[173]:=Editda;
edits_array[174]:=Editea;
edits_array[175]:=Editfa;
edits_array[176]:=Edit0b;
edits_array[177]:=Edit1b;
edits_array[178]:=Edit2b;
edits_array[179]:=Edit3b;
edits_array[180]:=Edit4b;
edits_array[181]:=Edit5b;
edits_array[182]:=Edit6b;
edits_array[183]:=Edit7b;
edits_array[184]:=Edit8b;
edits_array[185]:=Edit9b;
edits_array[186]:=Editab;
edits_array[187]:=Editbb;
edits_array[188]:=Editcb;
edits_array[189]:=Editdb;
edits_array[190]:=Editeb;
edits_array[191]:=Editfb;
edits_array[192]:=Edit0c;
edits_array[193]:=Edit1c;
edits_array[194]:=Edit2c;
edits_array[195]:=Edit3c;
edits_array[196]:=Edit4c;
edits_array[197]:=Edit5c;
edits_array[198]:=Edit6c;
edits_array[199]:=Edit7c;
edits_array[200]:=Edit8c;
edits_array[201]:=Edit9c;
edits_array[202]:=Editac;
edits_array[203]:=Editbc;
edits_array[204]:=Editcc;
edits_array[205]:=Editdc;
edits_array[206]:=Editec;
edits_array[207]:=Editfc;
edits_array[208]:=Edit0d;
edits_array[209]:=Edit1d;
edits_array[210]:=Edit2d;
edits_array[211]:=Edit3d;
edits_array[212]:=Edit4d;
edits_array[213]:=Edit5d;
edits_array[214]:=Edit6d;
edits_array[215]:=Edit7d;
edits_array[216]:=Edit8d;
edits_array[217]:=Edit9d;
edits_array[218]:=Editad;
edits_array[219]:=Editbd;
edits_array[220]:=Editcd;
edits_array[221]:=Editdd;
edits_array[222]:=Edited;
edits_array[223]:=Editfd;
edits_array[224]:=Edit0e;
edits_array[225]:=Edit1e;
edits_array[226]:=Edit2e;
edits_array[227]:=Edit3e;
edits_array[228]:=Edit4e;
edits_array[229]:=Edit5e;
edits_array[230]:=Edit6e;
edits_array[231]:=Edit7e;
edits_array[232]:=Edit8e;
edits_array[233]:=Edit9e;
edits_array[234]:=Editae;
edits_array[235]:=Editbe;
edits_array[236]:=Editce;
edits_array[237]:=Editde;
edits_array[238]:=Editee;
edits_array[239]:=Editfe;
edits_array[240]:=Edit0f;
edits_array[241]:=Edit1f;
edits_array[242]:=Edit2f;
edits_array[243]:=Edit3f;
edits_array[244]:=Edit4f;
edits_array[245]:=Edit5f;
edits_array[246]:=Edit6f;
edits_array[247]:=Edit7f;
edits_array[248]:=Edit8f;
edits_array[249]:=Edit9f;
edits_array[250]:=Editaf;
edits_array[251]:=Editbf;
edits_array[252]:=Editcf;
edits_array[253]:=Editdf;
edits_array[254]:=Editef;
edits_array[255]:=Editff;

for I := 0 to 255 do begin
	edits_array[i].Tag				:=	i;
	edits_array[i].OnChange 	:=  Form39.EditsOnChange;
	edits_array[i].PopupMenu	:=  popupmenu2;
end;
end;

procedure TForm39.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label35.Caption := inttohex(y,2) + ' = ' + chr(y);
label36.Caption := '= ' + inttostr(frequence[y]);
end;

procedure TForm39.Label37MouseEnter(Sender: TObject);
begin
with label37 do
	Hint := Caption
end;


procedure TForm39.Label3Click(Sender: TObject);
begin
{maskcollector;
for I := 0 to 255 do
  key[i]:=table[i];
intersections:=encoder.volidate(@key);
for I := 0 to 255 do
  edits_array[i].color:=clWhite;
for I := 1 to length(intersections) do
	edits_array[ord(intersections[i])].color:=$7F7FFF;  }
	volidol;   // :D
end;

procedure TForm39.Label4Click(Sender: TObject);
begin
if form38.tetxtload.Execute() then
	GetFileTimes(form38.tetxtload.fileName);
end;

procedure TForm39.MaskEdit1Exit(Sender: TObject);
var i		:	smallint;
		buf	:	string;
begin
buf := '';
for I := 1 to length(maskEdit1.Text) do
  case maskEdit1.Text[i] of
		'0'..'9':	buf := buf + maskEdit1.Text[i];
  end;
maskEdit1.Text := buf;
if (maskEdit1.Text = '') or (strtoint(maskedit1.Text) = 0) then
	maskEdit1.Text := '1';
trackbar1.Position := strtoint(maskedit1.Text);
end;

procedure TForm39.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  trackbar1.SetFocus; //perform MaskEdit1.onExit
  maskedit1.SetFocus;
end;
end;

procedure TForm39.N1Click(Sender: TObject);
var id	: byte;
		i		:	integer;
		buf	: string;
begin
id 	:= popupmenu2.PopupComponent.Tag;
buf := '';
if length(table2) > 0 then begin
  for I := 0 to length(table2)-1 do begin
    buf := buf + lowercase(inttohex(table2[i][id],2)) + ' ';
		if i + 1 mod 20 = 0 then
      buf := buf + #$0D + #$0A;
    end;
    showmessage(buf);
	end;
end;

procedure TForm39.Save1Click(Sender: TObject);
var _file	:	textfile;
		i			:	byte;
begin
if savedialog1.execute(handle) then
	case savedialog1.FilterIndex of
		0: 	begin
					assignfile(_file,savedialog1.FileName);
					rewrite(_file);
					for I := 0 to 255 do
						writeln(_file,inttostr(frequence[i]));
					closefile(_file);
				end;
		1: 	begin
					assignfile(_file,savedialog1.FileName);
					rewrite(_file);
					for I := 0 to 255 do
						writeln(_file,inttostr(i) + ' '+
													inttostr(frequence[i]));
					closefile(_file);
				end;                                                            
		2: 	begin
					assignfile(_file,savedialog1.FileName);
					rewrite(_file);
					for I := 0 to 255 do
						writeln(_file,inttostr(i) + ' '+
													inttohex(i,2)+' '+
													inttostr(frequence[i]));
					closefile(_file);
				end;
		3: 	begin
					assignfile(_file,savedialog1.FileName);
					rewrite(_file);
					for I := 0 to 255 do
						writeln(_file,inttohex(i,2)+' '+
													inttostr(frequence[i]));
					closefile(_file);
				end;
		4: image1.Picture.SaveToFile(savedialog1.FileName);
	end;
end;

procedure TForm39.TrackBar1Change(Sender: TObject);
var i,_length			:	integer;
		position			: integer;
		intersections	: AnsiString;
begin
form39.lock;
if length(table2) > 0 then begin
	position := trackbar1.Position;
  for I := 0 to 255 do begin
	 edits_array[i].Text  := chr(table2[position-1][i]);
	 edits_array[i].color := clWindow;
  end;
	maskedit1.Text	:=	Inttostr(trackbar1.position);
	intersections		:=	encoder.volidate(@table2[position-1]);
	_length					:=	length(intersections);
	i 							:=	1;
	while i < _length do begin
		edits_array[ord(intersections[i])].color := $7F7FFF;
		Inc(i);
	end;
end
else begin trackbar1.Enabled	:=	false;
					 maskedit1.Text			:=	'1';
					 maskedit1.Enabled	:=	false;
end;

  form39.unlock;
end;

procedure TForm39.EditsOnChange(Sender: TObject);
var intersections	: string;
		i,i2					:	integer;
		ID						: byte;
begin
if not unit39.form_activated then EXIT;
  {for i:=0 to 255 do
    if Sender = edits_array[i] then begin
      showmessage(inttostr(i));
      break;
end;}

if Sender is TEdit then begin
  ID := (sender as tedit).tag;
  form39.lock;                                     //������ ��� ��������!
  if length(edits_array[ID].Text) > 1 then
		edits_array[ID].Text := edits_array[ID].Text[1]; //only 1 symbol accepted
  if edits_array[ID].Text = '' then
		table[ID] := 0 else
	table[ID] := ord(edits_array[ID].text[1]);
  if length(table2) = 0 then begin
    maskcollector;
		intersections := encoder.volidate(@table) end
  else begin
		i2 := trackbar1.Position;
    if edits_array[ID].Text <> '' then
			table2[i2 - 1][ID] := ord(edits_array[ID].text[1])
		else
			table2[i2 - 1][ID] := 0;
		intersections := encoder.volidate(@table2[i2-1]);
	end;
	for I := 0 to 255 do
		edits_array[i].color := clWindow;
	for I := 1 to length(intersections) do
		edits_array[ord(intersections[i])].color := $7F7FFF;

end;
form39.unlock;
end;

procedure TForm39.lock;
begin
	unit39.form_activated := false;
end;

procedure TForm39.unlock;
begin
	unit39.form_activated := true;
end;

procedure TForm39.volidol;
var i: integer;
		intersections:string;
begin
  for I := 0 to 255 do begin
		edits_array[i].Color := clWindow;
  end;
  maskcollector;
	intersections := volidate(@table);
	for I := 1 to length(intersections) do
    edits_array[ord(intersections[i])].Color:=$7F7FFF;
end;
end.
