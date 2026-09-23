`timescale 1ns/1ns
`include "vector4.v"

module vector4_tb;

reg [7:0] IN;
wire [31:0] OUT;

integer errors = 0;

vector4 dut(IN, OUT);

initial begin
    $dumpfile("vector4_tb.vcd");
    $dumpvars(0, vector4_tb);

    for (integer i = 0; i < 2 ** 3; i++) begin
        IN = i[7:0]; #10;

        if (OUT !== { {24{IN[7]}}, IN}) begin
            errors = errors + 1;
        end
    end

    // Negative Numbers
    IN = 8'b0000_0000; #10;
    for (integer i = 0; i < 2 ** 3; i++) begin
        IN = {1'b1, i[6:0]}; #10;

        if (OUT !== { {24{IN[7]}}, IN}) begin
            errors = errors + 1;
        end
    end

    $display("Test complete. Errors: %0d", errors);
end

endmodule