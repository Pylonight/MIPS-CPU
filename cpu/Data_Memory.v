`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:31 03/09/2015 
// Design Name: 
// Module Name:    Data_Memory 
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
module Data_Memory(
    output [15 : 0] data_out,
    input write,
    input [15 : 0] address,
    input [15 : 0] data_in,
	 output reg [15 : 0] LED_datmem
    );

	//reg [7 : 0] memory [255 : 0];
	reg [15 : 0] memory [255 : 0];
	
	//assign data_out = {memory[address], memory[address+1]};	// big-end or little-end?
	assign data_out = memory[address];
	
	always @(posedge write)
	begin
		//memory[address] <= data_in[15 : 8];
		//memory[address] <= data_in[7 : 0];
		if (address == 16'hBF00)
		begin
			LED_datmem <= data_in;
		end
		else
		begin
			memory[address] <= data_in;
		end
	end

endmodule
