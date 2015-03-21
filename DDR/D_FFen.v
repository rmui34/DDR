module D_FFen (q, d, en, reset);
	
	output q;
	input d, en, reset;
	reg q; // Indicate that q is stateholding
	
	always @(posedge en or posedge reset)
	if (reset)
		q = 0; // On reset, set to 0
	else
		q = d; // Otherwise out = d

endmodule
