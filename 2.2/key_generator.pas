(* ������� ������� v2.4
 * ������ �����, ����, ��� ��������� ������� �������� �������,
 * E-Mail: <webmaster@anime.net.kg>
 * ����: http://anime.net.kg/
 *)
unit key_generator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, ExtCtrls, Mask, Math, encoder;

type
  Tgenerator_settings = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    useSeed: TCheckBox;
    TextSafe: TCheckBox;
    MaskEdit1: TEdit;
    MaskEdit2: TEdit;
    procedure useSeedClick(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
		procedure randomize(seed: int64); overload;
	public
		procedure setRandomSeed(pass: String);
	end;
	procedure generate_random_key(PRNGType, keySize: integer; LoRnd, HiRnd: byte; ReverseCompatibility: boolean; out key: PKey2);
var
  generator_settings: Tgenerator_settings;

implementation

uses Unit39, Unit38, MD5{, encoder};

{$R *.dfm}

procedure Tgenerator_settings.randomize(seed: int64);
begin
		 System.RandSeed := seed;
end;

procedure Tgenerator_settings.setRandomSeed(pass: String);
var seed: int64;
		MD5	: TMD5Digest;
		i		:	byte;
begin
try
	seed := strtoint(pass);
	except on EConvertError do begin
		MD5 := MD5String(pass);
		for I := 0 to 7 do
			seed := seed shl 8 + MD5.v[i];
	end;
end;
self.randomize(seed);          // <-- isnt good for cryptographic usage
end;

{ speed : 709456 keys/s @2.61GHz }
procedure generate_random_key(PRNGType, keySize: integer; LoRnd, HiRnd: byte; ReverseCompatibility: boolean; out key: PKey2);
var i, tmp, rand: byte;
		j:integer;
		table: TKey;
begin
if	(key = nil) or (keySize < 1) then
	EXIT;
if ReverseCompatibility then
	for I := 0 to 255 do{  <<----------------------                    }
		Table[i] := i {      <<------------------------                  }
else
	table := unit38.table;
setLength(key^, keySize);{                       ||  dat f8 shit :/  }
for j := 0 to keySize - 1 do begin{              ||
	for I := 0 to 255 do   >>------------------------
		Table[i] := i;       >>-----------------------                   }
	for I := LoRnd to HiRnd do begin
		rand:=Random(HiRnd-LoRnd+1)+LoRnd; 				// LowRnd <= f(x) <= HiRnd
		tmp:=table[i];
		table[i]:=table[rand];
		table[rand]:=tmp;
	end;
	key^[j] := table;
end;
if not ReverseCompatibility then
	unit38.table := table;
end;

procedure Tgenerator_settings.Button1Click(Sender: TObject);
var i,j			: integer;
		rand		: integer;
		tmp			: integer;
		shift		: integer;
		temp		: AnsiString;
		keyptr2	: PKey2;
begin
form39.button1.Click;
form39.lock;       //block form39.editxx.onChange

{#region random}{$REGION}
if ComboBox1.ItemIndex = 0 then
case RadioGroup1.ItemIndex of
	0: begin
			if useSeed.Checked then
				setRandomSeed(edit1.Text)
			else
				system.Randomize;
			keyptr2:= @table2;
			if TextSafe.Checked then
				generate_random_key(0, 1, 32, 255, true, keyptr2)
			else
				generate_random_key(0, 1,  0, 255, true, keyptr2);
			table := table2[0];
			setLength(table2,0);
			for i := 0 to 255 do
				edits_array[i].Text:=chr(table[i]);
									form39.trackbar1.position:=1;
									form39.trackbar1.max:=1;
									form39.trackbar1.Enabled:=false;
									form39.MaskEdit1.Enabled:=false;
									form39.MaskEdit1.text:=#$31;
									form39.Caption:='key'+' (1-dimension)';
			end;

	1:  begin
				try
					if strtoint(edit2.text) < 1 then begin
					 MessageDlg(SEnterNaturalNum,
											mtWarning,[mbOk],0);
					 edit2.SetFocus;
					 EXIT;
					end;
					except on EConvertError do begin
					 MessageDlg(SEnterNaturalNum,
											mtWarning,[mbOk],0);
					 edit2.SetFocus;
					 EXIT;
					end;
					end;
					try
						setLength(table2,strtoint(edit2.text));
					except
						 setLength(table2,0);
						 messageBox(
									handle,
									PChar(SNoMemory),
									PChar(SError),
                  MB_ICONERROR+
                  MB_OK
                  );
						 EXIT;
					end;
				keyPtr2 := @table2;
				if useSeed.Checked then
					setRandomSeed(edit1.Text)
				else
					system.Randomize;
				if TextSafe.Checked then
					generate_random_key( 0, strtoint(edit2.Text), 32, 255, true, keyPtr2)
				else
					generate_random_key( 0, strtoint(edit2.Text),  0, 255, true, keyPtr2);
                  for I := 0 to 255 do
                    edits_array[i].Text:=chr(table2[0][i]);
                  form39.trackbar1.max:=length(table2);
                  form39.trackbar1.position:=1;
                  form39.trackbar1.Enabled:=true;
									form39.MaskEdit1.Enabled:=true;
                  form39.MaskEdit1.text:=#$31;
                  form39.Caption:='key'+' (2-dimensions, size: '+inttostr(length(table2))+')';
      end;
    end else
		case comboBox1.ItemIndex of
{$ENDREGION}

{#region ROT13/47}{$REGION}
			1: begin                           //ROT-13
        for I := 65 to 77 do
          table[i]:=table[i]+13;
        for I := 78 to 90 do
          table[i]:=table[i]-13;
        for I := 97 to 109 do
					table[i]:=table[i]+13;
        for I := 110 to 122 do
          table[i]:=table[i]-13;
        {for I := 192 to 210 do
          table[i]:=table[i]+13;
        for I := 211 to 223 do
          table[i]:=table[i]-19;
        for I := 224 to 242 do
          table[i]:=table[i]+13;
        for I := 243 to 255 do
          table[i]:=table[i]-19;}
        for I := 0 to 255 do
          edits_array[i].Text:=chr(table[i]);
          form39.Caption:='ROT13';
      end;
			2: begin                           //ROT-47
					for I := 80 to 126 do
            table[i]:=table[i-47];
          for I := 33 to 79 do
            table[i]:=table[i]+47;
        for I := 0 to 255 do
          edits_array[i].Text:=chr(table[i]);
          form39.Caption:='ROT47';
			end;
{$ENDREGION}

{#region Atbash}{$REGION}
			3: begin                           //Atbash (Reverse)
					for I := 48 to 57 do
						table[i]:=-i+105;
					for I := 65 to 90 do
						table[i]:=-i+155;
					for I := 97 to 122 do
						table[i]:=-i+219;
					table[168]:=217;
					table[184]:=249;
					for I := 192 to 197 do
						table[i]:=-i+415;
					for I := 198 to 216 do
						table[i]:=-i+414;
					table[217]:=168;
					for I := 218 to 223 do
						table[i]:=-i+415;
					for I := 224 to 229 do
						table[i]:=-i+479;
					for I := 230 to 248 do
						table[i]:=-i+478;
					table[249]:=184;
					for I := 250 to 255 do
						table[i]:=-i+479;
					for I := 0 to 255 do
						edits_array[i].Text:=chr(table[i]);
					form39.Caption:='�����';
			end;
{$ENDREGION}

{#region Caesar}{$REGION}
			4: begin                           //Shift (Caesar)
					try
						shift:=strtoint(maskedit1.Text);
					except on EConvertError do begin
					 MessageDlg(SEnterNum255,	mtWarning, [mbYes], 0);
					 maskedit1.SetFocus;
					 maskedit1.SelectAll;
					 EXIT;
					end;
					end;
					if shift > 0 then
						for I := 0 to shift-1 do begin

							tmp:=table[57];            //0..9
							for j := 57 downto 49 do
								table[j]:=table[j-1];
							table[48]:=tmp;

							tmp:=table[90];            //A..Z
							for j := 90 downto 66 do
								table[j]:=table[j-1];
							table[65]:=tmp;

							tmp:=table[122];           //a..z
							for j := 122 downto 98 do
								table[j]:=table[j-1];
							table[97]:=tmp;

							tmp:=table[223];           //�..�
							for j := 223 downto 193 do
								table[j]:=table[j-1];
							table[192]:=tmp;
							tmp:=table[168];
							table[168]:=table[198];
							table[198]:=tmp;

							tmp:=table[255];           //�..�
							for j := 255 downto 225 do
								table[j]:=table[j-1];
							table[224]:=tmp;
							tmp:=table[184];
							table[184]:=table[230];
							table[230]:=tmp;
						end;
					if shift < 0 then
						for I := (shift+1) to 0 do begin
							tmp:=table[48];            //0..9
							for j := 48 to 56 do
								table[j]:=table[j+1];
							table[57]:=tmp;

							tmp:=table[65];            //A..Z
							for j := 65 to 89 do
								table[j]:=table[j+1];
							table[90]:=tmp;

							tmp:=table[97];            //a..z
              for j := 97 to 121 do
                table[j]:=table[j+1];
              table[122]:=tmp;

							tmp:=table[192];           //�..�
              for j := 192 to 222 do
                table[j]:=table[j+1];
              table[223]:=tmp;
              tmp:=table[168];
              table[168]:=table[197];
              table[197]:=tmp;

							tmp:=table[224];           //�..�
							for j := 224 to 254 do
								table[j]:=table[j+1];
							table[255]:=tmp;
							tmp:=table[184];
							table[184]:=table[229];
							table[229]:=tmp;
						end;
						for I := 0 to 255 do
							edits_array[i].Text:=chr(table[i]);
					form39.Caption:='������ (�����: '+inttostr(shift)+')';
			end;
{$ENDREGION}

{#region byte inversion}{$REGION}
			5: begin                           //Reverse (Global)
					for I := 0 to 255 do begin
            table[i]:=255-i;
            edits_array[i].Text:=chr(table[i]);
          end;
          form39.Caption:='Invert bytes';
			end;
{$ENDREGION}

{#region qwerty <-> ������}{$REGION}
    	6: begin
					table[$22]:=$DD;
					table[$27]:=$FD;
					table[$2C]:=$3F;
					table[$2E]:=$2F;
					table[$2F]:=$2E;
					temp:=#$C6+#$E6+#$3C+#$3D+#$3E+#$2C+#$40+#$D4+#$C8+
								#$D1+#$C2+#$D3+#$C0+#$CF+#$D0+#$D8+#$CE+#$CB+
								#$C4+#$DC+#$D2+#$D9+#$C7+#$C9+#$CA+#$DB+#$C5+
								#$C3+#$CC+#$D6+#$D7+#$CD+#$DF+#$F5+#$5C+#$FA+
								#$5E+#$5F+#$B8+#$F4+#$E8+#$F1+#$E2+#$F3+#$E0+
								#$EF+#$F0+#$F8+#$EE+#$EB+#$E4+#$FC+#$F2+#$F9+
								#$E7+#$E9+#$EA+#$FB+#$E5+#$E3+#$EC+#$F6+#$F7+
								#$ED+#$FF+#$D5+#$7C+#$DA+#$A8;
					for I := $3A to $7E do
						table[i]:=ord(temp[i-$39]);
					table[$A8]:=$7E;
					table[$B8]:=$60;
					temp:=#$46+#$C1+#$44+#$55+#$4C+#$54+#$3A+#$50+#$42+
								#$51+#$52+#$4B+#$56+#$59+#$4A+#$47+#$48+#$43+
								#$4E+#$45+#$41+#$7B+#$57+#$58+#$49+#$4F+#$7D+
								#$53+#$4D+#$22+#$DE+#$5A+#$66+#$E1+#$64+#$75+
								#$6C+#$74+#$3B+#$70+#$62+#$71+#$72+#$6B+#$76+
								#$79+#$6A+#$67+#$68+#$63+#$6E+#$65+#$61+#$5B+
								#$77+#$78+#$69+#$6F+#$5D+#$73+#$6D+#$27+#$FE+
								#$7A;
					for I := $C0 to $FF do
						table[i]:=ord(temp[i-$BF]);
					for I := 0 to 255 do
						edits_array[i].Text:=chr(table[i]);
					form39.Caption:='������ ����� En <-> Ru';
			end;
{$ENDREGION}

{#region qwerty<->dworak (en)}{$REGION}
			7: begin                           //qwerty<->dworak (en)
					temp:='_#$%&-()*}w[vz0123456789SsW]VZ@AXJE>UIDCHTNMBRL"POYGK' +
								'<QF:/\=^{`axje.uidchtnmbrl'+#39+'poygk,qf;?|+';
					for I := 34 to 125 do
						table[i]:=ord(temp[i-33]);
					for I := 0 to 255 do
						edits_array[i].Text:=chr(table[i]);
					form39.Caption:='qwerty<->dworak (en)';
			end;
{$ENDREGION}

{#region old v1.2 defkey}{$REGION}
			8: begin                           //old v1.2 defkey
					for I := 0 to 25 do
						table[i]:=i+97;
					for I := 26 to 51 do
						table[i]:=i+39;
					for I := 52 to 57 do
						table[i]:=i+172;
					table[58]:=184;
					for I := 59 to 84 do
						table[i]:=i+171;
					for I := 85 to 90 do
						table[i]:=i+107;
					table[91]:=168;
					for I := 92 to 117 do
						table[i]:=i+106;
					for I := 118 to 127 do
						table[i]:=i-70;
					temp:=#$60#$7E#$21#$40#$23#$24#$25#$5E#$26+
								#$2A#$28#$29#$2D#$5F#$3D#$2B#$5C#$7C+
								#$5B#$5D#$7B#$7D#$3B#$3A#$27#$22#$2C+
								#$2E#$3C#$3E#$2F#$3F#$B9#$20#$0D#$A4+
								#$A6#$A7#$A9#$AB#$BB#$00#$B0#$B1#$B5+
								#$B6#$B7#$96#$97#$91#$92#$82#$93#$BF+
								#$94#$84#$85#$89#$8B#$9B;
          for I := 128 to 187 do
            table[i]:=ord(temp[i-127]);
          for I := 188 to 199 do
            table[i]:=i-187;
          for I := 200 to 217 do
            table[i]:=i-186;
					temp:=#$7F#$80#$81#$83#$86#$8A#$8C#$88#$8D+
								#$99#$8E#$8F#$90#$95#$98#$9A#$9C#$87;
          for I := 218 to 235 do
            table[i]:=ord(temp[i-217]);
          for I := 236 to 242 do
            table[i]:=i-79;
          table[243]:=165;
          table[244]:=170;
          for I := 245 to 248 do
            table[i]:=i-73;
          for I := 249 to 251 do
            table[i]:=i-71;
          table[252]:=186;
          for I := 253 to 255 do
						table[i]:=i-65;
					for I := 0 to $F do
						for J := I to $F do begin
							rand := I * $10 + J;
							shift := rand shr 4 or (rand and $0F) shl 4;
							tmp := table[rand];
							table[rand] := table[shift];
							table[shift] := tmp;
						end;
					for I := 0 to 255 do
            edits_array[i].Text:=chr(table[i]);
          form39.Caption:='v1.2 default key';
			end;
{$ENDREGION}

{#region dynamic shift}{$REGION}
			9: begin                           //increasing shift
					try
						rand:=strtoint(maskedit1.Text);
						tmp:= strtoint(maskedit2.Text);
					except on EConvertError do begin
						MessageDlg(SEnterSolNum, mtWarning, [mbYes], 0);
						maskedit2.setFocus;
						EXIT;
					end;
					end;
					shift:=0;
          setLength(table2,tmp);
          for I := 0 to tmp - 1 do begin
            for j := 0 to 255 do
							table2[i][j]:=j + shift;
						INC(shift,rand);
          end;
                  for I := 0 to 255 do
                    edits_array[i].Text:=chr(table2[0][i]);
                  form39.trackbar1.max:=length(table2);
                  form39.trackbar1.position:=1;
                  form39.trackbar1.Enabled:=true;
									form39.MaskEdit1.Enabled:=true;
                  form39.MaskEdit1.text:=#$31;
                  form39.Caption:='key (dynamic shift '+maskedit1.Text+') (2-dimensions, size: '+inttostr(length(table2))+')';

			end;
		end;
{$ENDREGION}

if not form39.TrackBar1.Enabled then begin

temp:=edits_array[0].Text;
edits_array[0].Text:='';
form39.unlock;
edits_array[0].Text:= temp; //perform TForm39.EditsOnChange
end;
form39.unlock;
self.Close;
end;

procedure Tgenerator_settings.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure Tgenerator_settings.useSeedClick(Sender: TObject);
begin
edit1.Enabled := useSeed.Checked;
if useSeed.Checked then begin
	edit1.SetFocus;
  edit1.SelectAll;
	end;
end;

procedure Tgenerator_settings.ComboBox1Change(Sender: TObject);
begin
if ComboBox1.ItemIndex = 4 then
  begin
    label3.Visible:=true;
    maskedit1.Visible:=true;
    label3.Caption:='�����:';
    label4.Visible:=false;
    maskedit2.Visible:=false;
	end else
	if ComboBox1.ItemIndex = 9 then
  begin
    label3.Visible:=true;
    maskedit1.Visible:=true;
    label3.Caption:='f '+#$27+' (x)=';
    label4.Visible:=true;
    maskedit2.Visible:=true;
   end else begin
    label4.Visible:=false;
    maskedit2.Visible:=false;
    label3.Visible:=false;
    maskedit1.Visible:=false;
  end;
if ComboBox1.ItemIndex > 0 then
  begin
    label2.Enabled:=false;
    edit2.Enabled:=false;
		useSeed.Enabled:=false;
		TextSafe.Enabled := false;
    edit1.Enabled:=false;
    RadioGroup1.enabled:=false;
  end else begin
    RadioGroup1.enabled:=true;
    label3.Visible:=false;
		maskedit1.Visible:=false;
		useSeed.Enabled:=true;
		edit1.Enabled:=useSeed.Checked;
		TextSafe.Enabled := true;
	if RadioGroup1.ItemIndex = 0 then begin
		label2.Enabled:=false;
		edit2.Enabled:=false;
	end else begin
		label2.Enabled:=true;
		edit2.Enabled:=true;
end;
  end;
end;

procedure Tgenerator_settings.MaskEdit1Exit(Sender: TObject);
var buf:string;
i:integer;
begin
buf:='';
for I := 1 to length(maskEdit1.Text) do
  case maskEdit1.Text[i] of
    '0'..'9','-','+':buf:=buf+maskEdit1.Text[i];
  end;
maskEdit1.Text:=buf;
if (maskEdit1.Text='') then
  maskEdit1.Text:='1'
end;

procedure Tgenerator_settings.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then begin
  label2.Enabled:=false;
	edit2.Enabled:=false;
end else begin
  label2.Enabled:=true;
  edit2.Enabled:=true;
end;

end;

end.
