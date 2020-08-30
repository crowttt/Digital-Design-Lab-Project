module lab5_birth(	
		input [2:0] cnt,
		output [3:0] birth_num,
		output reg [6:0] seg_data
	);
reg [3:0] birth;
//**CODE_CONVERTER**//
always@ (*)begin
    birth[3] = (!cnt[2] & cnt[0]) | (!cnt[2] & cnt[1]);
    birth[2] = 0;
    birth[1] = 0;
    birth[0] = (cnt[2] & cnt[0]) | (!cnt[2] & !cnt[1]) | (!cnt[2] & !cnt[0]);
end
assign birth_num = birth;
/////////////////////


//**BCD_to_7SEG**//
always@ (*)begin
    seg_data[6] = (!birth[3] & !birth[2] & !birth[1]) | (birth[2] & birth[1] & birth[0]); 
    seg_data[5] = (!birth[3] & !birth[2] & birth[0]) | (!birth[2] & birth[1]); 
    seg_data[4] = (birth[0]) | (!birth[3] & birth[2] & !birth[1]); 
    seg_data[3] = (birth[2] & !birth[1] & !birth[0]) | (birth[2] & birth[1] & birth[0]) | (!birth[3] & !birth[2] & !birth[1] & birth[0]); 
    seg_data[2] = (!birth[2] & birth[1] & !birth[0]); 
    seg_data[1] = (birth[2] & !birth[1] & birth[0]) | (birth[2] & birth[1] & !birth[0]); 
    seg_data[0] = (!birth[3] & birth[2] & !birth[1] & !birth[0]) | (!birth[3] & !birth[2] & !birth[1] & birth[0]); 
end
///////////////////
	
endmodule