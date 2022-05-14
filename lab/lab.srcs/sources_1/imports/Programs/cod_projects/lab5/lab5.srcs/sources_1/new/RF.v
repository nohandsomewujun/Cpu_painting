`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/19 21:14:14
// Design Name: 
// Module Name: RF
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


module  RF # (
    parameter AW = 5,		//��ַ���
    parameter DW = 32		//���ݿ��
)(
    input clk,			//ʱ��
    input [AW-1:0] ra0, ra1, ra2,		//����ַ
    output reg [DW-1:0] rd0, rd1, 	//������
    output [DW-1:0] rd2,
    input [AW-1:0] wa, 		//д��ַ
    input [DW-1:0] wd,		//д����
    input we			//дʹ��
);
    reg [DW-1:0] rf [0: (1<<AW)-1];		//�Ĵ�����
   // assign rd0 = rf[ra0], rd1 = rf[ra1], rd2 = rf[ra2];	//������
   //rd0
   assign rd2 = rf[ra2];
   always @ (*) begin
        if (we && (ra0 == wa))  begin
              rd0  = wd;
        end
        else rd0 = rf[ra0];
    end
    //rd1
   always @ (*) begin
        if (we && (ra1 == wa))  begin
              rd1  = wd;
        end
        else rd1 = rf[ra1];
    end
    
    always @ (posedge clk) begin
        if (we)  begin
              rf[wa]  <=  wd;		//д����
        end
        rf[0] <= 0;
    end
endmodule

