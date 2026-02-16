`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 09:36:51
// Design Name: 
// Module Name: full_adder
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


module full_adder (
    input  wire A, B, Cin,
    output wire Sum, Cout
);

wire S1, C1, C2;

half_adder HA1 (A,B,S1,C1);
half_adder HA2 (S1, Cin, Sum, C2);

assign Cout = C1 | C2;

endmodule
