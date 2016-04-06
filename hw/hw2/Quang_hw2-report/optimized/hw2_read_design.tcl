##set base_dir ""    // Folder Path to the verilog netlist
set base_dir "/home/grads/qxn5005/CSE577"
##set verilog_search_path        "$base_dir/inputs"               // Verilog files
set verilog_search_path        "$base_dir/inputs"
#set search_path [concat  $search_path $verilog_search_path]     // This will not change
set search_path [concat  $search_path $verilog_search_path]
##analyze -work work -format verilog cse577_project_top.v                             // Hierarchical verilog files, Top module in the first line.
###analyze -work work -format verilog cse577_project_module1.v                        // All hierarchical verilog files should be present.
analyze -work work -format verilog Quang_TRAFFIC_LIGHT.v

