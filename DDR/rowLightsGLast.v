module rowLightsGLast(Reset, is10, key, preLight, pressed, lightOn);
	input Reset;
	input is10;
	input key;
	input preLight;
	
	output reg pressed;
	output reg lightOn;
	
	wire PS;
	reg NS;

	parameter off = 0, on = 1;

	// New-State
	always @ (PS or preLight) begin
		case (PS)
			off: if (preLight) NS = 1;
				  else NS = 0;
			
			on: //NS = 0;
				if (preLight) NS = 1;
				else NS = 0;
			
			default: NS = 1'bx;
		endcase
	end
	
	// Output
	always @ (PS) begin
		case (PS)
			off:  begin
						lightOn = 0;
						pressed = 0;
						//s2 = 0;
					end
			
			on: begin
					lightOn = 1;
					if (key) begin pressed = 1; end
					else begin pressed = 0; end
					end
			
			default: begin 
							lightOn = 1'bx;
							pressed = 1'bx;
						end
			
		endcase
	end
		
	D_FFen D1(.q(PS), .d(NS), .en(is10), .reset(Reset));
	//D_FFen D1(.q(PS), .d(NS), .en(is10), .reset(Reset), .clk(Clock));
	
endmodule
