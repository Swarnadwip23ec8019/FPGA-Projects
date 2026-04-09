
module reg_file (
    input clk, rst, reg_write,
    input [2:0] rd_addr1, rd_addr2, rd_addr3,
    input [2:0] wr_addr,
    input [7:0] wr_data,
    output [7:0] rd_data1, rd_data2, rd_data3
);
    reg [7:0] regs [0:7];
    integer i;
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 8; i = i + 1)
                regs[i] <= 8'd0;
        end else if (reg_write) begin
            regs[wr_addr] <= wr_data;
        end
    end
    assign rd_data1 = regs[rd_addr1];
    assign rd_data2 = regs[rd_addr2];
    assign rd_data3 = regs[rd_addr3];
endmodule
