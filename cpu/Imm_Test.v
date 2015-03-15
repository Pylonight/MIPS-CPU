`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:22:41 03/11/2015
// Design Name:   Immediate_Extend
// Module Name:   F:/ISE/work/cpu/cpu/Imm_Test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Immediate_Extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Imm_Test;

	// Inputs
	reg [2:0] load;
	reg [15:0] data_in;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Immediate_Extend uut (
		.data_out(data_out), 
		.load(load), 
		.data_in(data_in)
	);

	initial begin
		// Initialize Inputs
		load = 0;
		data_in = 16'b1010101010101010;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		load = 1;
		#50;
		load = 2;
		#50;
		load = 3;
		#50;
		load = 4;
		#50;
		load = 5;
		#50;
		load = 6;
		#50;
		
		load = 0;
		data_in = 16'b0101010101010101;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		load = 1;
		#50;
		load = 2;
		#50;
		load = 3;
		#50;
		load = 4;
		#50;
		load = 5;
		#50;
		load = 6;
		#50;

	end
      
endmodule

