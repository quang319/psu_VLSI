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
ExecStep $xv_path/bin/xelab -wto f3b72f7470684674b8d85744ae4a79f1 -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot fpga_behav xil_defaultlib.fpga xil_defaultlib.glbl -log elaborate.log
