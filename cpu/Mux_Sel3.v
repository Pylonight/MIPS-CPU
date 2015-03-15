`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:19:11 03/11/2015 
// Design Name: 
// Module Name:    Mux_Sel3 
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
module Mux_Sel3(
    output [15 : 0] data_out,
    input [15 : 0] data_in_A,
    input [15 : 0] data_in_B,
    input [15 : 0] data_in_C,
    input [1 : 0] sel
    );

	assign data_out =
		(sel == 0) ? data_in_A :
		(sel == 1) ? data_in_B :
		data_in_C;

endmodule
