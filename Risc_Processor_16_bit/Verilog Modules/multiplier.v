module multiplier (
    input [7:0] a, b,
    output [7:0] result
);
    wire [15:0] product;
    assign product = a * b;
    assign result  = product[7:0];
endmodule
