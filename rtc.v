module rtc (
	input sclk,
	input poll_freq,

	output reg ce,
	output reg[4:0] digit,

	inout data_io
);

wire data_in_w, data_out_w;
reg data_in = 1'b0;
reg data_out = 1'b0;
reg input_en = 1'b0;

assign data_in_w = data_in;
assign data_out_w = data_out;

IOBUF iobuf (
	.O(data_out_w),
	.IO(data_io),
	.I(data_in_w),
	.T(input_en)
);

always @ (posedge sclk) begin
	ce <= 1'b0;
	digit <= 5'd0;
end

endmodule
