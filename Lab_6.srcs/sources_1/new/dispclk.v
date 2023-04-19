`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2023 07:47:03 PM
// Design Name: 
// Module Name: dispclk
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


module dispclk(
    input clk,
    input reset,
    output clk_out
    );
    reg[10:0] COUNT;
    assign clk_out = COUNT[10];

//    Simulation
//    reg[1:0] COUNT;
//    assign clk_out = COUNT[1];
    
    initial COUNT = 0;
    always @ (posedge clk) begin
        if(reset)
            COUNT = 0;
        else
            COUNT = COUNT + 1;
    end
    
    
endmodule
