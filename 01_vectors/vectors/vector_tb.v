`timescale 1ns/1ps
`include "vector.v"

module vector_tb;

reg [2:0] A;
wire [2:0] OUT;

vector0 dut(A, OUT, OUT[2], OUT[1], OUT[0]);

initial begin
    $dumpfile("vector_tb.vcd");
    $dumpvars(0, vector_tb);

    A = 3'b000; #10;
    for (integer i = 0; i < 8; i++) begin
        A = i[2:0]; #10;
    end
    A = 3'b000; #10;
end

endmodule