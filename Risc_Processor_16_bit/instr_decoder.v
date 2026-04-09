module instr_decoder (
    input [15:0] instr,
    output [3:0]  opcode,
    output [2:0]  rd, rs1, rs2,
    output [2:0]  reg_mem,
    output [8:0]  mem_addr
);
    assign opcode   = instr[15:12];
    assign rd       = instr[11:9];
    assign rs1      = instr[8:6];
    assign rs2      = instr[5:3];
    assign reg_mem  = instr[11:9];
    assign mem_addr = instr[8:0];
endmodule
