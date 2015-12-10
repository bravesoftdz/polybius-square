﻿(* Квадрат полибия v2.4
 * Просто помни, сука, что программу накодил Серенков Валерий,
 * E-Mail: <webmaster@anime.net.kg>
 * Сайт: http://anime.net.kg/
 *)
{>> Многоалфавитный шифр замены

Зависимости: НЕТ
Автор:       Frederica Bernkastel, mails@namba.kg, Skype: frederica.bernkastel0
Дата:        17 января 2015 г.
**************************************************************************}

{*************************************************************************}
{ Multialphabetical replace cypher Unit For Borland Delphi }
{ }
{ Copyright © 2015 by Frederica Bernkastel }
{ E-mail: mails@namba.kg, }
{ Web-site: }
{ }
{*************************************************************************}
{******************************* SPEED TEST ******************************
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
* if ... else if ... cascade (+freq analyze +grouping)  218075.7   bytes/s
* if ... else if ... cascade (+freq analyze)            436151.4   bytes/s
* if ... else if ... cascade                            655206.875 bytes/s
* new :byte modification                               3288097.78  bytes/s
* new :byte modification secondGen (+freq analyze)     6070272     bytes/s
* new :byte modification secondGen                     6201344     bytes/s
* new :byte modification thirdGen                      7944499     bytes/s
* new :byte modification thirdGen  (AnsiChar mod)      8077577.5   bytes/s
* new :byte modification thirdGen  (decode)            8130165     bytes/s
* file_encode_2dimm (2)                                5392056     bytes/s
* file_encode_2dimm (16)                               5368875     bytes/s
* file_encode_2dimm (1024)                             5269258     bytes/s
* file_encode_2dimm (65536)                            5080717     bytes/s
* file_decode_2dimm (2)                              119744782.37  bytes/s
* file_decode_2dimm (16)                             119744782.37  bytes/s
* file_decode_2dimm (1024)                           106518814.72  bytes/s
* file_decode_2dimm (65536)                           27252762.68  bytes/s
* file_decode (final Gen)                            198426641.59  bytes/s
* freq analyze                                      >209715200     bytes/s
* invert                                                   <16     ms
* invert_2dimm   (65536)                                    63     ms
* volidate			 (65536)                                    47     ms
* volidate_text	 (65536)																	 <16		 ms
	@2.61GHz
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
*************************************************************************}

unit encoder;

interface

{	* Здесь и далее, КЛЮЧ - установленное взаимооднозначное
	* соответствие множества байт на себя I <--> Key[ I ] }
type	TByteArray = array of byte;
    	PByteArray = ^TByteArray;
type 	Tkey 			 = array [0..255] of byte;
			Pkey 			 = ^Tkey;
type 	Tkey2 		 = array of Tkey;
			Pkey2 		 = ^Tkey2;
type 	TFrequency = array[0..255] of Int64;

{	* В большистве функций, данные передаются через указатели
	* на строки типа PAnsiString}

{Старые функции очаровывания / разочаровывания :)}
function encode(input			:	AnsiString;
								key				: Pkey;
								grouping	:	integer;
								separator	:	AnsiString):Ansistring;
function decode(input:Ansistring; key: Pkey):Ansistring;
{unction encode2(input: string; fill_zero:boolean):string;}

{Шифрование моноалфавитным ключом}
procedure file_encode			 (data:PAnsiString; key: Pkey);
procedure file_decode			 (data:PAnsiString; key: Pkey); overload;

{Шифрование многоалфавитным ключом}
procedure file_encode_2dimm(data:PAnsiString; key: Pkey2);
procedure file_decode_2dimm(data:PAnsiString; key: Pkey2); overload;
procedure file_decode_2dimm(data:PAnsiString; key: Pkey2; initKeyOffset, initDataOffset: int64); overload;
{	* Функция инвертирования ключа.
	* Если применить функцию дешифрования данных с инвертированным ключом,
	* то произойдёт обратное преобразование, т.е. шифрование.
	* Т.к. дешифрование на порядок быстрее шифрования.}
procedure invert	(key: Pkey); overload;
procedure invert	(key: Pkey2);overload;

{	* Проверка ключа на взаимооднозначное соответствие байт.
	* Необходимо производить проверку перед любыми действиями с ключом,
	* иначе последствия непредсказуемы.}
{ * volidate(PKey) - точно указыает на перекрывающиеся байты
	* volidate(PKey2) - true, если ошибок нет.}
function  volidate(key: Pkey): string; overload;
function  volidate(key: Pkey2):boolean; overload;

{	*	Проверка ключа на неизменность управляющих символов ASCII,
	*	т.е. соответствию key[ i ] = i, где 00h <= i < 20h }
function  volidate_text(key: Pkey):	boolean; overload;
function  volidate_text(key: Pkey2):	boolean; overload;

{	*	Вычисление количества транспозиций ключа}
function	TransposCnt(key: PKey): integer;

{	* Частотный анализ данных
	* TFrequency - массив [0..255] количеств соответствующих байт (ненормализован)}
function  Frequency_analysis(data: PAnsiString):TFrequency;

{	* Очаровывание строки (преобразование в HexAscii Win-1251)}
function  StrToHex(text: String):String;

function 	IntToHex(Value: Int64; Digits: Integer): string;
procedure CvtInt64;

var progress: integer;	//Прогресс чего-либо, доступный любому потоку

implementation

{#region encode/decode}{$REGION}
procedure file_encode(data:PAnsiString; key: Pkey);
var i					:	integer;
		_length		:	integer;
		i2				:	byte;
		ord_input	:	byte;
begin
//result:='';
	_length := length(data^);
	if _length = 0  then EXIT;
//for I := 0 to 255 do
//setLength(result,_length);
	for I := 1 to _length do begin
			ord_input := ord(data^[i]);
			for I2 := 0 to 255 do begin
				if ord_input = key^[i2] then begin
					data^[i] := chr(i2);  //MOV BYTE PTR DS:[ESI+EAX-1],BL
					break;
				end;
		end;
		progress:=i;
	end;
	progress:=0;
end;

procedure file_decode(data:PAnsiString; key: Pkey);
var i					:	integer;
		_length		:	integer;
		ord_input	:	byte;
begin
	_length := length(data^);  //get size of data
	if _length = 0  then EXIT;

// setLength(result,_length);
	for I := 1 to _length do begin
			ord_input := ord(data^[i]); //chr to bin
			data^[i]  := chr(key^[ord_input]);
			 { if not switch then
					data^[i]:=chr(0);}
			//if ((i) mod trunc(_length/255)) = 0 then
			//	INC(progress);
			progress:=i;
	end;
	progress:=0;
end;

procedure file_encode_2dimm(data: PAnsistring; key: Pkey2);
var i					:	integer;
		i2				:	integer;
		i3				:	integer;
		_length		:	integer;
		key_length:	integer;
		ord_input	: byte;
begin
		progress := 0;
		_Length 	:= length(data^); //get size of data
		if _length = 0  then EXIT;
		key_length:= length(key^);//get size of key
		if key_length = 0  then EXIT;

		for i:=1 to _length do begin
				ord_input := ord(data^[i]);//chr to byte
				i3:=i - ((i-1) div key_length) * key_length - 1;//fract function
																												//if size of data >
																												//size of key --> loop key
			for i2   := 0 to 255 do                       {normally, size of 2nd
																										dimension of key is fixed, and
																										equals 256 (2^8)}
				if ord_input = key^[i3][i2] then begin
				 data^[i] := chr(i2);
         break;
		 end;
		 progress:=i;
	end;
	progress:=0;
end;

procedure file_decode_2dimm(data: PAnsistring; key: Pkey2);
var i					:	integer;
		i3				:	integer;
		_length		:	integer;
		key_length:	integer;
		ord_input	: byte;
begin
		_Length		:= length(data^); //get size of data
		if _length = 0  then EXIT;
		key_length:= length(key^);  //get size of key
		if key_length = 0  then EXIT;
			for i:=1 to _length do begin
				ord_input := ord(data^[i]);//chr to byte
				i3 := i - ((i-1) div key_length) * key_length - 1;  //see 149 line
				data^[i] := chr(key^[i3][ord_input]);
				progress:=i;
		end;
		progress:=0;
end;

procedure file_decode_2dimm(data: PAnsistring; key: Pkey2; initKeyOffset, initDataOffset: int64);
var i						:	integer;
		i3,low,high	:	integer;
		_length			:	integer;
		key_length	:	integer;
		ord_input		: byte;
begin
		_Length		:= length(data^); //get size of data
		if _length = 0  then EXIT;
		key_length:= length(key^);  //get size of key
		if key_length = 0  then EXIT;
		low := initDataOffset + 1;
		high:= low + key_length - 1;
		if high > _length then
			high := _length;
		if Abs(initKeyOffset) >= key_length then
		initKeyOffset := initKeyOffset - Trunc(initKeyOffset / key_length) * key_length;
		if initKeyOffset = 0 then begin
			if initDataOffset = 0 then  //keyOffset =  0,  DataOffset = 0
				for i:=1 to _length do begin
					ord_input := ord(data^[i]);//chr to byte
					i3 := i - ((i-1) div key_length) * key_length - 1;  //see 149 line
					data^[i] := chr(key^[i3][ord_input]);
					progress:=i;
			end else begin										//keyOffset =  0, DataOffset <> 0
				if low < 1 then begin //bad, bad...
					high := high - low + 1;
					low := 1;
				end;
				if high > _length then
					high := _length;
				for i:=low to high do begin
					ord_input := ord(data^[i]);//chr to byte
					data^[i] := chr(key^[i-low][ord_input]);
					progress:=i;
		end end end else
			if initDataOffset = 0 then  //keyOffset <> 0, DataOffset =  0
				for i:=1 to _length do begin
					ord_input := ord(data^[i]);//chr to byte
					i3 := i + initKeyOffset - ((i+initKeyOffset-1) div key_length) * key_length - 1;
					data^[i] := chr(key^[i3][ord_input]);
					progress:=i;
			end else                    //keyOffset <> 0, DataOffset <> 0
				begin
				//...
				end;
		progress:=0;
end;

{unction encode2(input: string; fill_zero:boolean):string;
var i,i2,i3,_length,key_length:integer;
ord_input: byte;
switch:boolean;
begin
result:='';
    _Length:=length(pointer^); //get size of data
    key_length:=length(table2);//get size of key
        for i:=1 to _length do begin
          ord_input:=ord(pointer^[i]);//chr to byte
          i3:=i - ((i-1) div key_length) * key_length - 1;
        switch:=false;
      for i2:=0 to 255 do
        if ord_input=table2[i3][i2] then begin
         result:=result+inttohex(i2);
         switch:=true;
         break;
     end;
				if (not switch) and fill_zero then
           result:=result+inttohex(0);
        end;
end;  }
{$ENDREGION}

{#region utils}{$REGION}
procedure invert(key: Pkey);
var temp: Tkey;
		i: byte;
begin
	for I := 0 to 255 do
		temp[key^[i]] := i;
	key^ := temp;
end;

procedure invert(key: Pkey2);
var _length	: integer;
		i2			: integer;
		i				: byte;
		temp		: Tkey;
begin
	_length := length(key^);
  for I2 := 0 to _length - 1 do begin
    for I := 0 to 255 do
			temp[key^[i2][i]] := i;
		key^[i2] := temp;
  end;
end;

function volidate(key: Pkey):string;
var i,i2:byte;
begin
result:='';
for I := 0 to 255 do
  for i2 := 0 to 255 do
    if ((key^[i] = key^[i2]) and (i <> i2)) then
			result := result + chr(i) + chr(i2);
end;

function  volidate(key: Pkey2):boolean;
var i				:	byte;
		i2		 	:	byte;
		i3			:	integer;
		_length	:	integer;
		temp		: array[0..255] of integer;
begin
	result := true;
	for I := 0 to 255 do
		temp[i] := 0;
	_length := length(key^);
	for I3 := 0 to _length - 1 do
		for I := 0 to 255 do
			temp[key^[i3][i]] := temp[key^[i3][i]] + 1;
	for I := 0 to 255 do
		if temp[i] <> _length then begin
			result := false;
			EXIT;
		end;
end;

function volidate_text(key: Pkey): Boolean;
var i: byte;
begin
	result := true;
	for I := 0 to $1f do
		if key^[i] <> i then begin
			result := false;
			Break;
		end;
end;

function volidate_text(key: Pkey2): Boolean;
var i1, _length: longint;
		i2: byte;
begin
	result := true;
	_length := length(key^);
	for I1 := 0 to _length - 1 do
		for I2 := 0 to $1f do		
			if key^[i1][i2] <> i2 then begin
				result := false;
				EXIT;
			end;
end;

function TransposCnt(key: PKey): integer;
var i: byte;
begin
result := 0;
for I := 0 to 255 do
	if key^[i] > i then
		inc(result);
end;

function  Frequency_analysis(data: PAnsiString):TFrequency;
var
	_length : integer;
	i				: integer;
begin
	for I := 0 to 255 do
		result[i] := 0;
		_length 	:= length(data^);
	for i := 1 to _length do begin
		result[ord(data^[i])] := result[ord(data^[i])] + 1;
		progress:=i;
	end;
end;
{$ENDREGION}

{#region StrToHex}{$REGION}
function IntToHex(Value: Int64; Digits: Integer): string;
//  FmtStr(Result, '%.*x', [Digits, Value]);
asm
        CMP     EAX, 32        // Digits < buffer length?
        JLE     @A1
        XOR     EAX, EAX
@A1:    PUSH    ESI
        MOV     ESI, ESP
        SUB     ESP, 32        // 32 chars
        MOV     ECX, 16        // base 16
        PUSH    EDX            // result ptr
        MOV     EDX, EAX       // zero filled field width: 0 for no leading zeros
        LEA     EAX, Value;
				CALL    CvtInt64

        MOV     EDX, ESI
        POP     EAX            // result ptr
				CALL    System.@LStrFromPCharLen
        ADD     ESP, 32
        POP     ESI
end;
procedure CvtInt64;
{ IN:
    EAX:  Address of the int64 value to be converted to text
    ESI:  Ptr to the right-hand side of the output buffer:  LEA ESI, StrBuf[32]
    ECX:  Base for conversion: 0 for signed decimal, or 10 or 16 for unsigned
    EDX:  Precision: zero padded minimum field width
  OUT:
    ESI:  Ptr to start of converted text (not start of buffer)
    ECX:  Byte length of converted text
}
asm
        OR      CL, CL
        JNZ     @start             // CL = 0  => signed integer conversion
        MOV     ECX, 10
        TEST    [EAX + 4], $80000000
        JZ      @start
        PUSH    [EAX + 4]
        PUSH    [EAX]
        MOV     EAX, ESP
        NEG     [ESP]              // negate the value
        ADC     [ESP + 4],0
        NEG     [ESP + 4]
        CALL    @start             // perform unsigned conversion
        MOV     [ESI-1].Byte, '-'  // tack on the negative sign
        DEC     ESI
        INC     ECX
        ADD     ESP, 8
        RET

@start:   // perform unsigned conversion
        PUSH    ESI
        SUB     ESP, 4
        FNSTCW  [ESP+2].Word     // save
        FNSTCW  [ESP].Word       // scratch
        OR      [ESP].Word, $0F00  // trunc toward zero, full precision
        FLDCW   [ESP].Word

        MOV     [ESP].Word, CX
        FLD1
        TEST    [EAX + 4], $80000000 // test for negative
        JZ      @ld1                 // FPU doesn't understand unsigned ints
        PUSH    [EAX + 4]            // copy value before modifying
        PUSH    [EAX]
        AND     [ESP + 4], $7FFFFFFF // clear the sign bit
        PUSH    $7FFFFFFF
        PUSH    $FFFFFFFF
        FILD    [ESP + 8].QWord     // load value
        FILD    [ESP].QWord
        FADD    ST(0), ST(2)        // Add 1.  Produces unsigned $80000000 in ST(0)
        FADDP   ST(1), ST(0)        // Add $80000000 to value to replace the sign bit
        ADD     ESP, 16
        JMP     @ld2
@ld1:
        FILD    [EAX].QWord         // value
@ld2:
        FILD    [ESP].Word          // base
        FLD     ST(1)
@loop:
        DEC     ESI
        FPREM                       // accumulator mod base
        FISTP   [ESP].Word
        FDIV    ST(1), ST(0)        // accumulator := acumulator / base
        MOV     AL, [ESP].Byte      // overlap long FPU division op with int ops
        ADD     AL, '0'
        CMP     AL, '0'+10
        JB      @store
				ADD     AL, ('A'-'0')-10
@store:
        MOV     [ESI].Byte, AL
        FLD     ST(1)           // copy accumulator
        FCOM    ST(3)           // if accumulator >= 1.0 then loop
        FSTSW   AX
        SAHF
        JAE @loop

        FLDCW   [ESP+2].Word
        ADD     ESP,4

        FFREE   ST(3)
        FFREE   ST(2)
        FFREE   ST(1);
        FFREE   ST(0);

        POP     ECX             // original ESI
        SUB     ECX, ESI        // ECX = length of converted string
        SUB     EDX,ECX
        JBE     @done           // output longer than field width = no pad
        SUB     ESI,EDX
        MOV     AL,'0'
        ADD     ECX,EDX
        JMP     @z
@zloop: MOV     [ESI+EDX].Byte,AL
@z:     DEC     EDX
        JNZ     @zloop
        MOV     [ESI].Byte,AL
@done:
end;

function  StrToHex(text: String):String;
var i,_length:integer;
begin
result := '';
_length:=length(text);
for I := 1 to _length do
	result:=result+IntToHex(ord(text[I]),2)+#32;
if result[length(result)] = #32 then
	setLength(result,length(result)-1);
end;
{$ENDREGION}

{#region old charing/uncharing funcs}{$REGION}
function encode(input:string; key: Pkey; grouping:integer; separator: String):string;
var i						:	integer;
		z						:	integer;
		ord_input_i	:	longint;
begin
result	:=	'';
z				:=	grouping;
		{for I2 := 0 to 255 do
			if input[I]=table[I2  ] then begin
				freq(InttoHex(I2,2)); result:=result+InttoHex(I2,2); break end;}
for I := 1 to length(input) do begin
if grouping > 0 then //группировка символов
	z := z+1;
	if z >= grouping then begin
		result := result + separator;
		z := 0;
	end;
ord_input_i:=ord(input[I]);
if ord_input_i=key^[0  ] then result:=result+'00' else
if ord_input_i=key^[1  ] then result:=result+'01' else
if ord_input_i=key^[2  ] then result:=result+'02' else
if ord_input_i=key^[3  ] then result:=result+'03' else
if ord_input_i=key^[4  ] then result:=result+'04' else
if ord_input_i=key^[5  ] then result:=result+'05' else
if ord_input_i=key^[6  ] then result:=result+'06' else
if ord_input_i=key^[7  ] then result:=result+'07' else
if ord_input_i=key^[8  ] then result:=result+'08' else
if ord_input_i=key^[9  ] then result:=result+'09' else
if ord_input_i=key^[10 ] then result:=result+'0a' else
if ord_input_i=key^[11 ] then result:=result+'0b' else
if ord_input_i=key^[12 ] then result:=result+'0c' else
if ord_input_i=key^[13 ] then result:=result+'0d' else
if ord_input_i=key^[14 ] then result:=result+'0e' else
if ord_input_i=key^[15 ] then result:=result+'0f' else
if ord_input_i=key^[16 ] then result:=result+'10' else
if ord_input_i=key^[17 ] then result:=result+'11' else
if ord_input_i=key^[18 ] then result:=result+'12' else
if ord_input_i=key^[19 ] then result:=result+'13' else
if ord_input_i=key^[20 ] then result:=result+'14' else
if ord_input_i=key^[21 ] then result:=result+'15' else
if ord_input_i=key^[22 ] then result:=result+'16' else
if ord_input_i=key^[23 ] then result:=result+'17' else
if ord_input_i=key^[24 ] then result:=result+'18' else
if ord_input_i=key^[25 ] then result:=result+'19' else
if ord_input_i=key^[26 ] then result:=result+'1a' else
if ord_input_i=key^[27 ] then result:=result+'1b' else
if ord_input_i=key^[28 ] then result:=result+'1c' else
if ord_input_i=key^[29 ] then result:=result+'1d' else
if ord_input_i=key^[30 ] then result:=result+'1e' else
if ord_input_i=key^[31 ] then result:=result+'1f' else
if ord_input_i=key^[32 ] then result:=result+'20' else
if ord_input_i=key^[33 ] then result:=result+'21' else
if ord_input_i=key^[34 ] then result:=result+'22' else
if ord_input_i=key^[35 ] then result:=result+'23' else
if ord_input_i=key^[36 ] then result:=result+'24' else
if ord_input_i=key^[37 ] then result:=result+'25' else
if ord_input_i=key^[38 ] then result:=result+'26' else
if ord_input_i=key^[39 ] then result:=result+'27' else
if ord_input_i=key^[40 ] then result:=result+'28' else
if ord_input_i=key^[41 ] then result:=result+'29' else
if ord_input_i=key^[42 ] then result:=result+'2a' else
if ord_input_i=key^[43 ] then result:=result+'2b' else
if ord_input_i=key^[44 ] then result:=result+'2c' else
if ord_input_i=key^[45 ] then result:=result+'2d' else
if ord_input_i=key^[46 ] then result:=result+'2e' else
if ord_input_i=key^[47 ] then result:=result+'2f' else
if ord_input_i=key^[48 ] then result:=result+'30' else
if ord_input_i=key^[49 ] then result:=result+'31' else
if ord_input_i=key^[50 ] then result:=result+'32' else
if ord_input_i=key^[51 ] then result:=result+'33' else
if ord_input_i=key^[52 ] then result:=result+'34' else
if ord_input_i=key^[53 ] then result:=result+'35' else
if ord_input_i=key^[54 ] then result:=result+'36' else
if ord_input_i=key^[55 ] then result:=result+'37' else
if ord_input_i=key^[56 ] then result:=result+'38' else
if ord_input_i=key^[57 ] then result:=result+'39' else
if ord_input_i=key^[58 ] then result:=result+'3a' else
if ord_input_i=key^[59 ] then result:=result+'3b' else
if ord_input_i=key^[60 ] then result:=result+'3c' else
if ord_input_i=key^[61 ] then result:=result+'3d' else
if ord_input_i=key^[62 ] then result:=result+'3e' else
if ord_input_i=key^[63 ] then result:=result+'3f' else
if ord_input_i=key^[64 ] then result:=result+'40' else
if ord_input_i=key^[65 ] then result:=result+'41' else
if ord_input_i=key^[66 ] then result:=result+'42' else
if ord_input_i=key^[67 ] then result:=result+'43' else
if ord_input_i=key^[68 ] then result:=result+'44' else
if ord_input_i=key^[69 ] then result:=result+'45' else
if ord_input_i=key^[70 ] then result:=result+'46' else
if ord_input_i=key^[71 ] then result:=result+'47' else
if ord_input_i=key^[72 ] then result:=result+'48' else
if ord_input_i=key^[73 ] then result:=result+'49' else
if ord_input_i=key^[74 ] then result:=result+'4a' else
if ord_input_i=key^[75 ] then result:=result+'4b' else
if ord_input_i=key^[76 ] then result:=result+'4c' else
if ord_input_i=key^[77 ] then result:=result+'4d' else
if ord_input_i=key^[78 ] then result:=result+'4e' else
if ord_input_i=key^[79 ] then result:=result+'4f' else
if ord_input_i=key^[80 ] then result:=result+'50' else
if ord_input_i=key^[81 ] then result:=result+'51' else
if ord_input_i=key^[82 ] then result:=result+'52' else
if ord_input_i=key^[83 ] then result:=result+'53' else
if ord_input_i=key^[84 ] then result:=result+'54' else
if ord_input_i=key^[85 ] then result:=result+'55' else
if ord_input_i=key^[86 ] then result:=result+'56' else
if ord_input_i=key^[87 ] then result:=result+'57' else
if ord_input_i=key^[88 ] then result:=result+'58' else
if ord_input_i=key^[89 ] then result:=result+'59' else
if ord_input_i=key^[90 ] then result:=result+'5a' else
if ord_input_i=key^[91 ] then result:=result+'5b' else
if ord_input_i=key^[92 ] then result:=result+'5c' else
if ord_input_i=key^[93 ] then result:=result+'5d' else
if ord_input_i=key^[94 ] then result:=result+'5e' else
if ord_input_i=key^[95 ] then result:=result+'5f' else
if ord_input_i=key^[96 ] then result:=result+'60' else
if ord_input_i=key^[97 ] then result:=result+'61' else
if ord_input_i=key^[98 ] then result:=result+'62' else
if ord_input_i=key^[99 ] then result:=result+'63' else
if ord_input_i=key^[100] then result:=result+'64' else
if ord_input_i=key^[101] then result:=result+'65' else
if ord_input_i=key^[102] then result:=result+'66' else
if ord_input_i=key^[103] then result:=result+'67' else
if ord_input_i=key^[104] then result:=result+'68' else
if ord_input_i=key^[105] then result:=result+'69' else
if ord_input_i=key^[106] then result:=result+'6a' else
if ord_input_i=key^[107] then result:=result+'6b' else
if ord_input_i=key^[108] then result:=result+'6c' else
if ord_input_i=key^[109] then result:=result+'6d' else
if ord_input_i=key^[110] then result:=result+'6e' else
if ord_input_i=key^[111] then result:=result+'6f' else
if ord_input_i=key^[112] then result:=result+'70' else
if ord_input_i=key^[113] then result:=result+'71' else
if ord_input_i=key^[114] then result:=result+'72' else
if ord_input_i=key^[115] then result:=result+'73' else
if ord_input_i=key^[116] then result:=result+'74' else
if ord_input_i=key^[117] then result:=result+'75' else
if ord_input_i=key^[118] then result:=result+'76' else
if ord_input_i=key^[119] then result:=result+'77' else
if ord_input_i=key^[120] then result:=result+'78' else
if ord_input_i=key^[121] then result:=result+'79' else
if ord_input_i=key^[122] then result:=result+'7a' else
if ord_input_i=key^[123] then result:=result+'7b' else
if ord_input_i=key^[124] then result:=result+'7c' else
if ord_input_i=key^[125] then result:=result+'7d' else
if ord_input_i=key^[126] then result:=result+'7e' else
if ord_input_i=key^[127] then result:=result+'7f' else
if ord_input_i=key^[128] then result:=result+'80' else
if ord_input_i=key^[129] then result:=result+'81' else
if ord_input_i=key^[130] then result:=result+'82' else
if ord_input_i=key^[131] then result:=result+'83' else
if ord_input_i=key^[132] then result:=result+'84' else
if ord_input_i=key^[133] then result:=result+'85' else
if ord_input_i=key^[134] then result:=result+'86' else
if ord_input_i=key^[135] then result:=result+'87' else
if ord_input_i=key^[136] then result:=result+'88' else
if ord_input_i=key^[137] then result:=result+'89' else
if ord_input_i=key^[138] then result:=result+'8a' else
if ord_input_i=key^[139] then result:=result+'8b' else
if ord_input_i=key^[140] then result:=result+'8c' else
if ord_input_i=key^[141] then result:=result+'8d' else
if ord_input_i=key^[142] then result:=result+'8e' else
if ord_input_i=key^[143] then result:=result+'8f' else
if ord_input_i=key^[144] then result:=result+'90' else
if ord_input_i=key^[145] then result:=result+'91' else
if ord_input_i=key^[146] then result:=result+'92' else
if ord_input_i=key^[147] then result:=result+'93' else
if ord_input_i=key^[148] then result:=result+'94' else
if ord_input_i=key^[149] then result:=result+'95' else
if ord_input_i=key^[150] then result:=result+'96' else
if ord_input_i=key^[151] then result:=result+'97' else
if ord_input_i=key^[152] then result:=result+'98' else
if ord_input_i=key^[153] then result:=result+'99' else
if ord_input_i=key^[154] then result:=result+'9a' else
if ord_input_i=key^[155] then result:=result+'9b' else
if ord_input_i=key^[156] then result:=result+'9c' else
if ord_input_i=key^[157] then result:=result+'9d' else
if ord_input_i=key^[158] then result:=result+'9e' else
if ord_input_i=key^[159] then result:=result+'9f' else
if ord_input_i=key^[160] then result:=result+'a0' else
if ord_input_i=key^[161] then result:=result+'a1' else
if ord_input_i=key^[162] then result:=result+'a2' else
if ord_input_i=key^[163] then result:=result+'a3' else
if ord_input_i=key^[164] then result:=result+'a4' else
if ord_input_i=key^[165] then result:=result+'a5' else
if ord_input_i=key^[166] then result:=result+'a6' else
if ord_input_i=key^[167] then result:=result+'a7' else
if ord_input_i=key^[168] then result:=result+'a8' else
if ord_input_i=key^[169] then result:=result+'a9' else
if ord_input_i=key^[170] then result:=result+'aa' else
if ord_input_i=key^[171] then result:=result+'ab' else
if ord_input_i=key^[172] then result:=result+'ac' else
if ord_input_i=key^[173] then result:=result+'ad' else
if ord_input_i=key^[174] then result:=result+'ae' else
if ord_input_i=key^[175] then result:=result+'af' else
if ord_input_i=key^[176] then result:=result+'b0' else
if ord_input_i=key^[177] then result:=result+'b1' else
if ord_input_i=key^[178] then result:=result+'b2' else
if ord_input_i=key^[179] then result:=result+'b3' else
if ord_input_i=key^[180] then result:=result+'b4' else
if ord_input_i=key^[181] then result:=result+'b5' else
if ord_input_i=key^[182] then result:=result+'b6' else
if ord_input_i=key^[183] then result:=result+'b7' else
if ord_input_i=key^[184] then result:=result+'b8' else
if ord_input_i=key^[185] then result:=result+'b9' else
if ord_input_i=key^[186] then result:=result+'ba' else
if ord_input_i=key^[187] then result:=result+'bb' else
if ord_input_i=key^[188] then result:=result+'bc' else
if ord_input_i=key^[189] then result:=result+'bd' else
if ord_input_i=key^[190] then result:=result+'be' else
if ord_input_i=key^[191] then result:=result+'bf' else
if ord_input_i=key^[192] then result:=result+'c0' else
if ord_input_i=key^[193] then result:=result+'c1' else
if ord_input_i=key^[194] then result:=result+'c2' else
if ord_input_i=key^[195] then result:=result+'c3' else
if ord_input_i=key^[196] then result:=result+'c4' else
if ord_input_i=key^[197] then result:=result+'c5' else
if ord_input_i=key^[198] then result:=result+'c6' else
if ord_input_i=key^[199] then result:=result+'c7' else
if ord_input_i=key^[200] then result:=result+'c8' else
if ord_input_i=key^[201] then result:=result+'c9' else
if ord_input_i=key^[202] then result:=result+'ca' else
if ord_input_i=key^[203] then result:=result+'cb' else
if ord_input_i=key^[204] then result:=result+'cc' else
if ord_input_i=key^[205] then result:=result+'cd' else
if ord_input_i=key^[206] then result:=result+'ce' else
if ord_input_i=key^[207] then result:=result+'cf' else
if ord_input_i=key^[208] then result:=result+'d0' else
if ord_input_i=key^[209] then result:=result+'d1' else
if ord_input_i=key^[210] then result:=result+'d2' else
if ord_input_i=key^[211] then result:=result+'d3' else
if ord_input_i=key^[212] then result:=result+'d4' else
if ord_input_i=key^[213] then result:=result+'d5' else
if ord_input_i=key^[214] then result:=result+'d6' else
if ord_input_i=key^[215] then result:=result+'d7' else
if ord_input_i=key^[216] then result:=result+'d8' else
if ord_input_i=key^[217] then result:=result+'d9' else
if ord_input_i=key^[218] then result:=result+'da' else
if ord_input_i=key^[219] then result:=result+'db' else
if ord_input_i=key^[220] then result:=result+'dc' else
if ord_input_i=key^[221] then result:=result+'dd' else
if ord_input_i=key^[222] then result:=result+'de' else
if ord_input_i=key^[223] then result:=result+'df' else
if ord_input_i=key^[224] then result:=result+'e0' else
if ord_input_i=key^[225] then result:=result+'e1' else
if ord_input_i=key^[226] then result:=result+'e2' else
if ord_input_i=key^[227] then result:=result+'e3' else
if ord_input_i=key^[228] then result:=result+'e4' else
if ord_input_i=key^[229] then result:=result+'e5' else
if ord_input_i=key^[230] then result:=result+'e6' else
if ord_input_i=key^[231] then result:=result+'e7' else
if ord_input_i=key^[232] then result:=result+'e8' else
if ord_input_i=key^[233] then result:=result+'e9' else
if ord_input_i=key^[234] then result:=result+'ea' else
if ord_input_i=key^[235] then result:=result+'eb' else
if ord_input_i=key^[236] then result:=result+'ec' else
if ord_input_i=key^[237] then result:=result+'ed' else
if ord_input_i=key^[238] then result:=result+'ee' else
if ord_input_i=key^[239] then result:=result+'ef' else
if ord_input_i=key^[240] then result:=result+'f0' else
if ord_input_i=key^[241] then result:=result+'f1' else
if ord_input_i=key^[242] then result:=result+'f2' else
if ord_input_i=key^[243] then result:=result+'f3' else
if ord_input_i=key^[244] then result:=result+'f4' else
if ord_input_i=key^[245] then result:=result+'f5' else
if ord_input_i=key^[246] then result:=result+'f6' else
if ord_input_i=key^[247] then result:=result+'f7' else
if ord_input_i=key^[248] then result:=result+'f8' else
if ord_input_i=key^[249] then result:=result+'f9' else
if ord_input_i=key^[250] then result:=result+'fa' else
if ord_input_i=key^[251] then result:=result+'fb' else
if ord_input_i=key^[252] then result:=result+'fc' else
if ord_input_i=key^[253] then result:=result+'fd' else
if ord_input_i=key^[254] then result:=result+'fe' else
if ord_input_i=key^[255] then result:=result+'ff';
//result:=result+'00';
  end;
end;

function decode(input:string; key: Pkey):string;//функция дешифрования
var
		i						:longint;
		input_i_plus:string;
begin
result:='';
i:=1;
while i < length(input) do begin
input_i_plus:=input[i]+input[i+1];
if input_i_plus='00'then result:=result+chr(key^[0  ]) else
if input_i_plus='01'then result:=result+chr(key^[1  ]) else
if input_i_plus='02'then result:=result+chr(key^[2  ]) else
if input_i_plus='03'then result:=result+chr(key^[3  ]) else
if input_i_plus='04'then result:=result+chr(key^[4  ]) else
if input_i_plus='05'then result:=result+chr(key^[5  ]) else
if input_i_plus='06'then result:=result+chr(key^[6  ]) else
if input_i_plus='07'then result:=result+chr(key^[7  ]) else
if input_i_plus='08'then result:=result+chr(key^[8  ]) else
if input_i_plus='09'then result:=result+chr(key^[9  ]) else
if input_i_plus='0a'then result:=result+chr(key^[10 ]) else
if input_i_plus='0b'then result:=result+chr(key^[11 ]) else
if input_i_plus='0c'then result:=result+chr(key^[12 ]) else
if input_i_plus='0d'then result:=result+chr(key^[13 ]) else
if input_i_plus='0e'then result:=result+chr(key^[14 ]) else
if input_i_plus='0f'then result:=result+chr(key^[15 ]) else
if input_i_plus='10'then result:=result+chr(key^[16 ]) else
if input_i_plus='11'then result:=result+chr(key^[17 ]) else
if input_i_plus='12'then result:=result+chr(key^[18 ]) else
if input_i_plus='13'then result:=result+chr(key^[19 ]) else
if input_i_plus='14'then result:=result+chr(key^[20 ]) else
if input_i_plus='15'then result:=result+chr(key^[21 ]) else
if input_i_plus='16'then result:=result+chr(key^[22 ]) else
if input_i_plus='17'then result:=result+chr(key^[23 ]) else
if input_i_plus='18'then result:=result+chr(key^[24 ]) else
if input_i_plus='19'then result:=result+chr(key^[25 ]) else
if input_i_plus='1a'then result:=result+chr(key^[26 ]) else
if input_i_plus='1b'then result:=result+chr(key^[27 ]) else
if input_i_plus='1c'then result:=result+chr(key^[28 ]) else
if input_i_plus='1d'then result:=result+chr(key^[29 ]) else
if input_i_plus='1e'then result:=result+chr(key^[30 ]) else
if input_i_plus='1f'then result:=result+chr(key^[31 ]) else
if input_i_plus='20'then result:=result+chr(key^[32 ]) else
if input_i_plus='21'then result:=result+chr(key^[33 ]) else
if input_i_plus='22'then result:=result+chr(key^[34 ]) else
if input_i_plus='23'then result:=result+chr(key^[35 ]) else
if input_i_plus='24'then result:=result+chr(key^[36 ]) else
if input_i_plus='25'then result:=result+chr(key^[37 ]) else
if input_i_plus='26'then result:=result+chr(key^[38 ]) else
if input_i_plus='27'then result:=result+chr(key^[39 ]) else
if input_i_plus='28'then result:=result+chr(key^[40 ]) else
if input_i_plus='29'then result:=result+chr(key^[41 ]) else
if input_i_plus='2a'then result:=result+chr(key^[42 ]) else
if input_i_plus='2b'then result:=result+chr(key^[43 ]) else
if input_i_plus='2c'then result:=result+chr(key^[44 ]) else
if input_i_plus='2d'then result:=result+chr(key^[45 ]) else
if input_i_plus='2e'then result:=result+chr(key^[46 ]) else
if input_i_plus='2f'then result:=result+chr(key^[47 ]) else
if input_i_plus='30'then result:=result+chr(key^[48 ]) else
if input_i_plus='31'then result:=result+chr(key^[49 ]) else
if input_i_plus='32'then result:=result+chr(key^[50 ]) else
if input_i_plus='33'then result:=result+chr(key^[51 ]) else
if input_i_plus='34'then result:=result+chr(key^[52 ]) else
if input_i_plus='35'then result:=result+chr(key^[53 ]) else
if input_i_plus='36'then result:=result+chr(key^[54 ]) else
if input_i_plus='37'then result:=result+chr(key^[55 ]) else
if input_i_plus='38'then result:=result+chr(key^[56 ]) else
if input_i_plus='39'then result:=result+chr(key^[57 ]) else
if input_i_plus='3a'then result:=result+chr(key^[58 ]) else
if input_i_plus='3b'then result:=result+chr(key^[59 ]) else
if input_i_plus='3c'then result:=result+chr(key^[60 ]) else
if input_i_plus='3d'then result:=result+chr(key^[61 ]) else
if input_i_plus='3e'then result:=result+chr(key^[62 ]) else
if input_i_plus='3f'then result:=result+chr(key^[63 ]) else
if input_i_plus='40'then result:=result+chr(key^[64 ]) else
if input_i_plus='41'then result:=result+chr(key^[65 ]) else
if input_i_plus='42'then result:=result+chr(key^[66 ]) else
if input_i_plus='43'then result:=result+chr(key^[67 ]) else
if input_i_plus='44'then result:=result+chr(key^[68 ]) else
if input_i_plus='45'then result:=result+chr(key^[69 ]) else
if input_i_plus='46'then result:=result+chr(key^[70 ]) else
if input_i_plus='47'then result:=result+chr(key^[71 ]) else
if input_i_plus='48'then result:=result+chr(key^[72 ]) else
if input_i_plus='49'then result:=result+chr(key^[73 ]) else
if input_i_plus='4a'then result:=result+chr(key^[74 ]) else
if input_i_plus='4b'then result:=result+chr(key^[75 ]) else
if input_i_plus='4c'then result:=result+chr(key^[76 ]) else
if input_i_plus='4d'then result:=result+chr(key^[77 ]) else
if input_i_plus='4e'then result:=result+chr(key^[78 ]) else
if input_i_plus='4f'then result:=result+chr(key^[79 ]) else
if input_i_plus='50'then result:=result+chr(key^[80 ]) else
if input_i_plus='51'then result:=result+chr(key^[81 ]) else
if input_i_plus='52'then result:=result+chr(key^[82 ]) else
if input_i_plus='53'then result:=result+chr(key^[83 ]) else
if input_i_plus='54'then result:=result+chr(key^[84 ]) else
if input_i_plus='55'then result:=result+chr(key^[85 ]) else
if input_i_plus='56'then result:=result+chr(key^[86 ]) else
if input_i_plus='57'then result:=result+chr(key^[87 ]) else
if input_i_plus='58'then result:=result+chr(key^[88 ]) else
if input_i_plus='59'then result:=result+chr(key^[89 ]) else
if input_i_plus='5a'then result:=result+chr(key^[90 ]) else
if input_i_plus='5b'then result:=result+chr(key^[91 ]) else
if input_i_plus='5c'then result:=result+chr(key^[92 ]) else
if input_i_plus='5d'then result:=result+chr(key^[93 ]) else
if input_i_plus='5e'then result:=result+chr(key^[94 ]) else
if input_i_plus='5f'then result:=result+chr(key^[95 ]) else
if input_i_plus='60'then result:=result+chr(key^[96 ]) else
if input_i_plus='61'then result:=result+chr(key^[97 ]) else
if input_i_plus='62'then result:=result+chr(key^[98 ]) else
if input_i_plus='63'then result:=result+chr(key^[99 ]) else
if input_i_plus='64'then result:=result+chr(key^[100]) else
if input_i_plus='65'then result:=result+chr(key^[101]) else
if input_i_plus='66'then result:=result+chr(key^[102]) else
if input_i_plus='67'then result:=result+chr(key^[103]) else
if input_i_plus='68'then result:=result+chr(key^[104]) else
if input_i_plus='69'then result:=result+chr(key^[105]) else
if input_i_plus='6a'then result:=result+chr(key^[106]) else
if input_i_plus='6b'then result:=result+chr(key^[107]) else
if input_i_plus='6c'then result:=result+chr(key^[108]) else
if input_i_plus='6d'then result:=result+chr(key^[109]) else
if input_i_plus='6e'then result:=result+chr(key^[110]) else
if input_i_plus='6f'then result:=result+chr(key^[111]) else
if input_i_plus='70'then result:=result+chr(key^[112]) else
if input_i_plus='71'then result:=result+chr(key^[113]) else
if input_i_plus='72'then result:=result+chr(key^[114]) else
if input_i_plus='73'then result:=result+chr(key^[115]) else
if input_i_plus='74'then result:=result+chr(key^[116]) else
if input_i_plus='75'then result:=result+chr(key^[117]) else
if input_i_plus='76'then result:=result+chr(key^[118]) else
if input_i_plus='77'then result:=result+chr(key^[119]) else
if input_i_plus='78'then result:=result+chr(key^[120]) else
if input_i_plus='79'then result:=result+chr(key^[121]) else
if input_i_plus='7a'then result:=result+chr(key^[122]) else
if input_i_plus='7b'then result:=result+chr(key^[123]) else
if input_i_plus='7c'then result:=result+chr(key^[124]) else
if input_i_plus='7d'then result:=result+chr(key^[125]) else
if input_i_plus='7e'then result:=result+chr(key^[126]) else
if input_i_plus='7f'then result:=result+chr(key^[127]) else
if input_i_plus='80'then result:=result+chr(key^[128]) else
if input_i_plus='81'then result:=result+chr(key^[129]) else
if input_i_plus='82'then result:=result+chr(key^[130]) else
if input_i_plus='83'then result:=result+chr(key^[131]) else
if input_i_plus='84'then result:=result+chr(key^[132]) else
if input_i_plus='85'then result:=result+chr(key^[133]) else
if input_i_plus='86'then result:=result+chr(key^[134]) else
if input_i_plus='87'then result:=result+chr(key^[135]) else
if input_i_plus='88'then result:=result+chr(key^[136]) else
if input_i_plus='89'then result:=result+chr(key^[137]) else
if input_i_plus='8a'then result:=result+chr(key^[138]) else
if input_i_plus='8b'then result:=result+chr(key^[139]) else
if input_i_plus='8c'then result:=result+chr(key^[140]) else
if input_i_plus='8d'then result:=result+chr(key^[141]) else
if input_i_plus='8e'then result:=result+chr(key^[142]) else
if input_i_plus='8f'then result:=result+chr(key^[143]) else
if input_i_plus='90'then result:=result+chr(key^[144]) else
if input_i_plus='91'then result:=result+chr(key^[145]) else
if input_i_plus='92'then result:=result+chr(key^[146]) else
if input_i_plus='93'then result:=result+chr(key^[147]) else
if input_i_plus='94'then result:=result+chr(key^[148]) else
if input_i_plus='95'then result:=result+chr(key^[149]) else
if input_i_plus='96'then result:=result+chr(key^[150]) else
if input_i_plus='97'then result:=result+chr(key^[151]) else
if input_i_plus='98'then result:=result+chr(key^[152]) else
if input_i_plus='99'then result:=result+chr(key^[153]) else
if input_i_plus='9a'then result:=result+chr(key^[154]) else
if input_i_plus='9b'then result:=result+chr(key^[155]) else
if input_i_plus='9c'then result:=result+chr(key^[156]) else
if input_i_plus='9d'then result:=result+chr(key^[157]) else
if input_i_plus='9e'then result:=result+chr(key^[158]) else
if input_i_plus='9f'then result:=result+chr(key^[159]) else
if input_i_plus='a0'then result:=result+chr(key^[160]) else
if input_i_plus='a1'then result:=result+chr(key^[161]) else
if input_i_plus='a2'then result:=result+chr(key^[162]) else
if input_i_plus='a3'then result:=result+chr(key^[163]) else
if input_i_plus='a4'then result:=result+chr(key^[164]) else
if input_i_plus='a5'then result:=result+chr(key^[165]) else
if input_i_plus='a6'then result:=result+chr(key^[166]) else
if input_i_plus='a7'then result:=result+chr(key^[167]) else
if input_i_plus='a8'then result:=result+chr(key^[168]) else
if input_i_plus='a9'then result:=result+chr(key^[169]) else
if input_i_plus='aa'then result:=result+chr(key^[170]) else
if input_i_plus='ab'then result:=result+chr(key^[171]) else
if input_i_plus='ac'then result:=result+chr(key^[172]) else
if input_i_plus='ad'then result:=result+chr(key^[173]) else
if input_i_plus='ae'then result:=result+chr(key^[174]) else
if input_i_plus='af'then result:=result+chr(key^[175]) else
if input_i_plus='b0'then result:=result+chr(key^[176]) else
if input_i_plus='b1'then result:=result+chr(key^[177]) else
if input_i_plus='b2'then result:=result+chr(key^[178]) else
if input_i_plus='b3'then result:=result+chr(key^[179]) else
if input_i_plus='b4'then result:=result+chr(key^[180]) else
if input_i_plus='b5'then result:=result+chr(key^[181]) else
if input_i_plus='b6'then result:=result+chr(key^[182]) else
if input_i_plus='b7'then result:=result+chr(key^[183]) else
if input_i_plus='b8'then result:=result+chr(key^[184]) else
if input_i_plus='b9'then result:=result+chr(key^[185]) else
if input_i_plus='ba'then result:=result+chr(key^[186]) else
if input_i_plus='bb'then result:=result+chr(key^[187]) else
if input_i_plus='bc'then result:=result+chr(key^[188]) else
if input_i_plus='bd'then result:=result+chr(key^[189]) else
if input_i_plus='be'then result:=result+chr(key^[190]) else
if input_i_plus='bf'then result:=result+chr(key^[191]) else
if input_i_plus='c0'then result:=result+chr(key^[192]) else
if input_i_plus='c1'then result:=result+chr(key^[193]) else
if input_i_plus='c2'then result:=result+chr(key^[194]) else
if input_i_plus='c3'then result:=result+chr(key^[195]) else
if input_i_plus='c4'then result:=result+chr(key^[196]) else
if input_i_plus='c5'then result:=result+chr(key^[197]) else
if input_i_plus='c6'then result:=result+chr(key^[198]) else
if input_i_plus='c7'then result:=result+chr(key^[199]) else
if input_i_plus='c8'then result:=result+chr(key^[200]) else
if input_i_plus='c9'then result:=result+chr(key^[201]) else
if input_i_plus='ca'then result:=result+chr(key^[202]) else
if input_i_plus='cb'then result:=result+chr(key^[203]) else
if input_i_plus='cc'then result:=result+chr(key^[204]) else
if input_i_plus='cd'then result:=result+chr(key^[205]) else
if input_i_plus='ce'then result:=result+chr(key^[206]) else
if input_i_plus='cf'then result:=result+chr(key^[207]) else
if input_i_plus='d0'then result:=result+chr(key^[208]) else
if input_i_plus='d1'then result:=result+chr(key^[209]) else
if input_i_plus='d2'then result:=result+chr(key^[210]) else
if input_i_plus='d3'then result:=result+chr(key^[211]) else
if input_i_plus='d4'then result:=result+chr(key^[212]) else
if input_i_plus='d5'then result:=result+chr(key^[213]) else
if input_i_plus='d6'then result:=result+chr(key^[214]) else
if input_i_plus='d7'then result:=result+chr(key^[215]) else
if input_i_plus='d8'then result:=result+chr(key^[216]) else
if input_i_plus='d9'then result:=result+chr(key^[217]) else
if input_i_plus='da'then result:=result+chr(key^[218]) else
if input_i_plus='db'then result:=result+chr(key^[219]) else
if input_i_plus='dc'then result:=result+chr(key^[220]) else
if input_i_plus='dd'then result:=result+chr(key^[221]) else
if input_i_plus='de'then result:=result+chr(key^[222]) else
if input_i_plus='df'then result:=result+chr(key^[223]) else
if input_i_plus='e0'then result:=result+chr(key^[224]) else
if input_i_plus='e1'then result:=result+chr(key^[225]) else
if input_i_plus='e2'then result:=result+chr(key^[226]) else
if input_i_plus='e3'then result:=result+chr(key^[227]) else
if input_i_plus='e4'then result:=result+chr(key^[228]) else
if input_i_plus='e5'then result:=result+chr(key^[229]) else
if input_i_plus='e6'then result:=result+chr(key^[230]) else
if input_i_plus='e7'then result:=result+chr(key^[231]) else
if input_i_plus='e8'then result:=result+chr(key^[232]) else
if input_i_plus='e9'then result:=result+chr(key^[233]) else
if input_i_plus='ea'then result:=result+chr(key^[234]) else
if input_i_plus='eb'then result:=result+chr(key^[235]) else
if input_i_plus='ec'then result:=result+chr(key^[236]) else
if input_i_plus='ed'then result:=result+chr(key^[237]) else
if input_i_plus='ee'then result:=result+chr(key^[238]) else
if input_i_plus='ef'then result:=result+chr(key^[239]) else
if input_i_plus='f0'then result:=result+chr(key^[240]) else
if input_i_plus='f1'then result:=result+chr(key^[241]) else
if input_i_plus='f2'then result:=result+chr(key^[242]) else
if input_i_plus='f3'then result:=result+chr(key^[243]) else
if input_i_plus='f4'then result:=result+chr(key^[244]) else
if input_i_plus='f5'then result:=result+chr(key^[245]) else
if input_i_plus='f6'then result:=result+chr(key^[246]) else
if input_i_plus='f7'then result:=result+chr(key^[247]) else
if input_i_plus='f8'then result:=result+chr(key^[248]) else
if input_i_plus='f9'then result:=result+chr(key^[249]) else
if input_i_plus='fa'then result:=result+chr(key^[250]) else
if input_i_plus='fb'then result:=result+chr(key^[251]) else
if input_i_plus='fc'then result:=result+chr(key^[252]) else
if input_i_plus='fd'then result:=result+chr(key^[253]) else
if input_i_plus='fe'then result:=result+chr(key^[254]) else
if input_i_plus='ff'then result:=result+chr(key^[255]);//else
//result:=#00;
i:=i+2;
end;
end;
{$ENDREGION}

end.
