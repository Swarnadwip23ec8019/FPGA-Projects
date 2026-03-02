module bin_to_bcd (
    input [7:0] binary_Runs,
    input [3:0] binary_Wickets,
    input innings_over,game_over, winner,
    output reg [3:0] wickets, ones, tens, hundreds
);

    reg [7:0] data;

    always @(binary_Runs,binary_Wickets,innings_over,game_over,winner) begin
        if(~game_over) begin
            if(innings_over) begin
                hundreds <= 4'b1100;
                tens <= 4'b1101;
                ones <= 4'b0000;
                wickets <= 4'b1110;
            end else begin
                data <= binary_Runs;
                hundreds <= data / 100;
                data <= data % 100;
                tens <= data / 10;
                ones <= data % 10;
                wickets <= (binary_Wickets % 10);
            end
        end else begin
            case (winner)
                0:  begin
                    hundreds <= 4'b1111;
                    tens <= 4'b0000;
                    ones <= 4'b0001;
                    wickets <= 4'b0000;
                end 
                0:  begin
                    hundreds <= 4'b1111;
                    tens <= 4'b0000;
                    ones <= 4'b0010;
                    wickets <= 4'b0000;
                end 
                default: wickets <= 4'd0;
            endcase
        end
    end
endmodule