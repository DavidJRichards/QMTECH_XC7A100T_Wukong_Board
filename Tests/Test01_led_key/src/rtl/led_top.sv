`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:55 02/28/2016 
// Design Name: 
// Module Name:    led_top 
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
module led_top(
    input sys_clk,
    input sys_rst_n,
    output led_1[1:0]
    );

parameter DLY_CNT = 32'd50000000;
parameter HALF_DLY_CNT = 32'd25000000;

reg r_led;
reg [31:0]count;

//counter control
always@(posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
		begin
			count <= 32'd0;
		end
	else if(count == DLY_CNT)
		begin
			count <= 32'd0;
		end
	else
		begin
			count <= count+32'd1;
		end
end

//led output register control
always@(posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
		begin
			r_led <= 1'b0;
		end
	else if(count < HALF_DLY_CNT)
		begin
			r_led <= 1'b1;
		end
	else
		begin
			r_led <= 1'b0;
		end
end

assign led_1[1] = r_led;
assign led_1[0] = ~r_led;

endmodule
