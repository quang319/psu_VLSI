set_clock_uncertainty -setup 0.4 [get_ports clk]
set_clock_uncertainty -hold  0.8 [get_ports clk]
set_clock_transition 0.2 [get_clocks clk]

