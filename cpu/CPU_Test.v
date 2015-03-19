`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:55:37 03/13/2015
// Design Name:   CPU_MIPS
// Module Name:   F:/ISE/work/cpu/cpu/CPU_Test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU_MIPS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_Test;

	// Inputs
	reg clk;
	reg clk_click;
	reg rst;

	// Outputs
	wire [15:0] PC_out;
	wire [15:0] IR_out;
	wire [15:0] b16_out;
	wire [15:0] LED_datmem;
	wire [7:0] LED_out;
	wire [5:0] LED_ctrl;
	wire [2:0] state;
	wire [5:0] cur_ins;
	
	/*wire [15:0] test;
	wire [15:0] test1;
	wire [15:0] test2;
	wire [15:0] test3;
	wire [15:0] test4;*/

	// Instantiate the Unit Under Test (UUT)
	CPU_MIPS uut (
		.PC_out(PC_out), 
		.IR_out(IR_out), 
		.b16_out(b16_out), 
		.LED_datmem(LED_datmem), 
		.LED_out(LED_out),
		.LED_ctrl(LED_ctrl),
		.clk(clk), 
		.clk_click(clk_click),
		.rst(rst), 
		.real_clk(real_clk),
		.state(state), 
		.cur_ins(cur_ins)
		/*.test(test),
		.test1(test1),
		.test2(test2),
		.test3(test3),
		.test4(test4)*/
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 1;
        
		// Add stimulus here

	end
	
	always begin
		clk = 0;
		#1;
		clk = 1;
		#1;
	end
      
endmodule

