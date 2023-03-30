`timescale 1ns / 1ps
module top(
    input clk_old,
    input PS2_CLK,
    input PS2_DATA,
    output hsync, vsync,
    output [2:0] rgb
    );
    
    wire clk;
    wire left,right,reset,throw;
    wire left_enable,right_enable,throw_enable,reset_enable;
    wire goChange;
    wire [5:0] player;
    wire [2:0] i;
    wire [2:0] j;
    wire [2:0] arrPos;
    wire [1:0] winner;
    clk_div div(.clk(clk_old), .new_clk(clk)); 
    keyboard keyboard(.PS2_CLK(PS2_CLK),.PS2_DATA(PS2_DATA), .CLK(clk),.left(left),.right(right),.reset(reset),.throw(throw));
    bounce right(.clk(clk),.in_s(right),.clock_en(0'b1),.out_signal_en(right_enable));
    bounce left(.clk(clk),.in_s(left),.clock_en(0'b1),.out_signal_en(left_enable));
    bounce throw(.clk(clk),.in_s(throw),.clock_en(0'b1),.out_signal_en(throw_enable));
    bounce reset(.clk(clk),.in_s(reset),.clock_en(0'b1),.out_signal_en(reset_enable));
    vgaa vgaaaa(.clk(clk_old),.hsync(hsync),.ArrPos(arrPos),.player(player),.i(i),.j(j),.winner(winner),.reset(reset_enable),.vsync(vsync),.rgb(rgb),.goChange(goChange));
    fsm fsm(.clk(clk),.throw(throw_enable),.left(left_enable),.right(right_enable),.reset(reset_enable),.arrPos(arrPos),.winner(winner),.i(i),.j(j),.player(player),.goChange(goChange));
endmodule
