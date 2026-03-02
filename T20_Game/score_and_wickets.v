module score_and_wickets (
    input clk_fpga,rst,delivery,team_switch,
    input [3:0] lfsr_out,
    input game_over,
    output reg [7:0] runs,
    output reg [3:0] wickets,
    output reg[11:0] team_1_data,team_2_data
);

    localparam single = 16;
    localparam double = 32;
    localparam triple = 48;
    localparam four = 64;
    localparam six = 96;

    always @(posedge clk_fpga or posedge rst) begin
        if(rst) begin
            runs <= 0;
            wickets <= 0;
            team_1_data <= 0;
            team_2_data <= 0;
        end
        else if(game_over) begin
            runs <= runs;
            wickets <= wickets;
            team_1_data <= team_1_data;
            team_2_data <= team_2_data;
        end
        else if(delivery) begin
            if((~team_switch) && (wickets < 10)) begin
                case (lfsr_out)
                    0,1,2:  team_1_data <= team_1_data;
                    3,4,5,6:    team_1_data <= team_1_data + single;
                    7,8,9:  team_1_data <= team_1_data + double;
                    10: team_1_data <= team_1_data + triple;
                    11: team_1_data <= team_1_data + four;
                    12: team_1_data <= team_1_data + six;
                    13,14:  team_1_data <= team_1_data;
                    15: team_1_data <= team_1_data + 1; 
                    default: team_1_data <= team_1_data;
                endcase
                runs <= team_1_data[11:4];
                wickets <= team_1_data[3:0];
            end
            else if((team_switch) && (wickets < 10)) begin
                case (lfsr_out)
                    0,1,2:  team_2_data <= team_2_data;
                    3,4,5,6:    team_2_data <= team_2_data + single;
                    7,8,9:  team_2_data <= team_2_data + double;
                    10: team_2_data <= team_2_data + triple;
                    11: team_2_data <= team_2_data + four;
                    12: team_2_data <= team_2_data + six;
                    13,14:  team_2_data <= team_2_data;
                    15: team_2_data <= team_2_data + 1; 
                    default: team_2_data <= team_2_data;
                endcase
                runs <= team_2_data[11:4];
                wickets <= team_2_data[3:0];
            end
        end
        else begin
            case (team_switch)
                0:  begin
                    runs <= team_1_data[11:4];
                    wickets <= team_1_data[3:0];
                end 
                1:  begin
                    runs <= team_2_data[11:4];
                    wickets <= team_2_data[3:0];
                end 
                default: runs <= 0;
            endcase
        end
    end
    
endmodule