module arenaEnd(Clock, Reset, preLight, pressedO, pressedG, reachEnd);
	input Clock, Reset;
	input preLight;
	input pressedO, pressedG;
	
	output reg reachEnd;
	
	wire PS;
	reg NS;
	
	parameter noReach = 0, reach = 1;
	
	// New-State
	always @ (PS or preLight) begin
		case (PS)
			noReach: if (preLight) NS = 1;
						else NS = 0;
			
			reach: //if (preLight) NS = 1;
					//else NS = 0;
					NS = 0;
			
			default: NS = 1'bx;
		endcase
	end
	
	// Output
	always @ (PS) begin
		case (PS)
			noReach: begin
							reachEnd = 0;
						end
			
			reach: begin
						reachEnd = 1;
					end
			
			default: begin 
							reachEnd = 1'bx;
						end
			
		endcase
	end
		
	D_FFen D1(.q(PS), .d(NS), .en(is10), .reset(Reset), .clk(Clock));
	
	
endmodule
