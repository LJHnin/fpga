/////////////////////////////////////////////////////////////////////////////
//EDA工具平台：Vivado 2019.1 + ModelSim SE-64 10.5 
//开发套件型号： STAR 入门FPGA开发套件
//版   权  申   明： 本例程由《深入浅出玩转FPGA》作者“特权同学”原创，
//				仅供特权同学相关FPGA开发套件学习使用，谢谢支持
//官方淘宝店铺： http://myfpga.taobao.com/
//微 信 公 众 号：“FPGA快乐学习”
//				欢迎关注，获取更多更新的FPGA学习资料 
/////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
module vlg_design(
	input clk,
	input rst_n,
	output reg[3:0] syscnt
    );
localparam DIVCNT_MAX =3'd4;
reg[2:0] divcnt;
always @(posedge clk)
	if(!rst_n) divcnt<='b0;
	else if(divcnt<DIVCNT_MAX) divcnt<=divcnt+1'b1;
	else divcnt <='b0;
reg clk_en;

always @(posedge clk)
	if(!rst_n) clk_en<=1'b0;
	else if(divcnt ==DIVCNT_MAX) clk_en <=1'b1;
	else clk_en<=1'b0;
always @(posedge clk)
	if(!rst_n) syscnt<='b0;
	else if(clk_en) syscnt<=syscnt+1'b1;
	else syscnt<=syscnt;

endmodule

