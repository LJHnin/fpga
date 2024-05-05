`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/05 11:02:57
// Design Name: 
// Module Name: show_who
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


module show_who (
    input clk,
    input rst,
    input [3:0] state,
    input cnt_down_over,
    output reg [3:0] an
);
  reg [3:0] pos;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      pos <= 4'd0;
      an  <= 4'hf;
    end else
      case (pos)
        4'd0: begin
          an  <= 4'hf;
          pos <= state;
        end 
        4'd1, 4'd2, 4'd4, 4'd8:
        if (cnt_down_over) begin
          pos <= 4'd0;
        end else an <= pos;
        default: pos <= 4'd0;
      endcase
  end
endmodule
