module mac_top (
    input clk,
    input rst,
    input load,
    input [3:0] A,
    input [3:0] B,
    output [7:0] Y,
    output done
);

wire load_en;
wire acc_en;
wire [3:0] A_reg;
wire [3:0] B_reg;
wire [7:0] product;

control_unit CU (
    .clk(clk),
    .rst(rst),
    .load(load),
    .load_en(load_en),
    .acc_en(acc_en),
    .done(done)
);

input_register IR (
    .clk(clk),
    .rst(rst),
    .load_en(load_en),
    .A_in(A),
    .B_in(B),
    .A_reg(A_reg),
    .B_reg(B_reg)
);

multiplier MUL (
    .A(A_reg),
    .B(B_reg),
    .P(product)
);

accumulator ACC (
    .clk(clk),
    .rst(rst),
    .acc_en(acc_en),
    .product(product),
    .Y(Y)
);

endmodule
