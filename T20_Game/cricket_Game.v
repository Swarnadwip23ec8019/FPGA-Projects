module cricket_Game (
    input clk_fpga,rst,delivery,team_switch,
    output [7:0] runs,
    output [3:0] wickets,
    output [15:0] leds,
    output innings_over,game_over,winner
);

    wire [11:0] team_1_data,team_2_data;
    wire [6:0] team_1_balls,team_2_balls;
    wire [3:0] lfsr_out;

    lfsr g1(clk_fpga,rst,lfsr_out);

    score_and_wickets g2(clk_fpga,rst,delivery,team_switch,lfsr_out,game_over,runs,wickets,team_1_data,team_2_data);
    
    score_comparator g3(clk_fpga,rst,team_1_data,team_2_data,team_1_balls,team_2_balls,wickets,leds,innings_over,game_over,winner);

    led_controller g4(clk_fpga,rst,team_switch,delivery,lfsr_out,innings_over,game_over,leds,team_1_balls,team_2_balls);
endmodule