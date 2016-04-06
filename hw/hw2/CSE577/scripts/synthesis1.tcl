set path1 "/home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt/db_ccs"
set path2 "/home/software/synopsys-2013/SAED32_EDK/lib/sram/db_ccs"  
set search_path "$path1 $path2 $search_path"

set search_path [concat  $search_path [list [format "%s%s"  $synopsys_root "/libraries/syn"]]]
set search_path [concat  $search_path [list "." [format "%s%s"  $synopsys_root "/dw/sim_ver"]]]

# Library Variables
set synthetic_library [list dw_foundation.sldb]

#set target_library saed32rvt_tt1p05v25c.db
set target_library saed32rvt_ff0p85v25c.db
set target_library1 saed32sram_tt1p05v25c.db

set link_library   [concat  $target_library $target_library1 $synthetic_library]
set target_library "saed32rvt_ff0p85v25c.db saed32sram_tt1p05v25c.db"
set verilogout_no_tri "true"


set script_dir "/home/mdl/sxr5403/DAC_Yasuki/scripts"
source $script_dir/read_design.tcl
elaborate ProcessorTop
set_fix_multiple_port_nets -all ProcessorTop
link
create_clock clk -name "ideal_clock1" -period 2
saif_map -start
set_power_prediction
compile 
write -format ddc -hierarchy -output processortop.ddc -hier

compile_ultra
report_timing > timing.rpt
report_area  > area.rpt 
report_power > power_nosaif.rpt
report_cell > cell.rpt
change_names -rules verilog -hierarchy
write -format ddc -hierarchy -output processortop1.ddc -hier
write -f verilog -hierarchy -output  processortop1.v
