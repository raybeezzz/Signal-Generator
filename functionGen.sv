module functionGen (
			output logic [3:0] kpc, // column select, active-low
			(* altera_attribute = "-name WEAK_PULL_UP_RESISTOR ON" *)
			input logic  [3:0] kpr,// rows, active-low w/ pull-ups
			input logic FPGA_CLK1_50,
			input logic reset_n,
			output logic wave,
			output logic clk
				) ;
  
 
	logic [3:0] displayNum;	// number to display on 7-seg
	logic [3:0] kpFreqVal; // keypad output
	logic kphit;             // keypad button press indicator


 
	// Instantiation of the modules
	test test_0 (.clk(FPGA_CLK1_50), .reset_n, .freqValue(kpFreqVal), .wave);
	kpdecode kpdecode_0 (.test(kpFreqVal), .kphit, .kpr, .kpc, .clk(FPGA_CLK1_50)) ;
	colseq  colseq_0  (.kpc, .kpr, .reset_n, .clk(FPGA_CLK1_50)) ;
	
endmodule
