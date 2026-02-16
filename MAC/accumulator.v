module accumulator (
    input clk,
    input rst,
    input acc_en,
    input [7:0] product,
    output reg [7:0] Y
);

always @(posedge clk or posedge rst) begin
    if (rst)
        Y <= 8'd0;
    else if (acc_en)
        Y <= Y + product;
end

endmodule
