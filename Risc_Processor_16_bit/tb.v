`timescale 1ns/1ps
module tb;
    reg clk, rst;
    reg [2:0] SW;
    wire [7:0] LED;
    wire flag_Z, flag_G, flag_L;

    risc_processor dut (.clk(clk),.rst(rst),.SW(SW),.LED(LED),.flag_Z(flag_Z),.flag_G(flag_G),.flag_L(flag_L));
    
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        SW = 3'd0;
        rst = 1;
        
        #15 rst = 0;
        #500;
        
        SW = 3'd1; 
        #10 SW = 3'd2; 
        #10 SW = 3'd3; 
        #10 SW = 3'd4; 
        #10 SW = 3'd5; 
        #10 SW = 3'd6; 
        #10 SW = 3'd7; 
        #10 $finish;
    end
endmodule
