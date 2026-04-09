module pc (
    input clk, pc_write, rst,
    output reg [7:0] pc_out
);
    always @(posedge clk) begin
        if (rst)
            pc_out <= 8'h00;
        else if (pc_write)
            pc_out <= pc_out + 8'h01;
    end
endmodule
