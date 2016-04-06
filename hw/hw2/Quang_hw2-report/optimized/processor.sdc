###################################################################

# Created by write_sdc on Wed Feb  3 16:25:16 2016

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_max_area 0
create_clock [get_ports clk]  -period 0.5  -waveform {0 0.25}
