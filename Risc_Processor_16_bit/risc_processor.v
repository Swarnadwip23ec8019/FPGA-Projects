module risc_processor (
    input clk, rst,
    input [2:0] SW,
    output [7:0] LED,
    output flag_Z, flag_G, flag_L
  
);
    wire [1:0] alu_op;
    wire flag_write, halt, imem_read, ir_write, mem_read, mem_write, mul_en, pc_write, reg_write;
    wire [1:0] wb_sel;
    
    wire [3:0] opcode;
    wire flag_g_int, flag_l_int, flag_z_int;
    wire [7:0] reg0_out,reg1_out,reg2_out,reg3_out,reg4_out,reg5_out,reg6_out,reg7_out;
    
    control_unit u_cu (.clk(clk),.rst(rst),.opcode(opcode),.flag_g(flag_g_int),.flag_l(flag_l_int),.flag_z(flag_z_int),.pc_write(pc_write),.imem_read(imem_read),
        .ir_write(ir_write),.reg_write(reg_write),.mem_read(mem_read),.mem_write(mem_write),.mul_en(mul_en),.flag_write(flag_write),.halt(halt),.alu_op(alu_op),.wb_sel(wb_sel));

    datapath u_dp (.clk(clk),.rst(rst),.alu_op(alu_op),.flag_write(flag_write),.halt(halt),.imem_read(imem_read),.ir_write(ir_write),.mem_read(mem_read),
        .mem_write(mem_write),.mul_en(mul_en),.pc_write(pc_write),.reg_write(reg_write),.wb_sel(wb_sel),.flag_g(flag_g_int),.flag_l(flag_l_int),.flag_z(flag_z_int),
        .opcode(opcode),.reg0(reg0_out),.reg1(reg1_out),.reg2(reg2_out),.reg3(reg3_out),.reg4(reg4_out),.reg5(reg5_out),.reg6(reg6_out),.reg7(reg7_out));

    assign flag_Z = flag_z_int;
    assign flag_G = flag_g_int;
    assign flag_L = flag_l_int;
    
    reg_select u_reg_sel(.reg0(reg0_out),.reg1(reg1_out),.reg2(reg2_out),.reg3(reg3_out),.reg4(reg4_out),.reg5(reg5_out),.reg6(reg6_out),.reg7(reg7_out),.SW(SW),.LED(LED));
endmodule
