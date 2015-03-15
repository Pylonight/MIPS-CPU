`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:22:14 03/09/2015 
// Design Name: 
// Module Name:    Mux_Sel 
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
module Mux_Sel(
    output [15 : 0] data_out,
    input [15 : 0] data_in_A,
    input [15 : 0] data_in_B,
    input sel
    );

	assign data_out = sel ? data_in_B : data_in_A;

endmodule
