`timescale 1ns / 1ps

module clock(
	input wire clk,

	output wire[7:0] digit_segs,
	output wire[5:0] position
);

wire[2:0] digit_pos;
wire[4:0] digit, digit_cur;

display disp(digit, latch, clk, digit_pos, digit_cur);
sseg s(digit_cur, digit_pos, digit_segs, position);

endmodule
