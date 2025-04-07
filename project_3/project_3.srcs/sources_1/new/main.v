`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2024 23:36:11
// Design Name: 
// Module Name: main
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
// Create Date: 17.10.2024 10:16:24
// Design Name: 
// Module Name: main
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


module main(
    input clk_p,
    input clk_n,
    input [4:0] btns,
    output [7:0] leds
    );
wire a;
wire out, CLKOUT0, o, ol;
wire clk;
wire slow_clk;
wire [7:0] lab3;
reg active_module = 0;
 IBUFDS #(
      .DIFF_TERM("FALSE"),       // Differential Termination
      .IBUF_LOW_PWR("TRUE"),     // Low power="TRUE", Highest performance="FALSE" 
      .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
   ) IBUFDS_inst (
      .O(a),  // Buffer output
      .I(clk_p),  // Diff_p buffer input (connect directly to top-level port)
      .IB(clk_n) // Diff_n buffer input (connect directly to top-level port)
   );
  BUFG BUFG_inst (
      .O(out), // 1-bit output: Clock output
      .I(a)  // 1-bit input: Clock input
   );

   MMCME2_BASE #(
      .BANDWIDTH("OPTIMIZED"),   // Jitter programming (OPTIMIZED, HIGH, LOW)
      .CLKFBOUT_MULT_F(5.0),     // Multiply value for all CLKOUT (2.000-64.000).
      .CLKFBOUT_PHASE(0.0),      // Phase offset in degrees of CLKFB (-360.000-360.000).
      .CLKIN1_PERIOD(5.0),       // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      // CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
      .CLKOUT1_DIVIDE(10.2),
      .CLKOUT2_DIVIDE(20.4),
      .CLKOUT3_DIVIDE(40.8),
      .CLKOUT4_DIVIDE(1),
      .CLKOUT5_DIVIDE(1),
      .CLKOUT6_DIVIDE(1),
      .CLKOUT0_DIVIDE_F(10),    // Divide amount for CLKOUT0 (1.000-128.000).
      // CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
      .CLKOUT0_DUTY_CYCLE(0.5),
      .CLKOUT1_DUTY_CYCLE(0.5),
      .CLKOUT2_DUTY_CYCLE(0.5),
      .CLKOUT3_DUTY_CYCLE(0.5),
      .CLKOUT4_DUTY_CYCLE(0.5),
      .CLKOUT5_DUTY_CYCLE(0.5),
      .CLKOUT6_DUTY_CYCLE(0.5),
      // CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
      .CLKOUT0_PHASE(0.0),
      .CLKOUT1_PHASE(22.5),
      .CLKOUT2_PHASE(0.0),
      .CLKOUT3_PHASE(0.0),
      .CLKOUT4_PHASE(0.0),
      .CLKOUT5_PHASE(0.0),
      .CLKOUT6_PHASE(0.0),
      .CLKOUT4_CASCADE("FALSE"), // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
      .DIVCLK_DIVIDE(1),         // Master division value (1-106)
      .REF_JITTER1(0.0),         // Reference input jitter in UI (0.000-0.999).
      .STARTUP_WAIT("FALSE")     // Delays DONE until MMCM is locked (FALSE, TRUE)
   )
   MMCME2_BASE_inst (
      // Clock Outputs: 1-bit (each) output: User configurable clock outputs
      .CLKOUT0(CLKOUT0),     // 1-bit output: CLKOUT0
      .CLKOUT0B(CLKOUT0B),   // 1-bit output: Inverted CLKOUT0
      .CLKOUT1(CLKOUT1),     // 1-bit output: CLKOUT1
      .CLKOUT1B(CLKOUT1B),   // 1-bit output: Inverted CLKOUT1
      .CLKOUT2(CLKOUT2),     // 1-bit output: CLKOUT2
      .CLKOUT2B(CLKOUT2B),   // 1-bit output: Inverted CLKOUT2
      .CLKOUT3(CLKOUT3),     // 1-bit output: CLKOUT3
      .CLKOUT3B(CLKOUT3B),   // 1-bit output: Inverted CLKOUT3
      .CLKOUT4(CLKOUT4),     // 1-bit output: CLKOUT4
      .CLKOUT5(CLKOUT5),     // 1-bit output: CLKOUT5
      .CLKOUT6(CLKOUT6),     // 1-bit output: CLKOUT6
      // Feedback Clocks: 1-bit (each) output: Clock feedback ports
      .CLKFBOUT(CLKFBOUT),   // 1-bit output: Feedback clock
      .CLKFBOUTB(CLKFBOUTB), // 1-bit output: Inverted CLKFBOUT
      // Status Ports: 1-bit (each) output: MMCM status ports
      .LOCKED(LOCKED),       // 1-bit output: LOCK
      // Clock Inputs: 1-bit (each) input: Clock input
      .CLKIN1(out),       // 1-bit input: Clock
      // Control Ports: 1-bit (each) input: MMCM control ports
      .PWRDWN(0),       // 1-bit input: Power-down
      .RST(0),             // 1-bit input: Reset
      // Feedback Clocks: 1-bit (each) input: Clock feedback ports
      .CLKFBIN(CLKFBOUT)      // 1-bit input: Feedback clock
   );
   // End of MMCME2_BASE_inst instantiation
   wire [4:0] LED;
   counter uut_c(
    .clk(CLKOUT0),
    .out_c(LED),
    .slow_clk_out(slow_clk)
    );
    
   wire [4:0] btns_out; 
   antidrebezg uut_b(
   .btns(btns),
   .clk(CLKOUT0),
   .slow_clk(slow_clk),
   .btns_out(btns_out)
   );
   
   state_module uut_s(
   .btns(btns_out),
   .clk(CLKOUT0),
   .led(lab3)
   );
   wire [1:0] lab2_out;
   main_0 uut(
    .x(LED[0]),
    .y(LED[1]),    
    .z(LED[2]),
    .k(LED[3]),    
    .l(LED[4]),
    .o(lab2_out[0]),    
    .ol(lab2_out[1])
    );
    
reg [7:0] led_out;
always @(posedge CLKOUT0)
begin
    if(btns_out[4])
        active_module <= ~active_module;
end
always @ (*)
begin
    if(active_module)
        led_out <= lab3;
    else
    begin
        led_out[4:0] <= LED;
        led_out[5] <= lab2_out[0];
        led_out[6] <= lab2_out[1];
        led_out[7] <= 1'b0;
    end
        
end
assign leds = led_out;						
endmodule


module counter(
    input clk,
    output [4:0] out_c,
    output slow_clk_out
);
reg [27:0] count_1=0;
reg [27:0] count_4=0;
reg [4:0] count_2=0;
reg count_3=0;
always @(posedge clk)
begin
    if (count_1 == 98000000)
    begin
        count_1 <= 0;
        count_2 <= count_2 + 1;
    end
    else count_1 <= count_1 + 1; 
    
    
    if(count_4 == 9800000)
    begin
        count_4 <= 0;
        count_3 <= ~count_3;
    end  
    else
        count_4 <= count_4 + 1;
    
end

assign out_c = count_2;
assign slow_clk_out = count_3;
endmodule

module main_0(
input x, y, z, k, l,
output o, ol
    );
   parameter I0 = 16'haaaa;
   parameter I1 = 16'hcccc;

assign o = x && (y | z) && (k | !l);
wire ol_0, ol_1, ol_2, ol_3 ;
LUT2 #(
      .INIT(I0|I1)  // Specify LUT Contents
   ) lut_0 (
      .O(ol_0), // LUT general output
      .I0(y),    // LUT input
      .I1(z)    // LUT input
   );
LUT1 #(
      .INIT(2'b01)  // Specify LUT Contents
   ) lut_1 (
      .O(ol_1), // LUT general output
      .I0(l)    // LUT input
   );
LUT2 #(
      .INIT(I0|I1)  // Specify LUT Contents
   ) lut_2 (
      .O(ol_2), // LUT general output
      .I0(ol_1),    // LUT input
      .I1(k)    // LUT input
   );
LUT2 #(
      .INIT(I0&I1)  // Specify LUT Contents
   ) lut_3 (
      .O(ol_3), // LUT general output
      .I0(x),    // LUT input
      .I1(ol_0)    // LUT input
   );
LUT2 #(
      .INIT(I0&I1)  // Specify LUT Contents
   ) lut_4 (
      .O(ol), // LUT general output
      .I0(ol_3),    // LUT input
      .I1(ol_2)    // LUT input
   );
endmodule

module antidrebezg(
    input [4:0] btns,
    input clk,
    input slow_clk,
    output [4:0] btns_out
);
reg [4:0] btn_reg=0;
reg [4:0] btn1_reg=0;
reg [4:0] btn2_reg=0;
reg r_slow_clk;

always @(posedge clk)
begin
    r_slow_clk <= slow_clk;
    if ((r_slow_clk ^ slow_clk) & (slow_clk == 1'b1))
    begin
        btn_reg <= btns;
        btn1_reg <= btn_reg;
    end
    btn2_reg <= btn1_reg;
end
assign btns_out = btn1_reg & ~btn2_reg;
endmodule

module state_module(
    input [4:0] btns,
    input clk,
    output [7:0] led
);

parameter button1 = 5'b00001;
parameter button2 = 5'b00010;
parameter button3 = 5'b00100;
parameter button4 = 5'b01000;

parameter STATE0 = 8'b00001111;
parameter STATE1 = 8'b11110000;
parameter STATE2 = 8'b10101010;
parameter STATE3 = 8'b11100111;
parameter STATE4 = 8'b00110011;

reg [7:0] state = STATE0;

always @(posedge clk)
begin
    case(state)
    STATE0:
    begin
        if(btns == button1)
            state = STATE1;
    end
    STATE1:
    begin
        if(btns == button1)
            state = STATE3;
        else if(btns == button2)
            state = STATE2;
    end
    STATE2:
    begin
        if(btns == button2)
            state = STATE3;
        else if(btns == button4)
            state = STATE0;
    end
    STATE3:
    begin
        if(btns == button1)
            state = STATE4;
        else if(btns == button4)
            state = STATE0;
    end
    STATE4:
    begin
        if(btns == button1)
            state = STATE0;
        else if(btns == button4)
            state = STATE0;
    end
    endcase
end
assign led = state;
endmodule