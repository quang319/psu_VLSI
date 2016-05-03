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
ExecStep $xv_path/bin/xsim tb_transCb_behav -key {Behavioral:sim_1:Functional:tb_transCb} -tclbatch tb_transCb.tcl -log simulate.log
