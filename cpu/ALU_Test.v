`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:46:03 03/11/2015
// Design Name:   Arithmetic_Logic_Unit
// Module Name:   F:/ISE/work/cpu/cpu/ALU_Test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Arithmetic_Logic_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Test;

	// Inputs
	reg [4:0] ctrl;
	reg [15:0] data_in_A;
	reg [15:0] data_in_B;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Arithmetic_Logic_Unit uut (
		.data_out(data_out), 
		.ctrl(ctrl), 
		.data_in_A(data_in_A), 
		.data_in_B(data_in_B)
	);

	initial begin
		// Initialize Inputs
		ctrl = 0;
		data_in_A = 2;
		data_in_B = 8;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		ctrl = 1;
		#50;
		ctrl = 2;
		#50;
		ctrl = 3;
		#50;
		ctrl = 4;
		#50;
		ctrl = 5;
		#50;
		ctrl = 6;
		#50;
		ctrl = 7;
		#50;
		ctrl = 8;
		#50;
		ctrl = 9;
		#50;
		ctrl = 10;
		#50;
		ctrl = 11;
		#50;
		ctrl = 12;
		#50;
		ctrl = 13;
		#50;
		ctrl = 14;
		#50;
		ctrl = 15;
		#50;
		ctrl = 16;
		#50;
	end
      
endmodule

