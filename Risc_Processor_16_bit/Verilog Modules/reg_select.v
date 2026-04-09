module reg_select(
    input [7:0] reg0,reg1,reg2,reg3,reg4,reg5,reg6,reg7,
    input [2:0] SW,
    output [7:0] LED
    );
    
    reg [7:0] LED_reg;
    always @(*) begin
        case (SW)
            3'd0: LED_reg = reg0;
            3'd1: LED_reg = reg1;
            3'd2: LED_reg = reg2;
            3'd3: LED_reg = reg3;
            3'd4: LED_reg = reg4;
            3'd5: LED_reg = reg5;
            3'd6: LED_reg = reg6;
            3'd7: LED_reg = reg7;
        endcase
    end
    assign LED = LED_reg; 
endmodule
