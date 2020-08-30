module BFloat16(clk,display,add7,mpy3,in_float,intger,decimal,sign);
input   clk, display, add7, mpy3;
input [15:0] in_float;
output reg sign;
output reg [11:0] intger ;
output reg [13:0] decimal;

reg switch_display, temp_sign,temp_sign1,temp_sign2,temp_sign3;
reg [8:0] exp,exp_2complement,exp_2complement1;
reg [13:0] decimal_binary,decimal_binary1,decimal_binary2,decimal_binary3;
reg [143:0] fra, temp, temp_mpy_3;
reg [13:0] decimal_temp[13:0];

reg [11:0] intger1,intger2,intger3;

always@(posedge clk) begin
    if(display) begin
        switch_display <= 1;
        temp_sign <= in_float[15];
        exp <= {1'b0,in_float[14:7]} - 9'b001111111;
        fra <= {128'b0 ,1'b1, in_float[6:0] , 8'b0 };
    end
    
end


always@(clk)begin

    if(exp<=255)begin
        temp <= fra << exp;
        temp_mpy_3 <= temp + temp + temp;
        if(temp[143:15]<1000)begin
            if(temp_sign==0)begin
                temp_sign1 <= temp_sign;
                temp_sign2 <= temp_sign;
                temp_sign3 <= temp_sign;
                
                intger1 <= temp[26:15];
                intger2 <= temp[26:15]+7;
                intger3 <= temp_mpy_3[26:15];
            
                decimal_binary1 <= temp[14:1];
                decimal_binary2 <= temp[14:1];
                decimal_binary3 <= temp_mpy_3[14:1];
            end
            else begin
                temp_sign1 <= temp_sign;
                temp_sign3 <= temp_sign;
                intger1 <= temp[26:15];
                intger3 <= temp_mpy_3[26:15];        
                decimal_binary1 <= temp[14:1];           
                decimal_binary3 <= temp_mpy_3[14:1];
                
                if(temp[26:15]<7)begin
                    temp_sign2 <= 0;
                    if(temp[14:1]==0)begin
                        intger2 <= 7-temp[26:15];
                        decimal_binary2 <= temp[14:1];
                    end
                    else begin
                        intger2 <= 6-temp[26:15];
                        decimal_binary2 <= ~temp[14:1];
                    end
                end
                else begin
                    temp_sign2 <= temp_sign;
                    intger2 <= temp[26:15]-7;
                    decimal_binary2 <= temp[14:1];
                end
            end
        end
        else begin
            temp_sign1 <= temp_sign;
            temp_sign2 <= temp_sign;
            temp_sign3 <= temp_sign;
            intger1 <= 10'd1000;
            intger3 <= 10'd1000;
            decimal_binary1 <= temp[14:1];           
            decimal_binary3 <= temp_mpy_3[14:1];
            decimal_binary2 <= temp[14:1];
            
            
            if(temp_sign==1 && temp[26:15]<1007)
                intger2 <= temp[26:15]-7;
            else
                intger2 <= 10'd1000;   
        end

    end
    else begin
        exp_2complement <= ~exp + 1;
        temp <= fra >> exp_2complement;
        temp_mpy_3 <= temp + temp + temp;
        
        temp_sign1 <= temp_sign;
        temp_sign3 <= temp_sign;
        
        intger1 <= temp[26:15];
        intger3 <= temp_mpy_3[26:15];
        
        decimal_binary1 <= temp[14:1];
        decimal_binary3 <= temp_mpy_3[14:1];
        
        if(temp_sign==1)begin
            temp_sign2 <= 0;
            if(temp[14:1]==0)begin
                intger2 <= 7-temp[26:15];
                decimal_binary2 <= temp[14:1];
            end
            else begin
                intger2 <= 6-temp[26:15];
                decimal_binary2 <= ~temp[14:1];
            end
        end
        else begin
            temp_sign2 <= temp_sign;
            intger2 <= temp[26:15] + 7;
            decimal_binary2 <= temp[14:1];
        end
            
    end
    
    
   
    
    if(add7)begin
        sign <= temp_sign2;
        intger <= intger2;
        decimal_binary <= decimal_binary2;
    end
    else if(mpy3)begin
        sign <= temp_sign3;
        intger <= intger3;
        decimal_binary <= decimal_binary3;
    end
    else begin
        sign <= temp_sign1;
        intger <= intger1;
        decimal_binary <= decimal_binary1;       
    end
end

always@(*)begin
    decimal_temp[13] <= decimal_binary[13]*14'd5000;
    decimal_temp[12] <= decimal_binary[12]*14'd2500;
    decimal_temp[11] <= decimal_binary[11]*14'd1250;
    decimal_temp[10] <= decimal_binary[10]*14'd625;
    decimal_temp[9] <= decimal_binary[9]*14'd313;
    decimal_temp[8] <= decimal_binary[8]*14'd156;
    decimal_temp[7] <= decimal_binary[7]*14'd78;
    decimal_temp[6] <= decimal_binary[6]*14'd39;
    decimal_temp[5] <= decimal_binary[5]*14'd19;
    decimal_temp[4] <= decimal_binary[4]*14'd9;
    decimal_temp[3] <= decimal_binary[3]*14'd5;
    decimal_temp[2] <= decimal_binary[2]*14'd3;
    decimal_temp[1] <= decimal_binary[1]*14'd2;
    decimal_temp[0] <= decimal_binary[0]*14'd1;
    decimal <= decimal_temp[0]+ decimal_temp[1]+ decimal_temp[2]+ decimal_temp[3]+ decimal_temp[4]+ decimal_temp[5]+ decimal_temp[6]+ decimal_temp[7]+ decimal_temp[8]+ decimal_temp[9]+ decimal_temp[10]+ decimal_temp[11]+ decimal_temp[12]+ decimal_temp[13];
end

endmodule
