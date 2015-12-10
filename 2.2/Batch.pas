unit Batch;

interface

{#region Uses}                                   {$REGION}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, StdCtrls, ComCtrls,stdActns, FileCtrl;{$ENDREGION}

{#region Classes}                                {$REGION}
type
	TBatchForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    CheckBox6: TCheckBox;
    ComboBox2: TComboBox;
		OpenDialog1: TOpenDialog;
    Button6: TButton;
    Button7: TButton;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    ListBox2: TListBox;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button5: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    ComboBox1: TComboBox;
    CheckBox7: TCheckBox;
    TabSheet3: TTabSheet;
    Edit2: TEdit;
    Label3: TLabel;
    Button8: TButton;
    Label4: TLabel;
    Edit3: TEdit;
    Button9: TButton;
    ListBox3: TListBox;
    CheckBox8: TCheckBox;
    SaveDialog1: TSaveDialog;
    TabSheet4: TTabSheet;
    ListBox4: TListBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    TabSheet5: TTabSheet;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    CheckBox11: TCheckBox;
    Button10: TButton;
    GroupBox6: TGroupBox;
    Button11: TButton;
    CheckBox12: TCheckBox;
    procedure CheckBox12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure ListBox4Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
		procedure Button1Click(Sender: TObject);
	private
  	Form_Activated: boolean;
		procedure FileSearch(const dirName:string);
	public
		
	end;                                           {$ENDREGION}

var BatchForm: TBatchForm;

implementation

uses Unit38, Unit39, TABPGDLG, encoder, Threads, Functions, Unit41,
  key_generator;

{$R *.dfm}

{#region Form Events}                            {$REGION}
procedure TBatchForm.FormActivate(Sender: TObject);
begin
if not Form_Activated then
begin
	listbox2.ItemIndex := -1;
	listbox3.ItemIndex := -1;
	listbox4.ItemIndex := -1;
	if pagesdlg.form_activated then
		if pagesdlg.CheckBox6.Checked then
			Edit1.Text := pagesdlg.Edit3.Text;
	Form_Activated := true;
end;
end;

procedure TBatchForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form38.Enabled:=true;
form39.Enabled:=true;
end;

procedure TBatchForm.FormCreate(Sender: TObject);
begin
Form_Activated:=false;
end;

procedure TBatchForm.FormShow(Sender: TObject);
begin
form38.Enabled:=false;
form39.Enabled:=false;
end;

{$ENDREGION}

{#region VCL Events}                             {$REGION}
procedure TBatchForm.Button6Click(Sender: TObject);
var
keyPtr: Pkey;
keyPtr2:Pkey2;
i: byte;
buf: AnsiString;
begin
Form39.maskcollector;
keyPtr := @table;
keyPtr2:= @table2;
case pageControl1.TabIndex of
0: begin
		if listbox1.Items.Count = 0 then
		begin
			messageDlg(SBatchNoFiles, mtWarning, [mbOK], 0);
			EXIT;
		end;
		if ((not DirectoryExists(Edit1.Text)) and (not checkbox5.Checked)) then
		begin
			messageDlg(SBatchNoPath, mtWarning, [mbOK], 0);
			EXIT;
		end;
		if (listbox2.ItemIndex = -1) then
		begin
			messageDlg(SBatchFuncNotSelected, mtWarning, [mbOK], 0);
			EXIT;
		end;
		if ((listbox2.ItemIndex = 2) or (listbox2.ItemIndex = 3)) then begin
			if (length(table2) = 0) and not CheckBox11.Checked then
			begin
				messageDlg(SBatchNoKey, mtWarning, [mbOK], 0);
				EXIT;
			end else
				if not pagesdlg.checkbox5.checked then
					if not volidate(keyPtr2) then
						if messageBox(
													handle,
													 PChar(SKeyCorrupted),
													PChar(SAttention),
													MB_ICONWARNING+
													MB_YESNO
													) = 7 then EXIT;
		end else
			if ((listbox2.ItemIndex = 0) or (listbox2.ItemIndex = 1)) and not CheckBox11.Checked then begin
				if not pagesdlg.checkbox5.checked then
					if volidate(keyPtr) <> '' then
						if messageBox(
													handle,
													 PChar(SKeyCorrupted),
													PChar(SAttention),
													MB_ICONWARNING+
													MB_YESNO
													) = 7 then EXIT;
			end;
		if CheckBox11.Checked and (passPrompt.Edit1.Text = '') then begin
			messageDlg(SBatchDynProcNotSet, mtWarning, [mbOK], 0);
			EXIT;
    end;
		if binary_mode then
			form38.Cleanup_form;
		Threads.run(dt_batch);
	end;
1: begin
		if not FileExists(Edit2.text) then
		begin
				messageDlg(SBatchFileNotExist, mtWarning, [mbOK], 0);
				EXIT;
		end;
		if not DirectoryExists(ExtractFilePath(Edit3.Text)) then
    	begin
				messageDlg(SBatchNoPath, mtWarning, [mbOK], 0);
				EXIT;
			end;
		if (listbox3.ItemIndex = -1) then
		begin
			messageDlg(SBatchFuncNotSelected, mtWarning, [mbOK], 0);
			EXIT;
		end;
		if ((listbox3.ItemIndex = 2) or (listbox3.ItemIndex = 3)) then begin
			if length(table2) <= 0 then
			begin
				messageDlg(SBatchNoKey, mtWarning, [mbOK], 0);
				EXIT;
			end else
				if not pagesdlg.checkbox5.checked then
					if not volidate(keyPtr2) then
						if messageBox(
													handle,
													 PChar(SKeyCorrupted),
													PChar(SAttention),
													MB_ICONWARNING+
													MB_YESNO
													) = 7 then EXIT;
		end else
			if ((listbox3.ItemIndex = 0) or (listbox3.ItemIndex = 1)) then begin
				if not pagesdlg.checkbox5.checked then
					if volidate(keyPtr) <> '' then
						if messageBox(
													handle,
													 PChar(SKeyCorrupted),
													PChar(SAttention),
													MB_ICONWARNING+
													MB_YESNO
													) = 7 then EXIT;
			end;
		if binary_mode then
			form38.Cleanup_form;
		Threads.run(dt_large_file);
	end;
2: begin
		if (binary_data = '') and (listbox4.ItemIndex <> 2) then
		begin
			messageDlg(SBatchFileNotLoaded, mtWarning, [mbOK], 0);
			EXIT;
		end;
		if (listbox4.ItemIndex = -1) then
		begin
			messageDlg(SBatchFuncNotSelected, mtWarning, [mbOK], 0);
			EXIT;
		end;
		if ((listbox4.ItemIndex = 0) or (listbox4.ItemIndex = 1)) then begin
			if length(table2) <= 0 then
			begin
				messageDlg(SBatchNoKey, mtWarning, [mbOK], 0);
				EXIT;
			end else
				if not pagesdlg.checkbox5.checked then
					if not volidate(keyPtr2) then
						if messageBox(
													handle,
													 PChar(SKeyCorrupted),
													PChar(SAttention),
													MB_ICONWARNING+
													MB_YESNO
													) = 7 then EXIT;
		end;
		if (listbox4.ItemIndex = 3) and
		(passPrompt.Edit1.Text = '')and
		checkbox12.Checked then begin
			messageDlg(SBatchDynProcNotSet, mtWarning, [mbOK], 0);
			EXIT;
		end;
		if (listbox4.ItemIndex = 3) and (length(binary_data) < 54) then begin
			messageDlg(SFileCorrupted, mtWarning, [mbOK], 0);
			EXIT;
		end;
		case listbox4.ItemIndex of
			0:	if SaveDialog1.Execute then
							Threads.run(dt_multifart, SaveDialog1.FileName);
			1:	if SaveDialog1.Execute then
							Threads.run(dt_warp, SaveDialog1.FileName);
			2:	begin
						form39.lock;
						if length(table2) > 0 then begin
							keyPtr2 := @table2;
							invert(keyptr2);
							for I := 0 to 255 do
								edits_array[i].Text := chr(table2[form39.trackbar1.position][i]);
						end else begin
							Form39.maskcollector;
							keyptr := @table;
							i := TransposCnt(keyptr);
							invert(keyptr);
							if TransposCnt(keyptr) = i then
								messageBox(
									handle,
									PChar(SKeyInvar),
									PChar(SHint),
									MB_ICONINFORMATION+
									MB_OK
								);
							for I := 0 to 255 do
								edits_array[i].Text := chr(table[i]);
						end;
						form39.unlock;
					end;

			3:	if checkbox12.checked then { TODO : Create real stegano }
						if checkbox9.Checked then
							Threads.run(dt_encode_dyn, 'bmpheader')
						else
							Threads.run(dt_decode_dyn, 'bmpheader')
					else
						if length(table2) > 0 then
							if checkbox9.Checked then
								Threads.run(dt_encode_2dimm, 'bmpheader')
							else
								Threads.run(dt_decode_2dimm, 'bmpheader')
						else
							if checkbox9.Checked then
								Threads.run(dt_encode, 'bmpheader')
							else
								Threads.run(dt_decode, 'bmpheader')
		end;
		if CheckBox6.Checked then Close;
	end;
end;

end;

procedure TBatchForm.Button10Click(Sender: TObject);
begin
	passPrompt.ShowModalP(3);
end;

procedure TBatchForm.Button11Click(Sender: TObject);
begin
  passPrompt.ShowModalP(3);
end;

procedure TBatchForm.Button1Click(Sender: TObject);
begin
opendialog1.Options := [ofHideReadOnly, ofPathMustExist, ofFileMustExist,
												ofExtensionDifferent, ofEnableSizing, ofDontAddToRecent,
												ofAllowMultiSelect];
if opendialog1.Execute(handle) then
	listbox1.Items.AddStrings(opendialog1.Files);
end;

procedure TBatchForm.Button2Click(Sender: TObject);
var FDir :string;
begin
	{BrowseForFolder := TBrowseForFolder.Create(nil);
	with BrowseForFolder do try
		RootDir := 'C:\';
		if Execute then
			FileSearch(Folder);
	finally
		Free;
	end; }
	if SelectDirectory(SSelectDirectory, ExtractFileDrive(FDir), FDir,
						 [sdNewUI]) then
		try
			FileSearch(FDir);
		finally

		end;
end;

procedure TBatchForm.Button3Click(Sender: TObject);
begin
	listbox1.DeleteSelected;
end;

procedure TBatchForm.Button4Click(Sender: TObject);
begin
	listbox1.Clear;
end;

procedure TBatchForm.Button5Click(Sender: TObject);
var FDir	:	string;
begin
	if SelectDirectory(SSelectDirectory, edit1.Text, FDir,
						 [sdNewUI,sdNewFolder]) then
		try
			Edit1.Text := IncludeTrailingBackSlash(FDir);
		finally

		end;
end;

procedure TBatchForm.Button7Click(Sender: TObject);
begin
	Close;
end;

procedure TBatchForm.Button8Click(Sender: TObject);
begin
opendialog1.Options := [ofHideReadOnly, ofPathMustExist, ofFileMustExist,
												ofExtensionDifferent, ofEnableSizing, ofDontAddToRecent];
if opendialog1.Execute(handle) then
	if FileExists(opendialog1.filename) then
		Edit2.Text := opendialog1.FileName;
end;

procedure TBatchForm.Button9Click(Sender: TObject);
begin
if SaveDialog1.Execute(handle) then
	Edit3.Text := SaveDialog1.FileName;
end;

procedure TBatchForm.CheckBox11Click(Sender: TObject);
begin
button10.Enabled := CheckBox11.Checked;
end;

procedure TBatchForm.CheckBox12Click(Sender: TObject);
begin
	button11.Enabled := checkbox12.Checked;
end;

procedure TBatchForm.CheckBox5Click(Sender: TObject);
begin
CheckBox4.Enabled := not CheckBox5.Checked;
CheckBox1.Enabled := not CheckBox5.Checked;
Edit1.Enabled 		:= not CheckBox5.Checked;
Button5.Enabled 	:= not CheckBox5.Checked;
ComboBox1.Enabled	:= not CheckBox5.Checked;
end;

procedure TBatchForm.ListBox2Click(Sender: TObject);
begin
if listbox2.ItemIndex = 4 then begin
	checkbox7.Visible := true;
	checkbox11.Visible:= false;
	button10.Visible	:= false;
end else begin
	checkbox7.Visible := false;
	checkbox11.Visible:= true;
	button10.Visible	:= true;
end;
end;

procedure TBatchForm.ListBox3Click(Sender: TObject);
begin
if listbox3.ItemIndex = 4 then begin
	checkbox8.Visible := true;
	if (Edit2.Text <> '') and (Edit3.Text = '') then
		Edit3.Text := Edit2.Text;
end
else
	checkbox8.Visible := false;
end;

procedure TBatchForm.ListBox4Click(Sender: TObject);
begin
case listbox4.ItemIndex of
	0:	label5.Caption := SBatchMiscInfo0;
	1:	label5.caption := SBatchMiscInfo1;
	2:  label5.caption := SBatchMiscInfo2;
	3:  label5.caption := SBatchMiscInfo3;
end;
if listbox4.ItemIndex = 1 then
	checkBox10.visible := true
else
	checkBox10.visible := false;
if listbox4.ItemIndex = 3 then begin
	button11.visible := true;
	checkbox12.Visible := true;
end
else begin
	button11.visible := false;
	checkbox12.Visible := false;
end;

if  (listbox4.ItemIndex = 0) or
		(listbox4.ItemIndex = 1) or
		(listbox4.ItemIndex = 3) then
	checkbox9.Visible := true
else
	checkbox9.Visible := false;
end;
																								 {$ENDREGION}



procedure TBatchForm.FileSearch(const dirName:string);
var
	searchResult: TSearchRec;
begin
	if FindFirst(dirName+'\*', faAnyFile, searchResult)=0 then begin
		try
			repeat
				if (searchResult.Attr and faDirectory)=0 then begin
						listbox1.Items.Append(IncludeTrailingBackSlash(dirName)+searchResult.Name);
				end else if (searchResult.Name<>'.') and (searchResult.Name<>'..') then begin
					FileSearch(IncludeTrailingBackSlash(dirName)+searchResult.Name);
				end;
			until FindNext(searchResult)<>0
		finally
			FindClose(searchResult);
		end;
	end;
end;

end.