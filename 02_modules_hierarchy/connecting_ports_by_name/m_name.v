// TODO: Implement mod_a based on the output waveform

module m_name (
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    mod_a inst_1(
        .in1(a),
        .in2(b),
        .in3(c),
        .in4(d),
        .out1(out1),
        .out2(out2),
    );

endmodule