// Raymond Bedry A00950868
// ELEX 7660 - January 21, 2020

module kpdecode ( input logic [3:0] kpc, kpr, //driver for keypad and input signal from FPGA
				input logic clk,
				output logic kphit, //ouptut signal for button press
				output logic [3:0] test); //output signal of the hex freqValueber
				
				logic [3:0] freqValue = 0;
	always_ff @(posedge clk)
	/*always_comb*/ begin
		//freqValue <= 1;
		kphit <= 0;
		if (kpr != 'b1111) begin //all of this works only if a button is pressed	
			kphit <= 1;//set high to enable the control bit
			//kpc is fourth column:
			if (kpr == 'b0111) begin 
				case (kpc)
					'b1110: freqValue <= 2; //d
					'b1101: freqValue <= 0; //c 
					'b1011: freqValue <= 0; //b
					'b0111: freqValue <= 0; //a
					//default: freqValue <= 0;
				endcase
			end
			//kpc is third column:
			else if (kpr == 'b1011) begin 
				case (kpc)
					'b1110: freqValue <= 0; //f
					'b1101: freqValue <= 0; //9
					'b1011: freqValue <= 0; //6
					'b0111: freqValue <= 2; //3 //set to 2 -> 100kHz
					 //default: freqValue = 0;
				endcase
			end
			//kpc is second column:
			else if (kpr == 'b1101) begin 
				case (kpc)
					'b1110: freqValue <= 0; //0
					'b1101: freqValue <= 0; //8
					'b1011: freqValue <= 0; //5
					'b0111: freqValue <= 1;//2 //set to 1 -> 50 kHz
					 //default: freqValue = 0;
				endcase
			end
			//kpc is first column: 
			else if (kpr == 'b1110) begin
				case (kpc)
					'b1110: freqValue <= 2; //e
					'b1101: freqValue <= 2; //7
					'b1011: freqValue <= 2; //4
					'b0111: freqValue <= 0; //1 //set to 0 -> 1kHz
					 //default: freqValue = 0;
				endcase
			end
			test <=freqValue;				
								
		end
		
	end
endmodule
