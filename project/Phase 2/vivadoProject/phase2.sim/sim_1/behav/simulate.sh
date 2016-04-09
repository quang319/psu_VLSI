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
ExecStep $xv_path/bin/xsim tb_skintoneDetector_behav -key {Behavioral:sim_1:Functional:tb_skintoneDetector} -tclbatch tb_skintoneDetector.tcl -log simulate.log
