`timescale 1ns/1ns
`include "vector5.v"

module vector5_tb;

reg A;
reg B;
reg C;
reg D;
reg E;
wire [24:0] OUT;

integer errors = 0;

vector5 dut(A, B, C, D, E, OUT);

initial begin
    $dumpfile("vector5_tb.vcd");
    $dumpvars(0, vector5_tb);

    for (integer i = 0; i < 2 ** 5; i++) begin
        {A, B, C, D, E} = i[4:0]; #10;

        if (OUT !== {{{5{~A}}, {5{~B}}, {5{~C}}, {5{~D}}, {5{~E}}} ^ {5{A, B, C, D, E}}}) begin
            errors = errors + 1;
        end
    end

    $display("Test complete. Errors: %0d", errors);
end

endmodule