module arith_unit (a,b,op_code,out_arith);
	input signed  [3:0] a,b;
	input  wire [2:0] op_code;
	output reg signed [7:0] out_arith;

	always @(*) begin
		case(op_code)
			0: out_arith = {{4{a[3]}},a} + 1 ;

			1: out_arith = {{4{b[3]}},b} + 1 ;

			2: out_arith = {{4{a[3]}},a} ;

			3: out_arith = {{4{b[3]}},b} ;

			4: out_arith = {{4{a[3]}},a} - 1 ;

			5: out_arith = a * b ;

			6: out_arith = {{4{a[3]}},a} + {{4{b[3]}},b};

			7: out_arith = {{4{a[3]}},a} - {{4{b[3]}},b};

			default: out_arith = 0;


		endcase
	end

endmodule