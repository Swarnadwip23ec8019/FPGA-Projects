module input_register (
    input clk,
    input rst,
    input load_en,
    input [3:0] A_in,
    input [3:0] B_in,
    output reg [3:0] A_reg,
    output reg [3:0] B_reg
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        A_reg <= 4'd0;
        B_reg <= 4'd0;
    end
    else if (load_en) begin
        A_reg <= A_in;
        B_reg <= B_in;
    end
end

endmodule
