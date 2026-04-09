module gcd_top (
    input  clk, rst, start,
    input  [7:0] A_in, B_in,

    output [7:0] gcd_out,
    output       idle_led,
    output       busy_led,
    output       done_led,
    output       error_led   // blinks at 1 Hz on error
);
    wire clk_1hz;
    wire load, compute;
    wire equal, A_zero, B_zero;
    wire [7:0] A_reg, B_reg;
    wire       error;

    clk_divider cd (
        .clk(clk), .rst(rst),
        .clk_1hz(clk_1hz)
    );

    gcd_datapath dp (
        .clk(clk),     .rst(rst),
        .load(load),   .compute(compute),
        .A_in(A_in),   .B_in(B_in),
        .A_reg(A_reg), .B_reg(B_reg),
        .gcd_out(gcd_out),
        .equal(equal), .A_zero(A_zero), .B_zero(B_zero)
    );

    gcd_controller ctrl (
        .clk(clk),       .rst(rst),   .start(start),
        .equal(equal),   .A_zero(A_zero), .B_zero(B_zero),
        .load(load),     .compute(compute),
        .idle(idle_led), .busy(busy_led),
        .done(done_led), .error(error)
    );

    // Error LED blinks at 1 Hz
    reg err_blink;
    always @(posedge clk_1hz or posedge rst)
        err_blink <= rst ? 0 : (error ? ~err_blink : 0);

    assign error_led = err_blink;

endmodule