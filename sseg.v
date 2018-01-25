`timescale 1ns / 1ps

module sseg(
	input wire[4:0] digit,
	input wire[2:0] digit_pos,

	output reg[7:0] digit_segs,
	output reg[5:0] position
);

always @* begin
	case (digit[3:0])
		4'd0: digit_segs <= {~digit[4], 7'b0000000};
		4'd1: digit_segs <= {~digit[4], 7'b1111001};
		4'd2: digit_segs <= {~digit[4], 7'b0100100};
		4'd3: digit_segs <= {~digit[4], 7'b0110000};
		4'd4: digit_segs <= {~digit[4], 7'b0011001};
		4'd5: digit_segs <= {~digit[4], 7'b0010010};
		4'd6: digit_segs <= {~digit[4], 7'b0000010};
		4'd7: digit_segs <= {~digit[4], 7'b1111000};
		4'd8: digit_segs <= {~digit[4], 7'b0000000};
		4'd9: digit_segs <= {~digit[4], 7'b0010000};
	endcase

	case (digit_pos)
		3'd0: position <= 6'b011111;
		3'd1: position <= 6'b101111;
		3'd2: position <= 6'b110111;
		3'd3: position <= 6'b111011;
		3'd4: position <= 6'b111101;
		3'd5: position <= 6'b111110;
	endcase
end

endmodule
