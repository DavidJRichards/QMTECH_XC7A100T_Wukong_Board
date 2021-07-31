`timescale 1ns / 1ps

module uart_tx_path(
	input clk_i,

	input [7:0] uart_tx_data_i,	         //待发送数据
	input uart_tx_en_i,			         //发送发送使能信号
	
	output uart_tx_o
);

parameter BAUD_DIV     = 13'd5208;      //波特率时钟，9600bps，50Mhz/9600=5208，波特率可调
parameter BAUD_DIV_CAP = 13'd2604;      //波特率时钟中间采样点，50Mhz/9600/2=2604，波特率可调

reg [12:0] baud_div=0;			         //波特率设置计数器
reg baud_bps=0;				             //数据发送点信号,高有效
(* MARKDEBUG = "TRUE" *)reg [9:0] send_data=10'b1111111111;     //待发送数据寄存器，1bit起始信号+8bit有效信号+1bit结束信号
(* MARKDEBUG = "TRUE" *)reg [3:0] bit_num=0;	                //发送数据个数计数器
reg uart_send_flag=0;	                //数据发送标志位
reg uart_tx_o_r=1;		                //发送数据寄存器，初始状态位高

always@(posedge clk_i)
begin
	if(baud_div==BAUD_DIV_CAP)	        //当波特率计数器计数到数据发送中点时，产生采样信号baud_bps，用来发送数据
		begin
			baud_bps<=1'b1;
			baud_div<=baud_div+1'b1;
		end
	else if(baud_div<BAUD_DIV && uart_send_flag)//数据发送标志位有效期间，波特率计数器累加，以产生波特率时钟
		begin
			baud_div<=baud_div+1'b1;
			baud_bps<=0;	
		end
	else
		begin
			baud_bps<=0;
			baud_div<=0;
		end
end

always@(posedge clk_i)
begin
	if(uart_tx_en_i)	//接收数据发送使能信号时，产生数据发送标志信号
		begin
			uart_send_flag<=1'b1;
			send_data<={1'b1,uart_tx_data_i,1'b0};//待发送数据寄存器装填，1bit起始信号0+8bit有效信号+1bit结束信号
		end
	else if(bit_num==4'd10)	//发送结束时候，清楚发送标志信号，并清楚待发送数据寄存器内部信号
		begin
			uart_send_flag<=1'b0;
			send_data<=10'b1111_1111_11;
		end
end

always@(posedge clk_i)
begin
	if(uart_send_flag)	//发送有效时候
		begin
			if(baud_bps)//检测发送点信号
				begin
					if(bit_num<=4'd9)
						begin
							uart_tx_o_r<=send_data[bit_num];	//发送待发送寄存器内数据，从低位到高位
							bit_num<=bit_num+1'b1;
						end
				end
			else if(bit_num==4'd10)
				bit_num<=4'd0;
		end
	else
		begin
			uart_tx_o_r<=1'b1;	//空闲状态时，保持发送端位高电平，以备发送时候产生低电平信号
			bit_num<=0;
		end
end

assign uart_tx_o=uart_tx_o_r;

endmodule
