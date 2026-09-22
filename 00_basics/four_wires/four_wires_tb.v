`timescale 1ms/1ms
`include "four_wires.v"

module four_wires_tb;

reg A;
reg B;
reg C;
wire W;
wire X;
wire Y;
wire Z;

four_wires dut(
    A, B, C,
    W, X, Y, Z
);

initial begin
    $dumpfile("four_wires_tb.vcd");
    $dumpvars(0, four_wires_tb);
    A=0; B=0; C=0; #10;
    A=0; B=0; C=1; #10;
    A=0; B=1; C=0; #10;
    A=0; B=1; C=1; #10;
    A=1; B=0; C=0; #10;
    A=1; B=0; C=1; #10;
    A=1; B=1; C=0; #10;
    A=1; B=1; C=1; #10;
end

endmodule