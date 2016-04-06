set_app_var search_path $search_path
set_app_var target_library $target_library
set_app_var link_library $link_library

link 
###############  check for library correctess(there should be no errors) ############################
check_library
#####################################################################################################
                 
open_mw_lib processor
read_verilog ../inputs/processorCore_new.v
uniquify_fp_mw_cel

report_design_mismatch 

##########################proceed if no mismatch ######################################################


