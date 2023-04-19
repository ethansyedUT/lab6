`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2023 02:41:08 PM
// Design Name: 
// Module Name: hexto7segment
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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2023 03:26:38 PM
// Design Name: 
// Module Name: hexto7segment
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


module hexto7segment(
    input [3:0] x,
    output reg [6:0] r
    );
    always @(*)
        case(x)
            4'b0000 : r = 7'b0000001; //0
            4'b0001 : r = 7'b1001111; //1
            4'b0010 : r = 7'b0010010; //2
            4'b0011 : r = 7'b0000110; //3
            4'b0100 : r = 7'b1001100; //4
            4'b0101 : r = 7'b0100100; //5
            4'b0110 : r = 7'b0100000; //6
            4'b0111 : r = 7'b0001111; //7
            4'b1000 : r = 7'b0000000; //8
            4'b1001 : r = 7'b0000100; //9
            4'b1010 : r = 7'b0001000; //A
            4'b1011 : r = 7'b1100000; //b
            4'b1100 : r = 7'b0110001; //C
            4'b1101 : r = 7'b1000010; //d
            4'b1110 : r = 7'b0110000; //E
            4'b1111 : r = 7'b0111000; //F
            default: begin
                r = 7'b1111111;
            end        
        endcase
endmodule

