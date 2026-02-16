module control_unit (
    input clk,
    input rst,
    input load,
    output reg load_en,
    output reg acc_en,
    output reg done
);

reg [1:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 2'd0;
        done  <= 1'b0;
    end
    else begin
        if (load && !done) begin
            count <= count + 1'b1;
        end

        if (count == 2'd3)
            done <= 1'b1;
    end
end

always @(*) begin
    if (load && !done) begin
        load_en = 1'b1;
        acc_en  = 1'b1;
    end
    else begin
        load_en = 1'b0;
        acc_en  = 1'b0;
    end
end

endmodule
