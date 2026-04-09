module datapath (
    input clk, rst,
    input [1:0]  alu_op,
    input flag_write, halt, imem_read, ir_write, mem_read, mem_write, mul_en, pc_write, reg_write,
    input [1:0]  wb_sel,
    
    output flag_g, flag_l, flag_z,
    output [3:0]  opcode,
    output [7:0]  reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7
);

    wire [7:0] pc_out;
    wire [15:0] imem_instr, ir_out;
    pc u_pc (.clk(clk),.rst(rst),.pc_write(pc_write),.pc_out(pc_out));

    // Decoded fields
    wire [3:0]  dec_opcode;
    wire [2:0]  dec_rd, dec_rs1, dec_rs2;
    wire [2:0]  dec_reg_mem;
    wire [8:0]  dec_mem_addr;
    instr_decoder u_dec (.instr(ir_out),.opcode(dec_opcode),.rd(dec_rd),.rs1(dec_rs1),.rs2(dec_rs2),.reg_mem(dec_reg_mem),.mem_addr(dec_mem_addr));
    
    //Instruction Memory
    instr_mem u_imem (.clk(clk),.imem_read(imem_read),.addr(pc_out),.instr(imem_instr));

    // Register file outputs
    wire [7:0] rf_data1, rf_data2, rf_data3;
    reg [7:0] wb_data;
     reg_file u_rf (.clk(clk),.rst(rst),.reg_write(reg_write),.rd_addr1 (dec_rs1),.rd_addr2 (dec_rs2),.rd_addr3 (dec_reg_mem),
     .wr_addr  (dec_rd),.wr_data  (wb_data),.rd_data1 (rf_data1),.rd_data2 (rf_data2),.rd_data3 (rf_data3));

    // ALU outputs
    wire [7:0] alu_result;
    wire alu_g, alu_l, alu_z;
    alu u_alu (.a(rf_data1),.b(rf_data2),.alu_op(alu_op),.result(alu_result),.g(alu_g),.l(alu_l),.z(alu_z));

    // Multiplier output
    wire [7:0] mul_result;
    multiplier u_mul (.a(rf_data1),.b(rf_data2),.result(mul_result));
    
    //Instruction Register
    instr_reg u_ir (.clk(clk),.rst(rst),.ir_write(ir_write),.ir_in(imem_instr),.ir_out(ir_out));

    // Data Memory output
    wire [7:0] dmem_data;
    data_mem u_dmem (.clk(clk),.rst(rst),.mem_read(mem_read),.mem_write(mem_write),.addr(dec_mem_addr),.write_data(rf_data3),.read_data(dmem_data));

    // Flag registers
    reg flag_g_r, flag_l_r, flag_z_r;
    
    always @(*) begin
        case (wb_sel)
            2'b00:   wb_data = alu_result;
            2'b01:   wb_data = mul_result;
            2'b10:   wb_data = dmem_data;
            default: wb_data = alu_result;
        endcase
    end
    
    // Flag Registers
    always @(posedge clk) begin
        if (rst) begin
            flag_g_r <= 1'b0; flag_l_r <= 1'b0; flag_z_r <= 1'b0;
        end else if (flag_write) begin
            flag_g_r <= alu_g; flag_l_r <= alu_l; flag_z_r <= alu_z;
        end
    end

    assign flag_g = flag_g_r;
    assign flag_l = flag_l_r;
    assign flag_z = flag_z_r;

    // Opcode exposed to control unit (directly from IR)
    assign opcode = ir_out[15:12];

    reg [7:0] shadow_regs [0:7];
    integer idx;

    always @(posedge clk) begin
        if (rst) begin
            for (idx = 0; idx < 8; idx = idx + 1)
                shadow_regs[idx] <= 8'd0;
        end else if (reg_write) begin
            shadow_regs[dec_rd] <= wb_data;
        end
    end

    assign reg0 = shadow_regs[0];
    assign reg1 = shadow_regs[1];
    assign reg2 = shadow_regs[2];
    assign reg3 = shadow_regs[3];
    assign reg4 = shadow_regs[4];
    assign reg5 = shadow_regs[5];
    assign reg6 = shadow_regs[6];
    assign reg7 = shadow_regs[7];

endmodule
