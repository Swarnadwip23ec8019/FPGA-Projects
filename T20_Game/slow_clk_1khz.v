module slow_clk_1khz (
    input clk_fpga,
    output reg clk_1khz
);

    localparam clkdiv = 50_000 - 1;
    reg [15:0] period_count = 0;

    always @(posedge clk_fpga) begin
        if(period_count == clkdiv) begin
            period_count <= 0;
            clk_1khz <= ~clk_1khz;
        end else begin
            period_count <= period_count + 1'b1;
            clk_1khz <= clk_1khz;
        end
    end
    
endmodule