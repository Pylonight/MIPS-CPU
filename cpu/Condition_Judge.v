`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:24:42 03/09/2015 
// Design Name: 
// Module Name:    Condition_Judge 
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
module Condition_Judge(
    output data_out,
	 input kind,
    input [15 : 0] data_in
    );

	assign data_out = (data_in ? 1'b0 : 1'b1)^kind;

endmodule
