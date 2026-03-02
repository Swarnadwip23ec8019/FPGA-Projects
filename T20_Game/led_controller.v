module led_controller (
    input clk_fpga,rst,team_switch,delivery,
    input [3:0] lfsr_out,
    input innings_over,game_over,
    output reg [15:0] leds,
    output reg [6:0] team_1_balls,team_2_balls
);

    wire [15:0] scroll;

    scroll_leds g5(clk_fpga,scroll);

    always @(posedge clk_fpga or posedge rst) begin
        if(rst) begin
            leds <= 0;
            team_1_balls <= 0;
            team_2_balls <= 0;
        end
        else if(game_over)  leds <= scroll;
        else if(delivery)   begin
            if((team_switch == 0) && (innings_over == 0)) begin
                case (lfsr_out)
                    13,14: team_1_balls <= team_1_balls; 
                    default: team_1_balls <= team_1_balls + 1;
                endcase
                leds <= team_1_balls;
            end
            else if((team_switch) && (innings_over == 0)) begin
                case (lfsr_out)
                    13,14: team_2_balls <= team_2_balls; 
                    default: team_2_balls <= team_2_balls + 1;
                endcase
                leds <= team_2_balls;
            end
        end
        else if(~team_switch)   leds <= team_1_balls;
        else    leds <= team_2_balls;
    end
    
endmodule