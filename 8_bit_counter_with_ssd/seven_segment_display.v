`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 10:52:52
// Design Name: 
// Module Name: seven_segment_display
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


module seven_segment_display(
    input clk,rst,
    input [7:0] value,
    output reg [3:0] an,
    output [6:0] seg
);

    reg [1:0] digit_select;
    reg [3:0] digit;
    reg [15:0] refresh_counter;

    wire [3:0] hundreds, tens, ones;

    assign hundreds = value / 100;
    assign tens     = (value % 100) / 10;
    assign ones     = value % 10;

    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end

    always @(posedge refresh_counter[15]) begin
        digit_select <= digit_select + 1;
    end

    always @(*) begin
        case(digit_select)
            2'b00: begin
                an = 4'b1110;
                digit = ones;
            end
            2'b01: begin
                an = 4'b1101;
                digit = tens;
            end
            2'b10: begin
                an = 4'b1011;
                digit = hundreds;
            end
            default: begin
                an = 4'b0111;
                digit = 4'd0;
            end
        endcase
    end

    seven_segment_coder ssc (digit,seg);

endmodule

