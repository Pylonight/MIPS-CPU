`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:28 03/09/2015 
// Design Name: 
// Module Name:    PC_Adder 
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
module PC_Adder(
    output [15 : 0] data_out,
    input [15 : 0] data_in
    );

	assign data_out = data_in+1;

endmodule
