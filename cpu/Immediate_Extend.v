`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:24 03/10/2015 
// Design Name: 
// Module Name:    Immediate_Extend 
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
// load :
// 0. 7:0 s
// 1. 3:0 s
// 2. 10:0 s
// 3. 2:0 t
// 4. 7:0 z
// 5. 4:0 s
// 6. 4:2 t
//////////////////////////////////////////////////////////////////////////////////
module Immediate_Extend(
    output [15 : 0] data_out,
    input [2 : 0] load,
    input [15 : 0] data_in
    );

	assign data_out =
		(load == 0) ? {{8{data_in[7]}}, data_in[7 : 0]} :
		(load == 1) ? {{12{data_in[3]}}, data_in[3 : 0]} :
		(load == 2) ? {{5{data_in[10]}}, data_in[10 : 0]} :
		(load == 3) ? {12'b0, data_in[3 : 0]} :
		(load == 4) ? {8'b0, data_in[7 : 0]} :
		(load == 5) ? {{11{data_in[4]}}, data_in[4 : 0]} :
		{13'b0, data_in[4 : 2]};
		
endmodule
