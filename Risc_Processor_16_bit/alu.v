module alu (
    input [7:0] a, b,
    input [1:0] alu_op,
    output reg [7:0] result,
    output reg g, l, z
);
    always @(*) begin
        g = 1'b0; l = 1'b0; z = 1'b0; result = 8'd0;

        case (alu_op)
            2'b00: result = a + b;
            2'b01: result = a - b;
            2'b10: begin
                result = 8'd0;
                if (a == b) begin
                    z = 1'b1; g = 1'b0; l = 1'b0;
                end else if (a > b) begin
                    g = 1'b1; z = 1'b0; l = 1'b0;
                end else begin
                    l = 1'b1; z = 1'b0; g = 1'b0;
                end
            end
            2'b11: result = a;
        endcase
    end
endmodule
