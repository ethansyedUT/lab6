`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2023 01:01:52 PM
// Design Name: 
// Module Name: state_machine
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

//does increment or decrement logic

module state_machine(
    input clk,
    input [1:0] select,
    input reset,
    input start,
    input [15:0] ld,
    output [3:0] c0, c1, c2, c3
    );
    
    
    always @(posedge clk or posedge reset) begin
//        if(reset)
//            state <=  
    end
endmodule
