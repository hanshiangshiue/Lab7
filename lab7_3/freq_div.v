`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:20 08/13/2015 
// Design Name: 
// Module Name:    freq_div 
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

`define FREQ_DIV_BIT 25


module freq_div(
	clk_out,
	clk_ctl,
	clk_150,
	clk_test,
	clk,
	rst_n 
	);

	output reg clk_out;
	output reg [1:0] clk_ctl;
	output reg clk_test;///////////////////
	output reg clk_150;
	input clk;
	input rst_n;
	reg [5:0] cnt_l;
	reg [7:0] c_tmp;
	reg [5:0] cnt_h;
	reg [`FREQ_DIV_BIT-1:0] cnt_tmp; 
	
	always @(clk_out or cnt_h or clk_150 or clk_ctl or cnt_l)
		cnt_tmp = {clk_out,cnt_h,clk_150,clk_ctl,c_tmp,clk_test,cnt_l} + 1'b1;
	
	always @(posedge clk or negedge rst_n)
		if (~rst_n) {clk_out, cnt_h, clk_150, clk_ctl, c_tmp, clk_test, cnt_l}<=`FREQ_DIV_BIT'd0;
		else {clk_out, cnt_h, clk_150, clk_ctl, c_tmp, clk_test, cnt_l}<=cnt_tmp;




endmodule
