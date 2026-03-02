module scroll_leds (
    input clk_fpga,
    output reg [15:0] led
);

    wire clk_10hz;

    slow_clk_10hz c0(clk_fpga,clk_10hz);

    always @(clk_10hz) begin
        if(led == 16'hffff) led <= 16'hfffe;
        else led <= {led[14:0],1'b1};
    end
    
endmodule