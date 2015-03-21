module scoreKeep(Clock, Reset, OlightOn, lastGlightOn, key, add1, add2, sub2);
	input Clock, Reset;
	input key, OlightOn, lastGlightOn;
	output reg add1, add2, sub2;
	
	wire [1:0] PS;
	reg [1:0] NS;
	
	parameter [1:0] none = 2'b00, plus1 = 2'b01, plus2 = 2'b10, minus2 = 2'b11;
	
	always @ (PS or OlightOn or lastGlightOn or key) begin
		
		case (PS)
			
			none: if (OlightOn & key) NS = plus2;
				   else if (lastGlightOn & key) NS = plus1;
				   else if ((key & ~OlightOn) | (key & ~lastGlightOn)) NS = minus2;
					else NS = none;
			
			plus1: if (OlightOn & key) NS = plus2;
				   else if (lastGlightOn & key) NS = plus1;
				   else if ((key & ~OlightOn) | (key & ~lastGlightOn)) NS = minus2;
					else NS = none;
			
			plus2: if (OlightOn & key) NS = plus2;
				   else if (lastGlightOn & key) NS = plus1;
				   else if ((key & ~OlightOn) | (key & ~lastGlightOn)) NS = minus2;
					else NS = none;
			
			minus2: if (OlightOn & key) NS = plus2;
				   else if (lastGlightOn & key) NS = plus1;
				   else if ((key & ~OlightOn) | (key & ~lastGlightOn)) NS = minus2;
					else NS = none;
			
			default: NS = 2'bx;
		endcase
	end
	
	// Output
	always @ (PS) begin
		case (PS)
			none:  begin
						add1 = 0; add2 = 0; sub2 = 0;
					end
			
			plus1: begin
						add1 = 1; add2 = 0; sub2 = 0;
					end
			
			plus2: begin
						add1 = 0; add2 = 1; sub2 = 0;
					end
			
			minus2: begin
						add1 = 0; add2 = 0; sub2 = 1;
					end
			
			default: begin 
							add1 = 1'bx; add2 = 1'bx; sub2 = 1'bx;
						end
			
		endcase
	end
		
	D_FF D1(.q(PS[0]), .d(NS[0]), .reset(Reset), .clk(Clock));
	D_FF D2(.q(PS[1]), .d(NS[1]), .reset(Reset), .clk(Clock));
	
	/*
	assign add2 = OlightOn & key;
	assign add1 = lastGlightOn & key;
	assign sub2 = (~OlightOn & key) | (~lastGlightOn & key);
	*/
endmodule	
