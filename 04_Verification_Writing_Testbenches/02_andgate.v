module top_module();
	reg A;
    reg B;
    wire Y;
    andgate dut(.in({B, A}), .out(Y));
    
    initial begin
        {B, A} = 2'b00; #10; 
        {B, A} = 2'b01; #10; 
        {B, A} = 2'b10; #10; 
        {B, A} = 2'b11; #10; 
    end
    
endmodule
