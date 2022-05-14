`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/19 21:47:10
// Design Name: 
// Module Name: control
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


module control(
    input [31:0] instruction,
    output [31:0] control
    
);
wire jal;
wire branch;
reg [1:0] reg_scr;
reg [2:0] aluop;
wire mem_read;
wire mem_write;
wire alu_scr;
wire reg_write;
wire jalr;
//jalr
assign jalr = (instruction[6:0] == 7'b1100111);
//jal
assign jal = (instruction[6:0] == 7'b1101111);
//branch
assign branch = (instruction[6:0] == 7'b1100011);


//reg_scr
always @ (*) begin
    case (instruction[6:0])
        7'b0010011: reg_scr = 2'b00;//addi
        7'b0110011: reg_scr = 2'b00;//add or sub
        7'b0000011: reg_scr = 2'b01;//lw
        7'b1101111: reg_scr = 2'b10;//jal
        7'b1100111: reg_scr = 2'b00;//jalr
        7'b0010111: reg_scr = 2'b00;//auipc
        default: reg_scr = 2'b00;
    endcase
end

//aluop
always @ (*) begin
    case (instruction[6:0])
        7'b0010011:  aluop = 3'b000;//addi
        7'b1100111:  aluop = 3'b000;//jalr
        7'b0100011:  aluop = 3'b000;//sw
        7'b0000011:  aluop = 3'b000;//lw
        7'b0110011:  begin
            if (instruction[30] == 0) aluop = 3'b000;//add
            else aluop = 3'b001;//sub
        end
        7'b1100011: begin 
            if (instruction[14:12] == 0) aluop = 3'b010;//beq
            else aluop = 3'b011;//blt
        end
        7'b0010111: aluop = 4;//auipc
        default:  aluop = 3'b111;
    endcase
end
//mem_write
assign mem_write = (instruction[6:0] == 7'b0100011);//sw
//mem_read
assign mem_read = (instruction[6:0] ==7'b0000011);//lw

//alu_scr
assign alu_scr = (instruction[6:0] == 7'b0010011) | (instruction[6:0] == 7'b0000011) | (instruction[6:0] == 7'b0100011) | (instruction[6:0] == 7'b0010111) | (instruction[6:0] == 7'b1101111);//addi,sw,lw,auipc,jalr
//reg_write
assign reg_write = (instruction[6:0] == 7'b0010011) | (instruction[6:0] == 7'b0110011) | (instruction[6:0] == 7'b1101111) | (instruction[6:0] == 7'b0000011) | (instruction[6:0] == 7'b0010111) | (instruction[6:0] == 7'b1101111);//add, addi, sub, jal, lw, auipc, jalr

//control
assign control = {{jalr}, {12{1'b0}}, {reg_write}, {reg_scr}, {2'b00}, {mem_read}, {mem_write}, {2'b00}, {jal}, {branch}, {3'b000}, {alu_scr}, {1'b0} ,{aluop}};

endmodule