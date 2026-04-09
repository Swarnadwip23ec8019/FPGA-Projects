module gcd_datapath (
    input  clk, rst,
    input  load, compute,
    input  [7:0] A_in, B_in,

    output reg [7:0] A_reg, B_reg,
    output reg [7:0] gcd_out,
    output equal, A_zero, B_zero
);
    assign equal  = (A_reg == B_reg);
    assign A_zero = (A_reg == 0);
    assign B_zero = (B_reg == 0);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A_reg <= 0; B_reg <= 0; gcd_out <= 0;
        end else begin
            if (load) begin
                A_reg <= A_in;
                B_reg <= B_in;
            end else if (compute) begin
                if      (A_reg > B_reg) A_reg <= A_reg - B_reg;
                else if (B_reg > A_reg) B_reg <= B_reg - A_reg;
            end

            if      (A_zero && B_zero) gcd_out <= 0;
            else if (A_zero)           gcd_out <= B_reg;
            else if (B_zero)           gcd_out <= A_reg;
            else if (equal)            gcd_out <= A_reg;
        end
    end
endmodule
