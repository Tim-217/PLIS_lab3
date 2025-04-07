`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2024 23:38:02
// Design Name: 
// Module Name: tb
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
// Create Date: 31.10.2024 11:20:05
// Design Name: 
// Module Name: tb
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


module tb();
    wire [7:0] ledos;
    reg [4:0] buttons; 
    reg clk = 0;

    main uut (
        .clk_p(clk),
        .clk_n(~clk),
        .leds(ledos),
        .btns(buttons)
    );

    always #5 clk = ~clk;


    initial begin
        buttons = 5'b00000;
        
        #10;
        
        buttons[0] = 1;//кн1
        #1000;
        buttons[0] = 0;
        #10;
        buttons[1] = 1;//кн2 
        #1000;
        buttons[1] = 0;
        #100;
        buttons[1] = 1;//кн2
        #1000;
        buttons[1] = 0;
        #100;
        buttons[0] = 1;//кн1
        #1000;
        buttons[0] = 0;
        #100;
        buttons[0] = 1;//кн1
        #1000;
        buttons[0] = 0;
        
        #10;
        
        buttons[0] = 1;//кн1
        #10;
        buttons[0] = 0;
        #10;
        buttons[0] = 1;//кн1
        #10;
        buttons[0] = 0;
        #10;
        buttons[3] = 1;//кн4
        #10;
        buttons[3] = 0;
        
        #10;
        
        buttons[0] = 1;//кн1
        #10;
        buttons[0] = 0;
        #10;
        buttons[1] = 1;//кн2 
        #10;
        buttons[1] = 0;
        #10;
        buttons[3] = 1;//кн4
        #10;
        buttons[3] = 0;
        
        #10;
        
        buttons[0] = 1;//кн1
        #10;
        buttons[0] = 0;
        #10;
        buttons[0] = 1;//кн1
        #10;
        buttons[0] = 0;
        #10;
        buttons[0] = 1;//кн1
        #10;
        buttons[0] = 0;
        #10;
        buttons[3] = 1;//кн3
        #10;
        buttons[3] = 0;      
        
    end
endmodule
