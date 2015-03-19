`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:54 03/12/2015 
// Design Name: 
// Module Name:    CPU_MIPS 
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
module CPU_MIPS(
    output [15 : 0] PC_out,
    //output [15 : 0] IR_out,
	 output [7 : 0] LED_out,
	 output [5 : 0] LED_ctrl,
	 input clk,
    input clk_click,
	 input rst,
	 output real_clk
	 //input ans_switch
	 //output [2 : 0] state,
	 //output [5 : 0] cur_ins
	 /*output [15 : 0] test,
	 output [15 : 0] test1,
	 output [15 : 0] test2,
	 output [15 : 0] test3,
	 output [15 : 0] test4*/
    );

	assign PC_out = PC;
	//assign IR_out = IR;
	/*assign test = ALUOut;
	assign test1 = ALUReg;
	assign test2 = Mux3Out;
	assign test3 = Cond_Kind;
	assign test4 = Jump_Kind;*/
	
	wire [2 : 0] state;
	wire [5 : 0] cur_ins;
	reg [3 : 0] LED_content;
	
	reg real_clk;	// eliminate the shaking hands
	reg [26 : 0] second_timer;
	
	always @(posedge clk or negedge rst)
	begin
		if (rst == 0)
		begin
			second_timer = 0;
		end
		else
		begin
			second_timer = second_timer+1;
			if (second_timer >= 10000000)
			begin
				second_timer = 0;
			end
			if (second_timer < 5000000)
			begin
				real_clk = 1'b1;
			end
			else
			begin
				real_clk = 1'b0;
			end
		end
	end
	
	// simulate-use
//	always @(posedge clk or negedge rst)
//	begin
//		if (rst == 0)
//		begin
//			second_timer = 0;
//		end
//		else
//		begin
//			second_timer = second_timer+1;
//			if (second_timer >= 100)
//			begin
//				second_timer = 0;
//			end
//			if (second_timer < 50)
//			begin
//				real_clk = 1'b1;
//			end
//			else
//			begin
//				real_clk = 1'b0;
//			end
//		end
//	end
	
	/*always @(posedge clk_click or negedge rst)
	begin
		if (rst == 0)
		begin
			real_clk = 0;
		end
		else
		begin
			if (real_clk != 1)
			begin
				real_clk = 1;
				#500;
				real_clk = 0;
			end
		end
	end*/
	
	wire [15 : 0] LED_datmem;

	wire Cond;
	wire Judge;
	wire [15 : 0] PC;
	wire [15 : 0] NPC;
	wire [15 : 0] IR;
	wire [15 : 0] RegA;
	wire [15 : 0] RegB;
	wire [15 : 0] Imm;
	wire [15 : 0] ALUOut;
	wire [15 : 0] LMD;
	wire [15 : 0] Mux1Out;
	wire [15 : 0] Mux2Out;
	wire [15 : 0] Mux3Out;
	wire [15 : 0] Mux4Out;
	wire [15 : 0] InsMem;
	wire [15 : 0] DatMem;
	wire [15 : 0] ALUReg;
	wire [15 : 0] AdderOut;
	wire [15 : 0] RegOutA;
	wire [15 : 0] RegOutB;
	wire [15 : 0] ImmExt;
	
	wire Load_NPC;
	wire Load_PC;
	wire Load_IR;
	wire Load_RegA;
	wire Load_RegB;
	wire Load_Imm;
	wire WT_Reg;
	wire [3 : 0] Addr_Reg;
	wire [2 : 0] Extend;
	wire [7 : 0] Send_Reg;
	wire Load_LMD;
	wire Cond_Kind;
	wire [1 : 0] Jump_Kind;
	wire Sel_Mux1;
	wire Sel_Mux2;
	wire [1 : 0] Sel_Mux4;
	wire [4 : 0] Cal_ALU;
	wire Write;
	wire Load_ALU;
	
	Anvyl_DISP
		Anvyl7Segment(LED_out, LED_ctrl, clk, rst, {PC[7 : 4], PC[3 : 0], LED_datmem});
	
	Load_Rst_Module
		PC_Unit(PC,	Load_PC, Mux3Out, rst),
		IR_Unit(IR, Load_IR, InsMem, rst),
		NPC_Unit(NPC, Load_NPC, AdderOut, rst),
		RegA_Unit(RegA, Load_RegA, RegOutA, rst),
		RegB_Unit(RegB, Load_RegB, RegOutB, rst),
		Imm_Unit(Imm, Load_Imm, ImmExt, rst),
		ALUOut_Unit(ALUReg, Load_ALU, ALUOut, rst),
		LMD_Unit(LMD, Load_LMD, DatMem, rst);
		
	PC_Adder
		Adder_Unit(AdderOut, PC);
		
	Instruction_Memory
		InsMem_Unit(InsMem, PC);
	
	Register_Group
		Reg_Gp_Unit(RegOutA, RegOutB, WT_Reg, Addr_Reg, Send_Reg, Mux4Out);
		
	Immediate_Extend
		ImmExt_Unit(ImmExt, Extend, IR);
		
	Mux_Sel
		Mux1(Mux1Out, RegA, NPC, Sel_Mux1),
		Mux2(Mux2Out, RegB, Imm, Sel_Mux2),
		Mux3(Mux3Out, NPC, ALUReg, Cond);
		
	Arithmetic_Logic_Unit
		ALU_Unit(ALUOut, Cal_ALU, Mux1Out, Mux2Out);
		
	Condition_Judge
		Jdg_Unit(Judge, Cond_Kind, RegA);
		
	Condition
		Cond_Unit(Cond, Jump_Kind, Judge);
		
	Mux_Sel3
		Mux4(Mux4Out, ALUReg, LMD, NPC, Sel_Mux4);
		
	Data_Memory
		DatMem_Unit(DatMem, Write, ALUReg, RegB, LED_datmem);
		
	Control_Unit
		Ctrl_Unit(Load_NPC, Load_PC, Load_IR, Load_RegA, Load_RegB, Load_Imm, WT_Reg, Addr_Reg, Extend, Send_Reg, Load_LMD, Cond_Kind, Jump_Kind,
						Sel_Mux1, Sel_Mux2, Sel_Mux4, Cal_ALU, Write, Load_ALU, real_clk, IR, rst, state, cur_ins);

endmodule
