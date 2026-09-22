`timescale 1ms/1ms
`include "nor2.v"

module nor2_tb;

reg A;
reg B;
wire Y;

nor2 dut(A, B, Y);

initial begin
    $dumpfile("nor2_tb.vcd");
    $dumpvars(0, nor2_tb);
    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;
end

endmodule