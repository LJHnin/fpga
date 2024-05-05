`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/05 11:02:27
// Design Name: 
// Module Name: push_detect
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


module push_detect (
    input clk,
    input rst,
    input [3:0] btn,
    output reg [3:0] state
);
  parameter over = 8'hff;
  reg [3:0] pos;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= 4'd0;
      pos   <= 4'd0;
    end else
      case (pos)
        4'd0: begin 
          state <= 4'd0;
          pos   <= btn;
        end
        4'd1, 4'd2, 4'd4, 4'd8: begin
          state <= pos;
          pos   <= 4'd0;
        end
        default: pos <= 4'd0;
      endcase
  end
endmodule
