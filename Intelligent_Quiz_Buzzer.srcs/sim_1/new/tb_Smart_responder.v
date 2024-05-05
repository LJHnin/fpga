`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/05 20:57:42
// Design Name: 
// Module Name: tb_Smart_responder
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


module tb_Smart_responder;

  // Smart_responder Parameters
  parameter PERIOD = 10;


  // Smart_responder Inputs
  reg        clk = 0;
  reg        rst_n = 0;
  reg  [3:0] btn = 0;

  // Smart_responder Outputs
  wire [3:0] an;
  wire [7:0] seg_code;


  initial begin
    forever #(PERIOD / 2) clk = ~clk;
  end

  initial begin
    #(PERIOD * 2) rst_n = 1;
  end

  Smart_responder u_Smart_responder (
      .clk  (clk),
      .rst_n(rst_n),
      .btn  (btn[3:0]),

      .an      (an[3:0]),
      .seg_code(seg_code[7:0])
  );

  initial begin
    btn<=0;
    #100000000
    #100000000 
    #100000000
    btn<=4'd1;
    #100000000
    btn<=4'd2;

  end

endmodule
