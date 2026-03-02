module mux_4to1(
    input [1:0] sel,
    input [3:0] a,b,c,d,
    output reg [3:0] y
);

always @(*) begin
    case (sel)
        2'b00:  y <= a; 
        2'b01:  y <= b; 
        2'b10:  y <= c; 
        2'b11:  y <= d; 
        default: y <= 0; 
    endcase
end
    
endmodule