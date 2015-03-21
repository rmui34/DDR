module row1LightsG(Reset, is10, num, lightOn);
	input Reset;
	input is10;
	input num;
	
	output reg lightOn;

	wire PS;
	reg NS;
	
	parameter off = 0, on = 1;

	// New-State
	always @ (PS or num) begin
		case (PS)
			off: if (num) NS = 1;
				  else NS = 0;
			
			on: //NS = 0;
				 if (num) NS = 1;
				 else NS = 0;
			
			default: NS = 1'bx;
		endcase
	end
	
	// Output
	always @ (PS) begin
		case (PS)
			off:  begin
						lightOn = 0;
					end
			
			on: begin
						lightOn = 1;
					end
			
			default: begin 
							lightOn = 1'bx;
						end
			
		endcase
	end
		
	//D_FFen D1(.q(PS), .d(NS), .en(is10), .reset(Reset), .clk(Clock));
	D_FFen D1(.q(PS), .d(NS), .en(is10), .reset(Reset));

endmodule

