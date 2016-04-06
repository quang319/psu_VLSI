set base_dir "/home/mdl/sxr5403/DAC_Yasuki/scripts/APR/"

set verilog_search_path        "$base_dir/inputs"


set search_path [concat  $search_path $verilog_search_path]

####LIBRARY setup##########
set search_path [concat  $search_path [list [format "%s%s"  $synopsys_root "/libraries/syn"]]]
set search_path [concat  $search_path [list "." [format "%s%s"  $synopsys_root "/dw/sim_ver"]]]

lappend search_path "/home/software/synopsys-2013/SAED32_EDK/lib/stdcell_lvt/db_ccs"
set synthetic_library [list dw_foundation.sldb]


lappend search_path "/home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt /home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt/milkyway /home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt/milkyway/saed32nm_rvt_1p9m /home/software/synopsys-2013/SAED32_EDK/lib/stdcell_lvt "

set path1 "/home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt/db_ccs"
set path2 "/home/software/synopsys-2013/SAED32_EDK/lib/sram/db_ccs"  
set search_path "$path1 $path2 $search_path"

#set link_library " * saed32rvt_tt1p05v25c.lib saed32sram_tt1p05v25c.lib saed32lvt_ulvl_tt0p78v125c_i0p78v.lib saed32nm_rvt_1p9m saed32nm_lvt_1p9m"
#set target_library "saed32rvt_tt1p05v25c.lib saed32sram_tt1p05v25c.lib dw_foundation.sldb saed32lvt_ulvl_tt0p78v125c_i0p78v.lib saed32nm_rvt_1p9m saed32nm_lvt_1p9m"

set link_library "saed32rvt_ff0p85v25c.lib saed32sram_tt1p05v25c.lib dw_foundation.sldb "
set target_library "saed32rvt_ff0p85v25c.lib saed32rvt_ff0p85v25c.lib saed32rvt_tt0p85v25c.lib saed32rvt_ff0p85v25c.lib saed32rvt_ff0p85v25c.lib saed32sram_tt1p05v25c.lib dw_foundation.sldb"

create_mw_lib processor -technology /home/software/synopsys-2013/SAED32_EDK/tech/milkyway/saed32nm_1p9m_mw.tf

set_tlu_plus_files -max_tluplus /home/software/synopsys-2013/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmax.tluplus -min_tluplus /home/software/synopsys-2013/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmin.tluplus -tech2itf_map /home/software/synopsys-2013/SAED32_EDK/tech/milkyway/saed32nm_tf_itf_tluplus.map


set_mw_technology_file -technology /home/software/synopsys-2013/SAED32_EDK/tech/milkyway/saed32nm_1p9m_mw.tf processor

set_mw_lib_reference processor -mw_reference_library "/home/software/synopsys-2013/SAED32_EDK/lib/stdcell_rvt/milkyway/saed32nm_rvt_1p9m/ /home/software/synopsys-2013/SAED32_EDK/lib/sram/milkyway/SRAM32NM"



set_app_var search_path $search_path
set_app_var target_library $target_library
set_app_var link_library $link_library


##open_mw_lib conv_mapped

uniquify_fp_mw_cel





