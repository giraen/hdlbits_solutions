`timescale 1ms/1ms
`include "inverter.v"

module inverter_tb;

reg A;
wire B;

inverter dut(A, B);

initial begin
    $dumpfile("inverter_tb.vcd");
    $dumpvars(0, inverter_tb);
    A=0; #10;
    A=1; #10;
end

endmodule