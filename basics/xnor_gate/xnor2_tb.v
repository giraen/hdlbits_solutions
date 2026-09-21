`timescale 1ms/1ms
`include "xnor2.v"

module xnor2_tb;

reg A;
reg B;
wire Y;

xnor2 dut(A, B, Y);

initial begin
    $dumpfile("xnor2_tb.vcd");
    $dumpvars(0, xnor2_tb);

    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;
end

endmodule