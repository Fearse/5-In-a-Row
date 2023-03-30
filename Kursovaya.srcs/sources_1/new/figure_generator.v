`timescale 1ns / 1ps
module figure_generator(

  input [10:0] vpos,
  input [10:0] hpos,
  input clk,
  input reset,
  input [2:0] i,
  input [2:0] j,
  input [5:0] player,
  input [2:0] ArrPos,
  input [1:0] winner,
  
  input goChange,
  
  output reg [2:0]colors,
  output board_gfx
); 
  reg [5:0] score_digit;
  wire [7:0] score_bits;
  reg [5:0] array[7:0][7:0];
  initial
    begin
        iTemp=0;
        jTemp=0;
        resetStart=0;
    end
  reg [2:0] iTemp;
  reg [2:0] jTemp;
  reg resetStart;
  //Создать двумерный массив
  always @(posedge clk)
    begin
        if(goChange)
            array[i][j]<=3-player;
        if(reset)
            resetStart<=1;   
        if(resetStart)
            begin
                array[iTemp][jTemp]<=0;
                if(iTemp!=7)
                    iTemp<=iTemp+1;
                else
                    begin
                        iTemp<=0;
                        if(jTemp!=7)
                            begin
                                jTemp<=jTemp+1;
                            end
                        else
                            begin
                                jTemp<=0;
                                array[i][j]<=0;
                                resetStart<=0;
                            end    
                    end
            end
      case (hpos[10:4])//Сколько пикселей по горизонтали отводится на 1 символ
        
        13:    
        begin
          score_digit <=28;
          colors[2]<=1;
          colors[1]<=0;
          colors[0]<=1;
        end
        14:
        begin
           score_digit <=32;
           colors[2]<=1;
          colors[1]<=0;
          colors[0]<=1;
        end
           
        15: 
          begin
            case (vpos [9:2])
              4,5,6,7: if(winner==0) score_digit <=30; else if(winner==3) score_digit<=23; else score_digit <=34;
              12,13,14,15: if(ArrPos==0) score_digit <=29; else score_digit<=23;
              16,17,18,19: begin if(array[0][0]!=0) score_digit<=28;else score_digit<=23; case(array[0][0]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              20,21,22,23: begin if(array[1][0]!=0) score_digit<=28;else score_digit<=23; case(array[1][0]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              24,25,26,27: begin if(array[2][0]!=0) score_digit<=28;else score_digit<=23; case(array[2][0]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              28,29,30,31: begin if(array[3][0]!=0) score_digit<=28;else score_digit<=23; case(array[3][0]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              32,33,34,35: begin if(array[4][0]!=0) score_digit<=28;else score_digit<=23; case(array[4][0]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              36,37,38,39: begin if(array[5][0]!=0) score_digit<=28;else score_digit<=23; case(array[5][0]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              40,41,42,43: begin if(array[6][0]!=0) score_digit<=28;else score_digit<=23; case(array[6][0]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              44,45,46,47: begin if(array[7][0]!=0) score_digit<=28;else score_digit<=23; case(array[7][0]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              
              default:score_digit<=23;
            endcase
          end
        16: 
          begin
            case (vpos [9:2])
              4,5,6,7:  if(winner==0) score_digit <=20; else if(winner==3) score_digit<=23; else score_digit <=35;
              12,13,14,15: if(ArrPos==1) score_digit <=29; else score_digit<=23;
              16,17,18,19: begin if(array[0][1]!=0) score_digit<=28;else score_digit<=23; case(array[0][1]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              20,21,22,23: begin if(array[1][1]!=0) score_digit<=28;else score_digit<=23; case(array[1][1]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              24,25,26,27: begin if(array[2][1]!=0) score_digit<=28;else score_digit<=23; case(array[2][1]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              28,29,30,31: begin if(array[3][1]!=0) score_digit<=28;else score_digit<=23; case(array[3][1]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              32,33,34,35: begin if(array[4][1]!=0) score_digit<=28;else score_digit<=23; case(array[4][1]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              36,37,38,39: begin if(array[5][1]!=0) score_digit<=28;else score_digit<=23; case(array[5][1]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              40,41,42,43: begin if(array[6][1]!=0) score_digit<=28;else score_digit<=23; case(array[6][1]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              44,45,46,47: begin if(array[7][1]!=0) score_digit<=28;else score_digit<=23; case(array[7][1]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              
            default: score_digit <=28;
            endcase
          end
        17: 
          begin
            case (vpos [9:2])
              4,5,6,7:  if(winner==0) score_digit <=10; else if(winner==3) score_digit<=13; else score_digit <=25;
              12,13,14,15: if(ArrPos==2) score_digit <=29; else score_digit<=23;
              16,17,18,19: begin if(array[0][2]!=0) score_digit<=28;else score_digit<=23; case(array[0][2]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              20,21,22,23: begin if(array[1][2]!=0) score_digit<=28;else score_digit<=23; case(array[1][2]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              24,25,26,27: begin if(array[2][2]!=0) score_digit<=28;else score_digit<=23; case(array[2][2]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              28,29,30,31: begin if(array[3][2]!=0) score_digit<=28;else score_digit<=23; case(array[3][2]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              32,33,34,35: begin if(array[4][2]!=0) score_digit<=28;else score_digit<=23; case(array[4][2]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              36,37,38,39: begin if(array[5][2]!=0) score_digit<=28;else score_digit<=23; case(array[5][2]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              40,41,42,43: begin if(array[6][2]!=0) score_digit<=28;else score_digit<=23; case(array[6][2]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              44,45,46,47: begin if(array[7][2]!=0) score_digit<=28;else score_digit<=23; case(array[7][2]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              
            default: score_digit <=28;
            endcase
          end
        18: 
          begin
            case (vpos [9:2])
              4,5,6,7:  if(winner==0) score_digit <=31; else if(winner==3) score_digit<=16; else score_digit <=25;
              12,13,14,15: if(ArrPos==3) score_digit <=29; else score_digit<=23;
              16,17,18,19: begin if(array[0][3]!=0) score_digit<=28;else score_digit<=23; case(array[0][3]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              20,21,22,23: begin if(array[1][3]!=0) score_digit<=28;else score_digit<=23; case(array[1][3]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              24,25,26,27: begin if(array[2][3]!=0) score_digit<=28;else score_digit<=23; case(array[2][3]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              28,29,30,31: begin if(array[3][3]!=0) score_digit<=28;else score_digit<=23; case(array[3][3]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              32,33,34,35: begin if(array[4][3]!=0) score_digit<=28;else score_digit<=23; case(array[4][3]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              36,37,38,39: begin if(array[5][3]!=0) score_digit<=28;else score_digit<=23; case(array[5][3]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              40,41,42,43: begin if(array[6][3]!=0) score_digit<=28;else score_digit<=23; case(array[6][3]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              44,45,46,47: begin if(array[7][3]!=0) score_digit<=28;else score_digit<=23; case(array[7][3]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              
            default: score_digit <=28;
            endcase
          end
        19: 
          begin
            case (vpos [9:2])
              4,5,6,7:  if(winner==3) score_digit<=10; else score_digit <=17;
              12,13,14,15: if(ArrPos==4) score_digit <=29;else score_digit<=23;
              16,17,18,19: begin if(array[0][4]!=0) score_digit<=28;else score_digit<=23; case(array[0][4]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              20,21,22,23: begin if(array[1][4]!=0) score_digit<=28;else score_digit<=23; case(array[1][4]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              24,25,26,27: begin if(array[2][4]!=0) score_digit<=28;else score_digit<=23; case(array[2][4]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              28,29,30,31: begin if(array[3][4]!=0) score_digit<=28;else score_digit<=23; case(array[3][4]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              32,33,34,35: begin if(array[4][4]!=0) score_digit<=28;else score_digit<=23; case(array[4][4]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              36,37,38,39: begin if(array[5][4]!=0) score_digit<=28;else score_digit<=23; case(array[5][4]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              40,41,42,43: begin if(array[6][4]!=0) score_digit<=28;else score_digit<=23; case(array[6][4]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              44,45,46,47: begin if(array[7][4]!=0) score_digit<=28;else score_digit<=23; case(array[7][4]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              
            default: score_digit <=28;
            endcase
          end
        20: 
          begin
            case (vpos [9:2])
              4,5,6,7: if(winner==3) score_digit<=34; else score_digit <=16;
              12,13,14,15: if(ArrPos==5) score_digit <=29;else score_digit<=23;
              16,17,18,19: begin if(array[0][5]!=0) score_digit<=28;else score_digit<=23; case(array[0][5]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              20,21,22,23: begin if(array[1][5]!=0) score_digit<=28;else score_digit<=23; case(array[1][5]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              24,25,26,27: begin if(array[2][5]!=0) score_digit<=28;else score_digit<=23; case(array[2][5]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              28,29,30,31: begin if(array[3][5]!=0) score_digit<=28;else score_digit<=23; case(array[3][5]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              32,33,34,35: begin if(array[4][5]!=0) score_digit<=28;else score_digit<=23; case(array[4][5]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              36,37,38,39: begin if(array[5][5]!=0) score_digit<=28;else score_digit<=23; case(array[5][5]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              40,41,42,43: begin if(array[6][5]!=0) score_digit<=28;else score_digit<=23; case(array[6][5]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              44,45,46,47: begin if(array[7][5]!=0) score_digit<=28;else score_digit<=23; case(array[7][5]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              
            default: score_digit <=28;
            endcase
          end
        21: 
          begin
            case (vpos [9:2])
              4,5,6,7: if(winner==3) score_digit<=23; else score_digit <=22;
              12,13,14,15: if(ArrPos==6) score_digit <=29;else score_digit<=23;
              16,17,18,19: begin if(array[0][6]!=0) score_digit<=28;else score_digit<=23; case(array[0][6]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              20,21,22,23: begin if(array[1][6]!=0) score_digit<=28;else score_digit<=23; case(array[1][6]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              24,25,26,27: begin if(array[2][6]!=0) score_digit<=28;else score_digit<=23; case(array[2][6]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              28,29,30,31: begin if(array[3][6]!=0) score_digit<=28;else score_digit<=23; case(array[3][6]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              32,33,34,35: begin if(array[4][6]!=0) score_digit<=28;else score_digit<=23; case(array[4][6]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              36,37,38,39: begin if(array[5][6]!=0) score_digit<=28;else score_digit<=23; case(array[5][6]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              40,41,42,43: begin if(array[6][6]!=0) score_digit<=28;else score_digit<=23; case(array[6][6]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              44,45,46,47: begin if(array[7][6]!=0) score_digit<=28;else score_digit<=23; case(array[7][6]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              
            default: score_digit <=28;
            endcase
          end
        22: 
          begin
            case (vpos [9:2])
              4,5,6,7: if(winner==3) score_digit<=23; 
              else
                if(winner!=0)
                    begin
                        score_digit<=3-player;  
                        if(3-player==1) 
                            begin           
                                colors[2]<=0;
                                colors[1]<=1;
                                colors[0]<=1;
                            end 
                        else 
                            begin           
                                colors[2]<=0;
                                colors[1]<=1;
                                colors[0]<=0;
                            end
                    end
                else
                    begin 
                        score_digit<=player;  
                        if(player==1) 
                            begin           
                                colors[2]<=0;
                                colors[1]<=1;
                                colors[0]<=1;
                            end 
                        else 
                            begin           
                                colors[2]<=0;
                                colors[1]<=1;
                                colors[0]<=0;
                            end 
                    end
              12,13,14,15: if(ArrPos==7) score_digit <=29;else score_digit<=23;
              16,17,18,19: begin if(array[0][7]!=0) score_digit<=28;else score_digit<=23; case(array[0][7]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              20,21,22,23: begin if(array[1][7]!=0) score_digit<=28;else score_digit<=23; case(array[1][7]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              24,25,26,27: begin if(array[2][7]!=0) score_digit<=28;else score_digit<=23; case(array[2][7]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              28,29,30,31: begin if(array[3][7]!=0) score_digit<=28;else score_digit<=23; case(array[3][7]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              32,33,34,35: begin if(array[4][7]!=0) score_digit<=28;else score_digit<=23; case(array[4][7]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              36,37,38,39: begin if(array[5][7]!=0) score_digit<=28;else score_digit<=23; case(array[5][7]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              40,41,42,43: begin if(array[6][7]!=0) score_digit<=28;else score_digit<=23; case(array[6][7]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              44,45,46,47: begin if(array[7][7]!=0) score_digit<=28;else score_digit<=23; case(array[7][7]) 1: begin colors[2]<=0;colors[1]<=1;colors[0]<=1;end 2:begin colors[2]<=0;colors[1]<=1;colors[0]<=0;end endcase end
              
            default: score_digit <=28;
            endcase
          end
        23:
        begin
           score_digit <=33;
          colors[2]<=1;colors[1]<=0;colors[0]<=1;
        end
           
        24:score_digit <= 28;

        default: score_digit <= 23;
      endcase
    end
  digits10_case digits(.clk(clk),.digit(score_digit),.yofs(vpos[3:1]),.bits(score_bits));//сколько пикселей будет занимать пикслель символа по вертикали

  assign board_gfx = score_bits[hpos[3:1]^ 3'b111];//Сколько пикслей будет занимать один пиксел изображения(горизонтальный)2
  
endmodule