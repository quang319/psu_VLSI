##############setup logic libraries##############
#set_app_var search_path my_search_path 
#set_app_var target_library my_library_list 
#set_app_var link_library "* my_link_library_list" 
#################################################


############opening MW design library############
open_mw_lib core
#################################################


############Reading the design netlist###########
read_verilog ../inputs/processor_new.v
link
###########################################

###########Connecting logic power and ground#####
derive_pg_connection -power_net VDD -ground_net VSS -reconnect
#read_sdc -version 1.7 design_name.sdc 

save_mw_cel -as processor_new


