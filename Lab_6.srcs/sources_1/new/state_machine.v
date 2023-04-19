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
    input [7:0] ld,
    output reg [3:0] c0, c1, c2, c3
    );
    
    reg [4:0] state;
    reg [4:0] next_state;
    
    reg [3:0] rc0, rc1, rc2, rc3; //c buffers
    reg tc; // terminal count;
    initial
    begin
    rc0 = 0;
    rc1 = 0;
    rc2 = 0;
    rc3 = 0;
    tc = 0;
    state = 5'b00000;
    next_state = 0;
    end
    always @ (start, c0, c1, c2, c3, state) begin
        //init state
        if(state == 5'b00000)begin
            tc = 0;
            rc0 = 0;
            rc1 = 0;
            rc2 = 0;
            rc3 = 0;
            if(start)begin
                if(select == 2'b00)
                    next_state = 5'b00001;
                else if(select == 2'b01)
                    next_state = 5'b00010;       
                else if(select == 2'b10)
                    next_state = 5'b00011;
                else if(select == 2'b11)
                     next_state = 5'b00100;
            end else
                next_state = 5'b00000;
        end
             
        //UFM state
        else if(state == 5'b00001)begin
            tc = 0;
            rc0 = 0;
            rc1 = 0;
            rc2 = 0;
            rc3 = 0;
            next_state = 5'b00111;
        end
         
         
         //UFL state && DFL state
        else if(state == 5'b00010 || state == 5'b00100) begin
            tc = 0;
            rc0 = 0;
            rc1 = 0;
            rc2 = ld[3:0];
            rc3 = ld[7:4];
            if(rc3 > 9)
                next_state = 5'b00101;
            else if(rc3 <= 9 && rc2 > 9)
                next_state = 5'b00110;
            else
                next_state = 5'b00111;
         end
            
         //DFM state
         else if(state == 5'b00011)begin
            tc = 0;
            rc3 = 9;
            rc2 = 9;
            rc1 = 9;
            rc0 = 9;
            next_state = 5'b00111;
         end
         
         //c3Max
         else if(state == 5'b00101)begin
            rc3 = 9;
            if(rc2>9) 
                next_state = 5'b00110;
            else
                next_state = 5'b00111;
         end
         
         //c2Max
         else if(state == 5'b00110)begin
            rc2 = 9;
            next_state = 5'b00111;
         end
         
         //rest = 5'b00111
         else if(state == 5'b00111)begin
            if(start)
                next_state = 5'b10010;
            else if(select == 0 && reset)
                next_state = 5'b00001;
            else if (select == 1 && reset)
                next_state = 5'b00010;
            else if (select == 2 && reset)
                next_state = 5'b00011;
            else if (select == 3 && reset)
                next_state =  5'b00100;
            else if((select == 0 || select == 1) && !tc && !reset) //increment
                next_state = 5'b01001;
            else if((select == 2 || select == 3) && !tc && !reset) //decrement
                next_state = 5'b01110;
            else
                next_state = 5'b00111;
         end 
         
         //T-count
         else if(state == 5'b01000)begin
            tc = 1;
            next_state = 5'b00111;
         end  
         
         //Increment
         else if(state == 5'b01001)begin
            rc0 = rc0 + 1;
            if(rc0 == 9 && rc1 ==9 && rc2 == 9 && rc3 == 9)
                next_state = 5'b01000;
            else if(rc0 > 9)begin
                rc0 = 0;
                next_state = 5'b01010;
            end else
                next_state = 5'b00111;
         end 
         
         //RO c1
         else if(state == 5'b01010)begin
            rc1 = rc1 + 1;
            if(rc1 > 9) begin
                rc1 = 0;
                next_state = 5'b01011;
            end else
                next_state = 5'b00111;
         end 
         
         //RO c2
         else if(state == 5'b01011)begin
            rc2 = rc2 + 1;
            if(rc2 > 9) begin
                rc2 = 0;
                next_state = 5'b01100;
            end else
                next_state = 5'b00111;
         end 
         
         //R0 c3
         else if(state == 5'b01100)begin
            rc3 = rc3 + 1;
            if(rc3 > 9)
                rc3 = 9;
            next_state = 5'b00111;
         end 
         
         //DTC
         else if(state == 5'b01101)begin
            tc = 1;
            next_state = 5'b00111;
         end 
         
         //Decrement
         else if(state == 5'b01110)begin
            rc0 = rc0 -1;
            if(rc0 == 0 && rc1 == 0 && rc2 == 0 && rc3 == 0)
                next_state = 5'b01101;
            else if(rc0 > 9)begin
                rc0 = 9;
                next_state = 5'b01111;
            end else
                next_state = 5'b00111;
         end 
         
         //D1
         else if(state == 5'b01111)begin
            rc1 = rc1 -1;
            if(rc1 > 9)begin
                rc1 = 9;
                next_state = 5'b10000;
            end else
                next_state = 5'b00111;
            
         end 
         
         //D2
         else if(state == 5'b10000)begin
            rc2 = rc2 -1;
            if(rc2 > 9) begin
                rc2 = 9;
                next_state = 5'b10001;
            end else
                next_state = 5'b00111;
         end 
         
         //D3
         else if(state == 5'b10001)begin
            rc3 = rc3-1;
            next_state = 5'b00111;
         end 
         
         //buffer
         else if(state == 5'b10010)begin
            if(start)
                next_state = 5'b10010;
            else
                next_state = 5'b10011;
         end 
         
         //buffer 2
         else if(state == 5'b10011)begin
            if(start)
                next_state = 5'b00111;
            else
                next_state = 5'b10011;
         end 
         c0 = rc0;
         c1 = rc1;
         c2 = rc2;
         c3 = rc3;
    end
    
    
    always @(posedge clk) begin
//        c0 <= rc0;
//        c1 <= rc1;
//        c2 <= rc2;
//        c3 <= rc3;
//        if(c3 > 9)begin
//            c3 <= 9;
//            c2 <= 9;
//            c1 <= 9;
//            c0 <= 9;
//        end
        if(reset && select == 2'b00)
            state <= 5'b00011;
        else if(reset && select == 2'b01)
            state <= 5'b00011;
        else if(reset &&  select == 2'b10)
            state <= 5'b00100;
        else if(reset && select == 2'b11)
            state <= 5'b00101;
        else
            state <= next_state;  
    end
endmodule
