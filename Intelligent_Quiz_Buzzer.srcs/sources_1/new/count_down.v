`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/05 11:01:20
// Design Name: 
// Module Name: count_down
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


module count_down (
    input clk,
    input rst,
    input cnt_start,
    output reg [7:0] seg_code
);
  parameter T1s = 27'd100000000;
  reg [26:0] cnt;
  reg cnt_sig;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      cnt <= 27'd0;
    end else if (cnt == T1s) begin
      cnt <= 27'd0;
    end else if (cnt_sig) begin
      cnt <= cnt + 1'b1;
    end else cnt <= 27'd0;
  end
  reg [3:0] cnt_down;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      cnt_down <= 4'd9;
      cnt_sig  <= 1'b0;
    end else if (cnt_start && !cnt_sig) begin
      cnt_sig <= 1'b1;
    end else if (cnt_down == 4'hf) begin
      cnt_down <= 4'd9;
      cnt_sig  <= 1'b0;
    end else if (cnt == T1s) begin
      cnt_down <= cnt_down - 1'b1;
    end
  end
  parameter _0 = 8'hc0,_1 = 8'hf9,_2 = 8'ha4,_3 = 8'hb0,
            _4 = 8'h99,_5 = 8'h92,_6 = 8'h82,_7 = 8'hf8,
            _8 = 8'h80,_9 = 8'h90;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      seg_code <= 8'hff;
    end else
      case (cnt_down)
        4'd0: seg_code <= ~_0;
        4'd1: seg_code <= ~_1;
        4'd2: seg_code <= ~_2;
        4'd3: seg_code <= ~_3;
        4'd4: seg_code <= ~_4;
        4'd5: seg_code <= ~_5;
        4'd6: seg_code <= ~_6;
        4'd7: seg_code <= ~_7;
        4'd8: seg_code <= ~_8;
        4'd9: seg_code <= ~_9;
        default: seg_code <= 8'hff;
      endcase 
  end

endmodule

