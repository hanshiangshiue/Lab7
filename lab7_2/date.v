`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:36 09/01/2015 
// Design Name: 
// Module Name:    date 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module date(
    clk,
	 rst_n,
	 mode,
	 ftsd_ctl,
	 display
	 );




input clk;
input rst_n;
input mode;
output [3:0] ftsd_ctl;
output [14:0] display;

wire clk_out;
wire [1:0] clk_ctl;
wire clk_150;
wire [3:0] month1;
wire [3:0] month0;
wire [3:0] day1;
wire [3:0] day0;
wire mon_en;
wire year_en;
wire [3:0] year1;
wire [3:0] year0;
wire [3:0] ftsd_in;
reg [3:0] in0;
reg [3:0] in1;
reg [3:0] in2;
reg [3:0] in3;





always@(*)
begin
	if(mode==1'b0)
	begin
		in0=month1;
		in1=month0;
		in2=day1;
		in3=day0;
	end
	else
	begin
		in0=4'd13;
		in1=4'd13;
		in2=year1;
		in3=year0;
	end
end




freq_div f1(
	.clk_out(clk_out), // divided clock output
	.clk_ctl(clk_ctl), // divided clock output for scan freq
	.clk_150(clk_150),
	.clk(clk), // global clock input
	.rst_n(rst_n) // active low reset
	);


day d1(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(1'b1),//­n¤£­n+1
	 .month1(month1),
	 .month0(month0),
	 .day1(day1),
	 .day0(day0),
	 .over(mon_en)
	 );



month m1(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(mon_en),
	 .month1(month1),
	 .month0(month0),
	 .over(year_en)
	 );




year y1(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(year_en),
	 .year1(year1),
	 .year0(year0)
	 );



scan_ctl sc1(
	.ftsd_ctl(ftsd_ctl),
	.ftsd_in(ftsd_in),
	.in0(in0),
	.in1(in1),
	.in2(in2), 
	.in3(in3),
	.ftsd_ctl_en(clk_ctl)
    );




bcd2ftsegdec b1(
	.display(display),
	.bcd(ftsd_in)
    );



endmodule
