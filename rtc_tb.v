`timescale 1ns / 1ps

module rtc_tb;

reg sclk, poll_freq;

initial begin
	sclk = 0;
	poll_freq = 0;
end

always #10000 begin
	sclk <= ~sclk; // ~50kHz
end

always #100000000 begin
	poll_freq = ~poll_freq; // ~5 Hz
end

endmodule
