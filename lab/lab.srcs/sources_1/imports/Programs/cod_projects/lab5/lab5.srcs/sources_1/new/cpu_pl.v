`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 13:23:18
// Design Name: 
// Module Name: cpu_pl
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


module  cpu_pl (
  input clk, 
  input rst,

  //IO_BUS
  output [7:0] io_addr,      //外设的地址
  output [31:0] io_dout,     //向外设输出的数据
  output io_we,                 //向外设输出数据时的写使能信号
  output io_rd,               //向外设输入数据时的读使能信号
  input [31:0] io_din,        //来自sw的输入数据

  //Debug_BUS
  output [31:0] chk_pc,
  input [15:0] chk_addr,
  output reg [31:0] chk_data

);

wire [31:0] rf_data;   //从RF读取的数据
wire [31:0] m_data;    //从MEM读取的数据

//PC/IF/ID 流水段寄存器
wire  [31:0] pc;
reg [31:0] pcd;
reg [31:0] ir;
reg [31:0] pcin;

// ID/EX 流水段寄存器
reg [31:0] pce;
reg [31:0] a;
reg [31:0] b;
reg [31:0] imm;
reg [4:0] rd;
reg [31:0] ctrl;

// EX/MEM 流水段寄存器
reg [31:0] y;
reg [31:0] bm;
reg [4:0] rdm;
reg [31:0] ctrlm;

// MEM/WB 流水段寄存器
reg [31:0] yw;
reg [31:0] mdr;
reg [4:0] rdw;
reg [31:0] ctrlw;


//io_bus
assign io_addr = y[7:0];
assign io_dout = bm;
//assign io_we = y[15] & ctrlm[12];
assign io_we = (y == 0) & ctrlm[12];
assign io_rd = 1;//for temp
//debug_bus
assign chk_pc = pc;
always @(*) begin
  case(chk_addr[15:12])
  0: begin
    case(chk_addr[7:0])
    8'h00: chk_data = pcin;
    8'h01: chk_data = pc;
    8'h02: chk_data = pcd;
    8'h03: chk_data = ir;
    8'h04: chk_data = ctrl;
    8'h05: chk_data = pce;
    8'h06: chk_data = a;
    8'h07: chk_data = b;
    8'h08: chk_data = imm;
    8'h09: chk_data = instruction;
    8'h0A: chk_data = ctrlm;
    8'h0B: chk_data = y;
    8'h0C: chk_data = mdr;
    8'h0D: chk_data = 0;
    8'h0E: chk_data = ctrlw;
    8'h0F: chk_data = mdr;
    8'h10: chk_data = yw;
    default: chk_data = 32'h87654321;
    endcase
  end
  1: chk_data = rf_data;
  2: chk_data = m_data;
  default: chk_data = 32'h87654321;
  endcase
end




//IF
wire [31:0] pc_next, pc_4, instruction, pc_imm, pc_next_n, pc_src_jalr;
wire pc_write, pc_src, pc_jalr;

assign pc_next = pc_src ? pc_imm : pc_4;
assign pc_next_n = pc_jalr ? pc_src_jalr : pc_next;
assign pc_4 = pc + 4;

pc p1(
  .clk(clk), 
  .rst(rst), 
  .pc_write(pc_write), 
  .pc_next(pc_next_n), 
  .pc(pc)
  );
instrcution_memory i1(.a(pc >> 2), .spo(instruction));

//IF/ID
wire IF_ID_write;

always @(posedge clk) begin
  if(rst) begin
    pcd <= 0;
    pcin <= 0;
    ir <= 0;
  end
  else if(pc_src | pc_jalr) begin
    pcd <= 0;
    pcin <= 0;
    ir <= 0;
  end
  else if(IF_ID_write) begin
    pcd <= pc;
    pcin <= pc_next;
    ir <= instruction;
  end
end

//ID
wire [31:0] control, control_last, Imm, RF_rs1, RF_rs2;
wire ctrl_mux;
reg [31:0] RF_wd;
reg [4:0] rs1, rs2;

assign control_last = ctrl_mux ?  0 : control;
RF r1(
  .clk(clk), 
  .ra0(ir[19:15]), 
  .ra1(ir[24:20]), 
  .ra2(chk_addr[4:0]), 
  .rd0(RF_rs1), 
  .rd1(RF_rs2), 
  .rd2(rf_data), 
  .wa(rdw), 
  .wd(RF_wd), 
  .we(ctrlw[18])
  );
Hazard_detection_unit h1(
  .ID_EX_MemRead(ctrl[13]), 
  .rd(rd), 
  .instruction(ir), 
  .IF_ID_write(IF_ID_write), 
  .pc_write(pc_write), 
  .ctrl_mux(ctrl_mux)
  );
control c1(
  .instruction(ir), 
  .control(control)
  );
imm_gen i2(
  .instruction(ir), 
  .out(Imm)
  );

//ID/EX     控制信号 ctrl_mux   pc_src
always @ (posedge clk) begin
  if(rst) begin
    pce <= 0;
    a <= 0;
    b <= 0;
    imm <= 0;
    rd <= 0;
    ctrl <= 0;
    rs1 <= 0;
    rs2 <= 0;
  end
  else if(pc_src | pc_jalr) begin
    pce <= 0;
    a <= 0;
    b <= 0;
    imm <= 0;
    rd <= 0;
    ctrl <= 0;
    rs1 <= 0;
    rs2 <= 0;
  end
  else begin
    pce <= pcd;
    a <= RF_rs1;
    b <= RF_rs2;
    imm <= Imm;
    ctrl <= control_last;
    rd <= ir[11:7];
    rs1 <= ir[19:15];
    rs2 <= ir[24:20];
  end
end

//EX
wire [31:0] alu_a, alu_b_1, alu_b_2;
wire [1:0] forwarding_a, forwarding_b;
wire [31:0] alu_result;
wire zero;

assign pc_src = (ctrl[9]) | (ctrl[8] & zero);
assign pc_jalr = ctrl[31];
assign pc_src_jalr = alu_result;
assign pc_imm = pce + (imm << 1);
mux_2_32 m1(.a(alu_b_1), .b(imm), .s(ctrl[4]), .out(alu_b_2));
Forwarding_unit f1(
  .rs1(rs1), 
  .rs2(rs2), 
  .rdm(rdm), 
  .rdw(rdw), 
  .EX_MEM_reg_write(ctrlm[18]), 
  .MEM_WB_reg_write(ctrlw[18]), 
  .forwarding_a(forwarding_a), 
  .forwarding_b(forwarding_b)
  );
mux_3_32 m2(
  .forwarding(forwarding_a), 
  .a(a), 
  .b(y), 
  .c(RF_wd), 
  .result(alu_a)
  );
mux_3_32 m3(
  .forwarding(forwarding_b), 
  .a(b), 
  .b(y), 
  .c(RF_wd), 
  .result(alu_b_1)
  );
alu a1(
  .a(alu_a), 
  .b(alu_b_2),
  .pce(pce), 
  .alu_ctrl(ctrl[2:0]), 
  .alu_out(alu_result), 
  .zero(zero)
  );

//EX/MEM
reg [31:0] pcm;

always @ (posedge clk) begin
  if(rst) begin
    ctrlm <= 0;
    pcm <= 0;
    y <= 0;
    bm <= 0;
    rdm <= 0;
  end
  else begin
    ctrlm <= ctrl;
    pcm <= pce;
    y <= alu_result;
    bm <= alu_b_1;
    rdm <= rd;
  end
end

//MEM
wire [31:0] DM_rd;
wire we;
//assign we = ~y[15] & ctrlm[12];
assign we = ~(y == 0) & ctrlm[12];
data_memory d1(
  .a(y >> 2), 
  .d(bm), 
  .dpra(chk_addr[11:0]), 
  .clk(clk), 
  .we(we), 
  .spo(DM_rd), 
  .dpo(m_data)
  );

// MEM/WB
reg [31:0] pcw;
always @ (posedge clk) begin
  if(rst) begin
    ctrlw <= 0;
    mdr <= 0;
    yw <= 0;
    rdw <= 0;
    pcw <= 0;
  end
  else begin
    ctrlw <= ctrlm;
    yw <= y;
    pcw <= pcm;
    rdw <= rdm;
    if(y[15]) mdr <= io_din;
    else mdr <= DM_rd;
  end
end

//WB
always @ (*) begin
  case (ctrlw[17:16])
    0: RF_wd = yw;
    1: RF_wd = mdr;
    2: RF_wd = pcw + 4;
    default: RF_wd = 0;
  endcase
end
endmodule
