`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2023 02:24:43 PM
// Design Name: 
// Module Name: system
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module system(
    input clk,
    input [1:0] select,
    input reset,
    input start,
    input [15:0] sw,
    output [3:0] an,
    output [6:0] sseg
    );
    
    
    
    wire slowClk;
    clkDiv sc (.clk(clk), .reset(reset), .clk_out(slowClk));
    
    //have one hlsm for slow clock
    
    
    //have on hlsm for fast clock
    reg [15:0] stored;
    reg [3:0] c0, c1, c2, c3;
    state_machine(.clk(slowClk), .select(select), .reset(reset), .start(start), .ld(sw), .LedResult(stored));
    
    display ds (.clk(clk), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .an(an), .sseg(sseg));
    
    
    
   
    
endmodule
