module lfsr (
    input clk_fpga,rst,
    output [3:0] q
);
    reg [5:0] shift;
    wire xor_sum;
    assign xor_sum = shift[1] ^ shift[4];
    
    always @(posedge clk_fpga) begin
        if(rst) shift <= 6'b111111;
        else    shift <= {xor_sum,shift[5:1]};
    end

    assign q = shift[3:0];
    
endmodule