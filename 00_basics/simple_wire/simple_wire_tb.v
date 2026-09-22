`timescale 1ns/1ns
`include "simple_wire.v"

module simple_wire_tb;

reg A;
wire B;

simple_wire dut(A, B);

initial begin
    $dumpfile("simple_wire_tb.vcd");
    $dumpvars(0, simple_wire_tb);

    A = 0; #10;
    A = 1; #10;
end

endmodule
