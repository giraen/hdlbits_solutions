module gates4 (
    input [3:0] in,
    output wire [3:0] out_and,
    output wire [3:0] out_or,
    output wire [3:0] out_xor
);

    assign out_and = in[3] & in[2] & in[1] & in[0];
    assign out_or = in[3] | in[2] | in[1] | in[0];
    assign out_xor = in[3] ^ in[2] ^ in[1] ^ in[0];

endmodule