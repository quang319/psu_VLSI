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
ExecStep $xv_path/bin/xsim tb_stage2_behav -key {Behavioral:sim_1:Functional:tb_stage2} -tclbatch tb_stage2.tcl -log simulate.log
