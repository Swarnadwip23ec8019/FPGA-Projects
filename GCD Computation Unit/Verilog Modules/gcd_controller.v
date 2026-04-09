module gcd_controller (
    input  clk, rst, start,
    input  equal, A_zero, B_zero,

    output reg load, compute,
    output reg idle, busy, done, error
);
    localparam S_IDLE    = 3'd0,
               S_LOAD    = 3'd1,
               S_CHECK   = 3'd2,
               S_COMPUTE = 3'd3,
               S_DONE    = 3'd4,
               S_ERROR   = 3'd5;

    reg [2:0] ps, ns;

    always @(posedge clk or posedge rst)
        ps <= rst ? S_IDLE : ns;

    always @(*) begin
        case (ps)
            S_IDLE:    ns = start ? S_LOAD : S_IDLE;
            S_LOAD:    ns = S_CHECK;
            S_CHECK:   ns = (A_zero && B_zero)         ? S_ERROR   :
                            (A_zero || B_zero || equal) ? S_DONE    : S_COMPUTE;
            S_COMPUTE: ns = equal ? S_DONE : S_COMPUTE;
            S_DONE:    ns = start ? S_LOAD : S_DONE;
            S_ERROR:   ns = start ? S_LOAD : S_ERROR;
            default:   ns = S_IDLE;
        endcase
    end

    always @(*) begin
        {load, compute, idle, busy, done, error} = 6'b0;
        case (ps)
            S_IDLE:    idle    = 1;
            S_LOAD:    begin load = 1; busy = 1; end
            S_CHECK:   busy    = 1;
            S_COMPUTE: begin compute = 1; busy = 1; end
            S_DONE:    done    = 1;
            S_ERROR:   error   = 1;
        endcase
    end
endmodule
