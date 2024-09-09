# Final Digital Logic Design Lab

## About
This was the final project for an undergraduate Digital Logic Design course at UT Austin <br>
ECE316 - Digital Logic Design <br>

The project consisted of programming an FPGA board (Basys 3 Artix-7) in Verilog to create a counter/timer that took input from the board's switches and consisted of multiple modes <br>

User input could be specified with SW0(LSB) - SW13(MSB) where each switch represented their respective amount in binary <br>

Mode 1 - Up counter from 0 <br>
Mode 2 - Down counter from 9999 <br>
Mode 3 - Up counter from user input; Input calculated from switch input between SW0 - SW13 <br>
Mode 4 - Down counter from user input; Input calculated from switch input between SW0 - SW13 <br>

Button 1 - Start <br> 
Button 2 - Pause <br>
Button 3 - Reset <br>

User Input = Max(9999, SW0 + SW1 + ... + SW13) <br>
SW0 - 1 <br>
SW1 - 2 <br>
SW2 - 4 <br>
... <br>
SW13 - 8192 <br>


