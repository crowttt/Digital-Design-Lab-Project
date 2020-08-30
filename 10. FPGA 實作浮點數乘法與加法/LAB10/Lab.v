module BFloat16(clk,display,add7,mpy3,in_float,intger,decimal,sign);
input   clk, display, add7, mpy3;
input [15:0] in_float;
output reg sign;
output reg [9:0] intger;
output reg [13:0] decimal;

reg [7:0] exp;
reg [23:0] fra, temp;

always@(posedge clk) begin
    if(display) begin
        sign <= in_float[15];
        exp <= in_float[14:7] - 8'b11111111;
        fra <= {10{1'b0},in_float[6:0],7{1'b0}};
    end

end

always@(*)begin
    if(exp>0)begin
        temp <= fra << exp;
        intger <= fra[23:14];
        decimal <= fra[13:0];
    end
    else if(exp==0)begin
        intger <= fra[23:14];
        decimal <= fra[13:0];
    end
    else begin
        exp <= ~exp + 1;
        temp <= fra >> exp;
        intger <= fra[23:14];
        decimal <= fra[13:0];
    end

end
