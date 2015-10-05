`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:18 08/31/2015 
// Design Name: 
// Module Name:    hour1 
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
module hour1(
    clk_out,
	 rst_n,
	 increase,
	 value,
	 re,//§ó·shour0  23:00 -> 00:00
	 over
	 );


input clk_out;
input rst_n;
input increase;
output [3:0] value;
output re;
output over;


reg over;
reg re;
reg re_next;
reg [3:0] value;
reg [3:0] value_tmp;



always@(*)
begin
	if(value==4'd2 && increase==1'b1)
	begin
		value_tmp=4'd0;
		over=1'b1;
	end
	else if(value!=4'd2 && increase==1'b1)
	begin
		value_tmp=value+4'd1;
		over=1'b0;
	end
	else
	begin
		value_tmp=value;
		over=1'b0;
	end
end



always@(*)
begin
	if(value==4'd2)
		re_next=1'b1;
	else
		re_next=1'b0;
end




always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
		value<=4'd0;
		re<=1'b0;
	end
	else
	begin
		value<=value_tmp;
		re<=re_next;
	end
end


endmodule
