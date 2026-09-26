module module_shift (
    input clk,
    input d,
    output q
);

    wire q0;
    wire q1;
    wire q2;

    my_dff dff_1(.clk(clk), .d(d), .q(q0));
    my_dff dff_1(.clk(clk), .d(q0), .q(q1));
    my_dff dff_2(.clk(clk), .d(q1), .q(q2));
    
    assign q = q2;

endmodule