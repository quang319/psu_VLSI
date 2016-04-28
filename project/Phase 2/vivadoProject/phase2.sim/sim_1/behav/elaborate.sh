#!/bin/sh -f
xv_path="/home/software/vivado-2014.4/Vivado/2014.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 317075b8fb6e4d4191379cbab50c58d7 -m64 --debug typical --relax --include "../../../phase2.srcs/sources_1/new" -L xbip_utils_v3_0 -L xbip_pipe_v3_0 -L xbip_bram18k_v3_0 -L mult_gen_v12_0 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_stage3_behav xil_defaultlib.tb_stage3 xil_defaultlib.glbl -log elaborate.log
