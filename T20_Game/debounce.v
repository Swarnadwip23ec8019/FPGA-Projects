module debounce (
    input clk_10hz,button,
    output debounced_button
);

    wire q1,q2,q2_bar;

    D_FF d1(clk_10hz,button,q1);
    D_FF d2(clk_10hz,q1,q2);

    assign q2_bar = ~q2;

    assign debounced_button = q1 & q2_bar;
    
endmodule