`timescale 1ns / 1ps
module digits10_case(
  
  input [5:0] digit,		// digit 0-9
  input [2:0] yofs,	// vertical offset (0-4)
  input clk,
  output reg [7:0] bits);	// output (5 bits)

  // combine {digit,yofs} into single ROM address
  wire [8:0] caseexpr = {digit,yofs};
  
  always @(posedge clk)
    case (caseexpr)
      9'o00: bits <= 8'b00000000;
      9'o01: bits <= 8'b01111111;
      9'o02: bits <= 8'b01100011;
      9'o03: bits <= 8'b01100011;
      9'o04: bits <= 8'b01100011;
      9'o05: bits <= 8'b01111111;
      
      9'o10: bits <= 8'b00000000;
      9'o11: bits <= 8'b00111000;
      9'o12: bits <= 8'b01111000;
      9'o13: bits <= 8'b00011000;
      9'o14: bits <= 8'b00011000;
      9'o15: bits <= 8'b01111110;
      
      9'o20: bits <= 8'b00000000;
      9'o21: bits <= 8'b01111111;
      9'o22: bits <= 8'b00000011;
      9'o23: bits <= 8'b01111111;
      9'o24: bits <= 8'b01100000;
      9'o25: bits <= 8'b01111111;
      
      9'o30: bits <= 8'b11111;
      9'o31: bits <= 8'b00001;
      9'o32: bits <= 8'b11111;
      9'o33: bits <= 8'b00001;
      9'o34: bits <= 8'b11111;

      9'o40: bits <= 8'b10001;
      9'o41: bits <= 8'b10001;
      9'o42: bits <= 8'b11111;
      9'o43: bits <= 8'b00001;
      9'o44: bits <= 8'b00001;

      9'o50: bits <= 8'b11111;
      9'o51: bits <= 8'b10000;
      9'o52: bits <= 8'b11111;
      9'o53: bits <= 8'b00001;
      9'o54: bits <= 8'b11111;

      9'o60: bits <= 8'b11111;
      9'o61: bits <= 8'b10000;
      9'o62: bits <= 8'b11111;
      9'o63: bits <= 8'b10001;
      9'o64: bits <= 8'b11111;

      9'o70: bits <= 8'b11111;
      9'o71: bits <= 8'b00001;
      9'o72: bits <= 8'b00001;
      9'o73: bits <= 8'b00001;
      9'o74: bits <= 8'b00001;

      9'o100: bits <= 8'b11111;
      9'o101: bits <= 8'b10001;
      9'o102: bits <= 8'b11111;
      9'o103: bits <= 8'b10001;
      9'o104: bits <= 8'b11111;
      
      9'o110: bits <= 8'b11111;
      9'o111: bits <= 8'b10001;
      9'o112: bits <= 8'b11111;
      9'o113: bits <= 8'b00001;
      9'o114: bits <= 8'b11111;
      //A
      9'o120: bits <= 8'b00000000;
      9'o121: bits <= 8'b01111111;
      9'o122: bits <= 8'b01100011;
      9'o123: bits <= 8'b01111111;
      9'o124: bits <= 8'b01100011;
      9'o125: bits <= 8'b01100011;
      
      9'o130: bits <= 8'b10000;
      9'o131: bits <= 8'b10000;
      9'o132: bits <= 8'b11111;
      9'o133: bits <= 8'b10001;
      9'o134: bits <= 8'b11111;
      
      9'o140: bits <= 8'b11111;
      9'o141: bits <= 8'b10000;
      9'o142: bits <= 8'b10000;
      9'o143: bits <= 8'b10000;
      9'o144: bits <= 8'b11111;
	
      9'o150: bits <= 8'b00000000;
      9'o151: bits <= 8'b01111110;
      9'o152: bits <= 8'b01100001;
      9'o153: bits <= 8'b01100001;
      9'o154: bits <= 8'b01100001;
      9'o155: bits <= 8'b01111110;
 
      9'o160: bits <= 8'b11111;
      9'o161: bits <= 8'b10000;
      9'o162: bits <= 8'b11111;
      9'o163: bits <= 8'b10000;
      9'o164: bits <= 8'b11111;
      //F
      9'o170: bits <= 8'b11111;
      9'o171: bits <= 8'b10000;
      9'o172: bits <= 8'b11111;
      9'o173: bits <= 8'b10000;
      9'o174: bits <= 8'b10000;
      //R 16
      9'o200: bits <= 8'b00000000;
      9'o201: bits <= 8'b01111110;
      9'o202: bits <= 8'b01100011;
      9'o203: bits <= 8'b01111110;
      9'o204: bits <= 8'b01101100;
      9'o205: bits <= 8'b01100110;
      //E 17
      9'o210: bits <= 8'b00000000;
      9'o211: bits <= 8'b01111111;
      9'o212: bits <= 8'b01100000;
      9'o213: bits <= 8'b01111111;
      9'o214: bits <= 8'b01100000;
      9'o215: bits <= 8'b01111111;
      //S 18
      9'o220: bits <= 8'b11111;
      9'o221: bits <= 8'b10000;
      9'o222: bits <= 8'b11111;
      9'o223: bits <= 8'b00001;
      9'o224: bits <= 8'b11111;
      //U 19
      9'o230: bits <= 8'b10001;
      9'o231: bits <= 8'b10001;
      9'o232: bits <= 8'b10001;
      9'o233: bits <= 8'b10001;
      9'o234: bits <= 8'b11111;
      //L 20
      9'o240: bits <= 8'b00000000;
      9'o241: bits <= 8'b01100000;
      9'o242: bits <= 8'b01100000;
      9'o243: bits <= 8'b01100000;
      9'o244: bits <= 8'b01100000;
      9'o245: bits <= 8'b01111111;
      //T 21
      9'o250: bits <= 8'b11111;
      9'o251: bits <= 8'b00100;
      9'o252: bits <= 8'b00100;
      9'o253: bits <= 8'b00100;
      9'o254: bits <= 8'b00100;
      //: 22
      9'o260: bits <= 8'b00000000;
      9'o261: bits <= 8'b00011000;
      9'o262: bits <= 8'b00011000;
      9'o263: bits <= 8'b00000000;
      9'o264: bits <= 8'b00011000;
      9'o265: bits <= 8'b00011000;
      //NULL 23
      9'o270: bits <= 8'b00000;
      9'o271: bits <= 8'b00000;
      9'o272: bits <= 8'b00000;
      9'o273: bits <= 8'b00000;
      9'o274: bits <= 8'b00000;
      //Arrow Right 24
      9'o300: bits <= 8'b00100;
      9'o301: bits <= 8'b00010;
      9'o302: bits <= 8'b11111;
      9'o303: bits <= 8'b00010;
      9'o304: bits <= 8'b00100;
      //N 25
      9'o310: bits <= 8'b00000000;
      9'o311: bits <= 8'b01100011;
      9'o312: bits <= 8'b01110011;
      9'o313: bits <= 8'b01101011;
      9'o314: bits <= 8'b01101011;
      9'o315: bits <= 8'b01100111;
      //O 26
      9'o320: bits <= 8'b11111;
      9'o321: bits <= 8'b10001;
      9'o322: bits <= 8'b10001;
      9'o323: bits <= 8'b10001;
      9'o324: bits <= 8'b11111;
      //D 27
      9'o330: bits <= 8'b11100;
      9'o331: bits <= 8'b10011;
      9'o332: bits <= 8'b10001;
      9'o333: bits <= 8'b10011;
      9'o334: bits <= 8'b11100;
      //circle 28
      9'o340: bits <= 8'b00000000;
      9'o341: bits <= 8'b00011000;
      9'o342: bits <= 8'b00111100;
      9'o343: bits <= 8'b01111110;
      9'o344: bits <= 8'b01111110;
      9'o345: bits <= 8'b00111100;
      9'o346: bits <= 8'b00011000;
      9'o347: bits <= 8'b00000000;
      //ARROW DOWN 29
      9'o350: bits <= 8'b00000000;
      9'o351: bits <= 8'b00011000;
      9'o352: bits <= 8'b00011000;
      9'o353: bits <= 8'b00011000;
      9'o354: bits <= 8'b01011010;
      9'o355: bits <= 8'b00111100;
      9'o356: bits <= 8'b00011000;
      //P 30
      9'o360: bits <= 8'b00000000;
      9'o361: bits <= 8'b01111110;
      9'o362: bits <= 8'b01100011;
      9'o363: bits <= 8'b01111110;
      9'o364: bits <= 8'b01100000;
      9'o365: bits <= 8'b01100000;
      //Y 31
      9'o370: bits <= 8'b00000000;
      9'o371: bits <= 8'b01100110;
      9'o372: bits <= 8'b00111100;
      9'o373: bits <= 8'b00011000;
      9'o374: bits <= 8'b00011000;
      9'o375: bits <= 8'b00011000;
      //|(righjt) 32
      9'o400: bits <= 8'b00000110;
      9'o401: bits <= 8'b00000110;
      9'o402: bits <= 8'b00000110;
      9'o403: bits <= 8'b00000110;
      9'o404: bits <= 8'b00000110;
      9'o405: bits <= 8'b00000110;
      9'o406: bits <= 8'b00000110;
      9'o407: bits <= 8'b00000110;
      //|(left) 33
      9'o410: bits <= 8'b01100000;
      9'o411: bits <= 8'b01100000;
      9'o412: bits <= 8'b01100000;
      9'o413: bits <= 8'b01100000;
      9'o414: bits <= 8'b01100000;
      9'o415: bits <= 8'b01100000;
      9'o416: bits <= 8'b01100000;
      9'o417: bits <= 8'b01100000;
      //W 34
      9'o420: bits <= 8'b00000000;
      9'o421: bits <= 8'b01000010;
      9'o422: bits <= 8'b01000010;
      9'o423: bits <= 8'b01011010;
      9'o424: bits <= 8'b01011010;
      9'o425: bits <= 8'b01100110;
      9'o426: bits <= 8'b01000010;
            //I 35
      9'o430: bits <= 8'b00000000;
      9'o431: bits <= 8'b00011000;
      9'o432: bits <= 8'b00011000;
      9'o433: bits <= 8'b00011000;
      9'o434: bits <= 8'b00011000;
      9'o435: bits <= 8'b00011000;
      9'o436: bits <= 8'b00011000;
      default: bits <= 0;
    endcase
endmodule