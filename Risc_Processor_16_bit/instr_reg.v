
module instr_reg (
    input clk, ir_write, rst,
    input [15:0] ir_in,
    output reg [15:0] ir_out
);
    always @(posedge clk) begin
        if (rst)
            ir_out <= 16'h0000;
        else if (ir_write)
            ir_out <= ir_in;
    end
endmodule
