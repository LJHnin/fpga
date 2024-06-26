`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/05 11:01:50
// Design Name: 
// Module Name: Smart_responder
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


module Smart_responder (
    input clk,
    input rst_n,
    input [3:0] btn,
    output [3:0] an,
    output [7:0] seg_code
);
  wire [3:0] state;
  wire rst = ~rst_n;
  push_detect u_push_detect (
      .clk  (clk),
      .rst  (rst),
      .btn  (btn),
      .state(state)
  );
  wire cnt_down_over;
  assign cnt_down_over = &seg_code;
  show_who u_show_who (
      .clk          (clk),
      .rst          (rst),
      .state        (state),
      .cnt_down_over(cnt_down_over ),
      .an           (an)
  );
  wire cnt_start;
  assign cnt_start = |state;
  count_down u_count_down (
      .clk      (clk),
      .rst      (rst),
      .cnt_start(cnt_start),
      .seg_code (seg_code)
  );

endmodule
