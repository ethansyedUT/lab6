`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2023 02:26:07 PM
// Design Name: 
// Module Name: clkDiv
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
// Create Date: 03/03/2023 03:55:23 PM
// Design Name: 
// Module Name: clk_div_disp
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


module clkDiv(
    input clk,
    input reset,
    output clk_out
    );
   // reg[19:0] COUNT;
    //assign clk_out = COUNT[19] && COUNT[18] && COUNT[17] && COUNT[16] && COUNT[14] && COUNT[9] && COUNT[6];

//    Simulation
    reg[23:0] COUNT;
    assign clk_out = COUNT[23];
    
    initial COUNT = 0;
    always @ (posedge clk) begin
        if(reset)
            COUNT = 0;
        else
            COUNT = COUNT + 1;
    end
    
    
endmodule

