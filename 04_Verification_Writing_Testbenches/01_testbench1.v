module top_module ( output reg A, output reg B );//

    // generate input patterns here
    initial begin
        {A, B} = 2'b00; #10;
        {A, B} = 2'b10; #5;
        {A, B} = 2'b11; #5;
        {A, B} = 2'b01; #20;
        {A, B} = 2'b00;
    end

endmodule
