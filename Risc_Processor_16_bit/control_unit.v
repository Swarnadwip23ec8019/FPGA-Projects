module control_unit (
    input clk, rst,
    input [3:0] opcode,
    input flag_g, flag_l, flag_z,
    output reg pc_write, imem_read, ir_write, reg_write, mem_read, mem_write, mul_en, flag_write, halt,
    output reg [1:0] alu_op, wb_sel
);

    // Opcodes
    localparam OP_NOP = 4'b0000, OP_ADD = 4'b0001, OP_SUB = 4'b0010, OP_MUL = 4'b0011, 
               OP_CMP = 4'b0100, OP_MOV = 4'b0101, OP_LOAD = 4'b0110, OP_STORE = 4'b0111, OP_HALT = 4'b1111;
               
    // ALU operations
    localparam ALU_ADD = 2'b00, ALU_SUB = 2'b01, ALU_CMP = 2'b10, ALU_MOV = 2'b11;

    // Write-back select
    localparam WB_ALU = 2'b00, WB_MUL = 2'b01, WB_MEM = 2'b10;

    // FSM States
    localparam S_FETCH = 3'd0, S_DECODE = 3'd1, S_READ = 3'd2, S_EXECUTE = 3'd3, S_MEMORY = 3'd4, S_WRITEBACK = 3'd5, S_HALT = 3'd6;

    reg [2:0] state, next_state;
    reg [3:0] opcode_reg;
    reg [1:0] alu_op_reg;
    
    always @(posedge clk) begin
        if (rst) begin
            state <= S_FETCH;
            opcode_reg <= OP_NOP;
            alu_op_reg <= ALU_ADD;
        end else begin
            state <= next_state;
            if (state == S_DECODE)
                opcode_reg <= opcode;
                
            if(state == S_EXECUTE) begin
                case (opcode_reg)
                    OP_ADD:  alu_op_reg <= ALU_ADD;
                    OP_SUB:  alu_op_reg <= ALU_SUB;
                    OP_CMP:  alu_op_reg <= ALU_CMP;
                    OP_MOV:  alu_op_reg <= ALU_MOV;
                    default: alu_op_reg <= ALU_ADD;
                endcase
            end
        end
    end
    
    always @(*) begin
        case (state)
            S_FETCH:     next_state = S_DECODE;
            S_DECODE:    next_state = S_READ;
            S_READ:      next_state = S_EXECUTE;
            S_EXECUTE:   next_state = S_MEMORY;
            S_MEMORY:    next_state = S_WRITEBACK;
            S_WRITEBACK: next_state = (opcode_reg == OP_HALT) ? S_HALT : S_FETCH;
            S_HALT:      next_state = S_HALT;
            default:     next_state = S_FETCH;
        endcase
    end
    
    always @(*) begin
        pc_write   = 1'b0;
        imem_read  = 1'b0;
        ir_write   = 1'b0;
        reg_write  = 1'b0;
        mem_read   = 1'b0;
        mem_write  = 1'b0;
        mul_en     = 1'b0;
        flag_write = 1'b0;
        halt       = 1'b0;
        alu_op     = ALU_ADD;
        wb_sel     = WB_ALU;

        case (state)
        
            S_FETCH: begin
                imem_read = 1'b1;
                ir_write  = 1'b1;
            end
            
            S_EXECUTE: begin
                case(opcode_reg)
                    OP_ADD: alu_op = ALU_ADD;
                    OP_SUB: alu_op = ALU_SUB;
                    OP_MUL: begin
                        mul_en = 1'b1;
                        wb_sel = WB_MUL;
                    end
                    OP_CMP: begin
                        alu_op     = ALU_CMP;
                        flag_write = 1'b1;
                    end
                    OP_MOV: alu_op = ALU_MOV;
                endcase
            end
            
            S_MEMORY: begin
                case (opcode_reg)
                    OP_LOAD: begin
                        mem_read = 1'b1;
                        wb_sel   = WB_MEM;
                    end
                    OP_STORE: mem_write = 1'b1;
                endcase
            end
            
            S_WRITEBACK: begin
                case (opcode_reg)
                    OP_ADD, OP_SUB: begin
                        reg_write = 1'b1;
                        alu_op    = alu_op_reg;
                        wb_sel    = WB_ALU;
                    end
                    OP_MUL: begin
                        reg_write = 1'b1;
                        wb_sel    = WB_MUL;
                    end
                    OP_MOV: begin
                        reg_write = 1'b1;
                        alu_op    = alu_op_reg;
                        wb_sel    = WB_ALU;
                    end
                    OP_LOAD: begin
                        reg_write = 1'b1;
                        wb_sel    = WB_MEM;
                    end
                    OP_HALT: halt = 1'b1;
                endcase
                if (opcode_reg != OP_HALT)
                    pc_write = 1'b1;
            end
            
            S_HALT: halt = 1'b1;
        endcase
    end
endmodule
