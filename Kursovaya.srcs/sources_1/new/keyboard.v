`timescale 1ns / 1ps
module keyboard(
    input PS2_CLK,PS2_DATA,CLK,
    output reg left,
    output reg right,
    output reg throw,
    output reg reset
    );

    parameter p_left=7'h1C;
    parameter p_right=7'h23;
    parameter p_next=7'h29;
    parameter p_reset=7'h2D;
    
    reg [7:0] code;
    reg [1:0] curState;
    reg [4:0] bitCount;
    wire ps2Clk,ps2Data;
initial begin
    throw=0;
    reset=0;
    left=0;
    right=0;

    code=7'd8;
    curState=0;
    bitCount=0;
end
    wire ps2clk_signal, ps2Data_enable;
    sync syncClk(.clk(CLK),.in(PS2_CLK),.out(ps2Clk));
    sync syncData(.clk(CLK),.in(PS2_DATA),.out(ps2Data));    
   always @(posedge ps2Clk)
   begin
  // code1=code;
   case(curState)
    2'd0: 
    begin
        reset=0;
        throw=0;
        left=0;
        right=0;
        if(ps2Data==1)
            curState=0;
        else
        begin
            curState=1;
            code=0;
        end
    end
    2'd1:
    begin
        bitCount=bitCount+1;
        code={ps2Data,code[7:1]};
        if(bitCount==4'd8)
            begin
                curState=2'd2;
                bitCount=0;
            end
    end
    2'd2:
        curState=2'd3;
    2'd3:
    begin
        curState=0;
        if(ps2Data==1)
        begin
            if(code==p_right)
                right=1;
            if(code==p_left)
                left=1;
            if(code==p_next)
                throw=1;
                
            if(code==p_reset)
                reset=1;        
               
        end
    end
    endcase
   end
endmodule
