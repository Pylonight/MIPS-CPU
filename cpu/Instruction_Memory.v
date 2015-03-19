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
	reg [15 : 0] memory [255 : 0];
	
	initial
	begin
		/*memory[0] = 16'b0110100100001000;
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
		memory[20] = 16'b1000000000000000;*/
		
		memory[0] = 16'h6fbf;
		memory[1] = 16'h37e0;
		memory[2] = 16'h6901;
		memory[3] = 16'h6a01;
		memory[4] = 16'h6c01;
		memory[5] = 16'hdf40;
		memory[6] = 16'hdf80;
		memory[7] = 16'he944;
		memory[8] = 16'hdf40;
		memory[9] = 16'he451;
		memory[10] = 16'hdf80;
		memory[11] = 16'heb42;
		memory[12] = 16'h6101;
		memory[13] = 16'h10f9;
		memory[14] = 16'h6901;
		memory[15] = 16'h6a0f;
		memory[16] = 16'h7c20;
		memory[17] = 16'hea84;
		memory[18] = 16'hdf80;
		memory[19] = 16'h6a03;
		memory[20] = 16'hea87;
		memory[21] = 16'hdf80;
		memory[22] = 16'h6a04;
		memory[23] = 16'hea87;
		memory[24] = 16'hdf80;
		memory[25] = 16'hea87;
		memory[26] = 16'hdf80;
		memory[27] = 16'hea87;
		memory[28] = 16'hdf80;
		memory[29] = 16'h6901;
		memory[30] = 16'h6a0f;
		memory[31] = 16'h7c20;
		memory[32] = 16'hea84;
		memory[33] = 16'hea87;
		memory[34] = 16'h6900;
		memory[35] = 16'h6a04;
		memory[36] = 16'h6b0c;
		memory[37] = 16'h4901;
		memory[38] = 16'h6d0f;
		memory[39] = 16'he9ac;
		memory[40] = 16'hea84;
		memory[41] = 16'hec2d;
		memory[42] = 16'hdf80;
		memory[43] = 16'hea84;
		memory[44] = 16'hec2d;
		memory[45] = 16'hdf80;
		memory[46] = 16'hea84;
		memory[47] = 16'hec2d;
		memory[48] = 16'hdf80;
		memory[49] = 16'hea84;
		memory[50] = 16'hec2d;
		memory[51] = 16'hdf80;
		memory[52] = 16'h4901;
		memory[53] = 16'he9ac;
		memory[54] = 16'heb24;
		memory[55] = 16'hea86;
		memory[56] = 16'hec2d;
		memory[57] = 16'hdf80;
		memory[58] = 16'hea86;
		memory[59] = 16'hec2d;
		memory[60] = 16'hdf80;
		memory[61] = 16'hea86;
		memory[62] = 16'hec2d;
		memory[63] = 16'hdf80;
		memory[64] = 16'hea86;
		memory[65] = 16'hec2d;
		memory[66] = 16'hdf80;
		memory[67] = 16'heb26;
		memory[68] = 16'he96a;
		memory[69] = 16'h61df;
		memory[70] = 16'h8000;
		
		/*memory[0] = 16'b0110111110111111;
		memory[1] = 16'b0011011111100000;
		memory[2] = 16'b0110100101001000;
		memory[3] = 16'b0110101100000000;
		memory[4] = 16'b1101101100100000;
		memory[5] = 16'b0110100101100101;
		memory[6] = 16'b1101101100100001;
		memory[7] = 16'b0110100101101100;
		memory[8] = 16'b1101101100100010;
		memory[9] = 16'b0110100101101100;
		memory[10] = 16'b1101101100100011;
		memory[11] = 16'b0110100101101111;
		memory[12] = 16'b1101101100100100;
		memory[13] = 16'b0110100100101100;
		memory[14] = 16'b1101101100100101;
		memory[15] = 16'b0110100100100000;
		memory[16] = 16'b1101101100100110;
		memory[17] = 16'b0110100101110111;
		memory[18] = 16'b1101101100100111;
		memory[19] = 16'b0110100101101111;
		memory[20] = 16'b1101101100101000;
		memory[21] = 16'b0110100101110010;
		memory[22] = 16'b1101101100101001;
		memory[23] = 16'b0110100101101100;
		memory[24] = 16'b1101101100101010;
		memory[25] = 16'b0110100101100100;
		memory[26] = 16'b1101101100101011;
		memory[27] = 16'b0110100100100001;
		memory[28] = 16'b1101101100101100;
		memory[29] = 16'b0110100100000000;
		memory[30] = 16'b1101101100101101;
		memory[31] = 16'b0110110000000000;
		memory[32] = 16'b0110100100000000;
		memory[33] = 16'b1001100101100000;
		memory[34] = 16'b0010001100000111;
		memory[35] = 16'b0100100100000001;
		memory[36] = 16'b0101101101111011;
		memory[37] = 16'b0110000011111011;
		memory[38] = 16'b0101101101100001;
		memory[39] = 16'b0110000111111001;
		memory[40] = 16'b0100110000000001;
		memory[41] = 16'b0001011111110111;
		memory[42] = 16'b1101111110000000;
		memory[43] = 16'b1000000000000000;*/

	end
	
	//assign data_out = {memory[address], memory[address+1]};	// big-end or little-end?
	assign data_out = memory[address];

endmodule
