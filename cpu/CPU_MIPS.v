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
    //output [15 : 0] PC_out,
    //output [15 : 0] IR_out,
	 //output [15 : 0] b16_out,
	 output [7 : 0] LED_out_rev,
	 output [5 : 0] LED_ctrl_rev,
	 input clk,
    input clk_timer,
	 input rst
	 //input ans_switch
	 /*output [2 : 0] state,
	 output [5 : 0] cur_ins,
	 output [15 : 0] test,
	 output [15 : 0] test1,
	 output [15 : 0] test2,
	 output [15 : 0] test3,
	 output [15 : 0] test4*/
    );
	
	reg [19 : 0] timer;
	reg [7 : 0] LED_out;
	reg [5 : 0] LED_ctrl;
	wire [15 : 0] b16_out;
	wire [15 : 0] state;
	wire [15 : 0] cur_ins;
	assign LED_out_rev = ~LED_out;
	assign LED_ctrl_rev = ~LED_ctrl;
	
	// 7-segment
	always @(posedge clk_timer)
	begin
		timer = timer+1;
		if (timer == 75000)
		begin
			timer = 0;
		end
		if (timer < 12500)
		begin
			LED_ctrl = 6'b011111;
			case (PC[7 : 4])
				4'b0000:	LED_out = 8'b00000011;
				4'b0001:	LED_out = 8'b10011111;
				4'b0010:	LED_out = 8'b00100101;
				4'b0011:	LED_out = 8'b00001101;
				4'b0100:	LED_out = 8'b10011001;
				4'b0101:	LED_out = 8'b01001001;
				4'b0110:	LED_out = 8'b01000001;
				4'b0111:	LED_out = 8'b00011111;
				4'b1000:	LED_out = 8'b00000001;
				4'b1001:	LED_out = 8'b00001001;
				4'b1010:	LED_out = 8'b00010001;
				4'b1011:	LED_out = 8'b11000001;
				4'b1100:	LED_out = 8'b01100011;
				4'b1101:	LED_out = 8'b10000101;
				4'b1110:	LED_out = 8'b01100001;
				4'b1111:	LED_out = 8'b01110001;
			endcase
		end
		else if (timer < 25000)
		begin
			LED_ctrl = 6'b101111;
			case (PC[3 : 0])
				4'b0000:	LED_out = 8'b00000011;
				4'b0001:	LED_out = 8'b10011111;
				4'b0010:	LED_out = 8'b00100101;
				4'b0011:	LED_out = 8'b00001101;
				4'b0100:	LED_out = 8'b10011001;
				4'b0101:	LED_out = 8'b01001001;
				4'b0110:	LED_out = 8'b01000001;
				4'b0111:	LED_out = 8'b00011111;
				4'b1000:	LED_out = 8'b00000001;
				4'b1001:	LED_out = 8'b00001001;
				4'b1010:	LED_out = 8'b00010001;
				4'b1011:	LED_out = 8'b11000001;
				4'b1100:	LED_out = 8'b01100011;
				4'b1101:	LED_out = 8'b10000101;
				4'b1110:	LED_out = 8'b01100001;
				4'b1111:	LED_out = 8'b01110001;
			endcase
		end
		else if (timer < 37500)
		begin
			LED_ctrl = 6'b110111;
			case (b16_out[15 : 12])
				4'b0000:	LED_out = 8'b00000011;
				4'b0001:	LED_out = 8'b10011111;
				4'b0010:	LED_out = 8'b00100101;
				4'b0011:	LED_out = 8'b00001101;
				4'b0100:	LED_out = 8'b10011001;
				4'b0101:	LED_out = 8'b01001001;
				4'b0110:	LED_out = 8'b01000001;
				4'b0111:	LED_out = 8'b00011111;
				4'b1000:	LED_out = 8'b00000001;
				4'b1001:	LED_out = 8'b00001001;
				4'b1010:	LED_out = 8'b00010001;
				4'b1011:	LED_out = 8'b11000001;
				4'b1100:	LED_out = 8'b01100011;
				4'b1101:	LED_out = 8'b10000101;
				4'b1110:	LED_out = 8'b01100001;
				4'b1111:	LED_out = 8'b01110001;
			endcase
		end
		else if (timer < 50000)
		begin
			LED_ctrl = 6'b111011;
			case (b16_out[11 : 8])
				4'b0000:	LED_out = 8'b00000011;
				4'b0001:	LED_out = 8'b10011111;
				4'b0010:	LED_out = 8'b00100101;
				4'b0011:	LED_out = 8'b00001101;
				4'b0100:	LED_out = 8'b10011001;
				4'b0101:	LED_out = 8'b01001001;
				4'b0110:	LED_out = 8'b01000001;
				4'b0111:	LED_out = 8'b00011111;
				4'b1000:	LED_out = 8'b00000001;
				4'b1001:	LED_out = 8'b00001001;
				4'b1010:	LED_out = 8'b00010001;
				4'b1011:	LED_out = 8'b11000001;
				4'b1100:	LED_out = 8'b01100011;
				4'b1101:	LED_out = 8'b10000101;
				4'b1110:	LED_out = 8'b01100001;
				4'b1111:	LED_out = 8'b01110001;
			endcase
		end
		else if (timer < 62500)
		begin
			LED_ctrl = 6'b111101;
			case (b16_out[7 : 4])
				4'b0000:	LED_out = 8'b00000011;
				4'b0001:	LED_out = 8'b10011111;
				4'b0010:	LED_out = 8'b00100101;
				4'b0011:	LED_out = 8'b00001101;
				4'b0100:	LED_out = 8'b10011001;
				4'b0101:	LED_out = 8'b01001001;
				4'b0110:	LED_out = 8'b01000001;
				4'b0111:	LED_out = 8'b00011111;
				4'b1000:	LED_out = 8'b00000001;
				4'b1001:	LED_out = 8'b00001001;
				4'b1010:	LED_out = 8'b00010001;
				4'b1011:	LED_out = 8'b11000001;
				4'b1100:	LED_out = 8'b01100011;
				4'b1101:	LED_out = 8'b10000101;
				4'b1110:	LED_out = 8'b01100001;
				4'b1111:	LED_out = 8'b01110001;
			endcase
		end
		else
		begin
			LED_ctrl = 6'b111110;
			case (b16_out[3 : 0])
				4'b0000:	LED_out = 8'b00000011;
				4'b0001:	LED_out = 8'b10011111;
				4'b0010:	LED_out = 8'b00100101;
				4'b0011:	LED_out = 8'b00001101;
				4'b0100:	LED_out = 8'b10011001;
				4'b0101:	LED_out = 8'b01001001;
				4'b0110:	LED_out = 8'b01000001;
				4'b0111:	LED_out = 8'b00011111;
				4'b1000:	LED_out = 8'b00000001;
				4'b1001:	LED_out = 8'b00001001;
				4'b1010:	LED_out = 8'b00010001;
				4'b1011:	LED_out = 8'b11000001;
				4'b1100:	LED_out = 8'b01100011;
				4'b1101:	LED_out = 8'b10000101;
				4'b1110:	LED_out = 8'b01100001;
				4'b1111:	LED_out = 8'b01110001;
			endcase
		end
	end

	//assign PC_out = PC;
	//assign IR_out = IR;
	/*assign test = ALUOut;
	assign test1 = ALUReg;
	assign test2 = Mux3Out;
	assign test3 = Cond_Kind;
	assign test4 = Jump_Kind;*/

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
		Reg_Gp_Unit(RegOutA, RegOutB, WT_Reg, Addr_Reg, Send_Reg, Mux4Out, b16_out);
		
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
		DatMem_Unit(DatMem, Write, ALUReg, RegB);
		
	Control_Unit
		Ctrl_Unit(Load_NPC, Load_PC, Load_IR, Load_RegA, Load_RegB, Load_Imm, WT_Reg, Addr_Reg, Extend, Send_Reg, Load_LMD, Cond_Kind, Jump_Kind,
						Sel_Mux1, Sel_Mux2, Sel_Mux4, Cal_ALU, Write, Load_ALU, clk, IR, rst, state, cur_ins);

endmodule
