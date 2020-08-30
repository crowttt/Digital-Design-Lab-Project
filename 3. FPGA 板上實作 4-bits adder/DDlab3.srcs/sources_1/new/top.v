`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/25 11:27:28
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input CLK100MHZ,
    input [15:0] SW,
    input BTNC,
    output reg [5:0] LED
    );
    wire[3:0] SW_A, SW_B,  SW_C,SW_D ;
    wire[5:0] sum;
    
    assign SW_A = SW[3:0];
    assign SW_B = SW[7:4];
    assign SW_C = SW[11:8];
    assign SW_D = SW[15:12];
    
    assign sum  = SW_A + SW_B + SW_C + SW_D ;
    
    always@(posedge CLK100MHZ) begin
        if (BTNC) begin
            LED = sum;
        end;
     end
endmodule
    




