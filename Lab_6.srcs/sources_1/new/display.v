`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2023 02:44:15 PM
// Design Name: 
// Module Name: display
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


module display(
    input clk,
//    input [3:0] c0, c1, c2, c3,
    input [6:0] in0, in1, in2, in3,
    output reg [3:0] an,
    output reg [6:0] sseg
    );
    
    //need interpreter for disp
    //replace disp with 4 different registers that are the values
    
    
    //.x is binary data
    //.r is seven segment display info
//    wire [6:0] in0, in1, in2, in3;
    
//    hexto7segment seg0 (.x(c0), .r(in0));
//    hexto7segment seg1 (.x(c1), .r(in1));
//    hexto7segment seg2 (.x(c2), .r(in2));
//    hexto7segment seg3 (.x(c3), .r(in3));
    
    reg [1:0] state;
    reg [1:0] next_state;
    
    always @ (*) begin    
        case(state) //state transition
            2'b00: next_state = 2'b01;
            2'b01: next_state = 2'b10;
            2'b10: next_state = 2'b11;
            2'b11: next_state = 2'b00;
            default: begin
                next_state = 2'b00;
            end
        endcase
        case(state) //display transition (indiv leds of display)
            2'b00: sseg = in0;
            2'b01: sseg = in1;
            2'b10: sseg = in2;
            2'b11: sseg = in3;
            default: begin
                sseg = in0;
            end
        endcase
        
        case(state) //decoder transition (which 7 segment)
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            2'b11: an = 4'b0111;
            default: begin
                an = 4'b1111;
            end
        endcase
    end
    
    always @(posedge clk) begin
        state <= next_state;
    end
    
    
    
endmodule
