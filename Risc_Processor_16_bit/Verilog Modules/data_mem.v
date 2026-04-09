
module data_mem (
    input clk, rst, mem_read, mem_write,
    input [8:0] addr,
    input [7:0] write_data,
    output reg [7:0] read_data
);
    reg [7:0] mem [0:511];
    integer i;

    initial begin
        for (i = 0; i < 512; i = i + 1)
            mem[i] = 8'd0;
            
        mem[10] = 8'd6;
        mem[11] = 8'd4;
    end
    
    always @(posedge clk) begin
        if (mem_write)
            mem[addr] <= write_data;
    end
    
    always @(posedge clk) begin
        if (rst)
            read_data <= 8'd0;
        else if (mem_read)
            read_data <= mem[addr];
    end
endmodule
