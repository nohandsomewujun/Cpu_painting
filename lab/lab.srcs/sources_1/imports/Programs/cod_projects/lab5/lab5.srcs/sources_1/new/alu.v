`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/19 22:08:19
// Design Name: 
// Module Name: alu
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


module alu (
    input [31:0] a, b,
    input [2:0] alu_ctrl,
    input [31:0] pce, 
    output reg [31:0] alu_out,
    output reg zero
);
wire signed [31:0] signed_a, signed_b;

assign signed_a = a;
assign signed_b = b;

always @ (*) begin
    case (alu_ctrl)
        0: begin    //add or addi
            alu_out = a + b; 
            zero = 0;
        end 
        1: begin   //sub
            alu_out = a - b; 
            zero = 0;
        end
        2: begin        //beq
            alu_out = 0;
            zero = (signed_a == signed_b) ? 1 : 0;
        end
        3: begin    //blt
            alu_out = 0;
            zero = (signed_a < signed_b) ? 1 : 0;
        end
        4: begin
            alu_out = pce + b;
            zero = 0;
        end
        default: begin
            alu_out = 0; 
            zero = 0;
        end
    endcase
end
endmodule
