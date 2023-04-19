`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2023 08:01:50 PM
// Design Name: 
// Module Name: tb_system
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


module tb_system;
    reg clk;
    reg [1:0] select;
    reg reset;
    reg start;
    reg [7:0] ld;
    wire [3:0] an;
    wire [6:0] sseg;
//    wire [3:0] d1, d2, d3 ,d4;
    
    system u1(
        .clk(clk),
        .select(select),
        .reset(reset),
        .start(start),
        .ld(ld),
        .an(an),
        .sseg(sseg)
//        .debugc(d1),
//        .debugc1(d2),
//        .debugc2(d3),
//        .debugc3(d4)
    );
    
    initial
    begin
    clk = 0;
    select = 0;
    reset = 0;
    start = 0;
    ld = 0;
    #10
    start = 1;
    reset = 1;
    #10
    start = 0;
    reset = 0;
    end
    always
    #5 clk = ~clk;
endmodule
