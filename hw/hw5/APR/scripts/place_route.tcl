set base_dir "/home/mdl/sxr5403/CSE577/APR/"

set verilog_search_path        "$base_dir/inputs"


set search_path [concat  $search_path $verilog_search_path]

####Setting Search path##########
set search_path [concat  $search_path [list [format "%s%s"  $synopsys_root "/libraries/syn"]]]
set search_path [concat  $search_path [list "." [format "%s%s"  $synopsys_root "/dw/sim_ver"]]]

lappend search_path "/home/software/synopsys-2013/SAED32_EDK/lib/stdcell_lvt/db_ccs"
set synthetic_library [list dw_foundation.sldb]

lappend search_path "/home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt /home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt/milkyway /home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt/milkyway/saed32nm_rvt_1p9m /home/software/synopsys-2013/SAED32_EDK/lib/stdcell_lvt "

set path1 "/home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt/db_ccs"
set path2 "/home/software/synopsys-2013/SAED32_EDK/lib/sram/db_ccs"  
set search_path "$path1 $path2 $search_path"

###############################################################################

#set link_library " * saed32rvt_tt1p05v25c.lib saed32sram_tt1p05v25c.lib saed32lvt_ulvl_tt0p78v125c_i0p78v.lib saed32nm_rvt_1p9m saed32nm_lvt_1p9m"
#set target_library "saed32rvt_tt1p05v25c.lib saed32sram_tt1p05v25c.lib dw_foundation.sldb saed32lvt_ulvl_tt0p78v125c_i0p78v.lib saed32nm_rvt_1p9m saed32nm_lvt_1p9m"

######Setting link library and target library##################################

set link_library "saed32rvt_ff0p85v25c.db saed32sram_tt1p05v25c.db dw_foundation.sldb "
set target_library "saed32rvt_ff0p85v25c.db saed32rvt_ff0p85v25c.db saed32rvt_tt0p85v25c.db saed32rvt_ff0p85v25c.db saed32rvt_ff0p85v25c.db saed32sram_tt1p05v25c.db dw_foundation.sldb"

######Setting link library and target library##################################

source ../inputs/clock_uncertainity.tcl
psynopt
route_opt

save_mw_cel -as route
