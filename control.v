module Control(Reg_Dst,Branch,Branch_Not_Equal,Mem_Read,Mem_to_Reg,ALU_Op,Mem_Write,ALU_Src,Reg_Write,Inst_31_26,Jump,reset);

	output reg  Branch,Branch_Not_Equal,Mem_Read,Mem_Write,ALU_Src,Reg_Write,Jump;
	output reg  [1:0] Mem_to_Reg,Reg_Dst;
	output reg  [2:0] ALU_Op;
	input  wire [5:0] Inst_31_26;
	input  wire reset;

	always@(Inst_31_26 or posedge reset) // if any of instruction opcode changes or postive edge of reset comes
	begin
		if(reset == 1'b1) 
		begin
			Reg_Dst<=2'b00;
			Branch<=1'b0;
			Branch_Not_Equal<=1'b0;
			Jump<=1'b0;
			Mem_Read<=1'b0;
			Mem_to_Reg<=2'b00;
			Mem_Write<=1'b0;
			ALU_Src<=1'b0;
			Reg_Write<=1'b0;
			ALU_Op<=3'b000;

		end
		else
		begin
			case(Inst_31_26)

				6'd0:     //R-Formate
				begin
					Reg_Dst<=2'b01;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b0;
					Reg_Write<=1'b1;
					ALU_Op<=3'b010;

				end
				6'd35:     //lw
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b1;
					Mem_to_Reg<=2'b01;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b000;
				end
				6'd43:  //sw
				begin
					Reg_Dst<=2'bxx;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'bxx;
					Mem_Write<=1'b1;
					ALU_Src<=1'b1;
					Reg_Write<=1'b0;
					ALU_Op<=3'b000;
				end
				6'd8: 	//addi
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b000;
				end
				6'd12:	//andi
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b011;
				end
				6'd13:	//ori
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b100;
				end	
				6'd10:	//stli
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b101;
				end	
				6'd14:	//xori
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b110;
				end	
				6'd5:	//bne
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b1;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b110;
				end
				6'd2:	//jump
				begin
					Reg_Dst<=2'bxx;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b1;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'bxx;
					Mem_Write<=1'b0;
					ALU_Src<=1'bx;
					Reg_Write<=1'b0;
					ALU_Op<=3'bxxx;
				end	
				6'd3:	//jal
				begin
					Reg_Dst<=2'b10;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b1;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b10;
					Mem_Write<=1'b0;
					ALU_Src<=1'bx;
					Reg_Write<=1'b1;
					ALU_Op<=3'bxxx;
				end	
				6'd15:	//lui
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b111;
				end	
			/*	6'd32:	//lb
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b111;
				end
				6'd33:	//lh
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b111;
				end
				6'd40:	//sb
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b111;
				end
				6'd41:	//sh
				begin
					Reg_Dst<=2'b00;
					Branch<=1'b0;
					Branch_Not_Equal<=1'b0;
					Jump<=1'b0;
					Mem_Read<=1'b0;
					Mem_to_Reg<=2'b00;
					Mem_Write<=1'b0;
					ALU_Src<=1'b1;
					Reg_Write<=1'b1;
					ALU_Op<=3'b111;
				end		*/	
		endcase
	end
end
endmodule



module control_bn();
wire Branch,Branch_Not_Equal,Mem_Read,Mem_Write,ALU_Src,Reg_Write,Jump;
wire[1:0]  Reg_Dst,Mem_to_Reg;
wire[2:0] ALU_Op;
reg[5:0] op_code;
reg reset;
Control jimmy(Reg_Dst,Branch,Branch_Not_Equal,Mem_Read,Mem_to_Reg,ALU_Op,Mem_Write,ALU_Src,Reg_Write,op_code,Jump,reset);
initial
begin
$monitor("Reg_Dst:%b, Branch:%b, Branch_Not_Equal:%b, Mem_Read:%b, Mem_to_Reg:%b, Mem_Write:%b, ALU_Src:%b, Reg_Write:%b, Alu_OP:%b, Jump:%b",Reg_Dst,Branch,Branch_Not_Equal,Mem_Read,Mem_to_Reg,Mem_Write,ALU_Src,Reg_Write,ALU_Op,Jump);
reset =1'b0;
#5
op_code = 6'b000000;
#5
op_code = 6'd35;
#5
op_code = 6'd8;
#5
reset = 1'b1;
end
endmodule
