// Raymond Bedry A00950868
// ELEX 7660 - January 21, 2020

module colseq (input logic [3:0] kpr, //input signals connected to FPGA
				input logic clk, reset_n, //active low reset input and clock
				output logic [3:0] kpc); //drives kepad columns in succession
	logic [3:0] forward; //variable to transition states
	
	//pause on current state or increment forward:
	always_comb begin
		if(kpr != 15) 
			forward = kpc;
		else 
			forward = (kpc << (4-1)) | (kpc >> 1); //shift bits
	end
		
	//assign next state to current state:
	always_ff @ (posedge clk, negedge reset_n) begin
		if (~reset_n)
			kpc <= 'b0111; //set to 'b0001 when reset pressed
		else
			kpc <= forward; //otherwise transition forward to next state
	end
endmodule 

	
			
			