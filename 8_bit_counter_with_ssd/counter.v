`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 10:52:52
// Design Name: 
// Module Name: counter
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


module counter (
    input slow_clk,
    input rst,
    output reg [7:0] count
);

    always @(posedge slow_clk or posedge rst) begin
        if (rst)
            count <= 8'd0;
        else
            count <= count + 1;
    end

endmodule

