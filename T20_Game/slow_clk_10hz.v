module slow_clk_10hz (
    input clk_fpga,
    output reg clk_10hz
);

    localparam clkdiv = 5_000_000 - 1;
    reg [22:0] period_count = 0;

    always @(posedge clk_fpga) begin
        if(period_count == clkdiv) begin
            period_count <= 0;
            clk_10hz <= ~ clk_10hz;
        end else begin
            period_count <= period_count + 1'b1;
            clk_10hz <= clk_10hz;
        end
    end
    
endmodule