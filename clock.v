module clock (
	input clk,
	input nrst,

	output[7:0] digit_segs,
	output[5:0] digit_sel,

	output rtc_sclk,
	output rtc_ce,
	inout rtc_data_io
);

wire rtc_poll_freq;
wire[4:0] digit;
wire display_refresh_freq;
wire[2:0] digit_pos;
wire[4:0] digit_cur;

assign display_refresh_freq = rtc_sclk;

clkdiv rtc_sclk_src (
	.clk(clk),
	.divisor(5'd10),
	.divclk(rtc_sclk)
);

clkdiv rtc_poll_freq_src (
	.clk(clk),
	.divisor(5'd20),
	.divclk(rtc_poll_freq)
);

rtc rtc_driver (
	.sclk(rtc_sclk),
	.poll_freq(rtc_poll_freq),
	.ce(rtc_ce),
	.digit(digit),
	.data_io(rtc_data_io)
);

display disp (
	.digit(digit),
	.latch(clk),
	.refresh_freq(display_refresh_freq),
	.digit_pos(digit_pos),
	.digit_cur(digit_cur)
);

sseg seven_seg (
	.digit(digit_cur),
	.digit_pos(digit_pos),
	.digit_segs(digit_segs),
	.digit_sel(digit_sel)
);

endmodule
