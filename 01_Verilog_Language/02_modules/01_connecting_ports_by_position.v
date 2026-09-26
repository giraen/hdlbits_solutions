module module_pos (
    input a, b, c, d,
    output wire out1,
    output wire out2,
);

    mod_a instance_1 (out1, out2, a,b,c,d);

endmodule