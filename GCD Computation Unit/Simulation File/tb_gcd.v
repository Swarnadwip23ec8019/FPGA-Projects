`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2026 14:12:00
// Design Name: 
// Module Name: tb_gcd
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


module tb_gcd();

    reg        clk, rst, start;
    reg  [7:0] A_in, B_in;

    wire [7:0] gcd_out;
    wire       idle, busy, done, error;

    // --------------------------------------------------------
    // DUT instantiation
    // --------------------------------------------------------
    gcd_top dut (
        .clk(clk), .rst(rst), .start(start),
        .A_in(A_in), .B_in(B_in),
        .gcd_out(gcd_out),
        .idle_led(idle), .busy_led(busy), .done_led(done), .error_led(error)
    );

    // --------------------------------------------------------
    // Clock: 10 ns period
    // --------------------------------------------------------
    initial begin
        clk = 0; rst = 1; start = 0;
    end
    always  #5 clk = ~clk;
    
    initial begin
        #10 rst = 0; A_in = 42; B_in = 12; start = 1;
        #10 start = 0;
        
        #100 A_in = 100; B_in = 75; start = 1;
        #10 start = 0;
        
        #80 A_in = 255; B_in = 85; start = 1;
        #10 start = 0;
        
        #80 A_in = 12; B_in = 8; start = 1;
        #10 start = 0;
        
        #80 A_in = 7; B_in = 3; start = 1;
        #10 start = 0;
        
        #150 A_in = 9; B_in = 9; start = 1;
        #10 start = 0;
        
        #40 A_in = 8; B_in = 0; start = 1;
        #10 start = 0;
        
        #40 A_in = 0; B_in = 18; start = 1;
        #10 start = 0;
        
        #40 A_in = 0; B_in = 0; start = 1;
        #10 start = 0;
        
        #100 $finish;    
    end
endmodule
