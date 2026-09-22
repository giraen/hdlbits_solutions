module clg (
    input a, b, c, d,
    output out, out_n
);

wire and2_1 = a & b;
wire and2_2 = c & d;
assign out = and2_1 | and2_2;
assign out_n = ~(out);

endmodule