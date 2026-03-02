module bcd_display (
    input clk_fpga,
    input [7:0] binary_Runs,
    input [3:0] binary_Wickets,
    input innings_over,game_over,winner,
    output [3:0] an,
    output dp,
    output [6:0] seg
);

    wire clk_1khz;
    wire [1:0] counter_out;
    wire [3:0] mux_out, wickets,ones,tens,hundreds;

    bin_to_bcd b1(binary_Runs,binary_Wickets,innings_over,game_over,winner,wickets,ones,tens,hundreds);

    slow_clk_1khz b2(clk_fpga,clk_1khz);

    two_bit_counter b3(clk_1khz,counter_out);

    decoder_2to4 b4(counter_out,dp,an);

    mux_4to1 b5(counter_out,wickets,ones,tens,hundreds,mux_out);

    bcd7seg b6(mux_out,seg);
    
endmodule