`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 15:18:02
// Design Name: 
// Module Name: pdu_cpu
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


module pdu_cpu (
  input clk,            //clk100mhz
  input rstn,           //cpu_resetn

  input step,           //btnu
  input cont,           //btnd
  input chk,            //btnr
  input data,           //btnc
  input del,            //btnl
  input [15:0] x,       //sw15-0

  output stop,          //led16r
  output [15:0] led,    //led15-0
  output [7:0] an,      //an7-0
  output [6:0] seg,     //ca-cg
  output [2:0] seg_sel,  //led17

  output [3:0] pred,	//像素颜色 (prgb)：红
  output [3:0] pgreen, 	//像素颜色 (prgb)：绿
  output [3:0] pblue, 	//像素颜色 (prgb)：蓝
  output hs,		//行同步
  output vs		//场同步
);

wire clk_cpu;
wire rst_cpu;
//io_bus
wire [7:0] io_addr;
wire [31:0] io_dout;
wire io_we;
wire io_rd;
wire [31:0] io_din;

//Debug_BUS
wire [31:0] chk_pc;
wire [15:0] chk_addr;
wire [31:0] chk_data;

//paint wire
wire paint_we;
wire [31:0] paint_data;
wire [31:0] paint_addr;

//vRAM
wire [14:0] waddr, raddr;
wire [11:0] pdata ,rdata, outputdata; 

//VDT
wire [10:0] h_addr,v_addr;
wire pclk;

assign pred=outputdata[3:0];
assign pgreen=outputdata[7:4];
assign pblue=outputdata[11:8];


pdu p1(
      .clk(clk), 
      .rstn(rstn), 
      .step(step),
      .cont(cont),
      .chk(chk),
      .data(data),
      .del(del),
      .x(x),
      .stop(stop),
      .led(led),
      .an(an),
      .seg(seg),
      .seg_sel(seg_sel),
      .clk_cpu(clk_cpu),
      .rst_cpu(rst_cpu),
      .io_addr(io_addr),
      .io_dout(io_dout), 
      .io_we(io_we), 
      .io_din(io_din),
      .io_rd(io_rd),
      .chk_pc(chk_pc),
      .chk_addr(chk_addr),
      .chk_data(chk_data)
       );

cpu_pl c1(
      .clk(clk_cpu), 
      .rst(rst_cpu), 
      .io_addr(io_addr), 
      .io_dout(io_dout), 
      .io_we(io_we), 
      .io_rd(io_rd),
      .io_din(io_din),
      .chk_pc(chk_pc),
      .chk_addr(chk_addr), 
      .chk_data(chk_data),
      .paint_we(paint_we),
      .paint_addr(paint_addr),
      .paint_data(paint_data)
      );
      
clk50 c2(.clk_in1(clk),.reset(0),.clk_out1(pclk));
addr_hash a1(.paint_addr(paint_addr), .paint_addr_hash(waddr));

VRAM v1(.addra(waddr),.clka(clk),.dina(paint_data),.wea(paint_we),.addrb(raddr),.clkb(clk),.doutb(rdata));
SRA s1(.h_addr(h_addr),.v_addr(v_addr),.rdata(rdata),.raddr(raddr),.pdata(pdata));
VDT v2(.clk(pclk),.rst(~rstn),.rd_data(pdata),.hs(hs),.vs(vs),.vga_data(outputdata),.h_cnt(h_addr),.v_cnt(v_addr));
endmodule
