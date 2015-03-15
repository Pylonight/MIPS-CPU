`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:26:27 03/09/2015 
// Design Name: 
// Module Name:    Condition 
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
module Condition(
    output data_out,
	 input [1 : 0] kind,
    input data_in
    );

	assign data_out = kind[1]&(kind[0]|data_in);

endmodule
