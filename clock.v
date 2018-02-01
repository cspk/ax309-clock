module clock(
	input clk,
	input nrst,

	output reg[7:0] digit_segs,
	output reg[5:0] digit_sel,

	output reg rtc_sclk,
	output reg rtc_ce,
	inout rtc_data_io
);

always @ (posedge clk or negedge nrst) begin
	if (!nrst) begin
		digit_segs <= 8'd0;
		digit_sel <= 8'd0;
		rtc_sclk <= 1'd0;
		rtc_ce <= 1'd0;
	end
end

endmodule
