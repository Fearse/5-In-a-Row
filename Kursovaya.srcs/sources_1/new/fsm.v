`timescale 1ns / 1ps
module fsm(
    input clk,
    input wire reset,
    input wire throw,
    input wire left,
    input wire right,
    output reg [1:0] winner,
    output reg [2:0] arrPos,
    output reg [2:0] i,
    output reg [2:0] j,
    output reg goChange,
    output reg [5:0] player
    );
    reg [3:0] posToWrite[7:0];
    reg [5:0] memory [7:0][7:0];
    initial
        begin
            i=0;
            j=0;
            state=0;
            iTemp=0;
            jTemp=0;
            player=1;
            arrPos=0;
            winner=0;
        end
  /*      РАБОТАЕТ*/
  /*
always@(posedge left or posedge right)
    begin
        if(right)
            if(arrPos!=7)
                arrPos<=arrPos+1;
             else
                arrPos<=0;
        else if(left)
            if(arrPos!=0)
                arrPos<=arrPos-1;
             else
                arrPos<=7;        
    end
*/
reg [2:0] state;
reg [2:0] iTemp;
reg [2:0] jTemp;
reg [5:0] sumOfNotZero;
//S0 - Сбросить всё
//S1 - Чей-то ход
//S2 - Проверка победы
//S3 - Кто-то выиграл(Ожидание броска)
always@(posedge clk,posedge reset)
    begin
    
        if(right)
            if(arrPos!=7)
                arrPos<=arrPos+1;
             else
                arrPos<=0;
        else if(left)
            if(arrPos!=0)
                arrPos<=arrPos-1;
             else
                arrPos<=7;
        if(reset)
            state<=0;
        else
            begin
                case (state)
                0:
                    begin
                        memory[iTemp][jTemp]<=0;
                        if(iTemp!=7)
                            iTemp<=iTemp+1;
                        else
                            begin
                                iTemp<=0;
                                if(jTemp!=7)
                                    begin
                                        jTemp<=jTemp+1;
                                        posToWrite[jTemp]<=8;
                                    end
                                else
                                    begin
                                        jTemp<=0;
                                        posToWrite[jTemp]<=8;
                                        state<=1;
                                        player<=1;
                                        winner<=0;
                                        sumOfNotZero=36;
                                    end    
                            end
                    end
                1:
                    begin
                        if(throw)
                            begin
                                goChange<=0;
                                if(posToWrite[arrPos]!=0)
                                    begin
                                        posToWrite[arrPos]<=posToWrite[arrPos]-1;
                                        if(posToWrite[arrPos]==0)
                                            sumOfNotZero<=sumOfNotZero-arrPos-1;
                                        state<=2;
                                    end
                            end
                    end
                2:
                    begin
                        i<=posToWrite[arrPos];
                        j<=arrPos;
                        state<=3;  
                    end
                3:
                    begin
                        memory[i][j]<=player;
                        state<=4;  
                    end    
                4:
                    begin
                         /* i<=posToWrite[arrPos];
                          j<=arrPos;
                          memory[i][j]<=player;*/
                          case (j)
                          0:if(memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j+3]==player&&memory[i][j+4]==player) winner<=player;
                          1:if(memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j+3]==player&&memory[i][j+4]==player||memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j+3]==player&&memory[i][j-1]==player) winner<=player;
                          2:if(memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j+3]==player&&memory[i][j+4]==player||memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j+3]==player&&memory[i][j-1]==player||memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j-2]==player&&memory[i][j-1]==player) winner<=player;
                          3:if(memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j+3]==player&&memory[i][j+4]==player||memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j+3]==player&&memory[i][j-1]==player||memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j-2]==player&&memory[i][j-1]==player||memory[i][j+1]==player&&memory[i][j-3]==player&&memory[i][j-2]==player&&memory[i][j-1]==player) winner<=player;
                          4:if(memory[i][j-1]==player&&memory[i][j-2]==player&&memory[i][j-3]==player&&memory[i][j-4]==player||memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j+3]==player&&memory[i][j-1]==player||memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j-2]==player&&memory[i][j-1]==player||memory[i][j+1]==player&&memory[i][j-3]==player&&memory[i][j-2]==player&&memory[i][j-1]==player) winner<=player;
                          5:if(memory[i][j-1]==player&&memory[i][j-2]==player&&memory[i][j-3]==player&&memory[i][j-4]==player||memory[i][j+1]==player&&memory[i][j+2]==player&&memory[i][j-2]==player&&memory[i][j-1]==player||memory[i][j+1]==player&&memory[i][j-3]==player&&memory[i][j-2]==player&&memory[i][j-1]==player) winner<=player;
                          6:if(memory[i][j-1]==player&&memory[i][j-2]==player&&memory[i][j-3]==player&&memory[i][j-4]==player||memory[i][j+1]==player&&memory[i][j-3]==player&&memory[i][j-2]==player&&memory[i][j-1]==player) winner<=player;
                          7:if(memory[i][j-1]==player&&memory[i][j-2]==player&&memory[i][j-3]==player&&memory[i][j-4]==player) winner<=player;
                          endcase
                          case (i)
                          0:if(memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i+3][j]==player&&memory[i+4][j]==player) winner<=player;
                          1:if(memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i+3][j]==player&&memory[i+4][j]==player||memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i+3][j]==player&&memory[i-1][j]==player) winner<=player;
                          2:if(memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i+3][j]==player&&memory[i+4][j]==player||memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i+3][j]==player&&memory[i-1][j]==player||memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i-2][j]==player&&memory[i-1][j]==player) winner<=player;
                          3:if(memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i+3][j]==player&&memory[i+4][j]==player||memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i+3][j]==player&&memory[i-1][j]==player||memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i-2][j]==player&&memory[i-1][j]==player||memory[i+1][j]==player&&memory[i-3][j]==player&&memory[i-2][j]==player&&memory[i-1][j]==player) winner<=player;
                          4:if(memory[i-1][j]==player&&memory[i-2][j]==player&&memory[i+3][j]==player&&memory[i-4][j]==player||memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i+3][j]==player&&memory[i-1][j]==player||memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i-2][j]==player&&memory[i-1][j]==player||memory[i+1][j]==player&&memory[i-3][j]==player&&memory[i-2][j]==player&&memory[i-1][j]==player) winner<=player;
                          5:if(memory[i-1][j]==player&&memory[i-2][j]==player&&memory[i+3][j]==player&&memory[i-4][j]==player||memory[i+1][j]==player&&memory[i+2][j]==player&&memory[i-2][j]==player&&memory[i-1][j]==player||memory[i+1][j]==player&&memory[i-3][j]==player&&memory[i-2][j]==player&&memory[i-1][j]==player) winner<=player;
                          6:if(memory[i-1][j]==player&&memory[i-2][j]==player&&memory[i+3][j]==player&&memory[i-4][j]==player||memory[i+1][j]==player&&memory[i-3][j]==player&&memory[i-2][j]==player&&memory[i-1][j]==player) winner<=player;
                          7:if(memory[i-1][j]==player&&memory[i-2][j]==player&&memory[i+3][j]==player&&memory[i-4][j]==player) winner<=player;
                          endcase
                          //1
                          case(i)
                              4,5,6,7:
                                case(j)
                                    0,1,2,3:if(memory[i-1][j+1]==player&&memory[i-2][j+2]==player&&memory[i-3][j+3]==player&&memory[i-4][j+4]==player) winner<=player;
                                endcase
                          endcase
                          //2
                          case(i)
                              3,4,5,6:
                                case(j)
                                    1,2,3,4:if(memory[i+1][j-1]==player&&memory[i-1][j+1]==player&&memory[i-2][j+2]==player&&memory[i-3][j+3]==player) winner<=player;
                                endcase
                          endcase
                          //3
                          case(i)
                              2,3,4,5:
                                case(j)
                                    2,3,4,5:if(memory[i+1][j-1]==player&&memory[i+2][j-2]==player&&memory[i-1][j+1]==player&&memory[i-2][j+2]==player) winner<=player;
                                endcase
                          endcase
                          //4
                          case(i)
                              1,2,3,4:
                                case(j)
                                    3,4,5,6:if(memory[i+1][j-1]==player&&memory[i+2][j-2]==player&&memory[i+3][j-3]==player&&memory[i-1][j+1]==player) winner<=player;
                                endcase
                          endcase
                          //5
                          case(i)
                              0,1,2,3:
                                case(j)
                                    4,5,6,7:if(memory[i+1][j-1]==player&&memory[i+2][j-2]==player&&memory[i+3][j-3]==player&&memory[i+4][j-4]==player) winner<=player;
                                endcase
                          endcase
                          //6
                          case(i)
                              4,5,6,7:
                                case(j)
                                    4,5,6,7:if(memory[i-1][j-1]==player&&memory[i-2][j-2]==player&&memory[i-3][j-3]==player&&memory[i-4][j-4]==player) winner<=player;
                                endcase
                          endcase
                          //7
                          case(i)
                              3,4,5,6:
                                case(j)
                                    3,4,5,6:if(memory[i+1][j+1]==player&&memory[i-1][j-1]==player&&memory[i-2][j-2]==player&&memory[i-3][j-3]==player) winner<=player;
                                endcase
                          endcase
                          //8
                          case(i)
                              2,3,4,5:
                                case(j)
                                    2,3,4,5:if(memory[i+1][j+1]==player&&memory[i+2][j+2]==player&&memory[i-1][j-1]==player&&memory[i-2][j-2]==player) winner<=player;
                                endcase
                          endcase
                          //9
                          case(i)
                              1,2,3,4:
                                case(j)
                                    1,2,3,4:if(memory[i+1][j+1]==player&&memory[i+2][j+2]==player&&memory[i+3][j+3]==player&&memory[i-1][j-1]==player) winner<=player;
                                endcase
                          endcase
                          //10
                          case(i)
                              0,1,2,3:
                                case(j)
                                    0,1,2,3:if(memory[i+1][j+1]==player&&memory[i+2][j+2]==player&&memory[i+3][j+3]==player&&memory[i+4][j+4]==player) winner<=player;
                                endcase
                          endcase
                          player<=3-player;
                          goChange<=1;
                          if(sumOfNotZero==0)
                            winner<=5;
                          if(winner!=0)
                            state<=5;
                          else
                            state<=1;
                    end
                5:
                    begin
                        if(throw)
                            state<=0;
                    end
                endcase
            end    
    end
endmodule
