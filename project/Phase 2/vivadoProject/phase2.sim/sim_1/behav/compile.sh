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
echo "xvlog -m64 -prj tb_stage2_vlog.prj"
ExecStep $xv_path/bin/xvlog -m64 -prj tb_stage2_vlog.prj 2>&1 | tee compile.log
