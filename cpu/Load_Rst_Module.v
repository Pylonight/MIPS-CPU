`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:47 03/09/2015 
// Design Name: 
// Module Name:    Load_Rst_Module 
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
//
// For :
// 1. Program_Counter
// 2. Next_Program_Counter
// 3. Instruction_Register
// 4. Register_A
// 5. Register_B
// 6. Immediate_Number
// 7. ALU_Output
// 8. Loaded_Memory_Data
//////////////////////////////////////////////////////////////////////////////////
module Load_Rst_Module(
    output reg [15 : 0] data_out,
    input load,
    input [15 : 0] data_in,
    input rst
    );
	
	always @(posedge load or negedge rst)
	begin
		if (rst == 0)
		begin
			data_out <= 0;
		end
		else if (load)
		begin
			data_out <= data_in;
		end
	end

endmodule
