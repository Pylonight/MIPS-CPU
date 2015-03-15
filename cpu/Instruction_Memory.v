`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:04 03/09/2015 
// Design Name: 
// Module Name:    Instruction_Memory 
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
module Instruction_Memory(
    output [15 : 0] data_out,
    input [15 : 0] address
    );

	//reg [7 : 0] memory [255 : 0];
	reg [15 : 0] memory[255 : 0];
	
	initial
	begin
		memory[0] = 16'b0110100100001000;
		memory[1] = 16'b0110101100000100;
		memory[2] = 16'b0100100100000001;
		memory[3] = 16'b1110000101100111;
		memory[4] = 16'b1101100101100001;
		memory[5] = 16'b1001101100100010;
		memory[6] = 16'b0010100100000001;
		memory[7] = 16'b1110100000000000;
		memory[8] = 16'b0110110000001011;
		memory[9] = 16'b1111010000000001;
		memory[10] = 16'b1111000100000000;
		memory[11] = 16'b0111100100000000;
		memory[12] = 16'b1110100110001101;
		memory[13] = 16'b0000100000000000;
		memory[14] = 16'b1110100101000000;
		memory[15] = 16'b0111000100001111;
		memory[16] = 16'b0110000111111111;
		memory[17] = 16'b1110100101101100;
		memory[18] = 16'b0011000100100110;
		memory[19] = 16'b1110101100100100;
		memory[20] = 16'b1000000000000000;
	end
	
	//assign data_out = {memory[address], memory[address+1]};	// big-end or little-end?
	assign data_out = memory[address];

endmodule
