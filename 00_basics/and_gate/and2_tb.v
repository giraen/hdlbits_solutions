`timescale 1ms/1ms
`include "and2.v"

module and2_tb;

reg A;
reg B;
wire Y;

and2 dut(
    A, B,
    Y
);

initial begin
    $dumpfile("and2_tb.vcd");
    $dumpvars(0, and2_tb);
    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;
end

endmodule