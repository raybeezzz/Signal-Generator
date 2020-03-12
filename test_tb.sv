module test_tb();
logic clk, reset_n;
logic wave;
logic [3:0] freqValue = 0;

test dut_0 (.*);

initial begin
	reset_n = 0;
	clk = 0;
	repeat(2) @(posedge clk);

	reset_n = 1;
	
	repeat(2000) @(posedge clk);
	freqValue = 1;
	repeat(2000) @(posedge clk);
	freqValue = 2;
	repeat(2000) @(posedge clk);
    
 	$stop ;
end
	
   // 20 Hz clock
   always
     #25ms clk = ~clk ;
endmodule
