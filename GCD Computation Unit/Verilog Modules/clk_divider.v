module clk_divider (
    input  clk, rst,
    output reg clk_1hz
);
    reg [25:0] c;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            c       <= 0;
            clk_1hz <= 0;
        end else begin
            if (c == 25_000_000) begin
                clk_1hz <= ~clk_1hz;
                c       <= 0;
            end else
                c <= c + 1;
        end
    end
endmodule