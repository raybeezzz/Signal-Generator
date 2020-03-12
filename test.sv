module test(input logic clk, reset_n, 
		output logic wave=0);

	logic [9:0] counter;

	always_ff @ (posedge clk, negedge reset_n)
	if (~reset_n) begin
		counter <= 0;
		wave <=0;
	end else begin
		counter <= counter + 1;
		if (counter == 4) begin
			wave <= ~wave;
			counter <= 0;
		end	
	end
endmodule
	
	
