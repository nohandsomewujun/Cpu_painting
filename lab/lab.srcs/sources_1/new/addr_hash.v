`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/14 21:43:02
// Design Name: 
// Module Name: addr_hash
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


module addr_hash(
    input [31:0] paint_addr,
    output [14:0] paint_addr_hash
    );
    assign paint_addr_hash = paint_addr[7:0] + paint_addr[15:8] * 200;
endmodule
