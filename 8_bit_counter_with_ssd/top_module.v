`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 10:52:52
// Design Name: 
// Module Name: top_module
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


module top_module (
    input clk,
    input rst,
    output [7:0] LED,
    output [6:0] seg,
    output [3:0] an
);

    wire slow_clk;
    wire [7:0] count;

    clock_divider clk_div (clk, rst, slow_clk);

    counter my_counter (slow_clk, rst, count);

    assign LED = count;

    seven_segment_display ssd (clk,rst,count,an,seg);

endmodule

