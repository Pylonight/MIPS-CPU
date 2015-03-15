`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:10:31 03/11/2015
// Design Name:   Condition_Judge
// Module Name:   F:/ISE/work/cpu/cpu/Judge_Test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Condition_Judge
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Judge_Test;

	// Inputs
	reg kind;
	reg [15:0] data_in;

	// Outputs
	wire data_out;

	// Instantiate the Unit Under Test (UUT)
	Condition_Judge uut (
		.data_out(data_out), 
		.kind(kind), 
		.data_in(data_in)
	);

	initial begin
		// Initialize Inputs
		kind = 0;
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		data_in = 1;
		#100;
		kind = 1;
		data_in = 0;
		#100;
		kind = 1;
		data_in = 1;
		#100;

	end
      
endmodule

