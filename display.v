module display(
	input wire[4:0] digit,
	input wire latch,
	input wire clk,

	output reg[2:0] digit_pos,
	output reg[4:0] digit_cur
);

reg[4:0] shift_reg[5:0];

always @ (negedge latch) begin
	shift_reg[0] <= digit;
	shift_reg[1] <= shift_reg[0];
	shift_reg[2] <= shift_reg[1];
	shift_reg[3] <= shift_reg[2];
	shift_reg[4] <= shift_reg[3];
	shift_reg[5] <= shift_reg[4];
end

reg cnt = 1'b0;
reg[2:0] digit_i = 3'd0;

always @ (posedge clk) begin
	cnt <= cnt + 1;
end

always @ (posedge cnt) begin
	digit_i <= digit_i + 3'd1;
	if (digit_i == 3'd5)
		digit_i <= 3'd0;

	digit_pos <= digit_i;
	digit_cur <= shift_reg[digit_i];
end

endmodule
