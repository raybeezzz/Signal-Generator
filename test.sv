module test(input logic clk, reset_n,
		input logic [3:0] freqValue ,
		output logic wave=0);

	logic [20:0] counter;
	logic [20:0] divider;
	logic [3:0] prevFV = 0;
	
	always_ff @ (posedge clk, negedge reset_n)
	if (~reset_n) begin
		counter <= 0;
		wave <=0;
	end else begin
		if (freqValue != prevFV) begin
			prevFV<=freqValue;
			counter <=0;
		end else begin
			counter <= counter + 1;
			if (counter == divider) begin
				wave <= ~wave;
				counter <= 0;
			end	
		end
	end 
	
	always_comb begin
		case (freqValue)
			0 : divider = 24999; // 1 kHz
			1 : divider = 499; // 50 kHz
			2 : divider = 249; // 100 kHz	
			default : divider = 585; // 1 kHz
		endcase
	end 
endmodule

	
	
