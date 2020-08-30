module add2(a, b,c,d, sum, ov);

	input [3:0] a, b, c, d;
	output [3:0] sum;
	output ov;
	//wire s4, s5 ;
	
	assign {s5,s4,sum} = a + b + c + d;
	assign ov = 1'b0;
	//ov = s4 || s5 ;
	
endmodule

