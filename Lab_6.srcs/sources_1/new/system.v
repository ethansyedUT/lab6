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
    input [7:0] ld,
    output [3:0] an,
    output [6:0] sseg,
    output [3:0] debugc, debugc1, debugc2, debugc3
    );
    
    
    wire [3:0] c0, c1, c2, c3;
    wire [6:0] in0, in1, in2, in3;
    wire slowClk, slowDispClk;
    
    clkDiv sc (.clk(clk), .reset(reset), .clk_out(slowClk));
    
    dispclk dis (.clk(clk), .reset(reset), .clk_out(slowDispClk));
    
    display ds (.clk(slowDispClk), .in0(in0), .in1(in1), .in2(in2), .in3(in3), .an(an), .sseg(sseg));
    
    hexto7segment seg0 (.x(c0), .r(in0));
    hexto7segment seg1 (.x(c1), .r(in1));
    hexto7segment seg2 (.x(c2), .r(in2));
    hexto7segment seg3 (.x(c3), .r(in3));
    //have one hlsm for slow clock
    
    
    //have on hlsm for fast clock
    //reg [15:0] stored;
    state_machine bruh (.clk(slowClk), .select(select), .reset(reset), .start(start), .ld(ld), .c0(c0), .c1(c1), .c2(c2), .c3(c3));
    
    
    
    
    
   
    
endmodule
