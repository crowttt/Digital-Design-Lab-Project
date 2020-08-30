module top(
	clk,
	rst,
	sw,
	CA,
	CB,
	CC,
	CD,
	CE,
	CF,
	CG,
	AN0,
	AN1,
	AN2,
	AN3,
	AN4,
	AN5,
	AN6,
	AN7,
	en_m17
    );
    
input clk;
input rst;
input [15:0]sw;
input en_n17 , en_p17 , en_m17;
output CA,CB,CC,CD,CE,CF,CG;
output AN0,AN1,AN2,AN3,AN4,AN5,AN6,AN7;

wire [9:0] intger;
wire [13:0] decimal;
wire sign;

reg [2:0] state;
reg [3:0] seg_number;
reg [6:0] seg_data;
reg [20:0] counter;
reg [7:0] scan;

always@(posedge clk)begin
    if(en_n17)begin
        in_float <= sw;
    end
    else begin
        in_float <= 0;
    end
end

BFloat16 float(clk,en_n17,en_p17,en_m17,in_float,intger,decimal,sign);

assign {AN7,AN6,AN5,AN4,AN3,AN2,AN1,AN0} = scan;
always@(posedge clk) begin
  counter <=(counter<=100000) ? (counter +1) : 0;
  state <= (counter==100000) ? (state + 1) : state;

	case(state)
		0:begin
            if(sign==1'b1)
    			seg_number <= 10;
            else if(sign==1'b0)
                seg_number <= 11;
            scan <= 8'b0111_1111;
		end
		1:begin
			seg_number <= (intger/100)%10;
			scan <= 8'b1011_1111;
		end
		2:begin
			seg_number <= (intger/10)%10;
			scan <= 8'b1101_1111;
		end
		3:begin
			seg_number <=  intger%10;
			scan <= 8'b1110_1111;
		end
		4:begin
			seg_number <= (decimal/1000)%10;
			scan <= 8'b1111_0111;
		end
		5:begin
			seg_number <= (decimal/100)%10;
			scan <= 8'b1111_1011;
		end
		6:begin
			seg_number <= (decimal/10)%10;
			scan <= 8'b1111_1101;
		end
		7:begin
			seg_number <= decimal%10;
			scan <= 8'b1111_1110;
		end
		default: state <= state;
	endcase 
end  


assign {CG,CF,CE,CD,CC,CB,CA} = seg_data;

always@(posedge clk) begin  
  case(seg_number)
	  4'd0:seg_data <= 7'b100_0000;
      4'd1:seg_data <= 7'b111_1001;
      4'd2:seg_data <= 7'b010_0100;
      4'd3:seg_data <= 7'b011_0000;
      4'd4:seg_data <= 7'b001_1001;
      4'd5:seg_data <= 7'b001_0010;
      4'd6:seg_data <= 7'b000_0010;
      4'd7:seg_data <= 7'b101_1000;
      4'd8:seg_data <= 7'b000_0000;
      4'd9:seg_data <= 7'b001_0000;
      4'd10:seg_data <= 7'b011_1111;
      4'd11:seg_data <= 7'b111_1111;
	default: seg_data <= seg_data;
  endcase
end 

endmodule