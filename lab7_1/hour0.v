`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:38 08/31/2015 
// Design Name: 
// Module Name:    hour0 
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
module hour0(
    clk_out,
	 rst_n,
	 increase,
	 re,
	 value,
	 over
	 );


input clk_out;
input rst_n;
input increase;
input re;
output [3:0] value;
output over;


reg over;
reg [3:0]value;
reg [3:0]value_tmp;




always@(*)
begin
	if(value==4'd3 && increase==1'b1 && re==1'b1)
	begin
		value_tmp=4'd0;
		over=1'b1;
	end
	else if(value==4'd9 && increase==1'b1)
	begin
		value_tmp=4'd0;
		over=1'b1;
	end
	else if(value!=4'd9 && increase==1'b1)
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



always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
		value<=4'd0;
	else
		value<=value_tmp;
end



endmodule
