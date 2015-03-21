module is1(Clock, Reset, num20b, yes1);

	input Clock, Reset;
	input [19:0] num20b;
	output reg yes1;
	
	wire PS;
	reg NS;
	
	parameter isNot1 = 0, is1 = 1;
	
	always @ (PS or num20b) begin
		case (PS)
		
			isNot1: if(num20b != 1) NS = isNot1;
					  else NS = is1;
		
			is1: NS = isNot1;
			
			default: NS = 1'bx;
		endcase
	
	end
	
	always @ (PS) begin
		case (PS)
		
			isNot1: yes1 = 0;
		
			is1: yes1 = 1;
			
			default: yes1 = 1'bx;
		endcase
	
	end
	
	D_FF d1 (.q(PS), .d(NS), .reset(Reset), .clk(Clock));
	
endmodule
