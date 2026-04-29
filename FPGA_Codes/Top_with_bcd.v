module Top_with_bcd(
	input clk,
	output[3:0] an,
	output [0:6] seg);
 
	 wire [7:0] result;
		 
		ALU inst_alu (.a(A),
						  .b(B), 
						  .sel(Sel),
						  .y(result)
						  );
						  
		digital_tube_decoder inst_BCD (.clk(clk),
												 .A(result),
												 .sel(Sel[3]),
												 .seg(seg),
												 .an(an)
												 ); 
	wire [3:0] A , B ;
	wire [3:0] Sel;

	assign A = 3;
	assign B = 8;
	assign Sel = 4'b1011;
	
endmodule