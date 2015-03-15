`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:52 03/09/2015 
// Design Name: 
// Module Name:    Register_Group 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Register_Group(
    output [15 : 0] data_out_A,
    output [15 : 0] data_out_B,
	 input write,
    input [3 : 0] address,
    input [7 : 0] output_AB,
    input [15 : 0] data_in,
	 output [15 : 0] ass_check
    );

	reg [15 : 0] register [15 : 0];	// R0 for zero, R1~R7 are normal reg, R2 for RA, R15 for SP, R14 for T, R13 for IH
	
	initial
	begin
		register[0] = 0;
	end
	
	assign data_out_A = register[output_AB[7 : 4]];
	assign data_out_B = register[output_AB[3 : 0]];
	
	always @(posedge write)	// R0 for zero, so write != 0 means pipeline needs to WB
	begin
		register[address] = data_in;
		register[0] = 0;
	end
	
	assign ass_check = register[1];

endmodule
