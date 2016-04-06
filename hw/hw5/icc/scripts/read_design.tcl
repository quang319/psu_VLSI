############opening MW design library############
open_mw_lib core
#################################################


############Reading the design netlist###########
read_verilog ../inputs/processor.v
link
###########################################

###########Connecting logic power and ground#####
derive_pg_connection -power_net VDD -ground_net VSS -reconnect
#read_sdc -version 1.7 design_name.sdc 

save_mw_cel -as processor


