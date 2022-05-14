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
  output [2:0] seg_sel  //led17

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

endmodule
