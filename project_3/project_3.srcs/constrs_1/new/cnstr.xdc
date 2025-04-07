set_property IOSTANDARD LVDS [get_ports clk_p]
set_property PACKAGE_PIN E19 [get_ports clk_p]

set_property PACKAGE_PIN E18 [get_ports clk_n]
set_property IOSTANDARD LVDS [get_ports clk_n]

set_property PACKAGE_PIN AM39 [get_ports leds[0]]
set_property IOSTANDARD LVCMOS18 [get_ports leds[0]]

set_property PACKAGE_PIN AN39 [get_ports leds[1]]
set_property IOSTANDARD LVCMOS18 [get_ports leds[1]]

set_property PACKAGE_PIN AR37 [get_ports leds[2]]
set_property IOSTANDARD LVCMOS18 [get_ports leds[2]]

set_property PACKAGE_PIN AT37 [get_ports leds[3]]
set_property IOSTANDARD LVCMOS18 [get_ports leds[3]]

set_property PACKAGE_PIN AR35 [get_ports leds[4]]
set_property IOSTANDARD LVCMOS18 [get_ports leds[4]]

set_property PACKAGE_PIN AP41  [get_ports leds[5]]
set_property IOSTANDARD LVCMOS18 [get_ports leds[5]]

set_property PACKAGE_PIN AP42 [get_ports leds[6]]
set_property IOSTANDARD LVCMOS18 [get_ports leds[6]]

set_property PACKAGE_PIN AU39 [get_ports leds[7]]
set_property IOSTANDARD LVCMOS18 [get_ports leds[7]]

#NORTH BUTTON
set_property PACKAGE_PIN AR40 [get_ports btns[4]] 
set_property IOSTANDARD LVCMOS18 [get_ports btns[4]]
#WEST BUTTON 
set_property PACKAGE_PIN AW40 [get_ports btns[0]] 
set_property IOSTANDARD LVCMOS18 [get_ports btns[0]]
#CENTER BUTTON
set_property PACKAGE_PIN AV39 [get_ports btns[1]] 
set_property IOSTANDARD LVCMOS18 [get_ports btns[1]]
#EAST BUTTON
set_property PACKAGE_PIN AU38 [get_ports btns[2]] 
set_property IOSTANDARD LVCMOS18 [get_ports btns[2]]
#SOUTH BUTTON
set_property PACKAGE_PIN AP40 [get_ports btns[3]] 
set_property IOSTANDARD LVCMOS18 [get_ports btns[3]]


create_clock -period 5.000 -name clk_p -waveform {0.000 2.500} [get_ports clk_p]