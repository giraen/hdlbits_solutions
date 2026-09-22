`timescale 1ns/1ps
`include "7458.v"

module ic_7458_tb;

// Use this instead of typing P1x manually
reg [5:0] P1_in;
reg [3:0] P2_in;

wire P1Y;
wire P2Y;

integer errors = 0;

// Then call them here as arrays
ic_7458 dut(
    P1_in[5], P1_in[4], P1_in[3], P1_in[2], P1_in[1], P1_in[0],
    P2_in[3], P2_in[2], P2_in[1], P2_in[0],
    P1Y, P2Y
);

initial begin
    $dumpfile("7458_tb.vcd");
    $dumpvars(0, ic_7458_tb);

    // Make all inputs to LOW first
    P1_in = 6'b00_0000;
    P2_in = 4'b0000;

    for (integer i = 0; i < 64; i++) begin
        P1_in = i[5:0]; #10;

        if (P1Y !== ((P1_in[5] & P1_in[4] & P1_in[3]) | (P1_in[2] & P1_in[1] & P1_in[0])))
            errors = errors + 1; 
    end
    P1_in = 6'b00_0000;


    for (integer i = 0; i < 16; i++) begin
        P2_in = i[3:0]; #10;

        if (P2Y !== ((P2_in[3] & P2_in[2]) | (P2_in[1] & P2_in[0])))
            errors = errors + 1; 
    end
    P2_in = 4'b0000;

    if (errors === 0)
        $display("Test complete. No errors");
    else
        $display("Test complete. Errors found");
        $display("Errors: %0d", errors);
end

endmodule