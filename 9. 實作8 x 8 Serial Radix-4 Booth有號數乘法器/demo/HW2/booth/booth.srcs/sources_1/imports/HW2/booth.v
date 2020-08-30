
`timescale 1ns/1ps

module lab(
	CLK, 
	RST,
	en,
	in_a, 
	in_b, 
	Product
);
// in_a * in_b = Product
// in_a is Multiplicand , in_b is Multiplier
					

input 			CLK, RST;
input			en;
input 	[7:0]	in_a;			// Multiplicand
input  	[7:0]	in_b;			// Multiplier
output  [15:0]  Product;

reg 		  [7:0] Mplicand;		
reg signed [16:0]	Product_booth, temp, temp_product;
reg 		  [2:0]  Counter;
assign Product = Product_booth[16:1];
reg mpy_done;

always @(posedge CLK or posedge RST) begin
	if(RST)
		mpy_done <= 1'b1;
	else if(en)
		mpy_done <= 1'b0;
	else if(Counter==3'd4)
		mpy_done <= 1'b1;
	else
		mpy_done <= mpy_done;
end
//Counter
always @(posedge CLK or posedge RST)
begin
	if (RST)
		Counter <= 3'b0;
	else if (~mpy_done)
		Counter <= Counter + 1'b1;
	else
		Counter <= Counter;
end

//Product
always @(posedge CLK or posedge RST)
begin
    if (RST) begin
	   Product_booth  <= 17'b0;
	   Mplicand <= 8'b0;
	end

	else if (Counter == 3'd0) begin
		Mplicand <= in_a;
		Product_booth <= {8'b0, in_b, 1'b0};	
	end

	else if (Counter <= 3'd4)begin
        if(mpy_done == 1'b0)
            Product_booth <= temp_product;

    end
    else begin
       Product_booth <= Product_booth;
       Mplicand    <= Mplicand;
    end

end

always@(*)begin

     if(Mplicand<=127)begin
         case(Product_booth[2:0])
             3'b000: begin
                 temp_product <= {Product_booth[16],Product_booth[16],Product_booth[16:2]} ;
             end
             3'b001: begin
                  temp <= (Product_booth + {Mplicand,9'b0});
                  temp_product <= {1'b0,1'b0,temp[16:2]} ;
             end
             3'b010: begin
                  temp <=(Product_booth + {Mplicand,9'b0});
                  temp_product <= {1'b0,1'b0,temp[16:2]};
             end
             3'b011: begin
                  temp <=(Product_booth + {Mplicand,9'b0} +  {Mplicand,9'b0}); 
                  temp_product <= {1'b0,1'b0,temp[16:2]} ;
             end
             3'b100: begin
                  temp <=(Product_booth - {Mplicand,9'b0} - {Mplicand,9'b0});
                  temp_product <= {1'b1,1'b1,temp[16:2]} ;
             end
             3'b101: begin
                  temp <=(Product_booth - {Mplicand,9'b0});
                  temp_product <= {1'b1,1'b1,temp[16:2]} ;
             end
             3'b110: begin
                  temp <=(Product_booth - {Mplicand,9'b0});
                  temp_product <= {1'b1,1'b1,temp[16:2]} ;
             end  
             3'b111: begin
                 temp_product <= {Product_booth[16],Product_booth[16],Product_booth[16:2]} ;
             end
        endcase
         
     end   
     else begin
         case(Product_booth[2:0])
         3'b000: begin
              temp_product <= ({Product_booth[16],Product_booth[16],Product_booth[16:2]} );
         end
         3'b001: begin
              temp <=(Product_booth + {Mplicand,9'b0});
              temp_product <= {1'b1,1'b1,temp[16:2]} ;
         end
         3'b010: begin
              temp <=(Product_booth + {Mplicand,9'b0});
              temp_product <= {1'b1,1'b1,temp[16:2]} ;
         end
         3'b011: begin
              temp <=(Product_booth + {Mplicand,9'b0} +  {Mplicand,9'b0}); 
              temp_product <= {1'b1,1'b1,temp[16:2]} ;
         end
         3'b100: begin
              temp <=(Product_booth - {Mplicand,9'b0} - {Mplicand,9'b0});
              temp_product <= {1'b0,1'b0,temp[16:2]} ;
         end
         3'b101: begin
               temp <=(Product_booth - {Mplicand,9'b0});
              temp_product <= {1'b0,1'b0,temp[16:2]} ;
         end
         3'b110: begin
              temp <=(Product_booth - {Mplicand,9'b0});
              temp_product <= {1'b0,1'b0,temp[16:2]} ;
         end  
         3'b111: begin
              temp_product <= {Product_booth[16],Product_booth[16],Product_booth[16:2]} ;
         end
         endcase
    end     
 end

endmodule
