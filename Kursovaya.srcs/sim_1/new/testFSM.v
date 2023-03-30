`timescale 1ns / 1ps

module testFSm;

	// Inputs
	reg clk;
	reg reset;
	reg throw;
	reg left;
	reg right;

	// Outputs
	wire [1:0] winner;
	wire [2:0] arrPos;
	wire [2:0] i;
	wire [2:0] j;
	wire goChange;
	wire [5:0] player;

	// Instantiate the Unit Under Test (UUT)
	fsm uut (
		.clk(clk), 
		.reset(reset), 
		.throw(throw), 
		.left(left), 
		.right(right), 
		.winner(winner), 
		.arrPos(arrPos), 
		.i(i), 
		.j(j), 
		.goChange(goChange), 
		.player(player)
	);
	always#10 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		throw = 0;
		left = 0;
		right = 0;

		// Wait 100 ns for global reset to finish
		#2000;
		left=1;
		#20
		left=1;
		#20
		left=0;
		right=1;
      #20
        right=0;
		throw=1;
		#20
		throw=0;
		#80
		throw=1;
		#20
		throw=0;
		 
		// Add stimulus here

	end
      
endmodule

