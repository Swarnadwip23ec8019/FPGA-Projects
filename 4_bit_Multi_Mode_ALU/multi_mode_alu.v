`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 10:07:59
// Design Name: 
// Module Name: multi_mode_alu
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


`timescale 1ns / 1ps

module multi_mode_alu(
    input  [3:0] A, B,
    input  [1:0] Mode,
    output reg [7:0] Y
);

always @(*) begin
    case (Mode)
        2'b00: Y = A + B;       
        2'b01: Y = A * B;
        2'b10: Y = A >> 2;
        2'b11: Y = 8'b11111111;
        default: Y = 8'b00000000;
    endcase
end
endmodule

