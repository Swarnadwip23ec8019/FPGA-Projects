`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 10:08:28
// Design Name: 
// Module Name: multi_mode_alu_tb
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


module multi_mode_alu_tb;

reg  [3:0] A, B;
reg  [1:0] Mode;
wire [7:0] Y;

multi_mode_alu uut (A,B,Mode,Y);

initial begin

    Mode = 2'b00; A = 4'd5; B = 4'd3; #10;
    Mode = 2'b00; A = 4'd9; B = 4'd6; #10;

    Mode = 2'b01; A = 4'd4; B = 4'd3; #10;
    Mode = 2'b01; A = 4'd7; B = 4'd2; #10;

    Mode = 2'b10; A = 4'd8; B = 4'd0; #10;
    Mode = 2'b10; A = 4'd15; B = 4'd0; #10;
    
    Mode = 2'b11; A = 4'd0; B = 4'd0; #10;

    $finish;
end

endmodule

