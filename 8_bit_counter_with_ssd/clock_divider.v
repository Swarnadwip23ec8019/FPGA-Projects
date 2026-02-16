`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 10:52:52
// Design Name: 
// Module Name: clock_divider
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


module clock_divider (
    input clk, 
    input rst,
    output reg slow_clk
);

    reg [25:0] counter; 

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            slow_clk <= 0;
        end
        else begin
            if (counter == 49_999_999) begin
                counter <= 0;
                slow_clk <= ~slow_clk;
            end
            else
                counter <= counter + 1;
        end
    end

endmodule

