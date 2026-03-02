module score_comparator (
    input clk_fpga,rst,
    input [11:0] team_1_data,team_2_data,
    input [6:0] team_1_balls,team_2_balls,
    input [3:0] wickets,
    input [15:0] balls,
    output reg innings_over,game_over,winner
);

    always @(posedge clk_fpga) begin
        if((wickets >= 10) || (balls >= 120))   innings_over <= 1;
        else    innings_over <= 0;
    end

    always @(posedge clk_fpga or posedge rst) begin
        if(rst) game_over <= 0;
        else if(((team_1_data[3:0] >= 10 ) || (team_1_balls >= 120)) && ((team_2_data[3:0] >= 10) || (team_2_balls >= 120)))    game_over <= 0;
        else    game_over <= game_over;
    end

    always @(posedge game_over) begin
        if(team_1_data[11:4] > team_2_data[11:4])   winner <= 0;
        else    winner <= 1;
    end
    
endmodule