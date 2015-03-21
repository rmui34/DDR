module Bit3Count(Clock, Reset, num);
	input Clock, Reset;
	output [2:0] num;
	
	wire [2:0] PS;
	reg [2:0] NS;
	
	reg [2:0] n;
	assign num = n;
	
	parameter [2:0] zero = 3'b000, one = 3'b001, two = 3'b010, three = 3'b011, four = 3'b100, five = 3'b101, six = 3'b110, seven = 3'b111;
	
	
	// New State
	always @ (PS) begin
		case (PS)
		
			zero: NS = one;
			
			one: NS = two;
			
			two: NS = three;
			
			three: NS = four;
			
			four: NS = five;
			
			five: NS = six;
			
			six: NS = seven;
			
			seven: NS = zero;
			
			default: NS = 3'bx;
		
		
		endcase
	end
	
	
	// Output
	always @ (PS) begin
		case (PS)
		
			zero: n = zero;
			
			one: n = one;
			
			two: n = two;
			
			three: n = three;
			
			four: n = four;
			
			five: n = five;
			
			six: n = six;
			
			seven: n = seven;
			
			default: n = 3'bx;
		
		
		endcase
	
	end
	
	
	D_FF D1(.q(PS[0]), .d(NS[0]), .reset(Reset), .clk(Clock));
	D_FF D2(.q(PS[1]), .d(NS[1]), .reset(Reset), .clk(Clock));
	D_FF D3(.q(PS[2]), .d(NS[2]), .reset(Reset), .clk(Clock));
	
endmodule
