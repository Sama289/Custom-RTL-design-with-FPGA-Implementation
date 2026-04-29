module arith_unit (a,b,op_code,out_arith);
	input signed  [3:0] a,b;
	input  wire [2:0] op_code;
	output reg signed [7:0] out_arith;

	always @(*) begin
		case(op_code)
			0: out_arith = a + 1 ;//Increment a 

			1: out_arith = b + 1 ;//Increment b 

			2: out_arith = a ;//Transfer a 

			3: out_arith = b ;//Transfer b 

			4: out_arith = a - 1 ;//Decrement a 

			5: out_arith = a * b ;//Multiply a and b 

			6: out_arith = a + b;//Add a and b 

			7: out_arith = a - b;//Subtract a and b 

			default: out_arith = 0;//default value of the output 
		endcase
	end
endmodule