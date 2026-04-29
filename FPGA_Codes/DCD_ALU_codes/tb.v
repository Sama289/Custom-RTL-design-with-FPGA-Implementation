module ALU_tb();

    reg signed [3:0] a, b;
    reg  [3:0] sel;
    reg signed [7:0] y_exp;
    wire signed [7:0] y;

    integer done_cont=0,fail_cont=0;
    integer i, j , k;

    reg signed [3:0] const_array [0:3];

    localparam MAXPOS=7, MAXNEG=-8, ALL_ONES=4'b1111 , ALL_ZEROS=4'b0000;


    ALU ALU_DUT( a, b, sel , y );

    initial begin

        const_array[0] = MAXPOS;//7
        const_array[1] = MAXNEG;//-8
        const_array[2] = ALL_ONES;//-1
        const_array[3] = ALL_ZEROS;//0

        for ( k = 0; k < 4; k=k+1) begin
            a = const_array[k];

        for ( j = 0; j < 4; j=j+1) begin
            b = const_array[j];    

    	for ( i = 0; i < 16; i=i+1) begin
    		sel = i;
    		golden_alu(a,b,sel,y_exp);
            #10;
    		check_result(y, y_exp );
    	end
        end
        end

        for ( i = 0; i < 16; i=i+1) begin
            sel = i;
            for ( j = 0; j < 100; j=j+1) begin
                if(i == 7) 
                    begin
                        a = $urandom_range(-8,7);
                        b = $urandom_range(-8,a);
                    end
                else 
                    begin
                        a = $random();
                        b = $random();
                    end
            golden_alu(a,b,sel,y_exp);
            #10;
            check_result(y, y_exp );
        end
        end


    	$stop;
    end



    task check_result (input [7:0] result,result_exp);
    	if(result!==result_exp)begin
    		$display("%t: error for a= %0b and b= %0b, and sel= %0b, y should be %0b 
    			 but it is %0b",$time,a,b,sel,y_exp,y);
    		fail_cont=fail_cont+1;
    	end
    	else done_cont=done_cont+1;
     endtask



    task golden_alu;
    input signed [3:0] a, b;
    input [3:0] sel;
    output signed [7:0] out;
    reg signed [3:0] temp_logic;
    reg signed [7:0] temp_arith;
        begin
            case (sel)
         
                4'b0000: temp_arith = a + 1;
                4'b0001: temp_arith = b + 1;
                4'b0010: temp_arith = a;
                4'b0011: temp_arith = b;
                4'b0100: temp_arith = a - 1;
                4'b0101: temp_arith = a * b;
                4'b0110: temp_arith = a + b;
                4'b0111: temp_arith = a - b;

                
                4'b1000: temp_logic = ~a;         
                4'b1001: temp_logic = ~b;         
                4'b1010: temp_logic = a & b;
                4'b1011: temp_logic = a | b;
                4'b1100: temp_logic = a ^ b;
                4'b1101: temp_logic = ~(a ^ b);
                4'b1110: temp_logic = ~(a & b);
                4'b1111: temp_logic = ~(a | b);

                default: out = 0;
            endcase

            if (sel[3] == 1)
                out = {{4{temp_logic[3]}}, temp_logic}; 
            else
                out = temp_arith;
        end
        

    endtask
endmodule

