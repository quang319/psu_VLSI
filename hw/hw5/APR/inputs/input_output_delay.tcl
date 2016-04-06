set all_input_but_clock  [remove_from_collection [all_inputs] {clk }]
#set_driving_cell -lib_cell BUFX16 -pin Y $all_input_but_clock


#set driving
set_input_delay -max 0.2 -clock clk  $all_input_but_clock
set_input_delay -min 0 -clock clk  $all_input_but_clock


#................DRC max_capacitance.............................
set_load  0.1  [all_outputs]
remove_unconnected_ports [get_cells -hier *]  -blast_buses

#check_design
set_max_area 0
set_fix_hold [all_clocks]
set verilogout_show_unconnected_pins true



