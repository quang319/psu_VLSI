	
#set script_dir "/home/grads/qxn5005/CSE577/"    		      	// ALl the scripts needed to run the synthesis is in this folder
set script_dir "/home/grads/qxn5005/CSE577" 
#source $script_dir/hw2_read_design.tcl		// Sourcing the verilog files
source $script_dir/scripts/hw5_read_design.tcl
#source "$script_dir/scripts/input_output_delay.tcl"
source "$script_dir/scripts/clock_uncertainity.tcl"
#elaborate ProcessorCore8VStep00           			// Top level module name.  RTL is being converted into std.cell netlsit
elaborate TRAFFIC_lights

#link                                      			// linking the technology library to the above netlist.
link 
#create_clock clk -name "clk" -period 2                         // creating the clk signal with port name clk, with time period of 2ns.
create_clock clk -name "clk" -period .5 

#saif_map -start                
#set_power_prediction 

#########  add wireload information. #########
set_max_area 0

#compile                                                       // Compiling the above generated netlist.
compile 
write -format ddc -hierarchy -output processorCore.ddc -hier

#compile_ultra                                                 // For further optimization.  
compile_ultra      

#                                                              // generation of report
report_timing > timing.rpt
report_area  > area.rpt 
report_power > power_nosaif.rpt
report_cell > cell.rpt
change_names -rules verilog -hierarchy
write -format ddc -hierarchy -output processor.ddc -hier
write -f verilog -hierarchy -output  processor.v
write_sdc processor.sdc


##set_svf output.svf
