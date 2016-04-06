source .cshrc
icc_shell -64bit | tee log.log &
fg

source library_setup.tcl
source read_design.tcl
source floorplan.tcl

