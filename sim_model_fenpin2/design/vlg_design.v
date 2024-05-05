/////////////////////////////////////////////////////////////////////////////
//EDA����ƽ̨��Vivado 2019.1 + ModelSim SE-64 10.5 
//�����׼��ͺţ� STAR ����FPGA�����׼�
//��   Ȩ  ��   ���� �������ɡ�����ǳ����תFPGA�����ߡ���Ȩͬѧ��ԭ����
//				������Ȩͬѧ���FPGA�����׼�ѧϰʹ�ã�лл֧��
//�ٷ��Ա����̣� http://myfpga.taobao.com/
//΢ �� �� �� �ţ���FPGA����ѧϰ��
//				��ӭ��ע����ȡ������µ�FPGAѧϰ���� 
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

