`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:40:05 03/11/2015
// Design Name:   Control_Unit
// Module Name:   F:/ISE/work/cpu/cpu/Ctrl_Test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Ctrl_Test;

	// Inputs
	reg clk;
	reg [15:0] IR_in;
	reg rst;

	// Outputs
	wire Load_NPC;
	wire Load_PC;
	wire Load_IR;
	wire Load_RegA;
	wire Load_RegB;
	wire Load_Imm;
	wire [3:0] WT_Reg;
	wire [2:0] Extend;
	wire [7:0] Send_Reg;
	wire Load_LMD;
	wire Cond_Kind;
	wire [1:0] Jump_Kind;
	wire Sel_Mux1;
	wire Sel_Mux2;
	wire [1:0] Sel_Mux4;
	wire [4:0] Cal_ALU;
	wire Write;
	wire Load_ALU;
	wire [2:0] state;
	wire [5:0]cur_ins;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.Load_NPC(Load_NPC), 
		.Load_PC(Load_PC), 
		.Load_IR(Load_IR), 
		.Load_RegA(Load_RegA), 
		.Load_RegB(Load_RegB), 
		.Load_Imm(Load_Imm), 
		.WT_Reg(WT_Reg), 
		.Extend(Extend), 
		.Send_Reg(Send_Reg), 
		.Load_LMD(Load_LMD), 
		.Cond_Kind(Cond_Kind), 
		.Jump_Kind(Jump_Kind), 
		.Sel_Mux1(Sel_Mux1), 
		.Sel_Mux2(Sel_Mux2), 
		.Sel_Mux4(Sel_Mux4), 
		.Cal_ALU(Cal_ALU), 
		.Write(Write), 
		.Load_ALU(Load_ALU), 
		.clk(clk), 
		.IR_in(IR_in), 
		.rst(rst),
		.state(state),
		.cur_ins(cur_ins)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		IR_in = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 1;
		IR_in = 16'b0110100100001000;	// LI
		//IR_in = 16'b0010000101010101;	// BEQZ
		//IR_in = 16'b1110000101110001;	// ADDU
		#500;
		IR_in = 16'b0001000110011010;	// B
        
		// Add stimulus here

	end
	
	always begin
		clk = 0;
		#50;
		clk = 1;
		#50;
	end
      
endmodule

