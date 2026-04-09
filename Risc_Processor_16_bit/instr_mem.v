module instr_mem (
    input clk, imem_read,
    input [7:0] addr,
    output reg [15:0] instr
);
    reg [15:0] mem [0:255];
    integer i;
    initial begin
        for (i = 0; i < 256; i = i + 1)
            mem[i] = 16'h0000;
            
        mem[0] = 16'h620A;
        mem[1] = 16'h640B;
        mem[2] = 16'h1650;
        mem[3] = 16'h2850;
        mem[4] = 16'h3AD0;
        mem[5] = 16'h7A14;
        mem[6] = 16'h40E0;
        mem[7] = 16'hF000;
    end

    always @(posedge clk) begin
        if (imem_read)
            instr <= mem[addr];
    end
endmodule
