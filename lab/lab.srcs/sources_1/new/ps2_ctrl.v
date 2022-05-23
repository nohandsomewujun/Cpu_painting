`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/22 15:10:02
// Design Name: 
// Module Name: ps2_ctrl
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


module ps2_ctrl(
    input [7:0] ps2_byte,
    output reg start
    );
    always @(*) begin
        if (ps2_byte == 8'h53) begin
            start = 1;
        end
        else start = 0;
    end
endmodule
