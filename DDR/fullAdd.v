module fullAdd(a, b, cin, carO, sum1Bit);
	
	input a, b, cin;
	output carO, sum1Bit;
	assign sum1Bit = a ^ b ^ cin; 
	assign carO = (a & cin) | (cin & b) | (b & a);
	
endmodule
