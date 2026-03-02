module cricket_top (
    input clk_fpga,rst,btnU,sw,
    output dp,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led
);

    wire delivery,innings_over,game_over,winner;
    wire [7:0] binary_Runs;
    wire [3:0] binary_Wickets;

    debounce d0(clk_fpga,btnU,delivery);

    cricket_Game g0(clk_fpga,rst,delivery,sw,binary_Runs,binary_Wickets,led,innings_over,game_over,winner);

    bcd_display b0(clk_fpga,binary_Runs,binary_Wickets,innings_over,game_over,winner,an,dp,seg);
    
endmodule