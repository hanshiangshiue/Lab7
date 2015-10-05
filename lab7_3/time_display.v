`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:32 09/01/2015 
// Design Name: 
// Module Name:    time_display 
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
module time_display(
    clk,
	 rst_n,
	 mode,
	 ftsd_ctl,
	 display
	 );

  
input clk;
input rst_n;
input [3:0] mode;
output [3:0] ftsd_ctl;
output [14:0] display;



wire clk_out;
wire [1:0] clk_ctl;
wire clk_150;
wire clk_test;/////////
wire [3:0] second0;
wire sec1en;
wire [3:0] second1;
wire min0en;
wire [3:0] minute0;
wire min1en;
wire [3:0] minute1;
wire hour0en;
wire [3:0] hr0;
wire re;
wire hour1en;
wire [3:0] hr1;
wire day_en;
wire [3:0] a1;
wire [3:0] a0;
wire [3:0] hrtw1;
wire [3:0] hrtw0;
wire [3:0] month1;
wire [3:0] month0;
wire [3:0] day1;
wire [3:0] day0;
wire mon_en;
wire year_en;
wire [3:0] year3;
wire [3:0] year2;
wire [3:0] year1;
wire [3:0] year0;
wire [3:0] ftsd_in;
reg [3:0] in0;
reg [3:0] in1;
reg [3:0] in2;
reg [3:0] in3;




always@(*)
begin
	if(mode==4'b0000)//分:秒
	begin
		in0=minute1;
		in1=minute0;
		in2=second1;
		in3=second0;
	end
	else if(mode==4'b0001)//24小時制
	begin
		in0=hr1;
		in1=hr0;
		in2=4'd0;
		in3=4'd0;
	end
	else if(mode==4'b0011)//12小時制
	begin
		in0=a1;
		in1=a0;
		in2=hrtw1;
		in3=hrtw0;
	end
	else if(mode==4'b0111)//月:日
	begin
		in0=month1;
		in1=month0;
		in2=day1;
		in3=day0;
	end
	else //mode==4'b1111  年分
	begin
		in0=year3;
		in1=year2;
		in2=year1;
		in3=year0;
	end
end



freq_div f1(
	.clk_out(clk_out),
	.clk_ctl(clk_ctl),
	.clk_150(clk_150),
	.clk_test(clk_test),
	.clk(clk),
	.rst_n(rst_n)
	);



sec0 u_sec0(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(1'b1),//要不要+1
	 .value(second0),
	 .over(sec1en)//算完了沒
	 );




sec1 u_sec1(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(sec1en),
	 .value(second1),
	 .over(min0en)
	 );



min0 u_min0(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(min0en),
	 .value(minute0),
	 .over(min1en)
	 );



min1 u_min1(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(min1en),
	 .value(minute1),
	 .over(hour0en)
	 );



hour0 u_hour0(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(hour0en),
	 .re(re),
	 .value(hr0),
	 .over(hour1en)
	 );




hour1 u_hour1(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(hour1en),
	 .value(hr1),
	 .re(re),
	 .over(day_en)
	 );



hour_12 u_hour_12(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .hr1(hr1),
	 .hr0(hr0),
	 .a1(a1),
	 .a0(a0),
	 .hrtw1(hrtw1),
	 .hrtw0(hrtw0)
	 );
	 
	 

day d1(
    .clk_out(clk_out),
	 .rst_n(rst_n),
	 .increase(day_en),//要不要+1
	 .month1(month1),
	 .month0(month0),
	 .year2(year2),
	 .year1(year1),
	 .year0(year0),
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
	 .year3(year3),
	 .year2(year2),
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
